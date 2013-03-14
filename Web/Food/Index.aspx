<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="Index.aspx.cs" Inherits="Web.Food.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>美味食谱-佳沃官方网站</title>
    <link href="/!css/style.css" rel="Stylesheet" type="text/css" />
    <link href="/!css/food.css" rel="Stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <div class="pagenavi">
            <p class="home">
                <a href="/Index.aspx">
                    <img src="/!images/icon_home.jpg" alt="首页" /></a>
            </p>
            <p class="fl">
                > <a href="/Food/Recipe.aspx">美食生活</a> > <span>美味食谱</span></p>
            <p class="clear">
            </p>
        </div>
        <p class="clear">
        </p>
        <div class="food_left">
            <p>
                <img src="/!images/food_pic1.jpg" alt="美味食谱" /></p>
            <asp:Repeater runat="server" ID="repMain">
                <ItemTemplate>
                    <p class="foot_title title_bg<%#Container.ItemIndex+1 %>">
                        <%#(Container.DataItem as FrontendNavigation).NavName %></p>
                    <div class="fl">
                        <p>
                            <img src="/!images/food_pic3.jpg" alt="<%#(Container.DataItem as FrontendNavigation).NavName %>" /></p>
                        <div class="food_linfo">
                            <p class="info_title info_title1">
                                趣味轻食</p>
                            <ul class="food_list food_list1">
                                <li><a href="">煎鱼配猕猴桃酱汁</a></li>
                                <li><a href="">猕猴桃炒饭</a></li>
                                <li><a href="">猕猴桃牛排土豆沙拉</a></li>
                                <li><a href="">猕猴桃甜酒雪梨酥皮点心</a></li>
                            </ul>
                            <p class="food_more">
                                <a href="/Food/KiwiCooked.aspx">更多>></a></p>
                        </div>
                    </div>
                    <div class="fr">
                        <p>
                            <img src="/!images/food_pic4.jpg" alt="蓝莓" /></p>
                        <div class="food_rinfo">
                            <p class="info_title info_title1">
                                营养熟食</p>
                            <ul class="food_list food_list1">
                                <li><a href="">白金巧喀猕猴桃菠莲塔</a></li>
                                <li><a href="">猕猴桃布丁</a></li>
                                <li><a href="">猕猴桃柠檬棒冰</a></li>
                                <li><a href="">糖醋橘子藕片</a></li>
                            </ul>
                            <p class="food_more">
                                <a href="/Food/KiwiCooked.aspx">更多>></a></p>
                        </div>
                    </div>
                    <p class="clear">
                    </p>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="food_right">
            <p>
                <img src="/!images/food_pic2.jpg" alt="时尚潮流" /></p>
            <div class="food_rlist">
                <ul>
                    <li>
                        <p class="food_pic">
                            <a href="">
                                <img src="/!images/food_listpic1.jpg" /></a>
                        </p>
                        <div class="rlist_info">
                            <p class="rlist_title">
                                <a href="">经营葡萄的保健功效</a></p>
                            <p>
                                葡萄品种之多灿若繁星，因地区不同而品种各异：有籽的、无籽的......</p>
                        </div>
                        <p class="clear">
                        </p>
                    </li>
                    <li>
                        <p class="food_pic">
                            <a href="">
                                <img src="/!images/food_listpic2.jpg" /></a></p>
                        <div class="rlist_info">
                            <p class="rlist_title">
                                <a href="">美味最榴莲</a></p>
                            <p>
                                葡萄品种之多灿若繁星，因地区不同而品种各异：有籽的、无籽的......</p>
                        </div>
                        <p class="clear">
                        </p>
                    </li>
                    <li>
                        <p class="food_pic">
                            <a href="">
                                <img src="/!images/food_listpic3.jpg" /></a></p>
                        <div class="rlist_info">
                            <p class="rlist_title">
                                <a href="">猕猴桃，窈窕OL的开心果</a></p>
                            <p>
                                葡萄品种之多灿若繁星，因地区不同而品种各异：有籽的、无籽的......</p>
                        </div>
                        <p class="clear">
                        </p>
                    </li>
                </ul>
                <p class="food_more">
                    <a href="/Food/FoodTrend.aspx">更多>></a></p>
            </div>
            <p>
                <img src="/!images/food_pic9.jpg" alt="健康安全" /></p>
            <div class="food_rlist">
                <ul>
                    <li>
                        <p class="food_pic">
                            <a href="">
                                <img src="/!images/food_listpic4.jpg" /></a></p>
                        <div class="rlist_info">
                            <p class="rlist_title">
                                <a href="">保卫新鲜蓝莓大作战</a></p>
                            <p>
                                葡萄品种之多灿若繁星，因地区不同而品种各异：有籽的、无籽的......</p>
                        </div>
                        <p class="clear">
                        </p>
                    </li>
                    <li>
                        <p class="food_pic">
                            <a href="">
                                <img src="/!images/food_listpic5.jpg" /></a></p>
                        <div class="rlist_info">
                            <p class="rlist_title">
                                <a href="">车厘子tips全面普及</a></p>
                            <p>
                                葡萄品种之多灿若繁星，因地区不同而品种各异：有籽的、无籽的......</p>
                        </div>
                        <p class="clear">
                        </p>
                    </li>
                    <li>
                        <p class="food_pic">
                            <a href="">
                                <img src="/!images/food_listpic6.jpg" /></a></p>
                        <div class="rlist_info">
                            <p class="rlist_title">
                                <a href="">食品质量与安全标志那些事儿</a></p>
                            <p>
                                葡萄品种之多灿若繁星，因地区不同而品种各异：有籽的、无籽的......</p>
                        </div>
                        <p class="clear">
                        </p>
                    </li>
                </ul>
                <p class="food_more">
                    <a href="/Food/HealthSafety.aspx">更多>></a></p>
            </div>
        </div>
        <p class="clear">
        </p>
    </div>
</asp:Content>
