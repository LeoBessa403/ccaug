<div class="main-content">
    <div class="container">
        <!-- start: PAGE HEADER -->
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
                        Cadastrar Aluno
                    </li>

                </ol>
                <div class="page-header">
                    <h1>Aluno
                        <small>Cadastrar Aluno</small>
                    </h1>
                </div>
                <!-- end: PAGE TITLE & BREADCRUMB -->
            </div>
        </div>
        <?php
        Modal::load();
        ?>
        <div class="row">
            <?php
            echo $form;
            ?>
        </div>
        <div class="pull-right">
            <!-- end: DYNAMIC TABLE PANEL -->
            <?php Valida::geraBtnVoltar('Escola/ListarAluno/' .
                Valida::GeraParametro(CO_TURMA . "/" . $turma . "/"
                    . CO_ESCOLA . "/" . $escola)); ?>
        </div>
        <br><br><br>
        <!-- end: PAGE CONTENT-->
    </div>
</div>
<!-- end: PAGE -->