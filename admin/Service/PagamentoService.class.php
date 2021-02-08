<?php

/**
 * PagamentoService.class [ SEVICE ]
 * @copyright (c) 2021, Leo Bessa
 */
class  PagamentoService extends AbstractService
{

    private $ObjetoModel;


    public function __construct()
    {
        parent::__construct(PagamentoEntidade::ENTIDADE);
        $this->ObjetoModel = New PagamentoModel();
    }


    public function notificacaoPagSeguro($aplicacao = false)
    {
        /** @var PDO $PDO */
        $PDO = $this->getPDO();
        /** @var PagamentoService $PagamentoService */
        $PagamentoService = new PagamentoService();
        /** @var HistoricoPagamentoService $HistoricoPagamentoService */
        $HistoricoPagamentoService = new HistoricoPagamentoService();

        if ($aplicacao) {
            $Url = URL_PAGSEGURO . "transactions/{$_POST['notificationCode']}?email=" .
                EMAIL_PAGSEGURO . "&token=" . TOKEN_PAGSEGURO;
        } else {
            $Url = URL_PAGSEGURO . "transactions/notifications/{$_POST['notificationCode']}?email=" .
                EMAIL_PAGSEGURO . "&token=" . TOKEN_PAGSEGURO;
        }

        $Curl = curl_init($Url);
        curl_setopt($Curl, CURLOPT_SSL_VERIFYPEER, true);
        curl_setopt($Curl, CURLOPT_RETURNTRANSFER, true);
        $Retorno = curl_exec($Curl);
        curl_close($Curl);

        $Xml = simplexml_load_string($Retorno);
        $coPagamento = (string)$Xml->reference;
        $dados[ST_PAGAMENTO] = (string)$Xml->status;
        $dados[DT_MODIFICADO] = (string)$Xml->lastEventDate;
        if ($dados[ST_PAGAMENTO] == StatusPagamentoEnum::PAGO)
            $dados[DT_CONFIRMA_PAGAMENTO] = (string)$Xml->lastEventDate;

        /** @var PagamentoEntidade $pagamento */
        $pagamento = $PagamentoService->PesquisaUmRegistro($coPagamento);

//        $whats = new WhatsAppService();
//        $retWhats = $whats->enviaMsgRetornoPagamento($plan->getCoAssinante()->getCoAssinante(),$Xml);

        $PDO->beginTransaction();
        if ($pagamento->getStPagamento() != (string)$Xml->status) {

            // HISTORICO DO PAGAMENTO RETORNO PAGSEGURO
            $histPaG[CO_PAGAMENTO] = $coPagamento;
            $histPaG[DT_CADASTRO] = (string)$Xml->lastEventDate;
            $histPaG[DS_ACAO] = 'Mudou o Status do pagamento para ' .
                StatusPagamentoEnum::getDescricaoValor((string)$Xml->status);
            $histPaG[DS_USUARIO] = 'Retorno da operadora do pagamento';
            $histPaG[ST_PAGAMENTO] = (string)$Xml->status;

            $HistoricoPagamentoService->Salva($histPaG);

//            $whats = new WhatsAppService();
//            $retWhats = $whats->enviaMsgRetornoPagamento($plan->getCoAssinante()->getCoAssinante(),$Xml);
        }

        $retorno[SUCESSO] = $PagamentoService->Salva($dados, $coPagamento);

        if ($retorno[SUCESSO]) {
            $retorno[SUCESSO] = true;
            $PDO->commit();
        } else {
            $retorno[SUCESSO] = false;
            $PDO->rollBack();
        }
        return $retorno;
    }


