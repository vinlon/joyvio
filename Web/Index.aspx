<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="Index.aspx.cs" Inherits="Web.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>佳沃官方网站</title>
    <link href="/!css/index.css" rel="Stylesheet" type="text/css" />
    <link href="/!css/lrtk.css" rel="Stylesheet" type="text/css" />
    <script src="/!js/ScrollPic.js" type="text/javascript"></script>
    <script src="/!js/easing.js" type="text/javascript"></script>
    <script src="/!js/slide.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var winWidth = $(window).width();
            $(this).myFocus(
            [{ src: "/!images/banner_pic1.jpg" }, { src: "/!images/banner_pic2.jpg" }, { src: "/!images/banner_pic3.jpg"}],
            {
                "ImgWidth": 1920,
                "ImgHeight": 400,
                "ScrollSpeed": 1000,
                "IsAnimateConti": true,
                "IsAutoPlay": true,
                "AutoPlayDelay": 8000,
                "Focus": ".focus",
                "isWaitLoaded": true//等待所有图片全部加载完成后才执行动画效果
            });

            $("#slideUl").slide({
                li_size: 1, //每次滚动li个数,默认一屏
                speed: 1000, //速度：数值越大，速度越慢（毫秒）默认500
                //timer: 3000, //不需要自动滚动删掉该参数
                li_w: 620, //每个li的宽度（包括border,margin,padding,都要算进去）
                left: "sildeLeft",
                right: "sildeRight"
            });
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="banner">
        <div id="maincontent">
            <div class="element pict">
                <img src="" alt="佳品天成 源自沃土" />
                <div class="banner_txt">
                    <p>
                        <span>
                            <img src="/!images/banner_txt1.gif" alt="佳品天成 源自沃土" /></span></p>
                </div>
            </div>
            <div class="element pict main">
                <img src="" alt="好产品从种植开始" />
                <div class="banner_txt">
                    <p>
                        <span>
                            <img src="/!images/banner_txt2.gif" alt="好产品从种植开始" /></span></p>
                </div>
        </div>
        <div class="element pict">
            <img src="" alt="源于自然的健康之饮" />
            <div class="banner_txt">
                <p>
                    <span>
                        <img src="/!images/banner_txt3.gif" alt="源于自然的健康之饮" /></span></p>
            </div>
    </div>
    <p class="clear">
    </p>
    <div class="focus">
        <ul>
            <li>
                <img src="/!images/focus_on.jpg" alt="佳品天成 源自沃土" /></li>
            <li>
                <img src="/!images/focus_off.jpg" alt="好产品从种植开始" /></li>
            <li>
                <img src="/!images/focus_off.jpg" alt="源于自然的健康之饮" /></li>
        </ul>
    </div>
    </div> </div>
    <p class="clear">
    </p>
    <div class="bottombar">
        <p class="fl">
            <img src="/!images/index_line1.jpg" /></p>
        <div class="bottom">
            <div class="slideUl" id="slideUl">
                <ul>
                    <li><a href="/Product/Index.aspx?skip=0">
                        <img src="/!images/bottom_pic1.jpg" alt="蓝莓：抗氧化之王 富含天然抗氧化剂花青素" /></a></li>
                    <li><a href="/Product/Index.aspx?skip=1">
                        <img src="/!images/bottom_pic2.jpg" alt="猕猴桃：维C之王 营养密度最高的水果" /></a></li>
                </ul>
                <p class="clear">
                </p>
                <p id="sildeRight" class="btn_left">
                    <img src="/!images/btn_left_off.jpg" alt="向左" /></p>
                <p id="sildeLeft" class="btn_right">
                    <img src="../!images/btn_right_off.jpg" alt="向右" /></p>
            </div>
            <div class="bottom_right">
                <p>
                    <a href="/Food/Recipe.aspx">
                        <img src="/!images/live_pic.jpg" alt="爱生活 爱鲜果" /></a></p>
                <div class="bottom_info">
                    <p class="bottom_title">
                        爱生活 爱鲜果</p>
                    <p class="info_txt">
                        保卫新鲜蓝莓大作战<br />
                        蓝莓巧心饼</p>
                    <p class="more">
                        <a href="/Food/Recipe.aspx">更多>></a></p>
                </div>
            </div>
            <div class="bottom_right">
                <p>
                    <a href="/TraceabilitySystem.aspx">
                        <img src="/!images/traceability_pic.jpg" alt="可追溯系统" /></a></p>
                <div class="bottom_info">
                    <p class="bottom_title">
                        可追溯系统</p>
                    <p class="info_txt">
                        通过佳沃全程可追溯系统，轻松查询产品从果园到餐桌每一个细节。</p>
                    <p class="more">
                        <a href="/TraceabilitySystem.aspx">更多>></a></p>
                </div>
            </div>
            <p class="clear">
            </p>
        </div>
        <p class="fr">
            <img src="/!images/index_line2.jpg" /></p>
        <p class="clear">
        </p>
    </div>
</asp:Content>
