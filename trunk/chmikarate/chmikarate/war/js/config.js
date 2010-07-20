/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
var _FileBrowserLanguage	= 'jsp' ;
var _FileBrowserExtension = _FileBrowserLanguage == 'perl' ? 'cgi' : _FileBrowserLanguage ;
CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	  config.language = 'zh-cn';
	  config.height = 500;
	  config.uiColor = '#ffe9b5';
	  config.toolbar = 'yaodian';
	  config.toolbar_yaodian = [['Source','-','Bold','Italic','Underline','Strike'],
	      						['TextColor','BGColor','FontSize'],
	    						['NumberedList','BulletedList','-','Outdent','Indent'],
	    						['JustifyLeft','JustifyCenter','JustifyRight'],
	    						['Link','Unlink','Image'],
	    						['Cut','Copy','Paste']];
	  
	  config.toolbar_product = [['Source','-','Bold','Italic','Underline','Strike'],
	      						['TextColor','BGColor','FontSize'],['Table','Templates','Maximize'],
	    						['NumberedList','BulletedList','-','Outdent','Indent'],
	    						['JustifyLeft','JustifyCenter','JustifyRight'],
	    						['Link','Unlink','Image'],
	    						['Cut','Copy','Paste']];


	  config.toolbarCanCollapse = false;	//工具欄是否可以被收縮
	  config.fontSize_sizes ='12/12px;15/15px;';
	  config.templates_replaceContent = false;//當使用範本時，“編輯內容將被替換”框是否選中 plugins/templates/plugin.js
	  config.colorButton_enableMore = false;
	  config.TemplateReplaceCheckbox = false ;
	  //config.ImageBrowser=true;
	  //config.ImageBrowserURL="/images";
	  //config.LinkBrowser=true; //是否允許在插入鏈接時瀏覽服務器
	  
	  config.ImageDlgHideLink		= false ;
	  config.ImageDlgHideAdvanced	= false ;
	  config.ImageBrowser = true ;
	  config.ImageBrowserURL = config.BasePath + 'filemanager/browser/default/browser.html?Type=Image&Connector=' + encodeURIComponent( config.BasePath + 'filemanager/connectors/' + _FileBrowserLanguage + '/connector.' + _FileBrowserExtension ) ;
	  config.ImageBrowserWindowWidth  = config.ScreenWidth * 0.7 ;	// 70% ;
	  config.ImageBrowserWindowHeight = config.ScreenHeight * 0.7 ;	// 70% ;
	  config.LinkBrowser=true;// 是否允许在插入链接时浏览服务器
	  //config.EnableMoreFontColors = false ;
};
