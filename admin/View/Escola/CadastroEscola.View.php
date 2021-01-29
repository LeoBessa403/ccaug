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
                            Escola
                        </a>
                    </li>
                    <li class="active">
                        Enviar / Responder
                    </li>

                </ol>
                <div class="page-header">
                    <h1>Escola
                        <small>Cadastrar Escola</small>
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
        <div class="pull-right" style="margin-bottom: 15px">
            <!-- end: DYNAMIC TABLE PANEL -->
            <?php
            Valida::geraBtnVoltar('Escola/ListarEscola/');
            ?>
        </div>
        <!-- end: PAGE CONTENT-->
    </div>
</div>
<!-- end: PAGE -->