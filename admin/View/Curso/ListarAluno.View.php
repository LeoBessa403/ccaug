<div class="main-content">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <!-- start: PAGE TITLE & BREADCRUMB -->
                <ol class="breadcrumb">
                    <li>
                        <i class="clip-grid-6"></i>
                        <a href="#">
                            Aluno
                        </a>
                    </li>
                    <li class="active">
                        Alunos
                    </li>
                </ol>
                <div class="page-header">
                    <h1>Aluno
                        <small>Listar Alunos</small>
                        <!--                        --><?php //Valida::geraBtnNovo('Renovar Assinatura', 'RenovaPlanoAluno'); ?>
                    </h1>
                </div>
                <!-- end: PAGE TITLE & BREADCRUMB -->
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <?php include_once 'DetalhesPagamento.View.php' ?>
                        <i class="fa fa-external-link-square"></i>
                        Alunos de Planos
                    </div>
                    <div class="panel-body">
                        <?php
                        Modal::load();
                        Modal::confirmacao("confirma_Aluno");
                        $grid = new Grid();
                        $arrColunas = array('Aluno', 'Code', 'Data Pagamento', 'Meio de Pagamento', 'Valor R$',
                            'Sit. Pagamento', 'Ações');

                        $grid->setColunasIndeces($arrColunas);
                        $grid->criaGrid();
                        $statusSis = '';
                        /** @var InscricaoEntidade $res */
                        foreach ($result as $res):
                            debug($res, 1);
                            $acao = '<button class="btn btn-primary btn-visualizar tooltips" data-coPagamento="' .
                                $res->getCoPagamento()->getCoPagamento() . '"  
                                        data-original-title="Visualizar Pagamento" data-placement="top">
                                         <i class="clip-eye"></i>
                                     </button>';
                            if ($res->getCoPagamento()->getStPagamento() == StatusPagamentoEnum::AGUARDANDO_PAGAMENTO ||
                                $res->getCoPagamento()->getStPagamento() == StatusPagamentoEnum::EM_ANALISE) {
                                if ($res->getCoPagamento()->getTpPagamento() == TipoPagamentoEnum::BOLETO
                                    && $res->getCoPagamento()->getDsLinkBoleto()) {
                                    $acao .= ' <a href="' . $res->getCoPagamento()->getDsLinkBoleto() . '" target="_blank"
                                                    class="btn btn-warning tooltips" 
                                                        data-original-title="Abrir Boleto" data-placement="top">
                                                         <i class="clip-file-pdf"></i>
                                                     </a>';
                                } elseif ($res->getCoPagamento()->getTpPagamento() == TipoPagamentoEnum::DEPOSITO_TRANSFERENCIA
                                    && $res->getCoPagamento()->getDsLinkBoleto()) {
                                    $acao .= ' <a href="' . $res->getCoPagamento()->getDsLinkBoleto() . '" target="_blank"
                                                    class="btn btn-warning tooltips" 
                                                        data-original-title="Abrir Página do Banco" data-placement="top">
                                                         <i class="clip-banknote"></i>
                                                     </a>';
                                }
                            }
                            if ($res->getCoPagamento()->getStPagamento() > 0) {
                                if ($res->getCoPagamento()->getStPagamento() == StatusPagamentoEnum::AGUARDANDO_PAGAMENTO ||
                                    $res->getCoPagamento()->getStPagamento() == StatusPagamentoEnum::EM_ANALISE) {
                                    $acao .= ' <a href="' . PASTAADMIN . 'Aluno/CancelarAssinaturaAluno/' .
                                        Valida::GeraParametro(DS_CODE_TRANSACAO . "/" .
                                            $res->getCoPagamento()->getDsCodeTransacao()) . '" 
                                                class="btn btn-danger tooltips" 
                                                    data-original-title="Cancelar Assinatura do Aluno" data-placement="top">
                                                     <i class="fa fa-trash-o"></i>
                                                 </a>';
                                } elseif ($res->getCoPagamento()->getStPagamento() == StatusPagamentoEnum::PAGO ||
                                    $res->getCoPagamento()->getStPagamento() == StatusPagamentoEnum::DISPONIVEL ||
                                    $res->getCoPagamento()->getStPagamento() == StatusPagamentoEnum::EM_DISPUTA) {
                                    $acao .= ' <a href="' . PASTAADMIN . 'Aluno/EstornarAssinaturaAluno/' .
                                        Valida::GeraParametro(DS_CODE_TRANSACAO . "/" .
                                            $res->getCoPagamento()->getDsCodeTransacao()) . '" 
                                class="btn btn-danger tooltips" 
                                    data-original-title="Estornar Assinatura do Aluno" data-placement="top">
                                     <i class="fa fa-trash-o"></i>
                                 </a>';
                                }
                            }
                            $dtPagamento = ($res->getCoPagamento()->getDtPago())
                                ? Valida::DataShow($res->getCoPagamento()->getDtPago())
                                : null;
                            $tpPagamento = ($res->getCoPagamento()->getTpPagamento())
                                ? TipoPagamentoEnum::getDescricaoValor($res->getCoPagamento()->getTpPagamento())
                                : null;

                            $grid->setColunas($res->getCoAluno()->getCoPessoa()->getNoPessoa(), 3);
                            $grid->setColunas($res->getCoPagamento()->getDsCodeTransacao(), 2);
                            $grid->setColunas($dtPagamento, 2);
                            $grid->setColunas($tpPagamento, 4);
                            $grid->setColunas($res->getCoPagamento()->getNuValorTotal(), 2);
                            $grid->setColunas(StatusPagamentoEnum::getDescricaoValor($res->getCoPagamento()->getStPagamento()), 2);
                            $grid->setColunas($acao, 3);
                            $grid->criaLinha($res->getCoPagamento()->getCoPagamento());
                        endforeach;
                        $grid->finalizaGrid();
                        ?>
                    </div>
                </div>
                <!-- end: DYNAMIC TABLE PANEL -->
            </div>
        </div>
        <!-- end: PAGE CONTENT-->
    </div>
</div>
<!-- end: PAGE -->