<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="ContactUs.aspx.cs" Inherits="Web.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>联系我们-佳沃官方网站</title>
    <link href="/!css/style.css" rel="Stylesheet" type="text/css" />
    <link href="/!css/about.css" rel="Stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <div class="pagenavi">
            <p class="home">
                <a href="/Index.aspx">
                    <img src="/!images/icon_home.jpg" alt="首页" /></a>
            </p>
            <p class="fl">
                > <span>联系我们</span></p>
            <p class="clear">
            </p>
        </div>
        <p class="clear">
        </p>
        <div class="about_left">
            <p class="map_pic">
                <img src="/!images/map.jpg" alt="地图" /></p>
        </div>
        <div class="about_right">
            <p>
                <img src="/!images/map_pic.jpg" alt="联系我们" /></p>
            <div class="contact_bar">
                <p class="contactus">
                    联系我们</p>
                <p class="company">
                    佳沃有限公司</p>
                <p>
                    北京市海淀区彩和坊路6号朔黄发展大厦6层 邮编 100080<br />
                    电话：+86 10 82175625<br />
                    传真：+86 10 82175683</p>
            </div>
        </div>
    </div>
</asp:Content>
