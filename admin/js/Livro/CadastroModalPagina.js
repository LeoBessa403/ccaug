$(function () {

    var home = $("#home").attr('data-val');
    var editor = CKEDITOR.replace('ds_code', {
        height: 1000,
        width: 850,

    });
    CKFinder.setupCKEditor(editor);

    var conteudo = ($("#ds_code").val());


    $(".conteudo").html(conteudo);


    editor.on('change',function (data) {

        $(".conteudo").html(data.editor.getData());
    });

});