<footer>
    <div class="certificado-wrapper">
        <div class="container">
            <div class="row">
                <p>"Ser aquilo no sentido para qual Deus nos criou."</p>
            </div>
        </div>
    </div>
    <div class="footer-wrapper">
        <div class="container">
            <div class="row padding-bottom-15">
                <div class="col-12 col-lg-auto margin-bottom-50 margin-bottom-lg-0">
                    <a class="margin-right-md-200" href="<?= HOME; ?>">
                        <img src="<?= PASTASITE; ?>images/logo_nova.png" alt="Comunidade Católica Até a Última Gota" style="max-width: 350px;" />
                    </a>
                </div>
                <div class="col-12 col-md-auto">
                    <h4 class="footer-title">Endereço</h4>
                    <p>Quadra 403 <br> Samambaia Norte <br> Brasília - DF / CEP: <br> 72320-000</p>
                </div>
                <div class="col-12 col-md-auto">
                    <h4 class="footer-title">Contato</h4>
                    <p>(61) 99106-6240 <br>contato@ccaug.com.br <br>escoladeapostolos@ccaug.com.br </p>
                </div>
            </div>
        </div>
        <div class="footer-wrapper-container">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <p class="font-secondary font-size-12"><?php include_once 'controle_versao.php'; ?></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<script src="<?= PASTASITE; ?>js/app.js"></script>
<!--<script src="--><?//= HOME ?><!--library/Helpers/includes/jquery.mask.js"></script>-->

<?php include_once PARTIAL_LIBRARY . 'constantes_javascript.php'; ?>
<?php carregaJs($url); ?>
</body>
</html>