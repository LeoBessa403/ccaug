<?php

/**
 * InscricaoService.class [ SEVICE ]
 * @copyright (c) 2021, Leo Bessa
 */
class  InscricaoService extends AbstractService
{

    private $ObjetoModel;


    public function __construct()
    {
        parent::__construct(InscricaoEntidade::ENTIDADE);
        $this->ObjetoModel = new InscricaoModel();
    }

    public function getReferenciaPagamentoInscricao()
    {
        $url = URL_PAGSEGURO . "sessions?email=" . EMAIL_PAGSEGURO . "&token=" . TOKEN_PAGSEGURO;

        $curl = curl_init($url);
        curl_setopt($curl, CURLOPT_HTTPHEADER, array("Content-Type: application/x-www-form-urlencoded; charset=UTF-8"));
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, true);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        $retorno = curl_exec($curl);
        curl_close($curl);

        $xml = simplexml_load_string($retorno);
        return $xml;
    }

    /**
     * @param $coCurso
     * @return array|mixed
     */
    public function getValorCurso($coCurso)
    {
        /** @var CursoService $CursoService */
        $CursoService = new CursoService();
        /** @var CursoEntidade $curso */
        $curso = $CursoService->PesquisaUmRegistro($coCurso);

        return [NU_VALOR => $curso->getCoUltimoValorCurso()->getNuValor()];
    }

    public function salvaInscricao($dados)
    {
        /** @var PagamentoService $PagamentoService */
        $PagamentoService = $this->getService(PAGAMENTO_SERVICE);
        /** @var HistoricoPagamentoService $HistoricoPagamentoService */
        $HistoricoPagamentoService = $this->getService(HISTORICO_PAGAMENTO_SERVICE);
        /** @var PDO $PDO */
        $PDO = $this->getPDO();
        $session = new Session();
        $retorno = [
            SUCESSO => false,
            MSG => null
        ];
        /** @var InscricaoValidador $InscricaoValidador */
        $InscricaoValidador = new InscricaoValidador();
        $validador = $InscricaoValidador->validarInscricao($dados);
        if ($validador[SUCESSO]) {

            $PDO->beginTransaction();

            $coPessoa = PessoaService::verificaSalvaDadosPessoa($dados);
            $insc[CO_ALUNO] = AlunoService::verificaSalvaDadosAluno($coPessoa);
            $insc[CO_TURMA] = 1;
            $insc[DT_CADASTRO] = Valida::DataHoraAtualBanco();

            $pagInsc[CO_INSCRICAO] = $this->Salva($insc);
            $pagInsc[TP_PAGAMENTO] = $dados[TP_PAGAMENTO][0];
            $pagInsc[DT_MODIFICADO] = Valida::DataHoraAtualBanco();
            $histPag[CO_PAGAMENTO] = $PagamentoService->Salva($pagInsc);
            $retorno[MSG] = CADASTRADO;

            // HISTORICO DO PAGAMENTO INICIADO
            $histPag[DT_CADASTRO] = Valida::DataHoraAtualBanco();
            $histPag[DS_ACAO] = 'Inicia o pagamento';
            $histPag[DS_USUARIO] = UsuarioService::getNoPessoaCoUsuario(UsuarioService::getCoUsuarioLogado())
                . ' Iniciou o pagamento';
            $histPag[ST_PAGAMENTO] = StatusPagamentoEnum::PENDENTE;
            $retorno[SUCESSO] = $HistoricoPagamentoService->Salva($histPag);

            if ($retorno[SUCESSO]) {



                debug('ok',1);
                $plano = $PlanoService->PesquisaUmRegistro($dados[CO_PLANO][0]);
                /** @var AssinanteEntidade $assinante */
                $assinante = $AssinanteService->PesquisaUmRegistro($dados[CO_ASSINANTE]);
                $retorno = $this->processaPagamento($plano, $assinante);

                if ($retorno["dados"]->error) {
                    Notificacoes::geraMensagem(
                        'Não foi possível realizar o Pagamento!',
                        TiposMensagemEnum::ALERTA
                    );
                    $retorno[SUCESSO] = false;
                    $PDO->rollBack();
                } else {
                    $retornoPagSeguro = $retorno['dados'];

                    $retPagSeg[ST_PAGAMENTO] = (string)$retornoPagSeguro->status;
                    $retPagSeg[DT_MODIFICADO] = (string)$retornoPagSeguro->lastEventDate;
                    $retPagSeg[NU_VALOR_DESCONTO] = (string)$retornoPagSeguro->feeAmount;
                    $retPagSeg[NU_VALOR_REAL] = (string)$retornoPagSeguro->netAmount;
                    $retPagSeg[DS_LINK_BOLETO] = (string)$retornoPagSeguro->paymentLink;
                    $retPagSeg[DS_CODE_TRANSACAO] = (string)$retornoPagSeguro->code;
                    $retPagSeg[CO_INSCRICAO] = $pagInsc[CO_INSCRICAO];

                    $retorno[SUCESSO] = $planoAssinanteAssinaturaService->Salva(
                        $retPagSeg, (int)$retornoPagSeguro->reference);

                    // HISTORICO DO PAGAMENTO RETORNO PAGSEGURO
                    $histPagAss[CO_PLANO_ASSINANTE_ASSINATURA] = (int)$retornoPagSeguro->reference;
                    $histPagAss[DT_CADASTRO] = (string)$retornoPagSeguro->lastEventDate;
                    $histPagAss[DS_ACAO] = 'Mudou o Status do pagamento para ' .
                        StatusPagamentoEnum::getDescricaoValor((string)$retornoPagSeguro->status);
                    $histPagAss[DS_USUARIO] = 'Retorno da operadora do pagamento';
                    $histPagAss[ST_PAGAMENTO] = (string)$retornoPagSeguro->status;

                    $HistPagAssService->Salva($histPagAss);

                    if ($retorno[SUCESSO]) {
                        $retorno[SUCESSO] = true;

                        if ($retPagSeg[DS_LINK_BOLETO]) {
                            echo "<script>window.open('" . $retPagSeg[DS_LINK_BOLETO] . "', '_blank');</script>";
                        }
                        Notificacoes::geraMensagem(
                            'Renovação Cadastrada com Sucesso!',
                            TiposMensagemEnum::SUCESSO
                        );
                        $PDO->commit();
                    } else {
                        Notificacoes::geraMensagem(
                            'Error ao salvar o pagamento',
                            TiposMensagemEnum::ALERTA
                        );
                        $retorno[SUCESSO] = false;
                        $PDO->rollBack();
                    }
                }
            } else {
                Notificacoes::geraMensagem(
                    'Não foi possível realizar a ação',
                    TiposMensagemEnum::ALERTA
                );
                $retorno[SUCESSO] = false;
                $PDO->rollBack();
            }
        } else {
            Notificacoes::geraMensagem(
                $validador[MSG],
                TiposMensagemEnum::ALERTA
            );
            $retorno = $validador;
        }

        return $retorno;
    }

}