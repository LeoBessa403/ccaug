$(function () {

    var home = $("#home").attr('data-val');
    var editor = CKEDITOR.replace('ds_code', {
        height: 1000,
        width: 900,
        language: 'pt-br',
        style: 'padding: 5px 12px;',
        mathJaxLib: 'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-AMS_HTML'
    });
    CKFinder.setupCKEditor(editor);

    var conteudo = ($("#ds_code").val());


    $(".conteudo").html(conteudo);


    editor.on('change',function (data) {

        $(".conteudo").html(data.editor.getData());
    });

    $(".accordion").accordion();


});