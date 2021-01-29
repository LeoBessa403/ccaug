<!--  MODAL FORM DE CADASTRO E EDIÇÃO -->
<div class="modal fade in modal-overflow j_cadastro" id="novaAnotacao" tabindex="-1"
     role="dialog" aria-hidden="true">
    <div class="modal-header btn-light-grey">
        <button type="button" class="close cancelar" data-dismiss="modal" aria-hidden="true">
            X
        </button>
        <h4 class="modal-title">Cadastro Anotação</h4>
    </div>
    <div class="modal-body" style="padding: 0;">
        <div class="alert alert-block alert-warning fade in col-md-12"
             style="margin-bottom: 0;">
            <h4 class="alert-heading"><i class="clip-pencil-2"></i> Anotação no Livro</h4>
        </div>
        <?= $form; ?>
    </div>
</div>
<a data-toggle="modal" role="button" href="#novaAnotacao" id="j_cadastro"></a>