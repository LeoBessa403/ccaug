$(function () {

    var home = $("#home").attr('data-val');

    ClassicEditor
        .create( document.querySelector( '.editor' ), {
            ckfinder: {
                uploadUrl:  home + 'library/plugins/ckeditor5/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json',
                options: {
                    resourceType: 'Images'
                }
            },
            heading: {
                options: [
                    { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
                    { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
                    { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
                    { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' },
                    { model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4' },
                    { model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5' },
                    { model: 'heading6', view: 'b', title: 'Heading 6', class: 'ck-heading_heading6' }
                ]
            },
            novo: {
                options: [
                    { view: 'p', title: 'Tag P', class: 'class-p' },
                    { view: 'i', title: 'Tag I', class: 'class-i' },
                    { view: 'span', title: 'Tag SPAN', class: 'class-span' },
                    { view: 'div', title: 'Tag DIV', class: 'class-div' },
                    { view: 'b', title: 'Tag B', class: 'class-b' }
                ]
            },
            toolbar: {
                items: [
                    'novo',
                    'heading',
                    '|',
                    'bold',
                    'italic',
                    'link',
                    'bulletedList',
                    'numberedList',
                    '|',
                    'indent',
                    'outdent',
                    'ckfinder',
                    '|',
                    'imageInsert',
                    'blockQuote',
                    'insertTable',
                    'mediaEmbed',
                    'undo',
                    'redo',
                    'codeBlock',
                    'code',
                    '|',
                    'alignment',
                    'exportPdf',
                    'exportWord',
                    'fontBackgroundColor',
                    'highlight',
                    'fontFamily',
                    'fontSize',
                    'fontColor',
                    '|',
                    'horizontalLine',
                    'htmlEmbed',
                    'pageBreak',
                    'removeFormat',
                    'specialCharacters',
                    'restrictedEditingException',
                    'todoList',
                    'underline'
                ]
            },
            language: 'pt-br',
            image: {
                toolbar: [
                    'imageTextAlternative',
                    'imageStyle:full',
                    'imageStyle:side',
                    'linkImage'
                ]
            },
            table: {
                contentToolbar: [
                    'tableColumn',
                    'tableRow',
                    'mergeTableCells',
                    'tableCellProperties',
                    'tableProperties'
                ]
            },
            plugin: ['CKFinder']

        } )
        .then( editor => {
            window.editor = editor;
        } )
        .catch( error => {
            console.error( 'Oops, something went wrong!' );
            console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
            console.warn( 'Build id: hxuo6imu8125-7y5z0t91xn8p' );
            console.error( error );
        } );


});