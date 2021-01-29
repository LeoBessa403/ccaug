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
                        Listar
                    </li>
                </ol>
                <div class="page-header">
                    <h1>Aluno
                        <small>Listar alunos</small>
                        <?php Valida::geraBtnNovo('Criar Aluno', 'CadastroAluno/'
                            . Valida::GeraParametro(CO_ESCOLA . "/" . $escola . "/" .
                                                    CO_TURMA . "/" . $turma)); ?>
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
                        Aluno
                    </div>
                    <div class="panel-body">
                        <?php
                        $perfil_master = false;

                        $grid = new Grid();
                        echo $grid->PesquisaAvancada('Pesquisar Aluno');
                        ?>
                        <h2>
                            <small>Alunos Cadastradas</small>
                        </h2>
                        <?php
                        Modal::load();
                        Modal::deletaRegistro(UrlAmigavel::$controller);
                        Modal::confirmacao("confirma_Usuario");

                        $arrColunas = array('Aluno', 'Turma', 'Status', 'Ações');

                        $grid->setColunasIndeces($arrColunas);
                        $grid->criaGrid();

                        /** @var AlunoEntidade $res */
                        foreach ($result as $res):
                            $acao = '<a href="' . PASTAADMIN . 'Escola/CadastroAluno/'
                                . Valida::GeraParametro(CO_ALUNO . "/" . $res->getCoAluno() . "/"
                                . CO_TURMA . "/" . $turma . "/"
                                    . CO_ESCOLA . "/" . $escola) . '" 
                                class="btn btn-primary tooltips" 
                                data-original-title="Visualizar Registro" data-placement="top">
                                <i class="fa fa-clipboard"></i>
                                </a>';

                            $grid->setColunas(strtoupper($res->getCoPessoa()->getNoPessoa()));
                            $grid->setColunas($res->getCoTurma()->getNuAno() . $res->getCoTurma()->getDsTurma());
                            $grid->setColunas(Valida::SituacaoSimNao($res->getStStatus()));
                            $grid->setColunas($acao, 2);
                            $grid->criaLinha($res->getCoAluno());
                        endforeach;
                        $grid->finalizaGrid();
                        ?>
                    </div>
                </div>
                <div class="pull-right">
                    <!-- end: DYNAMIC TABLE PANEL -->
                    <?php Valida::geraBtnVoltar('Escola/ListarTurma/' .
                        Valida::GeraParametro(CO_TURMA . "/" . $turma . "/"
                            . CO_ESCOLA . "/" . $escola)); ?>
                </div>
                <br><br><br>
                <!-- end: DYNAMIC TABLE PANEL -->
            </div>
        </div>
        <!-- end: PAGE CONTENT-->
    </div>
</div>
<!-- end: PAGE -->