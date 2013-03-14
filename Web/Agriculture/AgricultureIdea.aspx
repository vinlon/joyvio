<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="AgricultureIdea.aspx.cs" Inherits="Web.Agriculture.AgricultureIdea" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register TagPrefix="UC" TagName="AgricultureNews" Src="~/Agriculture/UC_AgricultureNews.ascx" %>
<%@ Register TagPrefix="UC" TagName="IdeaItems" Src="~/Agriculture/UC_IdeaItems.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>现代农业理念-佳沃官方网站</title>
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
                > <a href="/Agriculture/Index.aspx">现代农业</a> > <span>现代农业理念</span></p>
            <p class="clear">
            </p>
        </div>
        <p class="clear">
        </p>
        <div class="companybar">
            <div class="about_left">
                <p>
                    <img src="/!images/agriculture_pic5.jpg" alt="现代农业理念" /></p>
                <p class="idea_title">
                    现代农业理念</p>
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
                                        <a href="/News/ReportDetail.aspx?infoid=<%#(Container.DataItem as Information).InfoId %>&navid=<%#navid %>"
                                            title="<%#(Container.DataItem as Information).Title%>">
                                            <%#(Container.DataItem as Information).Title.SubStr(42,"...") %></a></p>
                                    <p class="source">
                                        <%#(Container.DataItem as Information).Source %></p>
                                    <p class="list_time">
                                        <%#(Container.DataItem as Information).PublishTime.ToString("yyyy-MM-dd")%></p>
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
                <p class="sc_rtitle">
                    现代农业理念 相关文章</p>
                <ul class="modage agrselected">
                    <UC:IdeaItems ID="idea" runat="server" ItemCount="4" TitleLength="24" />
                </ul>
                <p class="agrmar">
                </p>
                <UC:AgricultureNews ID="sideNews" isIndex="false" runat="server" />
                <p class="clear">
                </p>
            </div>
            <p class="clear">
            </p>
        </div>
    </div>
</asp:Content>
