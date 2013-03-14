<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="HealthSafety.aspx.cs" Inherits="Web.Food.HealthSafety" %>

<%@ Register TagPrefix="UC" TagName="CookBookRecommend" Src="~/Food/UC_CookBookRecommend.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>健康安全-佳沃官方网站</title>
    <link href="/!css/style.css" rel="Stylesheet" type="text/css" />
    <link href="/!css/food.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        //左右两侧等高
        var left_div = "left";
        var right_div = "right";
        function change(id1, id2) {
            var con1 = document.getElementById(id1);
            var con2 = document.getElementById(id2);
            if (con1.offsetHeight < con2.offsetHeight) {
                con1.style.height = con2.offsetHeight - 208 + "px";
            }
            else {
                con2.style.height = con1.offsetHeight + "px";
            }
        }
        window.onload = function () {
            try {
                change(left_div, right_div);
            }
            catch (e) {
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <div class="pagenavi">
            <p class="home">
                <a href="/Index.aspx">
                    <img src="/!images/icon_home.jpg" alt="首页" /></a>
            </p>
            <p class="fl">
                > <a href="/Food/Recipe.aspx">美食生活</a> > <span>健康安全</span>
            </p>
            <p class="clear">
            </p>
        </div>
        <p class="clear">
        </p>
        <div class="food_left">
            <p>
                <img src="/!images/healthsafety_pic1.jpg" alt="健康安全" /></p>
            <div class="hs_info" id="left">
                <ul>
                    <li>
                        <p class="hs_title">
                            <a href="">保卫新鲜蓝莓大作战</a></p>
                        <p>
                            蓝莓贵为水果之王，口感酸甜，营养丰富。但其难以保鲜的特点却让蓝莓爱好者大伤脑筋。要想打好新鲜蓝莓保卫战，一定要知道如何挑选、保存新鲜蓝莓的几个小tips。......</p>
                    </li>
                    <li>
                        <p class="hs_title">
                            <a href="">车厘子tips全面普及</a></p>
                        <p>
                            樱桃(Cherry)，又名车厘子，是“水果里的钻石” 娇小玲珑，红艳艳水灵灵，再系着一根细细长长的果蒂，样子十分讨人喜欢。</p>
                    </li>
                    <li>
                        <p class="hs_title">
                            <a href="">食品质量与安全标志那些事儿</a></p>
                        <p>
                            中国人都说“民以食为天”，食品安全是家庭安全的重中之重。如何看懂食品安全标志？了解安全标志是关键。</p>
                    </li>
                    <li>
                        <p class="hs_title">
                            <a href="">水果也化妆？！如何识破提子伪装</a></p>
                        <p>
                            市场上的提子如果个头又大又圆，但口感差，一般也是加入了催红剂和膨大剂。催红剂学名叫乙烯利，可以让提子、葡萄提早成熟，膨大剂可以让水果长得更大，在提子膨大剂中，氯吡脲的使用率最高。
                        </p>
                    </li>
                    <li>
                        <p class="hs_title">
                            <a href="">优质猕猴桃的选购</a></p>
                        <p>
                            猕猴桃称为“水果之王”，不仅美味，而且含有丰富营养物质。以下提供几个挑选优质猕猴桃的小窍门：</p>
                    </li>
                </ul>
            </div>
            <p class="clear">
            </p>
            <div class="pages">
                <a href="">上一页</a> <a href="">1</a> <span>2</span> <a href="">3</a> <a href="">4</a>
                <a href="">5</a> <a href="">6</a> <a href="">7</a> <a href="">8</a> <a href="">9</a>
                <a href="">10</a> <a href="">下一页</a>
            </div>
        </div>
        <div class="food_right" id="right">
            <!--热门推荐-->
            <UC:CookBookRecommend ID="recommend" runat="server" />
            <p>
                <img src="/!images/kiwi_pic3.jpg" alt="更多推荐" /></p>
            <div class="food_rlist">
                <ul>
                    <li>
                        <p class="kiwi_rtitle">
                            <a href="">保卫新鲜蓝莓大作战</a></p>
                        <p>
                            葡萄品种之多灿若繁星，因地区不同而品种各异：有籽的、无籽的，红色、紫色、青色及金黄色不等......</p>
                    </li>
                    <li>
                        <p class="kiwi_rtitle">
                            <a href="">保卫新鲜蓝莓大作战</a></p>
                        <p>
                            葡萄品种之多灿若繁星，因地区不同而品种各异：有籽的、无籽的，红色、紫色、青色及金黄色不等......</p>
                    </li>
                    <li>
                        <p class="kiwi_rtitle">
                            <a href="">保卫新鲜蓝莓大作战</a></p>
                        <p>
                            葡萄品种之多灿若繁星，因地区不同而品种各异：有籽的、无籽的，红色、紫色、青色及金黄色不等......</p>
                    </li>
                </ul>
                <p class="food_more">
                    <a href="">更多>></a></p>
            </div>
        </div>
    </div>
</asp:Content>
