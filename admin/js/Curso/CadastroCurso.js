$(function () {

    var home = $("#home").attr('data-val');
    var editor = CKEDITOR.replace('ds_descricao', {
        height: 600,
        width: 470,
        language: 'pt-br',
        style: 'padding: 5px 12px;'
    });
    CKFinder.setupCKEditor(editor);

    CKEDITOR.config.templates_replaceContent = false;

    $(".accordion").accordion();



});