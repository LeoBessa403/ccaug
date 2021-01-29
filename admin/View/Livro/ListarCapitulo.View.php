<div class="main-content">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <!-- start: PAGE TITLE & BREADCRUMB -->
                <ol class="breadcrumb">
                    <li>
                        <i class="clip-grid-6"></i>
                        <a href="#">
                            Capitulo
                        </a>
                    </li>
                    <li class="active">
                        Listar
                    </li>
                </ol>
                <div class="page-header">
                    <h1>Capitulo
                        <small>Listar Capitulos</small>
                        <?php Valida::geraBtnNovo('Criar Capitulo', 'CadastroCapitulo/'
                            . Valida::GeraParametro(CO_LIVRO . "/" . $livro)); ?>
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
                        livros
                    </div>
                    <div class="panel-body">
                        <?php
                        $perfil_master = false;

                        $grid = new Grid();
                        echo $grid->PesquisaAvancada('Pesquisar Capitulo');
                        ?>
                        <h2>
                            <small>Capítulos Cadastradas</small>
                        </h2>
                        <?php
                        Modal::load();
                        Modal::deletaRegistro(UrlAmigavel::$controller);
                        Modal::confirmacao("confirma_Usuario");

                        $arrColunas = array('Capa Capitulo', 'Livro', 'Título Capitulo', 'Ativo', 'Ações');

                        $grid->setColunasIndeces($arrColunas);
                        $grid->criaGrid();

                        /** @var CapituloEntidade $res */
                        foreach ($result as $res):
                            $acao = '<a href="' . PASTAADMIN . 'Livro/CadastroCapitulo/'
                                . Valida::GeraParametro(CO_CAPITULO . "/" . $res->getCoCapitulo() . "/"
                                . CO_LIVRO . "/" . $livro) . '" 
                                class="btn btn-primary tooltips" 
                                data-original-title="Visualizar Registro" data-placement="top">
                                <i class="fa fa-clipboard"></i>
                                </a>
                                <a data-placement="top" role="button" class="btn btn-warning tooltips"
                                    href="' . PASTAADMIN . 'Livro/ListarPaginaLivro/'
                                . Valida::GeraParametro(CO_CAPITULO . "/" . $res->getCoCapitulo() . "/"
                                    . CO_LIVRO . "/" . $livro) . '"
                                       data-original-title="Páginas do Capítulo" data-placement="top">
                                        <i class="clip-file"></i>
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
                            $grid->setColunas(strtoupper($res->getCoLivro()->getDsTitulo()));
                            $grid->setColunas(strtoupper($res->getDsTitulo()));
                            $grid->setColunas(Valida::SituacaoSimNao($res->getStStatus()));
                            $grid->setColunas($acao, 2);
                            $grid->criaLinha($res->getCoCapitulo());
                        endforeach;
                        $grid->finalizaGrid();
                        ?>
                    </div>
                </div>
                <div class="pull-right">
                    <!-- end: DYNAMIC TABLE PANEL -->
                    <?php Valida::geraBtnVoltar('Livro/ListarLivro/' .
                        Valida::GeraParametro( CO_LIVRO . "/" . $livro)); ?>
                </div>
                <br><br><br>
                <!-- end: DYNAMIC TABLE PANEL -->
            </div>
        </div>
        <!-- end: PAGE CONTENT-->
    </div>
</div>
<!-- end: PAGE -->