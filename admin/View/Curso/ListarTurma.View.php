<div class="main-content">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <!-- start: PAGE TITLE & BREADCRUMB -->
                <ol class="breadcrumb">
                    <li>
                        <i class="clip-grid-6"></i>
                        <a href="#">
                            Turma
                        </a>
                    </li>
                    <li class="active">
                        Listar
                    </li>
                </ol>
                <div class="page-header">
                    <h1>Turma
                        <small>Listar turmas</small>
                        <?php Valida::geraBtnNovo('Abrir Turma', 'CadastroTurma/'
                            . Valida::GeraParametro(CO_CURSO . "/" . $curso)); ?>
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
                        Turma
                    </div>
                    <div class="panel-body">
                        <?php
                        $perfil_master = false;

                        $grid = new Grid();
                        echo $grid->PesquisaAvancada('Pesquisar Turma');
                        ?>
                        <h2>
                            <small>Turmas Cadastradas</small>
                        </h2>
                        <?php
                        Modal::load();
                        Modal::deletaRegistro(UrlAmigavel::$controller);
                        Modal::confirmacao("confirma_Usuario");

                        $arrColunas = array('Curso', 'Turma', 'Abertura', 'Fechamento',  'Ativa', 'Ações');

                        $grid->setColunasIndeces($arrColunas);
                        $grid->criaGrid();

                        /** @var TurmaEntidade $res */
                        foreach ($result as $res):
                            $acao = '<a href="' . PASTAADMIN . 'Curso/CadastroTurma/'
                                . Valida::GeraParametro(CO_TURMA . "/" . $res->getCoTurma() . "/"
                                    . CO_CURSO . "/" . $curso) . '" 
                                class="btn btn-primary tooltips" 
                                data-original-title="Visualizar Registro" data-placement="top">
                                <i class="fa fa-clipboard"></i>
                                </a>
                                <a data-placement="top" role="button" class="btn btn-dark-grey tooltips"
                                    href="' . PASTAADMIN . 'Curso/ListarAluno/'
                                . Valida::GeraParametro(CO_TURMA . "/" . $res->getCoTurma() . "/"
                                    . CO_CURSO . "/" . $curso) . '"
                                       data-original-title="Alunos da Turma" data-placement="top">
                                        <i class="clip-study"></i>
                                    </a>';

                            $grid->setColunas(strtoupper($res->getCoCurso()->getCoUltimoValorCurso()->getDsTitulo()));
                            $grid->setColunas(strtoupper($res->getDsTurma()) . '/' .$res->getNuAno());
                            $grid->setColunas(Valida::DataShow($res->getDtInicio())
                                . ' as ' . $res->getNuHoraAbertura(), 4);
                            $grid->setColunas(Valida::DataShow($res->getDtFim()) . ' as ' .
                                $res->getNuHoraFechamento(), 3);
                            $grid->setColunas(Valida::SituacaoSimNao($res->getStStatus()));
                            $grid->setColunas($acao, 2);
                            $grid->criaLinha($res->getCoTurma());
                        endforeach;
                        $grid->finalizaGrid();
                        ?>
                    </div>
                </div>
                <div class="pull-right">
                    <!-- end: DYNAMIC TABLE PANEL -->
                    <?php Valida::geraBtnVoltar('Curso/ListarCurso/' .
                        Valida::GeraParametro(CO_CURSO . "/" . $curso)); ?>
                </div>
                <br><br><br>
                <!-- end: DYNAMIC TABLE PANEL -->
            </div>
        </div>
        <!-- end: PAGE CONTENT-->
    </div>
</div>
<!-- end: PAGE -->