(function ($) {
    jQuery.fn.extend({
        "myFocus": function (imgArr, option) {
            imgArr = jQuery.extend("", imgArr);
            option = jQuery.extend({
                "ImgWidth": 996,        //图片项的宽度
                "ImgHeight": 528,       //高度
                "ScrollSpeed": 1000,     //左右滚动的速度
                "IsAnimateConti": false, //是否连续执行滚动动画
                "IsAutoPlay": true,     //是否自动播放
                "AutoPlayDelay": 3000,  //自动播放延时(只在IsAutoPlay为true时有效)
                "Focus": "",             //焦点块的ul外层包裹控件的选择器
                "isWaitLoaded": false    //是否等待完成后再执行自动播放（只有开启了自动播放后才有效）
            }, option);
            var _currentpage = 0; //当前显示的图片索引
            var _loadedCount = 0; //已经加载了的图片数量
            var _maxpage = $("#maincontent").find(".pict").length; //图片项的数量
            var _AutoPlayId;
            var _Focus = $(option.Focus);


            if (_maxpage <= 0) return;


            //等待0.5秒后进行初始化
            setTimeout(startslide, 1);

            //初始化
            function startslide() {
                $("#maincontent").find(".pict").children("img").each(function (index) {
                    if (!imgArr[index]) return;
                    $(this).attr("src", imgArr[index]["src"]);
                });
                $("#maincontent .pict img").load(function () {
                    //给每个图片加载onload事件，等待图片加载完成
                    _loadedCount++;
                    //console.log("ready"+_loadedCount);
                    if (_loadedCount == _maxpage) {
                        //ReSetAutoPlay();//当全部加载完成后立即开始轮播
                        //console.log("Loaded Complate!");
                    }
                });
                //网页加载时显示淡入效果
                $("#maincontent").css("height", option.ImgHeight);
                $("#maincontent").find(".element").css("display", "inline-block");
                $("#maincontent").find(".right").hide();
                $("#maincontent").find(".left").hide();
                $("#maincontent").find(".right").fadeIn(600);
                $("#maincontent").find(".left").fadeIn(600);
                //注册事件，鼠标移动到左右两个按钮上更换按钮的背景图片
                $("#maincontent").find(".left,.right").hover(function () {
                    var str = $(this).find("img").attr("src");
                    if (str.indexOf("_on") == -1 && str.indexOf("_nouse") == -1) {
                        str = str.replace(".gif", "_on.gif");
                        str = str.replace(".jpg", "_on.jpg");
                        $(this).find("img").attr("src", str);
                    }
                }, function () {
                    var str = $(this).find("img").attr("src");
                    str = str.replace("_on.gif", ".gif");
                    str = str.replace("_on.jpg", ".jpg");
                    $(this).find("img").attr("src", str);
                });


                //初始化所有图片项的位置
                for (var i = 0; i < _maxpage; i++) {
                    //图片项的left
                    var _pos = Math.round(option.ImgWidth * (i - _currentpage) + $(window).width() / 2 - (option.ImgWidth) / 2);
                    //透明度
                    var _opa = 0.5;
                    if (i == _currentpage) _opa = 1;
                    if (_pos > $(window).width()) {
                        _pos -= _maxpage * option.ImgWidth
                    } else if (_pos < -option.ImgWidth) {
                        _pos += _maxpage * option.ImgWidth
                    }
                    $("#maincontent").find(".pict").eq(i).css({
                        left: _pos,
                        opacity: 0
                    }).animate({
                        opacity: _opa
                    }, 500)
                }

                $("#maincontent").stop().find(".main").removeClass("main");
                $("#maincontent").stop().find(".pict").eq(_currentpage).addClass("main").css({ "position": "absolute" });
                //注册事件
                $("#maincontent").find(".right").click(function () { nextPage(1); }); //前后按钮翻页
                $("#maincontent").find(".left").click(function () { prevPage(1); });
                _Focus.find("li").css("cursor", "pointer"); //点击焦点块实现跳转页
                _Focus.find("li").click(function () {
                    var offset = $(this).index() - _currentpage;
                    if (offset > 0)
                        nextPage(offset);
                    else if (offset < 0)
                        prevPage(Math.abs(offset));
                    else
                        return;
                    AutoPlay(false);
                });

                //设定是否自动轮播
                if (option.IsAutoPlay == true) {
                    ReSetAutoPlay(); //重置轮播
                    AutoPlay(false); //轮播函数，初次执行
                }

                //当浏览器窗体大小变更时
                window.onresize = windowCenter;
                function windowCenter() {
                    for (var i = 0; i < _maxpage; i++) {
                        var _pos = Math.round(option.ImgWidth * (i - _currentpage) + $(window).width() / 2 - (option.ImgWidth) / 2);
                        var center = Math.round($(window).width() / 2 - 1200 / 2);
                        $(".focus").css("left", center); //焦点图下方紫色小圆点
                        var _opa = 0.5;
                        if (i == _currentpage) _opa = 1;
                        if (_pos > $(window).width()) {
                            _pos -= _maxpage * option.ImgWidth
                        }
                        $("#maincontent").stop().find(".pict").eq(i).css({
                            left: _pos,
                            opacity: _opa
                        });

                        //动态获取上方logo的left设置到焦点图上的slogan
                        var outleft = (parseFloat($("#maincontent").find(".main").css("left").replace("px", "")) * -1);
                        $(".banner_txt").css("left", $(".header")[0].offsetLeft + outleft + "px");

                    }
                }
                windowCenter();
            } //初始化结束


            //下一页(参数：向后滚动几页)
            function nextPage(count) {
                if (!option.IsAnimateConti)
                    if ($("#maincontent").find(".pict").eq(0).is(":animated"))
                        return;
                _currentpage += count;
                if (_currentpage > _maxpage - 1) _currentpage = 0;
                $("#maincontent").stop().find(".main").removeClass("main");
                $("#maincontent").stop().find(".pict").eq(_currentpage).addClass("main").css({ "position": "absolute" });
                _pict = $("#maincontent").find(".pict");
                for (var i = 0; i < _maxpage; i++) {
                    var _pos = Math.round(option.ImgWidth * (i - _currentpage) + $(window).width() / 2 - (option.ImgWidth) / 2);
                    var _opa = 0.5;
                    if (i == _currentpage) _opa = 1;
                    if (_pos > $(window).width()) {
                        _pos -= _maxpage * option.ImgWidth
                    } else if (_pos < -option.ImgWidth * 2) {
                        _pos += _maxpage * option.ImgWidth
                    }
                    _pict.eq(i)
            			 .stop()
            			 .css({
            			     left: _pos + option.ImgWidth
            			 }).animate({
            			     left: _pos,
            			     opacity: _opa
            			 }, option.ScrollSpeed);
                }
                $(".focus").find("ul").find("li").find("img").attr("src", "/!images/focus_off.jpg");
                $(".focus").find("ul").find("li").eq(_currentpage).find("img").attr("src", "/!images/focus_on.jpg");
                ReSetAutoPlay();
                AutoPlay(false);
            }


            //上一页(参数：向前滚动几页)
            function prevPage(count) {
                if (!option.IsAnimateConti)
                    if ($("#maincontent").find(".pict").eq(0).is(":animated"))
                        return;
                _currentpage -= count;
                if (_currentpage < 0) _currentpage = _maxpage - 1;
                $("#maincontent").stop().find(".main").removeClass("main");
                $("#maincontent").stop().find(".pict").eq(_currentpage).addClass("main").css({ "position": "absolute" }); ;
                for (var i = 0; i < _maxpage; i++) {
                    var _pos = Math.round(option.ImgWidth * (i - _currentpage) + $(window).width() / 2 - (option.ImgWidth) / 2);
                    var _opa = 0.5;
                    if (i == _currentpage) _opa = 1;
                    if (_pos < -option.ImgWidth) {
                        _pos += _maxpage * option.ImgWidth
                    } else if (_pos > $(window).width() + option.ImgWidth) {
                        _pos -= _maxpage * option.ImgWidth
                    }
                    $("#maincontent").find(".pict")
                                     .eq(i)
            			             .stop()
            			             .css({ left: _pos - option.ImgWidth })
                                     .animate({ left: _pos, opacity: _opa }, option.ScrollSpeed);
                }
                $(".focus").find("ul").find("li").find("img").attr("src", "/!images/focus_off.jpg");
                $(".focus").find("ul").find("li").eq(_currentpage).find("img").attr("src", "/!images/focus_on.jpg");
                ReSetAutoPlay();
                AutoPlay(false);
            }




            //重新设定自动轮播
            function ReSetAutoPlay() {
                if (option.IsAutoPlay == true) {
                    clearInterval(_AutoPlayId);
                    _AutoPlayId = setInterval(function () { AutoPlay(true); }, option.AutoPlayDelay);
                }
            }

            //轮播函数
            function AutoPlay(isNextPage) {
                //如果开启等待全部图片加载完成后再执行的话，并且当前加载的图片小于全部数量则不执行轮播
                if (option.isWaitLoaded) {
                    if (_loadedCount < _maxpage)
                        return;
                }
                if (isNextPage == true)
                    nextPage(1); //轮播，下一页

                //_Focus.find("li").stop().css("background-position", "0px -20px")
                //        .eq(_currentpage).css("background-position", "0px 0px")
                //        .animate({ backgroundPosition: "(0px -20px)" }, (option.AutoPlayDelay * 2) - 1000);
            }

            //------END-----
        }
    });
})(jQuery);




/*-----
EASING，自定义动画插件
------*/

jQuery.extend(jQuery.easing, {
    def: 'easeOutQuint',
    swing: function (x, t, b, c, d) {
        return jQuery.easing[jQuery.easing.def](x, t, b, c, d);
    },
    easeOutQuint: function (x, t, b, c, d) {
        return c * ((t = t / d - 1) * t * t * t * t + 1) + b;
    }
});