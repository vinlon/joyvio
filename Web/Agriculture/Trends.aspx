<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="Trends.aspx.cs" Inherits="Web.Agriculture.Trends" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register TagPrefix="UC" TagName="AgricultureNews" Src="~/Agriculture/UC_AgricultureNews.ascx" %>
<%@ Register TagPrefix="UC" TagName="IdeaItems" Src="~/Agriculture/UC_IdeaItems.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>产业链动态-佳沃官方网站</title>
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
                > <a href="/Agriculture/Index.aspx">现代农业</a> > <span>产业链动态</span></p>
            <p class="clear">
            </p>
        </div>
        <p class="clear">
        </p>
        <%if (nav != null)
          { 
        %>
        <div class="companybar">
            <div class="about_left">
                <p>
                    <img src="/!images/agriculture_pic6.jpg" alt="产业链动态" /></p>
                <p class="idea_title">
                    产业链动态 ·
                    <%=nav.NavName %></p>
                <div class="idea_list">
                    <ul>
                        <li class="list_header">
                            <p class="list_title">
                                标题</p>
                            <p class="source">
                                文章出处</p>
                            <p class="list_time">
                                更新时间</p>
                        </li>
                        <asp:Repeater runat="server" ID="repMain">
                            <ItemTemplate>
                                <li>
                                    <p class="list_title">
                                        <a href="/News/ReportDetail.aspx?infoid=<%#(Container.DataItem as Information).InfoId %>&navid=<%#nav.NavId %>"
                                            title="<%#(Container.DataItem as Information).Title%>">
                                            <%#(Container.DataItem as Information).Title.SubStr(42,"...") %></a></p>
                                    <p class="source">
                                        <%#(Container.DataItem as Information).Source%></p>
                                    <p class="list_time">
                                        <%#(Container.DataItem as Information).PublishTime.ToString("yyyy-MM-dd") %></p>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
                <p class="clear">
                </p>
                <div class="pages agrmar">
                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" NextPageText="下一页" PrevPageText="上一页"
                        FirstPageText="首页" LastPageText="末页" ShowPageIndexBox="Never" PageSize="5" OnPageChanged="AspNetPager1_PageChanged"
                        PagingButtonSpacing="0px" UrlPageIndexName="page" UrlPaging="true" ShowBoxThreshold="30"
                        PagingButtonLayoutType="Span" CurrentPageButtonClass="page_on" AlwaysShow="true">
                    </webdiyer:AspNetPager>
                </div>
            </div>
            <div class="about_right">
                <UC:AgricultureNews ID="sideNews" isIndex="false" runat="server" />
                <p class="clear">
                </p>
                <p class="sc_rtitle agrmar">
                    现代农业理念 相关文章</p>
                <div class="modage modagebg">
                    <ul>
                        <UC:IdeaItems ID="idea" runat="server" ItemCount="4" TitleLength="24" />
                    </ul>
                    <p class="t_right">
                        <a href="/Agriculture/AgricultureIdea.aspx">更多>></a></p>
                </div>
            </div>
            <p class="clear">
            </p>
        </div>
        <%
            } %>
    </div>
</asp:Content>
