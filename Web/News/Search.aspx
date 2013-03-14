<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="Search.aspx.cs" Inherits="Web.News.Search" %>

<%@ Register TagPrefix="UC" TagName="Recommend" Src="~/News/UC_Recommend.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>搜素-佳沃官方网站</title>
    <link href="/!css/style.css" rel="Stylesheet" type="text/css" />
    <link href="/!css/news.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        //左右两侧等高
        var left_div = "left";
        var right_div = "right";
        function change(id1, id2) {
            var con1 = document.getElementById(id1);
            var con2 = document.getElementById(id2);
            if (con1.offsetHeight < con2.offsetHeight) {
                con1.style.height = con2.offsetHeight + "px";
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
                > <span>搜素</span></p>
            <p class="clear">
            </p>
        </div>
        <p class="clear">
        </p>
        <div class="rdetail_left" id="left">
            <p class="title">
                搜索结果</p>
            <div class="search_bar">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="search_text"></asp:TextBox><asp:ImageButton
                    ID="Btn_Search" src="/!images/search_btn.jpg" runat="server" />
                <p>
                    与"搜索"相关的4条结果</p>
            </div>
            <ul class="search_list">
                <li>
                    <p class="search_title">
                        <a href="">联想控股投资中国农谷项目签约</a></p>
                    <p>
                        1月19日上午，联想控股佳沃有限公司投资中国农谷项目在钟祥市石牌镇彭墩村签约。在签约仪式上，市政府和屈家岭管理区分别与联想控股佳沃有限公司签订战略合作协议和投资合作协议...</p>
                </li>
                <li>
                    <p class="search_title">
                        <a href="">联想控股投资中国农谷项目签约</a></p>
                    <p>
                        1月19日上午，联想控股佳沃有限公司投资中国农谷项目在钟祥市石牌镇彭墩村签约。在签约仪式上，市政府和屈家岭管理区分别与联想控股佳沃有限公司签订战略合作协议和投资合作协议...</p>
                </li>
                <li>
                    <p class="search_title">
                        <a href="">联想控股投资中国农谷项目签约</a></p>
                    <p>
                        1月19日上午，联想控股佳沃有限公司投资中国农谷项目在钟祥市石牌镇彭墩村签约。在签约仪式上，市政府和屈家岭管理区分别与联想控股佳沃有限公司签订战略合作协议和投资合作协议...</p>
                </li>
                <li>
                    <p class="search_title">
                        <a href="">联想控股投资中国农谷项目签约</a></p>
                    <p>
                        1月19日上午，联想控股佳沃有限公司投资中国农谷项目在钟祥市石牌镇彭墩村签约。在签约仪式上，市政府和屈家岭管理区分别与联想控股佳沃有限公司签订战略合作协议和投资合作协议...</p>
                </li>
                <li>
                    <p class="search_title">
                        <a href="">联想控股投资中国农谷项目签约</a></p>
                    <p>
                        1月19日上午，联想控股佳沃有限公司投资中国农谷项目在钟祥市石牌镇彭墩村签约。在签约仪式上，市政府和屈家岭管理区分别与联想控股佳沃有限公司签订战略合作协议和投资合作协议...</p>
                </li>
                <li>
                    <p class="search_title">
                        <a href="">联想控股投资中国农谷项目签约</a></p>
                    <p>
                        1月19日上午，联想控股佳沃有限公司投资中国农谷项目在钟祥市石牌镇彭墩村签约。在签约仪式上，市政府和屈家岭管理区分别与联想控股佳沃有限公司签订战略合作协议和投资合作协议...</p>
                </li>
                <li>
                    <p class="search_title">
                        <a href="">联想控股投资中国农谷项目签约</a></p>
                    <p>
                        1月19日上午，联想控股佳沃有限公司投资中国农谷项目在钟祥市石牌镇彭墩村签约。在签约仪式上，市政府和屈家岭管理区分别与联想控股佳沃有限公司签订战略合作协议和投资合作协议...</p>
                </li>
                <li>
                    <p class="search_title">
                        <a href="">联想控股投资中国农谷项目签约</a></p>
                    <p>
                        1月19日上午，联想控股佳沃有限公司投资中国农谷项目在钟祥市石牌镇彭墩村签约。在签约仪式上，市政府和屈家岭管理区分别与联想控股佳沃有限公司签订战略合作协议和投资合作协议...</p>
                </li>
                <li>
                    <p class="search_title">
                        <a href="">联想控股投资中国农谷项目签约</a></p>
                    <p>
                        1月19日上午，联想控股佳沃有限公司投资中国农谷项目在钟祥市石牌镇彭墩村签约。在签约仪式上，市政府和屈家岭管理区分别与联想控股佳沃有限公司签订战略合作协议和投资合作协议...</p>
                </li>
                <li>
                    <p class="search_title">
                        <a href="">联想控股投资中国农谷项目签约</a></p>
                    <p>
                        1月19日上午，联想控股佳沃有限公司投资中国农谷项目在钟祥市石牌镇彭墩村签约。在签约仪式上，市政府和屈家岭管理区分别与联想控股佳沃有限公司签订战略合作协议和投资合作协议...</p>
                </li>
            </ul>
            <p class="nosearch_txt">
                对不起！没有您查询的内容！</p>
            <p class="contact_search">
                如果没有搜索到你所需要的， 请<a href="">联系我们</a>提供更多信息。</p>
        </div>
        <UC:Recommend ID="newsRecommend" runat="server" />
        <p class="clear">
        </p>
    </div>
</asp:Content>
