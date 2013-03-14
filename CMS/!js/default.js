/// <reference path="jquery-1.7.1.js" />

//获取URL中的Query字符串
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) {
        return r[2];
    }
    else {
        return "";
    }
}
//Cookie
var Cookies = {};
//设置Cookies  
Cookies.set = function (name, value) {
    var argv = arguments;
    var argc = arguments.length;
    var expires = (argc > 2) ? argv[2] : null;
    var path = (argc > 3) ? argv[3] : '/';
    var domain = (argc > 4) ? argv[4] : null;
    var secure = (argc > 5) ? argv[5] : false;
    document.cookie = name + "=" + escape(value) +
       ((expires == null) ? "" : ("; expires=" + expires.toGMTString())) +
       ((path == null) ? "" : ("; path=" + path)) +
       ((domain == null) ? "" : ("; domain=" + domain)) +
       ((secure == true) ? "; secure" : "");
};
//读取Cookies  
Cookies.get = function (name) {
    var arg = name + "=";
    var alen = arg.length;
    var clen = document.cookie.length;
    var i = 0;
    var j = 0;
    while (i < clen) {
        j = i + alen;
        if (document.cookie.substring(i, j) == arg)
            return getCookieVal(j);
        i = document.cookie.indexOf(" ", i) + 1;
        if (i == 0)
            break;
    }
    return '';
};
//清除Cookies  
Cookies.clear = function (name) {
    if (Cookies.get(name)) {
        var expdate = new Date();
        expdate.setTime(expdate.getTime() - (86400 * 1000 * 1));
        Cookies.set(name, "", expdate);
    }
};

var getCookieVal = function (offset) {
    var endstr = document.cookie.indexOf(";", offset);
    if (endstr == -1) {
        endstr = document.cookie.length;
    }
    return unescape(document.cookie.substring(offset, endstr));
};

//需要JQuery支持
$(function () {
    $('.list_table tr').each(function (index) {     //list_table隔行变色
        if (index % 2 == 0) {
            $(this).addClass('even');
        }
        else {
            $(this).addClass('odd');
        }
    }).hover(
        function () {    //鼠标划过及双击选择
            $(this).addClass('hover');
        },
        function () {
            $(this).removeClass('hover');
        }
    ).dblclick(function () {
        $(this).addClass('selected');
    }).click(function () {
        $(this).removeClass('selected');
    });


    //显示/修改实体状态
    $('.command').each(function () {
        var command = $(this);
        var state = command.find('[name=entity_state]').val();          //当前状态  1：可用（enable）;0：不可用（disable）
        var url = $.trim(command.find('[name=command_url]').val());     //ajax请求地址
        var id = command.find('[name=command_argument]').val();         //ID
        var disable = command.find('[name=disable]');                   //禁用按钮
        var enable = command.find('[name=enable]');                     //启用按钮
        var del = command.find('[name=delete]');                        //删除按钮
        //状态的初始化 
        if (state == 1) {
            disable.show();
            enable.hide();
        }
        else if (state == 0) {
            disable.hide();
            enable.show();
        }

        //ajax请求
        //启用
        enable.click(function () {
            SetCommand("enable", url, id, function (response) {
                if (response == "1") {
                    enable.hide();
                    disable.show();
                }
                else {
                    alert(response);
                }
            });
        });
        //禁用
        disable.click(function () {
            SetCommand("disable", url, id, function (response) {
                if (response == "1") {
                    disable.hide();
                    enable.show();
                }
                else {
                    alert(response);
                }
            });
        });
        //删除
        del.click(function () {
            if (confirm("确认删除该记录？")) {
                SetCommand("delete", url, id, function (response) {
                    if (response == "1") {
                        command.parent().fadeOut(1000, function () {
                            $(this).remove(); //先收起后移除
                        });
                    }
                    else {
                        alert(response);
                    }
                });
            }
        });
    });



    function SetCommand(cmd, url, id, callback) {
        if (url == "") {
            alert('未设置请求路径,command标签下必须包含<input type="hidden" name="command_url" value="" />，value为请求路径');
        }
        $.ajax(
        {
            url: url + "?r=" + Math.random(),
            type: "POST",
            data: { 'command': cmd, 'id': id },
            success: function (response) {
                callback(response);
            }
        });
    }
});




