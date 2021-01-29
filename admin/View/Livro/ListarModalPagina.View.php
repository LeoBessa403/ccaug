<div class="main-content">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <!-- start: PAGE TITLE & BREADCRUMB -->
                <ol class="breadcrumb">
                    <li>
                        <i class="clip-grid-6"></i>
                        <a href="#">
                            Livro
                        </a>
                    </li>
                    <li class="active">
                        Listar
                    </li>
                </ol>
                <div class="page-header">
                    <h1>Modal
                        <small>Listar Modais</small>
                        <?php Valida::geraBtnNovo('Criar Modal', 'CadastroModalPagina/'
                            . Valida::GeraParametro(CO_PAGINA_LIVRO . "/" . $pagina)); ?>
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
                        Modal
                    </div>
                    <div class="panel-body">
                        <?php
                        $grid = new Grid();
                        ?>
                        <h2>
                            <small>Modais Cadastradas</small>
                        </h2>
                        <?php
                        Modal::load();
                        Modal::deletaRegistro(UrlAmigavel::$controller);

                        $arrColunas = array('Identificador', 'Título', 'Ativo', 'Ações');

                        $grid->setColunasIndeces($arrColunas);
                        $grid->criaGrid();

                        /** @var ModalEntidade $res */
                        foreach ($result as $res):
                            $acao = '<a href="' . PASTAADMIN . 'Livro/CadastroModalPagina/'
                                . Valida::GeraParametro(CO_MODAL . "/" . $res->getCoModal()
                                    . "/" . CO_PAGINA_LIVRO . "/" . $pagina) . '" 
                                class="btn btn-primary tooltips" 
                                data-original-title="Visualizar Registro" data-placement="top">
                                <i class="fa fa-clipboard"></i>
                                </a>';

                            $grid->setColunas($res->getDsIdentificador(), 3);
                            $grid->setColunas($res->getDsTitulo());
                            $grid->setColunas(Valida::SituacaoSimNao($res->getStStatus()),2);
                            $grid->setColunas($acao, 3);
                            $grid->criaLinha($res->getCoModal());
                        endforeach;
                        $grid->finalizaGrid();
                        ?>
                    </div>
                </div>
                <div class="pull-right">
                    <!-- end: DYNAMIC TABLE PANEL -->
                    <?php Valida::geraBtnVoltar('Livro/ListarPaginaLivro/' .
                        Valida::GeraParametro(CO_LIVRO . "/" . $livro
                            . "/" . CO_CAPITULO . "/" . $capitulo)); ?>
                </div>
                <br><br><br>
                <!-- end: DYNAMIC TABLE PANEL -->
            </div>
        </div>
        <!-- end: PAGE CONTENT-->
    </div>
</div>
<!-- end: PAGE -->