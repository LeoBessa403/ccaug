<style>
    .cke_editable {
        height: 200px !important;
    }

    .pag_dir {
        float: right !important;
    }

    /* Variáveis */
    :root {
        --cor-1: <?= $result->getDsCor1(); ?>;
        --cor-2: <?= $result->getDsCor2(); ?>;
        --cor-3: <?= $result->getDsCor3(); ?>;
    }

</style>
<link rel="stylesheet" href="<?= PASTA_LIBRARY; ?>css/styloLerLivro.css">
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
                            Página
                        </a>
                    </li>
                    <li class="active">
                        Cadastrar Página
                    </li>

                </ol>

                <div class="page-header">
                    <h1>Página
                        <small>Cadastrar Página</small>
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
            <div class="pag pag_dir col-sm-6" style="top: 300px; height: 900px !important;">
                <div class='conteudo'><!--Inicio Conteudo-->
                </div><!--Fim Conteudo-->
            </div>
        </div>
        <!-- end: PAGE CONTENT-->
    </div>
</div>
<!-- end: PAGE -->

<!--CKEDITO 4 -->
<script src="../../../library/plugins/ckeditor4/ckeditor.js"></script>
<script src="../../../library/plugins/ckeditor4/ckfinder/ckfinder.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-AMS_HTML"></script>





