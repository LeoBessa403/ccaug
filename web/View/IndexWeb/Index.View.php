<main class="main-conteudo margin-bottom-3">

    <div class="container">
        <section class="margin-bottom-100">
            <div class="row title-page-container">
                <div class="col">
                    <h3 class="title-page left-line-above">Inscreva-se em nossos Cursos.</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="grid-container">

                        <?php
                        /** @var CursoEntidade $curso */
                        foreach ($result as $curso) {
                            ?>
                            <a href="<?= PASTASITE . 'IndexWeb/DetalhesCurso/' .
                                        Valida::GeraParametro(CO_CURSO . "/" .$curso->getCoCurso()); ?>'" class="d-block mb-4">
                                <div class="card m-auto link-card">
                                    <div class="card-image"
                                         style="background-image: url('<?= PASTASITE; ?>images/pregacao.png')">
                                        <div class="card-image-overlay" style="background-color: #0087c5">
                                            <img class="card-image-overlay-icon warning" style="filter: brightness(0) invert(1)"
                                                 src="<?= PASTASITE; ?>images/pregacao.png"/>
                                        </div>

                                        <div class="card-image-svg">
                                            <svg width="320" height="30" xmlns="http://www.w3.org/2000/svg" class="top">
                                                <g>
                                                    <rect fill="none" id="canvas_background" height="32" width="322"
                                                          y="-1" x="-1"/>
                                                </g>
                                                <g>
                                                    <path stroke="null" id="svg_1" fill="#FFF"
                                                          d="m0,-1s134.78938,50.954025 322.589986,0c0,39.551729 -1.544053,23.339081 -1.544053,23.339081l1.127047,7.660921l-322.172981,0l0,-31.000002z"/>
                                                    <path stroke="null" id="svg_2"
                                                          d="m1976.96277,55.85904l29.99943,0l0,121.74864l-29.99943,0l0,-121.74864z"
                                                          stroke-width="1.5" fill="#F3F8FB"/>
                                                </g>
                                            </svg>
                                        </div>
                                    </div>

                                    <div class="card-title">
                                        <div class="min-height-50">
                                            <?= $curso->getCoUltimoValorCurso()->getDsTitulo(); ?>
                                        </div>
                                    </div>
                                    <div class="card-subtitle">
                                        <div class="row">
                                            <div class="col">
                                                Cursos On-line | Online
                                            </div>
                                            <div class="col-auto">
                                                <?= $curso->getCoUltimoValorCurso()->getNuCargaHoraria(); ?> horas
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-12">
                                                <p class="text-regular height-60 margin-bottom-0">
                                                    <?= $curso->getCoUltimoValorCurso()->getDsObjetivo(); ?>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <ul class="fa-ul margin-left-20 height-45">
                                            <li class="margin-bottom-10">
                                                <span class="fa-li"><i
                                                            class="far fa-clock font-size-15 margin-right-5 font-color-gray"></i></span>
                                                <p class="font-color-gray font-size-12 margin-bottom-0 margin-left-n-5 padding-top-2 text-bold">
                                                    <?= $curso->getCoUltimoValorCurso()->getNuDuracao(); ?> Semanas
                                                </p>
                                            </li>
                                        </ul>
                                        <div class="min-height-55">
                                            <div class="row">
                                                <div class="col-12">
                                                    <p class="margin-0 font-size-10 text-bold font-color-primary font-primary">
                                                        Investimento</p>
                                                    <p class="m-0 font-size-10 text-bold font-color-primary font-primary">
                                                        Em até 12 vezes</p>
                                                    <p class="font-secondary text-medium font-size-14 font-color-primary">
                                                        R$ <?= $curso->getCoUltimoValorCurso()->getNuValor(); ?></p>
                                                </div>
                                            </div>
                                        </div>
                                        <?php
                                        if ($curso->getCoUltimoValorCurso()->getStCertificacao() == SimNaoEnum::SIM) {
                                            ?>
                                            <div class="row">
                                                <div class="col-12">
                                                    <span class="badge badge-default">O curso é com certificado.</span>
                                                </div>
                                            </div>
                                        <?php } ?>
                                    </div>
                                </div>
                            </a>
                        <?php } ?>


                    </div>
                </div>
            </div>
        </section>
    </div>
</main>