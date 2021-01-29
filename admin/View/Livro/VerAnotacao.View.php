<!--  MODAL FORM DE APRESENTAÇÃO DA ANOTAÇÃO DO PROFESSOR -->
<div class="modal fade in modal-overflow j_anotacao" id="verAnotacao_<?= $i;?>" tabindex="-1"
     role="dialog" aria-hidden="true">
    <div class="modal-header btn-light-grey">
        <button type="button" class="close cancelar" data-dismiss="modal" aria-hidden="true">
            X
        </button>
        <h4 class="modal-title">Anotação do Professor</h4>
    </div>
    <div class="modal-body" style="padding: 10px 20px; font-size: 1.6em;">
        <?= $anotaProf[$i]; ?>
    </div>
</div>
<a data-toggle="modal" role="button" href="#verAnotacao_<?= $i;?>" id="j_anotacao_<?= $i;?>"></a>