    public function CancelarPagamentoCurso($code)
    {
        /** @var PagamentoService $PagamentoService */
        $PagamentoService = new PagamentoService();
        /** @var HistoricoPagamentoService $HistoricoPagamentoService */
        $HistoricoPagamentoService = new HistoricoPagamentoService();
        /** @var PDO $PDO */
        $PDO = $this->getPDO();
        $retorno = [
            SUCESSO => false,
            MSG => null
        ];
        $session = new Session();
        $Url = URL_PAGSEGURO . "transactions/cancels?email=" .
            EMAIL_PAGSEGURO . "&token=" . TOKEN_PAGSEGURO . "&transactionCode={$code}";

        $Curl = curl_init($Url);
        curl_setopt($Curl, CURLOPT_HTTPHEADER, array("Content-Type: application/x-www-form-urlencoded; charset=UTF-8"));
        curl_setopt($Curl, CURLOPT_POST, true);
        curl_setopt($Curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($Curl, CURLOPT_RETURNTRANSFER, true);
        $Retorno = curl_exec($Curl);
        curl_close($Curl);

        $Xml = simplexml_load_string($Retorno);

        if (!(string)$Xml->error->message) {
            $PDO->beginTransaction();

            /** @var PagamentoEntidade $pagamento */
            $pagamento = $PagamentoService->PesquisaUmQuando([
                DS_CODE_TRANSACAO => $code
            ]);

            // HISTORICO DO PAGAMENTO RETORNO PAGSEGURO
            $histPaG[CO_PAGAMENTO] = $pagamento->getCoPagamento();
            $histPaG[DT_CADASTRO] = Valida::DataHoraAtualBanco();
            $histPaG[DS_ACAO] = 'Mudou o Status do pagamento para ' .
                StatusPagamentoEnum::getDescricaoValor(StatusPagamentoEnum::CANCELADA);
            $histPaG[DS_USUARIO] = 'Suporte Efetuou o cancelamento.';
            $histPaG[ST_PAGAMENTO] = StatusPagamentoEnum::CANCELADA;

            $HistoricoPagamentoService->Salva($histPaG);

            // DESATIVA O PAGAMENTO CANCELADO
            $dados[DT_MODIFICADO] = Valida::DataHoraAtualBanco();
            $dados[ST_PAGAMENTO] = StatusPagamentoEnum::CANCELADA;
            $retorno[SUCESSO] = $PagamentoService->Salva($dados, $pagamento->getCoPagamento());

            if ($retorno[SUCESSO]) {
                $retorno[SUCESSO] = true;
                $session->setSession(MENSAGEM, ATUALIZADO);
                $PDO->commit();
            } else {
                $retorno[SUCESSO] = false;
                Notificacoes::geraMensagem(
                    'Error ao Cancela essa Transação.',
                    TiposMensagemEnum::ALERTA
                );
                $PDO->rollBack();
            }

        } else {
            Notificacoes::geraMensagem(
                'Error: Essa Transação não pode ser Cancelada.',
                TiposMensagemEnum::INFORMATIVO
            );
            $retorno[SUCESSO] = false;
        }
        return $retorno;
    }

    public function EstornarPagamentoCurso($code)
    {
        /** @var PagamentoService $PagamentoService */
        $PagamentoService = new PagamentoService();
        /** @var HistoricoPagamentoService $HistoricoPagamentoService */
        $HistoricoPagamentoService = new HistoricoPagamentoService();
        /** @var PDO $PDO */
        $PDO = $this->getPDO();
        $retorno = [
            SUCESSO => false,
            MSG => null
        ];
        $session = new Session();
        $Url = URL_PAGSEGURO . "transactions/refunds?email=" .
            EMAIL_PAGSEGURO . "&token=" . TOKEN_PAGSEGURO . "&transactionCode={$code}";

        $Curl = curl_init($Url);
        curl_setopt($Curl, CURLOPT_HTTPHEADER, array("Content-Type: application/x-www-form-urlencoded; charset=UTF-8"));
        curl_setopt($Curl, CURLOPT_POST, true);
        curl_setopt($Curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($Curl, CURLOPT_RETURNTRANSFER, true);
        $Retorno = curl_exec($Curl);
        curl_close($Curl);

        $Xml = simplexml_load_string($Retorno);
        if (!(string)$Xml->error->message) {
            $PDO->beginTransaction();

            /** @var PagamentoEntidade $pagamento */
            $pagamento = $PagamentoService->PesquisaUmQuando([
                DS_CODE_TRANSACAO => $code
            ]);

            // HISTORICO DO PAGAMENTO RETORNO PAGSEGURO
            $histPaG[CO_PAGAMENTO] = $pagamento->getCoPagamento();
            $histPaG[DT_CADASTRO] = Valida::DataHoraAtualBanco();
            $histPaG[DS_ACAO] = 'Mudou o Status do pagamento para ' .
                StatusPagamentoEnum::getDescricaoValor(StatusPagamentoEnum::DEVOLVIDA);
            $histPaG[DS_USUARIO] = 'Suporte Efetuou o estorno.';
            $histPaG[ST_PAGAMENTO] = StatusPagamentoEnum::DEVOLVIDA;

            $HistoricoPagamentoService->Salva($histPaG);

            // DESATIVA O PLANO ESTORNADO
            $dados[DT_MODIFICADO] = Valida::DataHoraAtualBanco();
            $dados[ST_PAGAMENTO] = StatusPagamentoEnum::DEVOLVIDA;
            $retorno[SUCESSO] = $PagamentoService->Salva($dados, $pagamento->getCoPagamento());

            if ($retorno[SUCESSO]) {
                $retorno[SUCESSO] = true;
                $session->setSession(MENSAGEM, ATUALIZADO);
                $PDO->commit();
            } else {
                $retorno[SUCESSO] = false;
                Notificacoes::geraMensagem(
                    'Error ao Estorna essa Transação.',
                    TiposMensagemEnum::ALERTA
                );
                $PDO->rollBack();
            }
        } else {
            Notificacoes::geraMensagem(
                'Error: Essa Transação não pode ser Estornada.',
                TiposMensagemEnum::INFORMATIVO
            );
            $retorno[SUCESSO] = false;
        }
        return $retorno;
    }

    public function DetalharPagamentoAjax($coPagamento)
    {
        /** @var PagamentoService $PagamentoService */
        $PagamentoService = new PagamentoService();
        /** @var PagamentoEntidade $pagamento */
        $pagamento = $PagamentoService->PesquisaUmRegistro($coPagamento);

        $dados = [];
        $dados[CO_PAGAMENTO] = [];
        if ($pagamento->getCoHistoricoPagamento()) {
            /** @var HistoricoPagamentoEntidade $histPag */
            foreach ($pagamento->getCoHistoricoPagamento() as $histPag) {
                $dados[CO_HISTORICO_PAGAMENTO][] = Valida::DataShow($histPag->getDtCadastro(), 'd/m/Y H:i:s') .
                    ' - Status: ' . StatusPagamentoEnum::getDescricaoValor($histPag->getStPagamento()) .
                    ', ' . $histPag->getDsAcao() . ' - ' . $histPag->getDsUsuario();
            }
            $dados[CO_HISTORICO_PAGAMENTO] = array_reverse($dados[CO_HISTORICO_PAGAMENTO]);
        }

        $dtPagamento = ($pagamento->getDtPago()) ?
            Valida::DataShow($pagamento->getDtPago(), 'd/m/Y H:i:s') : '';

        $tpPagamento = ($pagamento->getTpPagamento()) ?
            TipoPagamentoEnum::getDescricaoValor($pagamento->getTpPagamento()) : '';

        $codePagamento = ($pagamento->getDsCodeTransacao() != 'null') ?
            $pagamento->getDsCodeTransacao() : '';

        $dados[DS_CODE_TRANSACAO] = $codePagamento;
        $dados[DS_TITULO] = 'Curso nota 1000';
        $dados[DT_CONFIRMA_PAGAMENTO] = $dtPagamento;
        $dados[ST_PAGAMENTO] = StatusPagamentoEnum::getDescricaoValor($pagamento->getStPagamento());
        $dados[TP_PAGAMENTO] = $tpPagamento;
        $dados[NU_VALOR_TOTAL] = Valida::FormataMoeda($pagamento->getNuValorTotal(), 'R$');
        if (PerfilService::perfilMaster()) {
            $dados[NU_VALOR_DESCONTO] = Valida::FormataMoeda($pagamento->getNuValorDesconto(), 'R$');
            $dados[NU_VALOR_PAGO] = Valida::FormataMoeda($pagamento->getNuValorPago(), 'R$');
        }
        return $dados;
    }

}