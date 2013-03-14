$(function () {
    var topHeight = 0; //第一个视差特效块距离浏览器顶端距离
    var sliderArr = [];


    /*=============初始化===============*/

    //在非IE6,7下执行视差特效
    if (window.ieVersion.IE6) {
        $(".Parallax").css("background-attachment", "scroll");
    }
    else {
        //第一组
        $(".group1_text").parallax("50%", 1, true, topHeight);
        $("#group1_layer1").parallax("50%", 0.9, true, topHeight);
        $("#group1_layer2").parallax("50%", 0.85, true, topHeight);
        $("#group1_layer3").parallax("50%", 0.8, true, topHeight);
        $("#group1_layer4").parallax("50%", 0.75, true, topHeight);
        $("#group1_layer5").parallax("50%", 0.8, true, topHeight);
        $("#group1_bg").parallax("50%", 0.7, true, topHeight);
        //第二组
        $(".group2_text").parallax("50%", 1, true, topHeight);
        $("#group2_layer1").parallax("50%", 0.75, true, topHeight);
        $("#group2_layer2").parallax("50%", 0.8, true, topHeight);
        $("#group2_layer3").parallax("50%", 0.85, true, topHeight);
        $("#group2_layer4").parallax("50%", 0.9, true, topHeight);
        $("#group2_bg").parallax("50%", 0.7, true, topHeight);
        //第三组
        $(".group3_text").parallax("50%", 1, true, topHeight);
        $("#group3_layer1").parallax("50%", 0.7, true, topHeight);
        $("#group3_layer2").parallax("50%", 0.75, true, topHeight);
        $("#group3_layer3").parallax("50%", 0.8, true, topHeight);
        $("#group3_layer4").parallax("50%", 0.85, true, topHeight);
        $("#group3_layer5").parallax("50%", 0.9, true, topHeight);
        $("#group3_bg").parallax("50%", 0.7, true, topHeight);
        //第四组
        $("#group4_bg").parallax("50%", 1, true, topHeight);

    }

    ////计算右侧浮动导航条的浏览器滚动激活区间
    //$(".group").each(function (i) {
    //    var $groupItem = $(this);
    //    sliderArr.push({ "selector": ".group:eq(" + $groupItem.index() + ")", "offsetTop": $groupItem[0].offsetTop });
    //});
    //alert(sliderArr);


    /*===================================*/


    /*==========屏幕右侧导航条===============*/
    $(".slider div:gt(0)").hover(function () {
        //鼠标悬停切换颜色
        if ($(this).index() == 5) return;
        if ($(this).attr("class").indexOf("current") != -1) return;
        $(this).find(":not(.hidden)").css("display", "none").siblings(".hidden").css("display", "block");
    }, function () {
        if ($(this).index() == 5) return;
        if ($(this).attr("class").indexOf("current") != -1) return;
        $(this).find(":not(.hidden)").css("display", "").siblings(".hidden").css("display", "");
    }).click(function () {
        //点击则滚动到指定元素
        //$.scrollTo("#" + $(".group").eq($(this).index() - 1).attr("id"), "slow");
        $.scrollTo($(".group").eq($(this).index() - 1)[0].offsetTop - topHeight, "slow");
        activeSlider(this);
    });
    //激活右侧导航条高亮显示
    function activeSlider(sliderDiv) {
        $(sliderDiv).find(":not(.hidden)").css("display", "none").siblings(".hidden").css("display", "block");
        $(sliderDiv).addClass("current").siblings(".current").removeClass("current").find(":not(.hidden)").css("display", "").siblings(".hidden").css("display", "");
    }


    //当浏览器窗口变更,滚动时，实时保证右侧选择条在浏览器上下居中
    //function sliderCenter() {
    //    $(".slider").css("top", ($(window).height() / 2 - $(".slider").height() / 2) + "px");
    //    //当滚动到指定区间自动切换显示Slider高亮显示
    //    var avgLine = document.documentElement.clientHeight * 0.6; //浏览器高度1/3的Top值
    //    var scrollTop = document.documentElement.scrollTop; //网页向上滚动了的高度
    //    var groupHeight = $(".group").eq(0)[0].clientHeight; //group项的高度
    //    for (var i = 0; i < sliderArr.length; i++) {
    //        var low, high;
    //        low = (i == 0) ? 0 : sliderArr[i - 1].offsetTop + avgLine;
    //        high = sliderArr[i].offsetTop - avgLine;
    //        high = Math.abs(high);
    //        if (scrollTop >= low && scrollTop <= high) {
    //            activeSlider($(".slider").children("div").eq(i + 1)); //加一是去掉“佳沃产品”这一项
    //            break;
    //        }
    //    }
    //}

    //当浏览器窗口变更,滚动时，实时保证右侧选择条在浏览器上下居中
    function sliderCenter() {
        var top = $(window).height() / 2 - $(".slider").height() / 2;
        if (window.ieVersion.IE6) top += $(window).scrollTop();
        if (top <= 127) top = 127;
        $(".slider").css("top", top + "px");
        var minWidth = 1410;
        //if (window.ieVersion.IE8) minWidth=
        if ($(window).width() <= minWidth) {
            $(".group_btn").css("position", "relative");
            $(".groupLeft").css("left", "0px");
            $(".groupRight").css("right", "80px");
        }
        else {
            $(".group_btn").css("position", "");
            $(".groupLeft").css("left", "100px");
            $(".groupRight").css("right", "100px");
        }



        //当滚动到指定区间自动切换显示Slider高亮显示
        var avgLine = parseInt(document.documentElement.clientHeight * 0.3); //浏览器高度1/3的Top值
        var scrollTop = document.documentElement.scrollTop || document.body.scrollTop; //网页向上滚动了的高度
        var $group = $(".group");
        $group.each(function (i) {
            var $item1 = $group.eq(i);
            var $item2 = (i == $group.length - 1) ? $group.eq(i) : $group.eq(i + 1);
            var offsetTop1 = $item1[0].offsetTop;
            var offsetTop2 = $item2[0].offsetTop;
            if (offsetTop1 == offsetTop2) offsetTop2 += $item2[0].clientHeight;
            //console.log($item1[0].id + "," + offsetTop1 + "," + scrollTop + "," + avgLine);
            //console.log($item2[0].id + "," + offsetTop2 + "," + scrollTop + "," + avgLine);
            if ((offsetTop1 <= scrollTop + avgLine) && (offsetTop2 >= scrollTop + avgLine)) {
                activeSlider($(".slider").children("div").eq(i + 1)); //加一是去掉“佳沃产品”这一项
                //console.log("激活：" + i);
                return false;
            }
        });
    }
    $(window).resize(sliderCenter);
    $(window).scroll(sliderCenter);
    sliderCenter();
    /*================================*/


    /*========每个Group的内容左右切换=======*/
    //向左向右按钮 悬停切换颜色
    $(".groupLeft,.groupRight").hover(function () {
        $(this).find(":not(.hidden)").css("display", "none").parent().find(".hidden").css("display", "block");
    }, function () {
        $(this).find(":not(.hidden)").css("display", "").parent().find(".hidden").css("display", "");
    });

    //向左向右按钮 点击切换
    $(".groupRight").click(RightOne);
    $(".groupLeft").click(LeftOne);
    //下方圆点 点击切换
    $(".focus ul li").click(function () {
        var current = 0, next = 0;
        next = $(this).index();
        $(this).siblings("li").each(function (i) {
            var li = $(this);
            if (li.find("img").attr("src").indexOf("on") != -1) {
                current = li.index();
                return false; //Break
            }
        });
        ShowItem(current, next, this);
    });

    //向右显示一张
    function RightOne() {
        //变更图像
        var $item = $(this).parents(".group").find(".groupScreen").filter(".hidden").first();
        if ($item.length == 0) return;
        $item.css("left", "1920px").removeClass("hidden").animate({ left: "0px" }, "slow", function () {
            $(this).addClass("action");
            hiddenLeftRight(this);
        })
        //变更下方圆点焦点
        var $focus = $(this).parents(".group").find(".focus");
        var current;
        $focus.find("li").each(function (i) {
            var li = $(this);
            if (li.find("img").attr("src").indexOf("on") != -1) {
                current = li.index();
                return false; //Break
            }
        });
        if (current != $focus.find("li").length - 1) {
            $focus.find("li").eq(current).find("img").attr("src", "/!images/focus_off.jpg");
            $focus.find("li").eq(current + 1).find("img").attr("src", "/!images/focus_on.jpg");
        }
        hiddenLeftRight(this);
    }

    //向左显示一张
    function LeftOne() {
        //变更图像
        var $item = $(this).parents(".group").find(".groupScreen").filter(".action").last();
        if ($item.length == 0) return;
        $item.removeClass("action").animate({ left: "1920px" }, "slow", function () {
            $(this).addClass("hidden");
            hiddenLeftRight(this);
        })
        //变更下方圆点焦点
        var $focus = $(this).parents(".group").find(".focus");
        var current;
        $focus.find("li").each(function (i) {
            var li = $(this);
            if (li.find("img").attr("src").indexOf("on") != -1) {
                current = li.index();
                return false; //Break
            }
        });
        if (current != 0) {
            $focus.find("li").eq(current).find("img").attr("src", "/!images/focus_off.jpg");
            $focus.find("li").eq(current - 1).find("img").attr("src", "/!images/focus_on.jpg");
        }
        hiddenLeftRight(this);
    }

    //点击圆点切换左右图（current:当前项index , next:要切换到哪个index , thisOBj:原始引用对象）
    function ShowItem(current, next, thisObj) {
        if (next == current) return;
        else if (next > current) {
            var $right = $(thisObj).parents(".focus").siblings().find(".groupRight");
            var count = next - current;
            while (count--) {
                $right.click();
            }
        }
        else if (next < current) {
            var $left = $(thisObj).parents(".focus").siblings().find(".groupLeft");
            var count = current - next;
            while (count--) {
                $left.click();
            }
        }
    }


    //判断当前显示详情是否是第一个和最后一个
    //   如果是则隐藏向左按钮盒向右按钮
    //   参数为触发点击事件的源对象
    function hiddenLeftRight(Btn) {
        var $item = $(Btn).parents(".group").find(".groupScreen").filter(".hidden");
        var max = $(Btn).parents(".group").find(".groupScreen").length;
        var $left = $(Btn).parents(".group").find(".groupLeft");
        var $right = $(Btn).parents(".group").find(".groupRight");
        if ($item.length == max)
        { $left.hide(0); $right.show(0); }
        else if ($item.length == 0)
        { $left.show(0); $right.hide(0); }
        else
        { $left.show(0); $right.show(0); }
    }
    //页面初始化，把所有左键头都隐藏掉
    $(".groupLeft").hide(0);

    //    $(window).resize(screenCenter);
    /*================================*/


    //蓝莓地图 坐标点

    //$(".place_pop").css("display", "none");
    //弹出层place_pop ，坐标点icon_place
    $(".icon_place").mouseenter(function () {
        var popbox = $(this).siblings().filter(".place_pop").eq($(this).index(".icon_place"));
        if (popbox.css("display") == "none")
            popbox.fadeIn(300);
        //else
        //    popbox.fadeOut("normal");
    });

    $(".place_pop").mouseleave(function () {
        var popbox = $(this);
        if (popbox.css("display") != "none")
            popbox.fadeOut(300);
    });

    //蓝莓地图 热点
    //product_pop ，热点#Map area
    $("#Map area").mouseenter(function () {
        var popbox = $(this).parents(".product_pic").siblings().filter(".product_pop").eq($(this).index());
        popbox.siblings(".product_pop").hide(); //隐藏其他弹出层
        if (popbox.css("display") == "none")
            popbox.fadeIn(300);
    });

    //移出感应区方式1：移出弹出层消失
    $(".product_pop").mouseleave(function () {
        var popbox = $(this);
        popbox.siblings(".product_pop").hide(); //隐藏其他弹出层
        if (popbox.css("display") != "none")
            popbox.fadeOut(300);
    });

    //    //移出感应区方式2：移出感应区消失
    //    $("#Map area").mouseout(function () {
    //        var popbox = $(this).parents(".product_pic").siblings().filter(".product_pop").eq($(this).index());
    //        if (popbox.css("display") != "none")
    //            popbox.fadeOut("normal");
    //    });


    //猕猴桃地图 坐标点

    //$(".place_pop").css("display", "none");
    //弹出层place_pop ，坐标点icon_place
    $(".icon_kiwiplace").mouseenter(function () {
        var popbox = $(this).siblings().filter(".kiwiplace_pop").eq($(this).index(".icon_kiwiplace"));
        if (popbox.css("display") == "none")
            popbox.fadeIn(300);
        //else
        //    popbox.fadeOut("normal");
    });

    $(".kiwiplace_pop").mouseleave(function () {
        var popbox = $(this);
        if (popbox.css("display") != "none")
            popbox.fadeOut(300);
    });

    //猕猴桃地图 热点
    //product_pop ，热点#Map2 area
    $("#Map2 area").mouseenter(function () {
        var popbox = $(this).parents(".kiwipro_pic").siblings().filter(".kiwipro_pop").eq($(this).index());
        popbox.siblings(".kiwipro_pop").hide(); //隐藏其他弹出层
        if (popbox.css("display") == "none")
            popbox.fadeIn(300);
    });

    //移出感应区方式1：移出弹出层消失
    $(".kiwipro_pop").mouseleave(function () {
        var popbox = $(this);
        popbox.siblings(".kiwipro_pop").hide(); //隐藏其他弹出层
        if (popbox.css("display") != "none")
            popbox.fadeOut(300);
    });

    //    //移出感应区方式2：移出感应区消失
    //    $("#Map area").mouseout(function () {
    //        var popbox = $(this).parents(".product_pic").siblings().filter(".product_pop").eq($(this).index());
    //        if (popbox.css("display") != "none")
    //            popbox.fadeOut("normal");
    //    });


    //其他水果地图 坐标点

    //$(".place_pop").css("display", "none");
    //弹出层place_pop ，坐标点icon_place
    $(".icon_fruitsplace").mouseenter(function () {
        var popbox = $(this).siblings().filter(".fruitsplace_pop").eq($(this).index(".icon_fruitsplace"));
        if (popbox.css("display") == "none")
            popbox.fadeIn(300);
        //else
        //    popbox.fadeOut("normal");
    });

    $(".fruitsplace_pop").mouseleave(function () {
        var popbox = $(this);
        if (popbox.css("display") != "none")
            popbox.fadeOut(300);
    });

    //其他水果地图 热点
    //product_pop ，热点#Map2 area
    $("#Map3 area").mouseenter(function () {
        var popbox = $(this).parents(".fruitspro_pic").siblings().filter(".fruitspro_pop").eq($(this).index());
        popbox.siblings(".fruitspro_pop").hide(); //隐藏其他弹出层
        if (popbox.css("display") == "none")
            popbox.fadeIn(300);
    });

    //移出感应区方式1：移出弹出层消失
    $(".fruitspro_pop").mouseleave(function () {
        var popbox = $(this);
        popbox.siblings(".fruitspro_pop").hide(); //隐藏其他弹出层
        if (popbox.css("display") != "none")
            popbox.fadeOut(300);
    });

    //    //移出感应区方式2：移出感应区消失
    //    $("#Map area").mouseout(function () {
    //        var popbox = $(this).parents(".product_pic").siblings().filter(".product_pop").eq($(this).index());
    //        if (popbox.css("display") != "none")
    //            popbox.fadeOut("normal");
    //    });




    /*=======根据GET参数来直接定位到位置=====*/
    //获取GET参数判断是否需要滚动
    //目前待定参数名称为skip，参数值为0-3，为跳转第1-4项，蓝莓->其他项
    //必须放到最后，否则无法调用上方定义的click事件


    var skip = parseInt(jchlib.urlParam.getParam("skip"));
    if (skip >= 0) {
        $(".slider div:gt(0)").eq(skip).click();
    }
    /*==================================*/


    //五佳体系--蓝莓
    $(".group1_3pic").mouseover(function () {
        $(this).siblings().show().mouseout(function () {
            $(this).hide();
        });
        $(this).parent("li").siblings().find(".group1_3pop").hide();
    });


    //五佳体系-猕猴桃
    $(".group2_3pic").mouseover(function () {
        $(this).siblings().show().mouseout(function () {
            $(this).hide();
        });
        $(this).parent("li").siblings().find(".group2_3pop").hide();
    });

});