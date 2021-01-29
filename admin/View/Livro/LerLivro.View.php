<style>
    :root {
        --cor-1: <?= $result->getDsCor1(); ?>;
        --cor-2: <?= $result->getDsCor2(); ?>;
        --cor-3: <?= $result->getDsCor3(); ?>;
    }
</style>
<link rel="stylesheet" href="<?= PASTA_LIBRARY; ?>css/styloLerLivro.css">
<div class="main-content">
    <div class="container">
        <div class="row">
            <?php include_once 'CadastroAnotacao.View.php' ?>
            <div class="row" id="ler_livro">
                <?php
                $i = 3;
                $c = 1;
                $tamanhoW = 1200;
                $tamanhoH = 1160;
                $materia = $result->getCoMateria()->getDsMateria();
                if ($result->getCoImagem()) {
                    $caminho = '';
                    if (file_exists(PASTA_UPLOADS . $result->getCoImagem()->getDsCaminho())) {
                        $caminho = PASTAUPLOADS . $result->getCoImagem()->getDsCaminho();
                    }
                    $imagem = Valida::GetMiniatura($result->getCoImagem()->getDsCaminho(),
                        $materia, $tamanhoW, $tamanhoH, '', 3);
                }
                ?>
                <div id="pag_1" class="pag pag_esq capa" style="padding: 0;">
                    <?= $imagem; ?>
                </div>
                <?php
                if ($result->getCoCapitulo()) {
                    /** @var CapituloEntidade $capitulo */
                    foreach ($result->getCoCapitulo() as $capitulo) {
                        if (!empty($capitulos[$capitulo->getCoCapitulo()])) {
                            if ($capitulo->getCoImagem()) {
                                $caminho = '';
                                if (file_exists(PASTA_UPLOADS . $capitulo->getCoImagem()->getDsCaminho())) {
                                    $caminho = PASTAUPLOADS . $capitulo->getCoImagem()->getDsCaminho();
                                }
                                $imagem = Valida::GetMiniatura($capitulo->getCoImagem()->getDsCaminho(),
                                    $capitulo->getDsTitulo(), $tamanhoW, $tamanhoH, '', 3);
                            }
                            ?>
                            <div id="pag_<?= $i; ?>" class="pag pag_esq capa" style="padding: 0;">
                                <?= $imagem; ?>
                            </div>
                            <?php
                            $paginas[$i] = 'Capítulo ' . $c;
                            $i++;
                            $c++;

                            /** @var PaginaLivroEntidade $pagina */
                            foreach ($capitulos[$capitulo->getCoCapitulo()] as $pagina) {
                                if ($pagina->getCoModal()) {
                                    /** @var ModalEntidade $modal */
                                    foreach ($pagina->getCoModal() as $modal) {
                                        ?>
                                        <div class="modal fade in modal-overflow <?= $modal->getDsIdentificador(); ?>"
                                             id="j_cadastro<?= $modal->getCoModal(); ?>" tabindex="-1"
                                             role="dialog" aria-hidden="true">
                                            <div class="modal-header btn-light-grey">
                                                <button type="button" class="close cancelar" data-dismiss="modal"
                                                        aria-hidden="true">
                                                    X
                                                </button>
                                                <h4 class="modal-title"><?= $modal->getDsTitulo(); ?></h4>
                                            </div>
                                            <div class="modal-body" style="padding: 10px 20px 30px;">
                                                <?= $modal->getDsCode(); ?>
                                            </div>
                                        </div>
                                        <a data-toggle="modal" role="button"
                                           href="#j_cadastro<?= $modal->getCoModal(); ?>"
                                           id="<?= $modal->getDsIdentificador(); ?>"></a>

                                    <?php }
                                }
                                $compara = strstr($pagina->getDsCode(), 'cx-exer-total');
                                $classCxExTotal = '';
                                $classCxExTotalrp = '';
                                if($compara){
                                    $classCxExTotal = 'titulo-page-ex-total';
                                    $classCxExTotalrp = 'titulo-page-ex-total-rp';
                                }
                                ?>
                                <div id="pag_<?= $i; ?>" class="pag pag_esq">
                                    <p class='<?= $classCxExTotal;?> titulo-page titulo-page-esq'>
                                        <i class="clip-note anotacaoVer class_i"
                                           id="pag_anot_<?= $pagina->getCoPaginaLivro(); ?>"></i>
                                        <?php
                                        if (PerfilService::perfilAluno() && array_key_exists($i, $anotaProf)) {
                                            ?>
                                            <i class="fa fa-lightbulb-o anotProf <?= $classCxExTotal;?>" id="anot_prof_<?= $i; ?>"></i>
                                            <?php
                                            include 'VerAnotacao.View.php';
                                        } ?>
                                    </p>
                                    <div class='conteudo'><!--Inicio Conteudo-->
                                        <?= $pagina->getDsCode(); ?>
                                    </div><!--Fim Conteudo-->
                                    <p class='rodape-page <?= $classCxExTotalrp;?>'>
                                        <span class="tt_capitulo"><?= $capitulo->getDsTitulo(); ?></span>
                                        <span class="nu_pagina"><?= $i; ?></span>
                                    </p>
                                </div>
                                <?php
                                $paginas[$i] = 'Página ' . $i;
                                $i++;

                            }
                        }
                    }
                }
                ?>
                <!-- end: DYNAMIC TABLE PANEL -->
            </div>
        </div>
        <!-- end: PAGE CONTENT-->


        <div class="painel_navegacao">
            <div class="form-group co_pagina_livro_parent col-sm-6">
                <label for="s2id_autogen1" class="control-label">Ir para a Página</label>
                <select id="co_pagina_livro_navegacao" name="co_pagina_livro_navegacao[]"
                        class="form-control search-select select2-offscreen" tabindex="-1">
                    <option value="1">Capa</option>
                    <?php
                    foreach ($paginas as $key => $pagina) {
                        if (strstr($pagina, 'Capítulo')) {
                            echo '<optgroup label="' . $pagina . '">';
                            $pagina = 'Capa Capítulo';
                        }
                        echo '<option value="' . $key . '">' . $pagina . '</option>';
                    }
                    ?>
                </select>
            </div>
            <div class="form-group co_pagina col-sm-6">
                <label for="s2id_autogen00" class="control-label">Zoom:</label>
                <div class="btn-group">
                    <button id="zoommenosx" class="btn btn-primary hidden-xs" title="Diminuir todo o Zoom">
                        <i class="clip-zoom-out-2"></i>
                    </button>
                    <button id="zoommenos" class="btn btn-green" title="Diminuir o Zoom">
                        <i class="clip-zoom-out"></i>
                    </button>
                    <button id="zoommais" class="btn btn-green" title="Aumentar o Zoom">
                        <i class="clip-zoom-in"></i>
                    </button>
                    <button id="zoommaisx" class="btn btn-primary hidden-xs" title="Aumentar todo o Zoom">
                        <i class="clip-zoom-in-2"></i>
                    </button>

                </div>
                <!-- end: PAGE TITLE & BREADCRUMB -->
            </div>
        </div>
    </div>
</div>
<!-- end: PAGE -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-AMS_HTML"></script>