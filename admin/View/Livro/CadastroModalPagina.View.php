<style>
    .cke_editable {
        height: 200px !important;
    }

    .pag_dir {
        float: right !important;
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
                            Modal
                        </a>
                    </li>
                    <li class="active">
                        Cadastrar Modal
                    </li>

                </ol>

                <div class="page-header">
                    <h1>Modal
                        <small>Cadastrar Modal</small>
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
            <div class="fade in modal-overflow pag pag_dir col-sm-6" style="margin-top: 350px"
                 role="dialog" aria-hidden="true">
                <div class="modal-body conteudo" style="padding: 0;">
                </div>
            </div>
        </div>
        <!-- end: PAGE CONTENT-->
    </div>
</div>
<!-- end: PAGE -->

<!--CKEDITO 4 -->
<script src="../../../library/plugins/ckeditor4/ckeditor.js">
</script>
<script src="../../../library/plugins/ckeditor4/ckfinder/ckfinder.js"></script>


