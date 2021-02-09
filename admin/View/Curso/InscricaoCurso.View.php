<?php
include_once 'library/Partial/AcessoPermitido/topo_inicial.php';
?>
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
<!-- SCRIPT PAGSEGURO -->
<script type="text/javascript"
        src="<?= JS_PAGSEGURO; ?>"></script>

