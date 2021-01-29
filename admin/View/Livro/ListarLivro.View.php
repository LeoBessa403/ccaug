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
                    <h1>Livro
                        <small>Listar Livros</small>
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
                        Livro
                    </div>
                    <div class="panel-body">
                        <?php
                        $grid = new Grid();
                        ?>
                        <h2>
                            <small>Livros Cadastradas</small>
                        </h2>
                        <?php
                        Modal::load();
                        Modal::deletaRegistro(UrlAmigavel::$controller);
                        Modal::confirmacao("confirma_Usuario");

                        $arrColunas = array('Capa', 'Livro', 'Matéria', 'Ativo', 'Ações');

                        $grid->setColunasIndeces($arrColunas);
                        $grid->criaGrid();

                        /** @var LivroEntidade $res */
                        foreach ($result as $res):
                            $acao = '<a href="' . PASTAADMIN . 'Livro/CadastroLivro/'
                                . Valida::GeraParametro(CO_LIVRO . "/" . $res->getCoLivro()) . '" 
                                class="btn btn-primary tooltips" 
                                data-original-title="Visualizar Registro" data-placement="top">
                                <i class="fa fa-clipboard"></i>
                                </a>
                                <a data-placement="top" role="button" class="btn btn-green tooltips"
                                    href="' . PASTAADMIN . 'Livro/ListarCapitulo/'
                                . Valida::GeraParametro(CO_LIVRO . "/" . $res->getCoLivro()) . '" 
                                       data-original-title="Capítulos do Livro" data-placement="top">
                                        <i class="fa fa-book"></i>
                                    </a>
                                <a data-placement="top" role="button" class="btn btn-dark-grey tooltips"
                                    href="' . PASTAADMIN . 'Livro/LerLivro/'
                                . Valida::GeraParametro(CO_LIVRO . "/" . $res->getCoLivro()) . '" 
                                       data-original-title="Ler Livro" data-placement="top">
                                        <i class="clip-book"></i>
                                    </a>';

                            $tamanhoImg = 60;
                            if ($res->getCoImagem()) {
                                $caminho = '';
                                if (file_exists(PASTA_UPLOADS . $res->getCoImagem()->getDsCaminho())) {
                                    $caminho = $res->getCoImagem()->getDsCaminho();
                                }
                                $imagem = Valida::GetMiniatura(
                                    $caminho,
                                    $res->getDsTitulo(), $tamanhoImg, $tamanhoImg,
                                    "circle-img", 1
                                );
                            } else {
                                $imagem = Valida::getSemImg($tamanhoImg);
                            }

                            $grid->setColunas($imagem, 1);
                            $grid->setColunas(strtoupper($res->getDsTitulo()));
                            $grid->setColunas($res->getCoMateria()->getDsMateria());
                            $grid->setColunas(Valida::SituacaoSimNao($res->getStStatus()));
                            $grid->setColunas($acao, 3);
                            $grid->criaLinha($res->getCoLivro());
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