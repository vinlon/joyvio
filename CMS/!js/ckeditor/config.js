/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function (config) {
    // Define changes to default configuration here. For example:
    config.language = 'zh-cn';
    //    config.uiColor = '#AADC6E';

    config.toolbar = 'MyToolbar';

    config.toolbar_MyToolbar =
	[
        { name: 'styles', items: ['Source'] },
        { name: 'basicstyles', items: ['Bold', 'Italic', 'Strike', '-', 'RemoveFormat'] },
    	{ name: 'editing', items: ['Find', 'Replace', '-', 'SelectAll', '-', 'Scayt'] },
        { name: 'links', items: ['Link', 'Unlink', 'Anchor','Flash','Image'] },

    	{ name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote'] },
    	{ name: 'tools', items: ['Maximize', '-', 'About'] }
	];

    //自定义样式
    config.stylesSet = 'my_styles';
};


CKEDITOR.stylesSet.add('my_styles',
[
//    { name: '', element: 'div', styles: { 'color': 'Blue'} }

// Inline styles
//    {name: '引言', element: 'div', attributes: { 'class': 'introbar'} }
]);
