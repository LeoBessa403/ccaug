<div class="main-content">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <!-- start: PAGE TITLE & BREADCRUMB -->
                <ol class="breadcrumb">
                    <li>
                        <i class="clip-grid-6"></i>
                        <a href="#">
                            Escola
                        </a>
                    </li>
                    <li class="active">
                        Listar
                    </li>
                </ol>
                <div class="page-header">
                    <h1>Escola
                        <small>Listar escolas</small>
                        <?php if($gestor)Valida::geraBtnNovo(); ?>
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
                        Escola
                    </div>
                    <div class="panel-body">
                        <?php
                        $perfil_master = false;

                        $grid = new Grid();
                        if (!PerfilService::perfilCoordenador()) {
                            echo $grid->PesquisaAvancada('Pesquisar Escola');
                        }
                        ?>
                        <h2>
                            <small>Escolas Cadastradas</small>
                        </h2>
                        <?php
                        Modal::load();
                        Modal::deletaRegistro(UrlAmigavel::$controller);
                        Modal::confirmacao("confirma_Usuario");

                        $arrColunas = array('Escola', 'Coordenador(a)', 'CNPJ', 'Razão Social', 'Ações');

                        $grid->setColunasIndeces($arrColunas);
                        $grid->criaGrid();

                        /** @var EscolaEntidade $res */
                        foreach ($result as $res):
                            $acao = '<a href="' . PASTAADMIN . 'Escola/CadastroEscola/'
                                . Valida::GeraParametro(CO_ESCOLA . "/" . $res->getCoEscola()) . '" 
                                class="btn btn-primary tooltips" 
                                data-original-title="Visualizar Registro" data-placement="top">
                                <i class="fa fa-clipboard"></i>
                                </a>
                                <a data-placement="top" role="button" class="btn btn-green tooltips"
                                    href="' . PASTAADMIN . 'Escola/ListarTurma/'
                                . Valida::GeraParametro(CO_ESCOLA . "/" . $res->getCoEscola()) . '" 
                                       data-original-title="Turmas da Escola" data-placement="top">
                                        <i class="fa fa-group"></i>
                                    </a>
                                <a data-placement="top" role="button" class="btn btn-danger tooltips"
                                    href="' . PASTAADMIN . 'Escola/ListarProfessor/'
                                . Valida::GeraParametro(CO_ESCOLA . "/" . $res->getCoEscola()) . '" 
                                       data-original-title="Professores da Escola" data-placement="top">
                                        <i class="clip-user-5"></i>
                                    </a>';

                            $grid->setColunas(strtoupper($res->getNoFantasia()));
                            $grid->setColunas($res->getCoUsuario()->getCoPessoa()->getNoPessoa());
                            $grid->setColunas(Valida::MascaraCnpj($res->getNuCnpj()));
                            $grid->setColunas($res->getNoRazaoSocial());
                            $grid->setColunas($acao, 3);
                            $grid->criaLinha($res->getCoEscola());
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