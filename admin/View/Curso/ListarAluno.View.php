<style>
    .label_span{
        box-shadow: 1px 1px 1px black;
    }
</style>
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
                        <div class="alert alert-block alert-warning fade in col-md-12"
                             style="margin-bottom: 15px;">
                            <h4 class="alert-heading"><i class="fa fa-money"></i> Status de Pagamento</h4>
                            <?php
                            foreach (StatusPagamentoEnum::$descricao as $chave => $desc) {
                                echo '<span class="circle-img label_span label-' . StatusPagamentoEnum::$cores[$chave] . '">';
                                echo '&nbsp;&nbsp;&nbsp;&nbsp;</span> ' . $desc . ' / ';
                            }
                            ?>
                        </div>
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
                            /** @var PagamentoEntidade $pagamento */
                            $pagamento = $res->getCoPagamento()[0];
                            $acao = '<button class="btn btn-primary btn-visualizar tooltips" data-coPagamento="' .
                                $pagamento->getCoPagamento() . '"  
                                        data-original-title="Visualizar Pagamento" data-placement="top">
                                         <i class="clip-eye"></i>
                                     </button>';
                            if ($pagamento->getStPagamento() == StatusPagamentoEnum::AGUARDANDO_PAGAMENTO ||
                                $pagamento->getStPagamento() == StatusPagamentoEnum::EM_ANALISE) {
                                if ($pagamento->getTpPagamento() == TipoPagamentoEnum::BOLETO
                                    && $pagamento->getDsLinkBoleto()) {
                                    $acao .= ' <a href="' . $pagamento->getDsLinkBoleto() . '" target="_blank"
                                                    class="btn btn-warning tooltips" 
                                                        data-original-title="Abrir Boleto" data-placement="top">
                                                         <i class="clip-file-pdf"></i>
                                                     </a>';
                                } elseif ($pagamento->getTpPagamento() == TipoPagamentoEnum::DEPOSITO_TRANSFERENCIA
                                    && $pagamento->getDsLinkBoleto()) {
                                    $acao .= ' <a href="' . $pagamento->getDsLinkBoleto() . '" target="_blank"
                                                    class="btn btn-warning tooltips" 
                                                        data-original-title="Abrir Página do Banco" data-placement="top">
                                                         <i class="clip-banknote"></i>
                                                     </a>';
                                }
                            }
                            if ($pagamento->getStPagamento() > 0) {
                                if ($pagamento->getStPagamento() == StatusPagamentoEnum::AGUARDANDO_PAGAMENTO ||
                                    $pagamento->getStPagamento() == StatusPagamentoEnum::EM_ANALISE) {
                                    $acao .= ' <a href="' . PASTAADMIN . 'Curso/CancelarPagamentoCurso/' .
                                        Valida::GeraParametro(DS_CODE_TRANSACAO . "/" .
                                            $pagamento->getDsCodeTransacao()) . '" 
                                                class="btn btn-danger tooltips" 
                                                    data-original-title="Cancelar Inscrição do Aluno" data-placement="top">
                                                     <i class="fa fa-trash-o"></i>
                                                 </a>';
                                } elseif ($pagamento->getStPagamento() == StatusPagamentoEnum::PAGO ||
                                    $pagamento->getStPagamento() == StatusPagamentoEnum::DISPONIVEL ||
                                    $pagamento->getStPagamento() == StatusPagamentoEnum::EM_DISPUTA) {
                                    $acao .= ' <a href="' . PASTAADMIN . 'Curso/EstornarPagamentoCurso/' .
                                        Valida::GeraParametro(DS_CODE_TRANSACAO . "/" .
                                            $pagamento->getDsCodeTransacao()) . '" 
                                class="btn btn-danger tooltips" 
                                    data-original-title="Estornar Inscrição do Aluno" data-placement="top">
                                     <i class="fa fa-trash-o"></i>
                                 </a>';
                                }
                            }
                            $dtPagamento = ($pagamento->getDtPago())
                                ? Valida::DataShow($pagamento->getDtPago())
                                : null;
                            $tpPagamento = ($pagamento->getTpPagamento())
                                ? TipoPagamentoEnum::getDescricaoValor($pagamento->getTpPagamento())
                                : null;

                            $spanLabel = '<span class="circle-img label_span label-' .
                                StatusPagamentoEnum::$cores[$pagamento->getStPagamento()] . '">
                                            &nbsp;&nbsp;&nbsp;&nbsp;</span> ';

                            $grid->setColunas($res->getCoAluno()->getCoPessoa()->getNoPessoa(), 3);
                            $grid->setColunas($pagamento->getDsCodeTransacao(), 2);
                            $grid->setColunas($dtPagamento, 2);
                            $grid->setColunas($tpPagamento, 4);
                            $grid->setColunas($pagamento->getNuValorTotal(), 2);
                            $grid->setColunas($spanLabel . StatusPagamentoEnum::getDescricaoValor($pagamento->getStPagamento()), 2);
                            $grid->setColunas($acao, 3);
                            $grid->criaLinha($pagamento->getCoPagamento());
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