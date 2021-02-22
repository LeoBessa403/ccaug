<style>
    .btn_saiba_mais{
        padding: 2px 4px;
        background-color: green;
        color: white;
        max-width: 30%;
        float: right;
        font-size: 0.7em;
        margin-top: -20px;
        border-radius: 10px;
    }
</style>
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
                        $i = 0;
                        /** @var CursoEntidade $curso */
                        foreach ($result as $curso) {
                            $tamanhoImg = 180;
                            if ($curso->getCoImagem() && (file_exists(PASTA_UPLOADS .
                                    $curso->getCoImagem()->getDsCaminho()))) {
                                $imagem = Valida::GetMiniatura(
                                    $curso->getCoImagem()->getDsCaminho(),
                                    $curso->getCoUltimoValorCurso()->getDsTitulo(),
                                    $tamanhoImg, $tamanhoImg, "card-image-overlay-icon warning img-fluid"
                                );
                                $imgBck = TIMTHUMB . '?src=' . PASTAUPLOADS . $curso->getCoImagem()->getDsCaminho()
                                    . '&w=' . $tamanhoImg . '&h=' . $tamanhoImg;
                            } else {
                                $imagem = Valida::getSemImg($tamanhoImg, 'card-image-overlay-icon warning img-fluid');
                                $imgBck = TIMTHUMB . '?src=' . SEM_FOTO . '&w=' . $tamanhoImg . '&h=' . $tamanhoImg;
                            }
                            ?>
                            <a href="<?= PASTASITE . 'IndexWeb/DetalhesCurso/' .
                            Valida::GeraParametro(CO_CURSO . "/" . $curso->getCoCurso()); ?>" class="d-block mb-4">
                                <div class="card m-auto link-card">
                                    <div class="card-image" style="background-image: url('<?= $imgBck; ?>')">
                                        <div class="card-image-overlay" style="background-color: #0087c5">
                                            <?= $imagem; ?>
                                        </div>
                                        <div class="card-image-svg">
                                            <?php
                                            if ($i % 2 == 0) {
                                                ?>
                                                <svg width="320" height="30" xmlns="http://www.w3.org/2000/svg"
                                                     class="top">
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
                                            <?php } else { ?>
                                                <svg width="280" height="45" xmlns="http://www.w3.org/2000/svg">
                                                    <g>
                                                        <rect x="-1" y="-1" width="282" height="47"
                                                              id="canvas_background"
                                                              fill="none"></rect>
                                                    </g>
                                                    <g>
                                                        <path stroke="null"
                                                              d="m-115,44.999999q254.999993,-78.999995 509.999987,0"
                                                              fill="#FFF" id="svg_1"></path>
                                                    </g>
                                                </svg>
                                            <?php }
                                            $i++;
                                            ?>
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
                                                    <?= Valida::Resumi(strip_tags($curso->getDsDescricao()), 180); ?>
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
                                                    <?php
                                                    if ($curso->getCoUltimoValorCurso()->getNuValor() != '0.00') {
                                                        ?>
                                                        <p class="margin-0 font-size-10 text-bold font-color-primary font-primary">
                                                            Investimento</p>
                                                        <p class="m-0 font-size-10 text-bold font-color-primary font-primary">
                                                            Ou 5 x R$ 5,20</p>
                                                        <p class="font-secondary text-medium font-size-14 font-color-primary">
                                                            R$ <?= $curso->getCoUltimoValorCurso()->getNuValor(); ?></p>
                                                        <?php
                                                    } else {
                                                        ?>
                                                        <p class="m-0 font-size-10 text-bold font-color-primary font-primary">
                                                            Curso Inteiramente</p>
                                                        <p class="font-secondary text-medium font-size-14 font-color-primary">
                                                            GRATUITO</p>
                                                    <?php } ?>
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
                                        <div class="btn_saiba_mais">Saiba Mais</div>
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