<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="Sitemap.aspx.cs" Inherits="Web.Sitemap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>网站地图-佳沃官方网站</title>
    <link href="/!css/style.css" rel="Stylesheet" type="text/css" />
    <link href="/!css/about.css" rel="Stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="map_title">
        网站地图</p>
    <div class="map_list">
        <dl>
            <dt><a href="/Index.aspx">首页</a></dt>
        </dl>
        <dl>
            <dt><a href="/Product/Index.aspx">佳沃产品</a></dt>
            <dd>
                <a href="/Product/Index.aspx?skip=0">蓝莓</a></dd>
            <dd>
                <a href="/Product/Index.aspx?skip=1">猕猴桃</a></dd>
            <dd>
                <a href="/Product/Index.aspx?skip=2">其他水果</a></dd>
            <dd>
                <a href="/Product/Index.aspx?skip=3">茶叶</a></dd>
        </dl>
        <asp:Repeater runat="server" ID="repMenu">
            <ItemTemplate>
                <dl>
                    <dt><a href="<%#Common.GetNavigationUrl((Container.DataItem as FrontendNavigation))%>">
                        <%#(Container.DataItem as FrontendNavigation).NavName %></a></dt>
                    <asp:Repeater ID="Repeater2" runat="server" DataSource="<%#GetChildren(Container.DataItem as FrontendNavigation) %>">
                        <ItemTemplate>
                            <dd>
                                <a href="<%#Common.GetNavigationUrl((Container.DataItem as FrontendNavigation))%>">
                                    <%#(Container.DataItem as FrontendNavigation).NavName %></a></dd>
                        </ItemTemplate>
                    </asp:Repeater>
                </dl>
            </ItemTemplate>
        </asp:Repeater>
        <dl class="lastdl">
            <dt><a href="/TraceabilitySystem.aspx">可追溯系统</a></dt>
        </dl>
    </div>
</asp:Content>
