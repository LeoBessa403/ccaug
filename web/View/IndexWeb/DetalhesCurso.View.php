<?php
/** @var CursoEntidade $curso */
$curso = $result;
?>
<main class="main-conteudo padding-top-0 margin-bottom-3">
    <section class="bg-white padding-bottom-20 min-height-220">
        <div class="container">
            <div class="row d-none d-md-block">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="<?= HOME; ?>">Home</a></li>
                            <li class="breadcrumb-item"><a href="<?= HOME; ?>cursos">cursos</a></li>
                            <li class="breadcrumb-item active" aria-current="page">
                                <?= $curso->getCoUltimoValorCurso()->getDsTitulo(); ?>
                            </li>
                        </ol>
                    </nav>
                </div>
            </div>
            <div class="row padding-top-20 padding-top-md-0">
                <div class="col">
                    <h1 class="text-bold font-size-28 font-color-primary margin-bottom-30 margin-bottom-md-20">
                        <?= $curso->getCoUltimoValorCurso()->getDsTitulo(); ?>
                    </h1>
                    <div class="grid-container-curso">
                        <div class="d-flex align-items-center  justify-content-sm-start">
                            <i class="far fa-clock font-size-24 font-color-terniary margin-right-10"></i>
                            <div class="line-height-15">
                                    <span class="d-block font-secondary font-color-terniary font-size-12"
                                          title="31/08/2020 a 30/11/2020">
                                        <?= $curso->getCoUltimoValorCurso()->getNuDuracao(); ?> Semana
                                                                            </span>
                                <span class="font-secondary font-size-12 font-color-gray">Duração</span>
                            </div>
                        </div>
                        <div class="d-flex align-items-center justify-content-sm-start">
                            <i class="fas fa-desktop font-size-24 font-color-terniary margin-right-10"></i>
                            <div class="line-height-15">
                                <span class="d-block text-medium font-secondary font-color-terniary font-size-18">
                                    <?= $curso->getCoUltimoValorCurso()->getNuCargaHoraria(); ?>h</span>
                                <span class="font-secondary font-size-12 font-color-gray">Online</span>
                            </div>
                        </div>
                        <div class="d-flex align-items-center  justify-content-sm-start">
                            <i class="fas fa-certificate font-size-24 font-color-terniary margin-right-10"></i>
                            <div class="line-height-15">
                                <span class="d-block text-medium font-secondary font-color-terniary font-size-18">
                                    <?= Valida::SituacaoSimNao($curso->getCoUltimoValorCurso()->getStCertificacao()); ?>
                                </span>
                                <span class="font-secondary font-size-12 font-color-gray">Certificação</span>
                            </div>
                        </div>

                        <div class="d-flex align-items-center  justify-content-sm-start justify-content-lg-end">
                            <div class="line-height-15">
                                <span class="d-block font-secondary font-color-gray font-size-12"><!--Inscrições--> </span>
                                <span class="text-medium font-secondary font-size-13 font-color-terniary"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-auto">
                    <div class="sticky" data-margin-top="30" data-sticky-class="shadow">
                        <div class="card m-auto  card-full">
                            <div class="card-body">
                                <div class="row  justify-content-end">
                                    <div class="col-auto text-right">
                                        <?php
                                        if ($curso->getCoUltimoValorCurso()->getNuValor() != '0.00') {
                                            ?>
                                            <p class="margin-0 font-size-10 text-bold font-color-primary font-primary">
                                                Investimento</p>

                                            <p class="margin-bottom-0 font-size-20 text-bold font-secondary font-color-terniary">
                                                R$ <?= Valida::FormataMoeda($curso->getCoUltimoValorCurso()->getNuValor()); ?>
                                            </p>
                                            <p class='margin-0 font-size-10 text-bold font-color-primary font-primary'>
                                                Em
                                                até 12 vezes</p>
                                            <?php
                                        } else {
                                            ?>
                                            <p class="margin-0 font-size-10 text-bold font-color-primary font-primary">
                                                Curso Inteiramente</p>

                                            <p class="margin-bottom-0 font-size-20 text-bold font-secondary font-color-terniary">
                                                GRATUITO
                                            </p>
                                        <?php } ?>

                                    </div>
                                </div>
                                <div class="row justify-content-end no-gutters margin-top-15">
                                    <div class="col-auto">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>

    <section class="padding-top-50 padding-bottom-50 font-color-gray font-size-13">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-8" style="margin-bottom: 20px">
                    <?php
                    $tamanhoImg = 650;
                    if ($curso->getCoImagem() && (file_exists(PASTA_UPLOADS .
                            $curso->getCoImagem()->getDsCaminho()))) {
                        $imagem = Valida::GetMiniatura(
                            $curso->getCoImagem()->getDsCaminho(),
                            $curso->getCoUltimoValorCurso()->getDsTitulo(), $tamanhoImg, $tamanhoImg, "img-fluid"
                        );
                    } else {
                        $imagem = Valida::getSemImg($tamanhoImg, 'img-fluid');
                    }
                    ?>
                    <?= $imagem; ?>
                </div>
                <div class="col-12 col-lg-8">
                    <h3 class="font-size-20 text-bold font-color-primary margin-bottom-30">Conheça esta Formação!</h3>
                    <div class="conteudo">
                        <?= $curso->getDsDescricao(); ?>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>

</main>