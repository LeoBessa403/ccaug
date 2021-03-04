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
        /** @var CursoService $CursoService */
        $CursoService = $this->getService(CURSO_SERVICE);
        /** @var PessoaService $PessoaService */
        $PessoaService = $this->getService(PESSOA_SERVICE);
        /** @var PDO $PDO */
        $PDO = $this->getPDO();
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
            /** @var CursoEntidade $curso */
            $curso = $CursoService->PesquisaUmRegistro($dados[CO_CURSO]);
            $insc[CO_TURMA] = 1;
            if ($curso->getCoTurma()) {
                $turmas = array_reverse($curso->getCoTurma());
                /** @var TurmaEntidade $turma */
                foreach ($turmas as $turma) {
                    if ($turma->getStStatus() == SimNaoEnum::SIM) {
                        $insc[CO_TURMA] = $turma->getCoTurma();
                        break;
                    }
                }
            }
            $insc[DT_CADASTRO] = Valida::DataHoraAtualBanco();
            $pagInsc[CO_INSCRICAO] = $this->Salva($insc);
            if (!empty($dados[TP_PAGAMENTO])) {
                $pagInsc[TP_PAGAMENTO] = $dados[TP_PAGAMENTO][0];
            } else {
                $pagInsc[TP_PAGAMENTO] = TipoPagamentoEnum::GRATIS;
            }
            $pagInsc[DT_MODIFICADO] = Valida::DataHoraAtualBanco();

            $histPag[CO_PAGAMENTO] = $PagamentoService->Salva($pagInsc);
            $retorno[MSG] = CADASTRADO;

            $dadosEmail[NO_PESSOA] = $dados[NO_PESSOA];
            $dadosEmail[DS_EMAIL] = $dados[DS_EMAIL];
            $dadosEmail[DS_TITULO] = $curso->getCoUltimoValorCurso()->getDsTitulo();

            if ($pagInsc[TP_PAGAMENTO] == TipoPagamentoEnum::GRATIS) {

                $retPagSeg[DT_MODIFICADO] = Valida::DataHoraAtualBanco();
                $retPagSeg[NU_VALOR_PAGO] = '0.00';
                $retPagSeg[NU_VALOR_TOTAL] = '0.00';
                $retPagSeg[NU_VALOR_DESCONTO] = '0.00';
                $retPagSeg[ST_PAGAMENTO] = StatusPagamentoEnum::PAGO;

                $PagamentoService->Salva($retPagSeg, $histPag[CO_PAGAMENTO]);

                // HISTORICO DO PAGAMENTO INICIADO
                $histPag[DT_CADASTRO] = Valida::DataHoraAtualBanco();
                $histPag[DS_ACAO] = 'Curso Gratuito';
                $histPag[DS_USUARIO] = 'O Aluno Efetivou a Inscrição';
                $histPag[ST_PAGAMENTO] = StatusPagamentoEnum::PAGO;
                $retorno[SUCESSO] = $HistoricoPagamentoService->Salva($histPag);

                if ($retorno[SUCESSO]) {

                    $retorno[SUCESSO] = true;
                    Notificacoes::geraMensagem(
                        'Vagas do cursos foram esgotadas. Estaremos formando uma nova turma, 
                        em breve entraremos em contato para maiores informações.',
                        TiposMensagemEnum::SUCESSO
                    );
                    $dadosEmail['reserva'] = true;
                    $PDO->commit();
                } else {
                    Notificacoes::geraMensagem(
                        'Error ao salvar o pagamento',
                        TiposMensagemEnum::ALERTA
                    );
                    $retorno[SUCESSO] = false;
                    $PDO->rollBack();
                }
            } else {

                if ($dados[TP_PAGAMENTO][0] == TipoPagamentoEnum::PIX) {
                    $pagCurso[DT_MODIFICADO] = Valida::DataHoraAtualBanco();
                    $pagCurso[NU_VALOR_PAGO] = $curso->getCoUltimoValorCurso()->getNuValor();
                    $pagCurso[NU_VALOR_TOTAL] = $curso->getCoUltimoValorCurso()->getNuValor();
                    $pagCurso[NU_VALOR_DESCONTO] = '0.00';
                    $pagCurso[ST_PAGAMENTO] = StatusPagamentoEnum::AGUARDANDO_PAGAMENTO;

                    $PagamentoService->Salva($pagCurso, $histPag[CO_PAGAMENTO]);

                    // HISTORICO DO PAGAMENTO INICIADO
                    $histPag[DT_CADASTRO] = Valida::DataHoraAtualBanco();
                    $histPag[DS_ACAO] = 'Iniciou o Pagamento.';
                    $histPag[DS_USUARIO] = 'O Aluno Efetivou a Inscrição';
                    $histPag[ST_PAGAMENTO] = StatusPagamentoEnum::AGUARDANDO_PAGAMENTO;
                    $retorno[SUCESSO] = $HistoricoPagamentoService->Salva($histPag);

                    if ($retorno[SUCESSO]) {
                        $dadosEmail['pix'] = true;
                        $retorno[SUCESSO] = true;
                        Notificacoes::geraMensagem(
                            'Inscrição Realizada com Sucesso!<br>Instruções de pagamento Enviada no E-mail.',
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
                } else {

                    // HISTORICO DO PAGAMENTO INICIADO
                    $histPag[DT_CADASTRO] = Valida::DataHoraAtualBanco();
                    $histPag[DS_ACAO] = 'Inicia o pagamento';
                    $histPag[DS_USUARIO] = 'Aluno Iniciou o pagamento';
                    $histPag[ST_PAGAMENTO] = StatusPagamentoEnum::PENDENTE;
                    $retorno[SUCESSO] = $HistoricoPagamentoService->Salva($histPag);

                    if ($retorno[SUCESSO]) {
                        /** @var PessoaEntidade $pessoa */
                        $pessoa = $PessoaService->PesquisaUmRegistro($coPessoa);
                        $retorno = $this->processaPagamento($curso, $pessoa, $histPag[CO_PAGAMENTO]);

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
                            $retPagSeg[NU_VALOR_PAGO] = (string)$retornoPagSeguro->netAmount;
                            $retPagSeg[NU_VALOR_TOTAL] = $curso->getCoUltimoValorCurso()->getNuValor();
                            $retPagSeg[DS_LINK_BOLETO] = (string)$retornoPagSeguro->paymentLink;
                            $retPagSeg[DS_CODE_TRANSACAO] = (string)$retornoPagSeguro->code;
                            $retorno[SUCESSO] = $PagamentoService->Salva(
                                $retPagSeg, (int)$retornoPagSeguro->reference);

                            // HISTORICO DO PAGAMENTO RETORNO PAGSEGURO
                            $histPagAss[CO_PAGAMENTO] = (int)$retornoPagSeguro->reference;
                            $histPagAss[DT_CADASTRO] = (string)$retornoPagSeguro->lastEventDate;
                            $histPagAss[DS_ACAO] = 'Mudou o Status do pagamento para ' .
                                StatusPagamentoEnum::getDescricaoValor((string)$retornoPagSeguro->status);
                            $histPagAss[DS_USUARIO] = 'Retorno da operadora do pagamento';
                            $histPagAss[ST_PAGAMENTO] = (string)$retornoPagSeguro->status;

                            $HistoricoPagamentoService->Salva($histPagAss);

                            if ($retorno[SUCESSO]) {
                                $retorno[SUCESSO] = true;

                                if ($dados[TP_PAGAMENTO][0] == TipoPagamentoEnum::BOLETO) {
                                    if ($retPagSeg[DS_LINK_BOLETO]) {
                                        $dadosEmail[DS_LINK_BOLETO] = $retPagSeg[DS_LINK_BOLETO];
                                    }
                                    Notificacoes::geraMensagem(
                                        'Inscrição Realizada com Sucesso!<br>Confirmação de Inscrição e 
                                            Link Do Boleto Enviado no Email',
                                        TiposMensagemEnum::SUCESSO
                                    );
                                } else {
                                    Notificacoes::geraMensagem(
                                        'Inscrição Realizada com Sucesso!<br>Confirmação de Inscrição e 
                                            Enviado no Email<br>Aguardando confirmação de pagamento da Operadora do Cartão',
                                        TiposMensagemEnum::SUCESSO
                                    );
                                }

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
                }
            }
            $this->enviaConfirmacaoEmail($dadosEmail);
        } else {
            Notificacoes::geraMensagem(
                $validador[MSG],
                TiposMensagemEnum::ALERTA
            );
            $retorno = $validador;
        }
        return $retorno;
    }


    private function processaPagamento(CursoEntidade $curso, PessoaEntidade $pessoa, $coPag)
    {
        $Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);

        $tpPagamento = $Dados[TP_PAGAMENTO][0];
        $DadosArray["email"] = EMAIL_PAGSEGURO;
        $DadosArray["token"] = TOKEN_PAGSEGURO;

        $tel = $pessoa->getCoContato()->getNuTel1();
        $ddd = substr($tel, 0, 2);
        $numero = substr($tel, 2);

        if ($tpPagamento == TipoPagamentoEnum::CARTAO_CREDITO) {
            $DadosArray['creditCardToken'] = $Dados['tokenCartao'];
            $DadosArray['installmentQuantity'] = $Dados['qntParcelas'][0];
            $DadosArray['installmentValue'] = (string)Valida::FormataMoedaBanco($Dados['installmentValue']);
            $DadosArray['noInterestInstallmentQuantity'] = 3;//Quantidade de parcelas sem juro
            $DadosArray['creditCardHolderName'] = $Dados['creditCardHolderName'];
            $DadosArray['creditCardHolderCPF'] = Valida::RetiraMascara($Dados['creditCardHolderCPF']);
            $DadosArray['creditCardHolderBirthDate'] = $Dados['creditCardHolderBirthDate'];
            $DadosArray['creditCardHolderAreaCode'] = $ddd;
            $DadosArray['creditCardHolderPhone'] = $numero;
            $DadosArray['billingAddressStreet'] = $Dados[DS_ENDERECO];
            $DadosArray['billingAddressNumber'] = 10;
            $DadosArray['billingAddressComplement'] = $Dados[DS_COMPLEMENTO];
            $DadosArray['billingAddressDistrict'] = $Dados[DS_BAIRRO];
            $DadosArray['billingAddressPostalCode'] = Valida::RetiraMascara($Dados[NU_CEP]);
            $DadosArray['billingAddressCity'] = $Dados[NO_CIDADE];
            $DadosArray['billingAddressState'] = $Dados[SG_UF][0];
            $DadosArray['billingAddressCountry'] = 'BRA';
            $DadosArray['paymentMethod'] = 'creditCard';
        } elseif ($tpPagamento == TipoPagamentoEnum::BOLETO) {
            $DadosArray['paymentMethod'] = 'boleto';
        } elseif ($tpPagamento == TipoPagamentoEnum::PIX) {
            $DadosArray['bankName'] = $Dados['bankName'][0];
            $DadosArray['paymentMethod'] = 'eft';
        }

        $DadosArray['paymentMode'] = 'default';

        $DadosArray['receiverEmail'] = EMAIL_LOJA;
        $DadosArray['currency'] = 'BRL';
        $DadosArray['extraAmount'] = '0.00';

        $DadosArray["itemId1"] = $curso->getCoCurso();
        $DadosArray["itemDescription1"] = $curso->getCoUltimoValorCurso()->getDsTitulo();
        $total_venda = number_format($curso->getCoUltimoValorCurso()->getNuValor(), 2, '.', '');
        $DadosArray["itemAmount1"] = $total_venda;
        $DadosArray["itemQuantity1"] = 1;

        $DadosArray['notificationURL'] = URL_NOTIFICACAO;
        $DadosArray['reference'] = $coPag;
        $DadosArray['senderName'] = $pessoa->getNoPessoa();
        $DadosArray['senderCPF'] = $pessoa->getNuCpf();

        $tel = $pessoa->getCoContato()->getNuTel1();
        $ddd = substr($tel, 0, 2);
        $numero = substr($tel, 2);

        $email = $pessoa->getCoContato()->getDsEmail();
        if (!PROD) {
            $email = explode('@', $email);
            $email = $email[0] . '@sandbox.pagseguro.com.br';
        }

        $DadosArray['senderAreaCode'] = $ddd;
        $DadosArray['senderPhone'] = $numero;
        $DadosArray['senderEmail'] = $email;
        $DadosArray['senderHash'] = $Dados['hash'];
        $DadosArray['shippingAddressRequired'] = false;

        $buildQuery = http_build_query($DadosArray);
        $url = URL_PAGSEGURO . "transactions";

        $curl = curl_init($url);
        curl_setopt($curl, CURLOPT_HTTPHEADER, array("Content-Type: application/x-www-form-urlencoded; charset=UTF-8"));
        curl_setopt($curl, CURLOPT_POST, true);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, true);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $buildQuery);
        $retorno = curl_exec($curl);
        curl_close($curl);
        $xml = simplexml_load_string($retorno);

        $retorna = ['dados' => $xml, 'DadosArray' => $DadosArray];
        return $retorna;
    }

    public function enviaConfirmacaoEmail(array $dadosEmail)
    {
        if ($dadosEmail[NO_PESSOA]) {
            /** @var Email $email */
            $email = new Email();

            // Índice = Nome, e Valor = Email.
            $emails = array(
                $dadosEmail[NO_PESSOA] => $dadosEmail[DS_EMAIL],
            );
            $Mensagem = "<h3>Olá " . $dadosEmail[NO_PESSOA] . ", Sua Inscrição no " . $dadosEmail[DS_TITULO] .
                " foi realizada com sucesso.</h3>";
            $Mensagem .= "<p>Em breve Mais informações do Curso.</p>";
            if (!empty($dadosEmail[DS_LINK_BOLETO])) {
                $Mensagem .= "<p><b>Aguardando Pagamento, </b>Acesso o link do Boleto para pagamento 
                        <a href='" . $dadosEmail[DS_LINK_BOLETO] . "'>ABRIR BOLETO</a></p><br>";
            } elseif (!empty($dadosEmail['pix'])) {
                $Mensagem .= "<p>QR Code do PIX <img src='http://ccaug.com.br/uploads/pix.jpg' height='150' width='150'/> </p><br>";
                $Mensagem .= "<p>Chave PIX <b>linnekerlima@hotmail.com</b></p><br>";
                $Mensagem .= "<p><b>Aguardando Pagamento, </b>enviar comprovante para o WhatsApp da Escola.";
                $Mensagem .= '<br>Se já realizou o pagamento, Clique em</b> 
                                <a class="pulse" title="Nos chame no WhatSapp"
                                               href="' . Valida::geraLinkWhatSapp("Ola, Segue meu comprovante de pagamento") . '"
                                               target="_blank">WhatsApp</a> e nós envie o comprovante</p><br>';
            }elseif (!empty($dadosEmail['reserva'])) {
                $Mensagem .= "<p>Vagas do cursos foram esgotadas. Estaremos formado uma nova turma, 
                        ou se caso surja uma Vaga na Turma Atual.</p><br>";
            }

            $email->setEmailDestinatario($emails)
                ->setTitulo("Escola de Apóstolos - Confirmação de Inscrição do " . $dadosEmail[DS_TITULO])
                ->setMensagem($Mensagem);

            // Variável para validação de Emails Enviados com Sucesso.
            $this->Email = $email->Enviar();
        } else {
            Notificacoes::geraMensagem(
                "Confirmação da Ativação não enviada!",
                TiposMensagemEnum::INFORMATIVO
            );
        }
    }
}