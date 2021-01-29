<div class="main-content">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <!-- start: PAGE TITLE & BREADCRUMB -->
                <ol class="breadcrumb">
                    <li>
                        <i class="clip-grid-6"></i>
                        <a href="#">
                            Professor
                        </a>
                    </li>
                    <li class="active">
                        Listar
                    </li>
                </ol>
                <div class="page-header">
                    <h1>Escola
                        <small>Listar Professor</small>
                        <?php if ($gestor) Valida::geraBtnNovo('Criar Professor', 'CadastroProfessor/'
                            . Valida::GeraParametro(CO_ESCOLA . "/" . $escola)); ?>
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
                        Professor
                    </div>
                    <div class="panel-body">
                        <?php
                        $perfil_master = false;

                        $grid = new Grid();
                        if (!PerfilService::perfilCoordenador()) {
                            echo $grid->PesquisaAvancada('Pesquisar Professor');
                        }
                        ?>
                        <h2>
                            <small>Professores Cadastrados</small>
                        </h2>
                        <?php
                        Modal::load();
                        Modal::deletaRegistro(UrlAmigavel::$controller);
                        Modal::confirmacao("confirma_Usuario");

                        $arrColunas = array('Professor', 'Escola', 'Qtd. Turmas', 'Ações');

                        $grid->setColunasIndeces($arrColunas);
                        $grid->criaGrid();

                        /** @var ProfessorEntidade $res */
                        foreach ($result as $res):

//                            debug($res->getCoMateriaTurma(),1);

                            $acao = '<a href="' . PASTAADMIN . 'Escola/CadastroProfessor/'
                                . Valida::GeraParametro(CO_PROFESSOR . "/" . $res->getCoProfessor()
                                    . "/" . CO_ESCOLA . "/" . $res->getCoEscola()->getCoEscola()) . '"
                                class="btn btn-primary tooltips"
                                data-original-title="Visualizar Registro" data-placement="top">
                                <i class="fa fa-clipboard"></i>
                                </a>';

                            $grid->setColunas($res->getCoPessoa()->getNoPessoa());
                            $grid->setColunas($res->getCoEscola()->getNoFantasia());
                            $grid->setColunas(count($res->getCoMateriaTurma()));
                            $grid->setColunas($acao, 2);
                            $grid->criaLinha($res->getCoProfessor());
                        endforeach;
                        $grid->finalizaGrid();
                        ?>
                    </div>
                </div>
                <div class="pull-right">
                    <!-- end: DYNAMIC TABLE PANEL -->
                    <?php Valida::geraBtnVoltar('Escola/ListarEscola/' .
                        Valida::GeraParametro(CO_ESCOLA . "/" . $escola)); ?>
                </div>
                <br><br><br>
                <!-- end: DYNAMIC TABLE PANEL -->
            </div>
        </div>
        <!-- end: PAGE CONTENT-->
    </div>
</div>
<!-- end: PAGE -->