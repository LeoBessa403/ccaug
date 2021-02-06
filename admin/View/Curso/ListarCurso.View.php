<div class="main-content">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <!-- start: PAGE TITLE & BREADCRUMB -->
                <ol class="breadcrumb">
                    <li>
                        <i class="clip-grid-6"></i>
                        <a href="#">
                            Curso
                        </a>
                    </li>
                    <li class="active">
                        Listar
                    </li>
                </ol>
                <div class="page-header">
                    <h1>Curso
                        <small>Listar Cursos</small>
                        <?php Valida::geraBtnNovo(); ?>
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
                        Curso
                    </div>
                    <div class="panel-body">
                        <?php
                        $perfil_master = false;

                        $grid = new Grid();
                        echo $grid->PesquisaAvancada('Pesquisar Curso');
                        ?>
                        <h2>
                            <small>Cursos Cadastrados</small>
                        </h2>
                        <?php
                        Modal::load();

                        $arrColunas = array('Curso', 'Carga Horária', 'Duração', 'Ativo', 'Ações');

                        $grid->setColunasIndeces($arrColunas);
                        $grid->criaGrid();

                        /** @var CursoEntidade $res */
                        foreach ($result as $res):
//                            $acao = '<a href="' . PASTAADMIN . 'Escola/CadastroTurma/'
//                                . Valida::GeraParametro(CO_TURMA . "/" . $res->getCoTurma() . "/"
//                                . CO_ESCOLA . "/" . $escola) . '"
//                                class="btn btn-primary tooltips"
//                                data-original-title="Visualizar Registro" data-placement="top">
//                                <i class="fa fa-clipboard"></i>
//                                </a>
//                                <a data-placement="top" role="button" class="btn btn-dark-grey tooltips"
//                                    href="' . PASTAADMIN . 'Escola/ListarAluno/'
//                                . Valida::GeraParametro(CO_TURMA . "/" . $res->getCoTurma() . "/"
//                                    . CO_ESCOLA . "/" . $escola) . '"
//                                       data-original-title="Alunos da Turma" data-placement="top">
//                                        <i class="clip-study"></i>
//                                    </a>';

                            $grid->setColunas(strtoupper($res->getCoEscola()->getNoFantasia()));
                            $grid->setColunas($res->getNuAno());
                            $grid->setColunas(strtoupper($res->getDsTurma()));
                            $grid->setColunas(Valida::SituacaoSimNao($res->getStStatus()));
                            $grid->setColunas('$acao', 2);
                            $grid->criaLinha($res->getCoTurma());
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