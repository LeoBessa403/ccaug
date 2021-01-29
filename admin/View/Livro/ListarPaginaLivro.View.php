<style>
    .btn-dark-grey {
        position: absolute;
        margin-left: 3px;
    }

    .qtd {
        float: right;
        top: -6px;
        left: -4px;
        position: relative;
        z-index: 9999 !important;
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
                            Página
                        </a>
                    </li>
                    <li class="active">
                        Listar
                    </li>
                </ol>
                <div class="page-header">
                    <h1>Página
                        <small>Listar alunos</small>
                        <?php Valida::geraBtnNovo('Criar Página', 'CadastroPaginaLivro/'
                            . Valida::GeraParametro(CO_LIVRO . "/" . $livro . "/" .
                                CO_CAPITULO . "/" . $capitulo)); ?>
                    </h1>
                </div>
                <!-- end: PAGE TITLE & BREADCRUMB -->
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-external-link-square"></i>
                        Página
                    </div>
                    <div class="panel-body">
                        <?php
                        $grid = new Grid();
                        ?>
                        <h2>
                            <small>Páginas Cadastradas</small>
                        </h2>
                        <?php
                        Modal::load();
                        Modal::deletaRegistro(UrlAmigavel::$controller);
                        Modal::confirmacao("confirma_Usuario");

                        $arrColunas = array('Página', 'Livro', 'Capítulo', 'Status', 'Ações');

                        $grid->setColunasIndeces($arrColunas);
                        $grid->criaGrid();

                        /** @var PaginaLivroEntidade $res */
                        foreach ($result as $res):
                            $acao = '<a href="' . PASTAADMIN . 'Livro/CadastroPaginaLivro/'
                                . Valida::GeraParametro(CO_PAGINA_LIVRO . "/" . $res->getCoPaginaLivro() . "/"
                                    . CO_LIVRO . "/" . $livro . "/" .
                                    CO_CAPITULO . "/" . $capitulo) . '" 
                                class="btn btn-primary tooltips" 
                                data-original-title="Visualizar Registro" data-placement="top">
                                <i class="fa fa-clipboard"></i>
                                </a>
                                 <a href="' . PASTAADMIN . 'Livro/ListarModalPagina/' .
                                Valida::GeraParametro(CO_PAGINA_LIVRO . "/" . $res->getCoPaginaLivro()) . '" 
                                class="btn btn-dark-grey tooltips" 
                                    data-original-title="Modais da Página" data-placement="top">
                                     <i class="clip-stack-empty"></i>
                                 </a>';
                            if (!empty($res->getCoModal())) {
                                $acao .= ' <span class="qtd badge badge-danger"> ' . count($res->getCoModal()) . ' </span>';
                            }

                            $grid->setColunas('');
                            $grid->setColunas(strtoupper($res->getCoCapitulo()->getCoLivro()->getDsTitulo()));
                            $grid->setColunas(strtoupper($res->getCoCapitulo()->getDsTitulo()));
                            $grid->setColunas(Valida::SituacaoSimNao($res->getStStatus()));
                            $grid->setColunas($acao, 2);
                            $grid->criaLinha($res->getCoPaginaLivro());
                        endforeach;
                        $grid->finalizaGrid();
                        ?>
                    </div>
                </div>
                <div class="pull-right">
                    <!-- end: DYNAMIC TABLE PANEL -->
                    <?php Valida::geraBtnVoltar('Livro/ListarCapitulo/' .
                        Valida::GeraParametro(CO_LIVRO . "/" . $livro . "/" .
                            CO_CAPITULO . "/" . $capitulo)); ?>
                </div>
                <br><br><br>
                <!-- end: DYNAMIC TABLE PANEL -->
            </div>
        </div>
        <!-- end: PAGE CONTENT-->
    </div>
</div>
<!-- end: PAGE -->