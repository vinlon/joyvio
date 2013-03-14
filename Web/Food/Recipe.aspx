<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="Recipe.aspx.cs" Inherits="Web.Food.Recipe" %>

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
                            <img src="/!images/food_pic<%#Container.ItemIndex+1 %>_1.jpg" alt="" /></p>
                        <div class="food_linfo">
                            <p class="info_title info_title<%#Container.ItemIndex+1 %>">
                                <%#GetLeftSubNav(Container.DataItem as FrontendNavigation).GetPropertyOrDefault(n=>n.NavName) %>
                            </p>
                            <ul class="food_list food_list<%#Container.ItemIndex+1 %>">
                                <asp:Repeater runat="server" DataSource="<%#GetLeftDataSource(Container.DataItem as FrontendNavigation) %>">
                                    <ItemTemplate>
                                        <li><a href="KiwiDetail.aspx?cbid=<%#(Container.DataItem as CookBook).CookBookId %>">
                                            <%#(Container.DataItem as CookBook).CookBookName %></a></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                            <p class="food_more">
                                <a href="<%#Common.GetNavigationUrl(GetLeftSubNav(Container.DataItem as FrontendNavigation)) %>">
                                    更多>></a></p>
                        </div>
                    </div>
                    <div class="fr">
                        <p>
                            <img src="/!images/food_pic<%#Container.ItemIndex+1 %>_2.jpg" alt="" /></p>
                        <div class="food_rinfo">
                            <p class="info_title info_title<%#Container.ItemIndex+1 %>">
                                <%#GetRightSubNav(Container.DataItem as FrontendNavigation).GetPropertyOrDefault(n=>n.NavName) %></p>
                            <ul class="food_list food_list<%#Container.ItemIndex+1 %>">
                                <asp:Repeater runat="server" DataSource="<%#GetRightDataSource(Container.DataItem as FrontendNavigation) %>">
                                    <ItemTemplate>
                                        <li><a href="KiwiDetail.aspx?cbid=<%#(Container.DataItem as CookBook).CookBookId %>">
                                            <%#(Container.DataItem as CookBook).CookBookName %></a></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                            <p class="food_more">
                                <a href="<%#Common.GetNavigationUrl(GetRightSubNav(Container.DataItem as FrontendNavigation)) %>">
                                    更多>></a></p>
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
                    <asp:Repeater runat="server" ID="repSHCL">
                        <ItemTemplate>
                            <li>
                                <p class="food_pic">
                                    <a href="FoodDetail.aspx?infoid=<%#(Container.DataItem as Information).InfoId %>&navid=<%#CommonHelper.NAVIGATION_FOODTREND_ID %>">
                                        <img src="<%#Common.CMS_URL+ (GetCoverImage(Container.DataItem as Information)) %>" /></a></p>
                                <div class="rlist_info">
                                    <p class="rlist_title">
                                        <a href="FoodDetail.aspx?infoid=<%#(Container.DataItem as Information).InfoId %>&navid=<%#CommonHelper.NAVIGATION_FOODTREND_ID %>"
                                            title="<%#(Container.DataItem as Information).Title%>">
                                            <%#(Container.DataItem as Information).Title.SubStr(12,"...") %></a></p>
                                    <p>
                                        <%#(Container.DataItem as Information).Summary.SubStr(30,"...") %></p>
                                </div>
                                <p class="clear">
                                </p>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <p class="food_more">
                    <a href="/Food/FoodTrend.aspx?navid=<%=CommonHelper.NAVIGATION_FOODTREND_ID %>">更多>></a></p>
            </div>
            <p>
                <img src="/!images/food_pic9.jpg" alt="健康安全" /></p>
            <div class="food_rlist">
                <ul>
                    <asp:Repeater runat="server" ID="repJKAQ">
                        <ItemTemplate>
                            <li>
                                <p class="food_pic">
                                    <a href="FoodDetail.aspx?infoid=<%#(Container.DataItem as Information).InfoId %>&navid=<%#CommonHelper.NAVIGATION_FOODHEALTHY_ID %>">
                                        <img src="<%#Common.CMS_URL+ (GetCoverImage(Container.DataItem as Information)) %>" /></a></p>
                                <div class="rlist_info">
                                    <p class="rlist_title">
                                        <a href="FoodDetail.aspx?infoid=<%#(Container.DataItem as Information).InfoId %>&navid=<%#CommonHelper.NAVIGATION_FOODHEALTHY_ID %>"
                                            title="<%#(Container.DataItem as Information).Title%>">
                                            <%#(Container.DataItem as Information).Title.SubStr(12,"...") %></a></p>
                                    <p>
                                        <%#(Container.DataItem as Information).Summary.SubStr(30,"...") %></p>
                                </div>
                                <p class="clear">
                                </p>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <p class="food_more">
                    <a href="/Food/FoodTrend.aspx?navid=<%=CommonHelper.NAVIGATION_FOODHEALTHY_ID %>">更多>></a></p>
            </div>
        </div>
        <p class="clear">
        </p>
    </div>
</asp:Content>
