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
        $this->ObjetoModel = New InscricaoModel();
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

    public function salvaPagamentoAssinante($dados)
    {
        /** @var PlanoService $PlanoService */
        $PlanoService = $this->getService(PLANO_SERVICE);
        /** @var AssinanteService $AssinanteService */
        $AssinanteService = $this->getService(ASSINANTE_SERVICE);
        /** @var PlanoAssinanteAssinaturaService $planoAssinanteAssinaturaService */
        $planoAssinanteAssinaturaService = $this->getService(PLANO_ASSINANTE_ASSINATURA_SERVICE);
        /** @var HistoricoPagAssinaturaService $HistPagAssService */
        $HistPagAssService = $this->getService(HISTORICO_PAG_ASSINATURA_SERVICE);
        /** @var PessoaService $pessoaService */
        $pessoaService = $this->getService(PESSOA_SERVICE);
        /** @var ContatoService $contatoService */
        $contatoService = $this->getService(CONTATO_SERVICE);
        /** @var PDO $PDO */
        $PDO = $this->getPDO();
        $session = new Session();
        $retorno = [
            SUCESSO => false,
            MSG => null
        ];
        /** @var PlanoAssinanteAssinaturaValidador $planoAssinanteAssinaturaValidador */
        $planoAssinanteAssinaturaValidador = new PlanoAssinanteAssinaturaValidador();
        $validador = $planoAssinanteAssinaturaValidador->validarPlanoAssinanteAssinatura($dados);
        if ($validador[SUCESSO]) {

            $PDO->beginTransaction();
            /** @var PlanoEntidade $plano */
            $plano = $PlanoService->PesquisaUmRegistro($dados[CO_PLANO][0]);
            /** @var AssinanteEntidade $assinante */
            $assinante = $AssinanteService->PesquisaUmRegistro($dados[CO_ASSINANTE]);


            $pessoa[NU_CPF] = Valida::RetiraMascara($dados[NU_CPF]);
            $pessoaService->Salva($pessoa, $assinante->getCoPessoa()->getCoPessoa());
            $contato[NU_TEL1] = Valida::RetiraMascara($dados[NU_TEL1]);
            $contatoService->Salva($contato, $assinante->getCoPessoa()->getCoContato()->getCoContato());


            if (!empty($dados[CO_PLANO_ASSINANTE_ASSINATURA])) {
                $retorno[SUCESSO] = $dados[CO_PLANO_ASSINANTE_ASSINATURA];
                $retorno[MSG] = ATUALIZADO;
            } else {
                $planoAssinanteAssinatura[CO_PLANO_ASSINANTE] = $plano->getCoUltimoPlanoAssinante()->getCoPlanoAssinante();
                $planoAssinanteAssinatura[CO_ASSINANTE] = $dados[CO_ASSINANTE];
                $planoAssinanteAssinatura[NU_PROFISSIONAIS] = PlanoService::getNuProfissionais($plano->getNuMesAtivo());
                $planoAssinanteAssinatura[NU_FILIAIS] = 0;
                $planoAssinanteAssinatura[NU_VALOR_ASSINATURA] = $plano->getCoUltimoPlanoAssinante()->getNuValor();
                $planoAssinanteAssinatura[TP_PAGAMENTO] = $dados[TP_PAGAMENTO][0];
                $planoAssinanteAssinatura[DT_CADASTRO] = Valida::DataHoraAtualBanco();
                $planoAssinanteAssinatura[DT_EXPIRACAO] = Valida::DataDBDate(Valida::CalculaData(
                    Valida::DataShow($assinante->getDtExpiracao()),
                    $plano->getNuMesAtivo(),
                    "+",
                    'm'
                ));
                $planoAssinanteAssinatura[CO_PLANO_ASSINANTE_ASSINATURA_ATIVO] =
                    PlanoAssinanteAssinaturaService::getCoPlanoAssinaturaAtivo(
                        AssinanteService::getCoAssinanteLogado()
                    );
                $retorno[SUCESSO] = $planoAssinanteAssinaturaService->Salva($planoAssinanteAssinatura);
                $retorno[MSG] = CADASTRADO;
            }

            // HISTORICO DO PAGAMENTO INICIADO
            $histPagAss[CO_PLANO_ASSINANTE_ASSINATURA] = $retorno[SUCESSO];
            $histPagAss[DT_CADASTRO] = Valida::DataHoraAtualBanco();
            $histPagAss[DS_ACAO] = 'Inicia o pagamento';
            $histPagAss[DS_USUARIO] = UsuarioService::getNoPessoaCoUsuario(UsuarioService::getCoUsuarioLogado())
                . ' Iniciou o pagamento';
            $histPagAss[ST_PAGAMENTO] = StatusPagamentoEnum::PENDENTE;

            $HistPagAssService->Salva($histPagAss);

            if ($retorno[SUCESSO]) {

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
                    $retPagSeg[CO_PLANO_ASSINANTE] = $plano->getCoUltimoPlanoAssinante()->getCoPlanoAssinante();

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