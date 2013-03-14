/// <reference path="http://localhost:8021/js/jquery-1.7.2.min.js" />

$(function () {

    //导航
    $("li[name='navigation']").live("mouseover", function () {
        $(this).children().eq(1).show();
        $(this).addClass("hover");
    }).live("mouseout", function () {
        $(this).children().eq(1).hide();
        $(this).removeClass("hover");
    });
    //导航--佳沃产品
    $("li.secli").live("mouseover", function () {
        $(this).children().eq(1).show();
        $(this).children().eq(0).addClass("hover");
    }).live("mouseout", function () {
        $(this).children().eq(1).hide();
        $(this).children().eq(0).removeClass("hover");
    });

    //联想控股成员企业三级菜单
    $('.member').hover(function () {
        $(this).children('ul').show();
    }, function () {
        $(this).children('ul').hide();
    });
    $('.member ul>li').hover(function () {
        var index = $(this).prevAll().length;
        $(this).children('ul').css('top', index * $(this).height()).show();
    }, function () {
        $(this).children('ul').hide();
    }).find('ul').hide();

    //首页左下产品轮换
    $(".btn_left").hover(function () {
        $("img", $(this)).attr("src", $("img", $(this)).attr("src").replace("_off", "_on"));
    }, function () {
        $("img", $(this)).attr("src", $("img", $(this)).attr("src").replace("_on", "_off"));
    });

    $(".btn_right").hover(function () {
        $("img", $(this)).attr("src", $("img", $(this)).attr("src").replace("_off", "_on"));
    }, function () {
        $("img", $(this)).attr("src", $("img", $(this)).attr("src").replace("_on", "_off"));
    });

})

