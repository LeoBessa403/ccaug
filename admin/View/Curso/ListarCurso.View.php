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

                        $arrColunas = array('Curso', 'Valor R$', 'Carga Horária', 'Duração', 'Ativo', 'Ações');

                        $grid->setColunasIndeces($arrColunas);
                        $grid->criaGrid();

                        /** @var CursoEntidade $res */
                        foreach ($result as $res):
                            /** @var ValorCursoEntidade $valor */
                            $valor = $res->getCoUltimoValorCurso();
                            $acao = '<a href="' . PASTAADMIN . 'Curso/CadastroCurso/'
                                . Valida::GeraParametro(CO_CURSO . "/" . $res->getCoCurso()) . '"
                                class="btn btn-primary tooltips"
                                data-original-title="Visualizar Registro" data-placement="top">
                                <i class="fa fa-clipboard"></i>
                                </a>
                                <a data-placement="top" role="button" class="btn btn-green tooltips"
                                    href="' . PASTAADMIN . 'Curso/ListarTurma/'
                                . Valida::GeraParametro(CO_CURSO . "/" . $res->getCoCurso()) . '"
                                       data-original-title="Turmas do Curso" data-placement="top">
                                        <i class="fa fa-group"></i>
                                    </a>
                                    <a href="' . PASTAADMIN . 'Curso/HistoricoCurso/' .
                                Valida::GeraParametro(CO_CURSO . "/" . $res->getCoCurso()) . '"
                                        class="btn btn-med-grey tooltips"
                                            data-original-title="Histórico de Preço do Curso" data-placement="top">
                                             <i class="clip-folder-open"></i>
                                         </a>';

                            $grid->setColunas(strtoupper($valor->getDsTitulo()));
                            $grid->setColunas(Valida::FormataMoeda($valor->getNuValor()));
                            $grid->setColunas($valor->getNuCargaHoraria());
                            $grid->setColunas($valor->getNuDuracao());
                            $grid->setColunas(Valida::SituacaoSimNao($valor->getStStatus()));
                            $grid->setColunas($acao, 3);
                            $grid->criaLinha($res->getCoCurso());
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