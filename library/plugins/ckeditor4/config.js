/**
 * @license Copyright (c) 2003-2020, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

var home = $("#home").attr('data-val');

CKEDITOR.editorConfig = function( config ) {
    config.extraPlugins = 'image2, oembed, slideshow, bootstrapTabs';
};
