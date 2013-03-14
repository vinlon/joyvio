<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="News.aspx.cs" Inherits="Web.News.News" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register TagPrefix="UC" TagName="Recommend" Src="~/News/UC_Recommend.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>公司动态-佳沃官方网站</title>
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
        <%if (nav != null)
          { 
        %>
        <div class="pagenavi">
            <p class="home">
                <a href="/Index.aspx">
                    <img src="/!images/icon_home.jpg" alt="首页" /></a>
            </p>
            <p class="fl">
                > <a href="/News/Index.aspx?navid=<%=nav.ParentId %>">新闻中心</a> > <span>公司动态</span></p>
            <p class="clear">
            </p>
        </div>
        <p class="clear">
        </p>
        <div class="rdetail_left" id="left">
            <p>
                <img src="/!images/news_bannerpic.jpg" alt="公司动态" /></p>
            <div class="list">
                <ul>
                    <li class="liheader">
                        <p class="newslist_title">
                            公司动态
                        </p>
                        <p class="replist_time">
                            时间</p>
                        <p class="clear">
                        </p>
                    </li>
                    <asp:Repeater runat="server" ID="repMain">
                        <ItemTemplate>
                            <li>
                                <p class="replist_title">
                                    <a href="/News/ReportDetail.aspx?infoid=<%#(Container.DataItem as Information).InfoId %>&navid=<%#nav.NavId.ToString() %>"
                                        title="<%#(Container.DataItem as Information).Title %>">
                                        <%#(Container.DataItem as Information).Title.SubStr(42,"...") %></a></p>
                                <p class="replist_time">
                                    <%#(Container.DataItem as Information).PublishTime.ToString("yyyy-MM-dd") %></p>
                                <p class="clear">
                                </p>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
            <p class="clear">
            </p>
            <div class="pages">
                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" NextPageText="下一页" PrevPageText="上一页"
                    FirstPageText="首页" LastPageText="末页" ShowPageIndexBox="Never" PageSize="5" OnPageChanged="AspNetPager1_PageChanged"
                    PagingButtonSpacing="0px" UrlPageIndexName="page" UrlPaging="true" ShowBoxThreshold="30"
                    PagingButtonLayoutType="Span" CurrentPageButtonClass="page_on" AlwaysShow="true">
                </webdiyer:AspNetPager>
            </div>
        </div>
        <UC:Recommend ID="newsRecomend" runat="server" />
        <%
            } %>
        <p class="clear">
        </p>
    </div>
</asp:Content>
