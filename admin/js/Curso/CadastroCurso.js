$(function () {

    var home = $("#home").attr('data-val');
    var editor = CKEDITOR.replace('ds_descricao', {
        height: 600,
        width: 740,
        language: 'pt-br',
        style: 'padding: 5px 12px;'
    });
    CKFinder.setupCKEditor(editor);

    CKEDITOR.config.templates_replaceContent = false;

    $(".accordion").accordion();

    $("#st_gratuito").change(function () {
        if(!$(this).prop('checked')){
            $("#nu_valor").prop('disabled',false);
        }else{
            $("#nu_valor").prop('disabled',true).val('0.00');
            Funcoes.TiraValidacao('nu_valor');
        }
    });

    if(!$("#st_gratuito").prop('checked')){
        $("#nu_valor").prop('disabled',false);
    }



});