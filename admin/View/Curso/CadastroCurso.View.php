<style>
    .cke_editable {
        height: 200px !important;
    }
</style>
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
                            Curso
                        </a>
                    </li>
                    <li class="active">
                        Cadastrar Curso
                    </li>
                </ol>
                <div class="page-header">
                    <h1>Curso
                        <small>Cadastrar Curso</small>
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
        <!-- end: PAGE CONTENT-->
    </div>
</div>
<!-- end: PAGE -->

<!--CKEDITO 4 -->
<script src="<?= HOME; ?>library/plugins/ckeditor4/ckeditor.js"></script>
<script src="<?= HOME; ?>library/plugins/ckeditor4/ckfinder/ckfinder.js"></script>






