<?php
$pages = array(
    'home_inicio' => 'Início',
    'experimentar_gratis' => 'Experimentar Grátis',
    'planos_sistema' => 'Planos',
    'saiba_mais' => 'Saiba Mais',
);
$redesSocial = array(
    'instagram' => [
        'link' => 'https://www.instagram.com/sistemadabeleza/',
        'class' => 'beautypress-instagram',
        'title' => 'Nos siga no Instagram',
        'iClass' => 'fa fa-instagram',
    ],
    'facebook' => [
        'link' => 'https://www.facebook.com/sistemadabeleza/',
        'class' => 'beautypress-facebook',
        'title' => 'Nos siga no Facebook',
        'iClass' => 'fa fa-facebook',
    ],
    'youtube' => [
        'link' => 'https://www.youtube.com/channel/UCurAWOHi0yrq7SnmelWdOJA',
        'class' => 'beautypress-pinterest',
        'title' => 'Veja nosso canal no YouTube',
        'iClass' => 'fa fa-youtube-play',
    ],
    'twitter' => [
        'link' => 'https://twitter.com/sistemadabeleza/',
        'class' => 'beautypress-twitter',
        'title' => 'Nos siga no Twitter',
        'iClass' => 'fa fa-twitter',
    ],
    'whatsapp' => [
        'link' => 'https://api.whatsapp.com/send?phone=' . WHATSAPP .
            '&amp;l=pt_BR&amp;text=Olhando no site e gostaria de saber mais!',
        'class' => 'beautypress-whatsapp',
        'title' => 'Nos chame no WhatsApp',
        'iClass' => 'fa fa-whatsapp',
    ],
    'email' => [
        'link' => 'mailto:' . USER_EMAIL,
        'class' => 'beautypress-envelope',
        'title' => 'Nos envie um E-mail',
        'iClass' => 'fa fa-envelope',
    ],
);
$url = new UrlAmigavel();
$seo = new Seo($url);
$siteMap = new Sitemap();
///** @var VisitaService $visitaService */
//$visitaService = new VisitaService();
//$visitaService->gestaoVisita();
?>
<!doctype html>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="pt-br" itemscope itemtype="https://schema.org/WebSite"> <![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8" lang="pt-br" itemscope itemtype="https://schema.org/WebSite"> <![endif]-->
<!--[if IE 8]>
<html class="no-js lt-ie9" lang="pt-br" itemscope itemtype="https://schema.org/WebSite"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="pt-br" itemscope itemtype="https://schema.org/WebSite"> <!--<![endif]-->
<head>
    <!-- Inclução das tags do Seo -->
    <?php require_once 'library/Partial/Site/SeoTags.php'; ?>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="apple-touch-icon.png">

    <!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
    <link rel="shortcut icon" href="<?= HOME; ?>favicon.ico"/>
    <!-- Bootstrap.css -->
    <link rel="stylesheet" href="<?= PASTASITE; ?>css/app.css">

    <link rel="stylesheet" href="<?= PASTA_LIBRARY; ?>plugins/gritter/css/jquery.gritter.css">

</head>
<style>
    ::-webkit-scrollbar {
        width: 7px;
    }

    ::-webkit-scrollbar-track {
        background: #d8d8d8;
        border-radius: 6px;
    }

    ::-webkit-scrollbar-thumb {
        background: #294798;;
        border-radius: 6px;
    }

    ::-webkit-scrollbar-thumb:hover {
        background: #11338D;
    }
</style>
<body>
<h1 style="display: none;">
    <!--        --><? //= //$seo->getTitulo(); ?>
</h1>
<!-- GOOGLE ANALITCS -->
<?php if (ID_ANALITCS): ?>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=<?= ID_ANALITCS; ?>"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }

        gtag('js', new Date());

        gtag('config', '<?= ID_ANALITCS; ?>');
    </script>
<?php endif; ?>
<!-- FIM / GOOGLE ANALITCS -->

<!-- Main menu -->
<header>
    <div class="main-header main-header-full position-relative">
        <div class="main-header-wrapper header-full">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <nav class="navbar navbar-expand-lg">
                            <a class="navbar-brand" href="<?= HOME; ?>">
                                <img src="<?= PASTASITE; ?>images/logo_escola.png" alt="" style="max-width: 350px;"/>
                            </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavTopo" aria-controls="navbarNavTopo" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse justify-content-end align-items-center" id="navbarNavTopo">
                                <ul class="navbar-nav margin-top-40 margin-top-lg-0">
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">
                                            <div class="d-flex justify-content-lg-center align-items-center flex-lg-column padding-left-lg-0 padding-left-30">
                                                <div class="btn btn-primary btn-full-rounded has-icon-outside btn-sm margin-right-15 margin-right-lg-0">
                                                    <img src="https://imagem.rsb.org.br/bucket/csf/tipo-acao-formativa/3/Cd77fpwOUwc9Ib79GBM7emKGcH9pI53Tp5TyXcbY.svg" alt="." />
                                                </div>
                                                <span class="text">Capacitações Presenciais</span>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="<?= HOME; ?>">
                                            <div class="d-flex justify-content-lg-center align-items-center flex-lg-column padding-left-lg-0 padding-left-30">
                                                <div class="btn btn-primary btn-full-rounded has-icon-outside btn-sm margin-right-15 margin-right-lg-0">
                                                    <img src="https://imagem.rsb.org.br/bucket/csf/tipo-acao-formativa/2/He9Sbs7LlqlBA7H77JDDs71XL7hormPxlKxIoE0v.svg" alt="." />
                                                </div>
                                                <span class="text">Cursos On-line</span>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">
                                            <div class="d-flex justify-content-lg-center align-items-center flex-lg-column padding-left-lg-0 padding-left-30">
                                                <div class="btn btn-primary btn-full-rounded has-icon-outside btn-sm margin-right-15 margin-right-lg-0">
                                                    <img src="https://imagem.rsb.org.br/bucket/csf/tipo-acao-formativa/4/v0Os9ubSaqfBcUFe0b97xaViWuMdy27JeSdHpv4g.svg" alt="." />
                                                </div>
                                                <span class="text">Eventos</span>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">
                                            <div class="d-flex justify-content-lg-center align-items-center flex-lg-column padding-left-lg-0 padding-left-30">
                                                <div class="btn btn-primary btn-full-rounded has-icon-outside btn-sm margin-right-15 margin-right-lg-0">
                                                    <img src="https://imagem.rsb.org.br/bucket/csf/tipo-acao-formativa/1/tpL928BPgUXsGfV83uptGKW69SzRenmZkJwz5QaT.svg" alt="." />
                                                </div>
                                                <span class="text">Webconferências</span>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>


