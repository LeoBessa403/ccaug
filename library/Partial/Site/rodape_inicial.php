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

<script type="text/javascript" src="<?= PASTA_LIBRARY; ?>Helpers/includes/jquery-1.10.2.js"></script>
<script type="text/javascript" src="<?= PASTA_LIBRARY; ?>Helpers/includes/jquery-2.0.3.js"></script>
<script type="text/javascript" src="<?= PASTASITE; ?>js/app.js"></script>
<?php include_once PARTIAL_LIBRARY . 'constantes_javascript.php'; ?>
<?php carregaJs($url); ?>
<!-- Carrega DIVs dos Alertas e Notificações   -->
<?php
$session = new Session();
if ($session->CheckSession(MENSAGEM)) {
    switch ($session::getSession(MENSAGEM)) {
        case CADASTRADO:
            Notificacoes::cadastrado();
            break;
        case ATUALIZADO:
            Notificacoes::atualizado();
            break;
        case DELETADO:
            Notificacoes::deletado();
            break;
        default:
            Notificacoes::mesagens($session::getSession(MENSAGEM), $session::getSession(TIPO));
            break;
    }
    $session->FinalizaSession(MENSAGEM);
}



?>
</body>
</html>