<?php
include_once 'library/Partial/AcessoPermitido/topo_inicial.php';
?>
<style>
    .main-login{
        padding: 0;
        margin-top: -10px !important;
        width: 50%;
        margin-left: 25%;
    }
    .main-login h6{
        margin-left: 3%;
        font-size: 1em;
        margin-top: -6px !important;
        font-weight: bolder;
    }
</style>
    <!-- start: LOGIN BOX -->
    <div class="box-login box-shadow">
        <h3 class="logo" style="margin: 20px 0 10px; padding: 0;">Inscrição de Curso</h3>
        <?php
        echo $form;
        include_once 'library/Partial/Site/versao.php';
        ?>
        <!-- end: COPYRIGHT -->
    </div>
<?php
include_once 'library/Partial/AcessoPermitido/rodape_inicial.php';
echo '<script src="' . HOME . 'admin/js/Curso/InscricaoCurso.js"></script>';
?>

