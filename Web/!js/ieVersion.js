//判断当前浏览器是否是IE，
//向Window对象中增加isIE对象(指示是否是IE浏览器)
//向window对象中增加ieVersion对象
//ieVersion.IE6 , ieVersion.IE7 等分别为bool型指示是否为相应IE版本
function ieVersion() // correctly handle PNG transparency in Win IE 5.5 & 6. 
{
    window.isIE = (navigator.appVersion.indexOf("MSIE") == -1) ? false : true;
    var arVersion = navigator.appVersion.split("MSIE");
    var version = parseFloat(arVersion[1]);
    window.ieVersion.IE6 = (version >= 5.5 && version < 7) ? true : false;
    window.ieVersion.IE7 = (version >= 7 && version < 8) ? true : false;
    window.ieVersion.IE8 = (version >= 8 && version < 9) ? true : false;
    window.ieVersion.IE9 = (version >= 9 && version < 10) ? true : false;
    window.ieVersion.IE10 = (version >= 10 && version < 11) ? true : false;
}
ieVersion();