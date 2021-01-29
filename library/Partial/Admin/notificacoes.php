<style>
    .click_aqui {
        color: white;
        font-weight: bolder;
    }

    .click_aqui:hover {
        color: darkgrey;
    }
</style>
<li class="dropdown" xmlns="http://www.w3.org/1999/html">
    <a class="dropdown-toggle" data-close-others="true" data-hover="dropdown" data-toggle="dropdown" href="#"
       id="notif">
        <i class="fa-envelope fa"></i>
        <span class="badge"><span class="nu_notificacoes">0</span></span>
    </a>
    <ul class="dropdown-menu posts">
        <li>
            <span class="dropdown-menu-title pullUp"> Você tem <span class="nu_notificacoes"></span> Notificações</span>
        </li>
        <li>
            <div class="drop-down-wrapper ps-container notifica">
                <ul>
                    <?php
                    if (SuporteService::PesquisaCountMensagens()) {
                        ?>
                        <li>
                            <a href="<?= HOME . ADMIN; ?>/Suporte/ListarSuporte">
                                <div class="clearfix">
                                    <div class="thread-image">
                                        <?= Valida::getImgSistema(); ?>
                                    </div>
                                    <div class="thread-content">
                                        <span class="author">Você tem
                                            <b><?= SuporteService::PesquisaCountMensagens(); ?></b>
                                        Mensagem(ens) do Suporte não Lido.</span>
                                        <span class="preview"><b>Caso queira ver as mensagens, click aqui para
                                                ver sau caixa de mensagens.</b></span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <?php
                    } ?>
                </ul>
            </div>
        </li>
    </ul>
</li>