<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="Index.aspx.cs" Inherits="Web.News.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>新闻中心-佳沃官方网站</title>
    <link href="/!css/style.css" rel="Stylesheet" type="text/css" />
    <link href="/!css/news.css" rel="Stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <%if (nav != null)
          { 
        %><div class="pagenavi">
            <p class="home">
                <a href="/Index.aspx">
                    <img src="/!images/icon_home.jpg" alt="首页" /></a>
            </p>
            <p class="fl">
                > <span>
                    <%=nav.NavName %></span></p>
            <p class="clear">
            </p>
        </div>
        <p class="clear">
        </p>
        <div class="news_left">
            <div class="news_banner">
                <img src="/!images/news_banner.jpg" alt="新闻中心" />
            </div>
            <p class="clear">
            </p>
            <div class="reportbar">
                <!--设置为显示新闻中心下第一个子栏目的内容-->
                <%if (firstChild != null)
                  { %>
                <p class="report_title">
                    <%=firstChild.NavName %>
                    <span class="report_more"><a href="<%=Common.GetNavigationUrl(firstChild)%>">更多>></a></span></p>
                <ul class="report_list">
                    <asp:Repeater runat="server" ID="repLeft">
                        <ItemTemplate>
                            <li>
                                <p class="report_listtitle">
                                    <a href="/News/ReportDetail.aspx?infoid=<%#(Container.DataItem as Information).InfoId%>&navid=<%#firstChild.NavId %>"
                                        title="<%#(Container.DataItem as Information).Title%>">
                                        <%#(Container.DataItem as Information).Title%></a></p>
                                <p class="report_listlb">
                                    <%#(Container.DataItem as Information).Source%></p>
                                <p class="report_listtime">
                                    <%#(Container.DataItem as Information).PublishTime.ToString("yyyy.MM.dd") %>
                                </p>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <%} %>
            </div>
        </div>
        <div class="news_right">
            <!--设置为显示新闻中心下第二个子栏目的内容-->
            <%if (secondChild != null)
              { 
            %>
            <p class="news_title">
                <%=secondChild.NavName %>
                <span class="news_more"><a href="<%=Common.GetNavigationUrl(secondChild)%>">更多>></a></span></p>
            <p>
                <img src="/!images/news_pic1.jpg" alt="" /></p>
            <!--置顶新闻-->
            <%if (joyVio != null)
              { 
            %>
            <div class="new_member">
                <p class="new_mebtitle">
                    <%=joyVio.Title %></p>
                <p>
                    <%=joyVio.Summary %>...</p>
                <p class="t_right">
                    <a href="ReportDetail.aspx?infoid=<%=joyVio.InfoId %>&navid=<%=secondChild.NavId %>">
                        查看更多 >></a></p>
            </div>
            <%
                } %>
            <div class="news_list">
                <ul>
                    <asp:Repeater runat="server" ID="repRight">
                        <ItemTemplate>
                            <li><a href="ReportDetail.aspx?infoid=<%#(Container.DataItem as Information).InfoId%>&navid=<%#secondChild.NavId %>"
                                title="<%#(Container.DataItem as Information).Title%>">
                                <%#(Container.DataItem as Information).Title.SubStr(22,"...")%>
                            </a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <p class="t_right">
                    <a href="<%=Common.GetNavigationUrl(secondChild)%>">更多>></a></p>
            </div>
            <%
                } %>
        </div>
        <%
            } %>
        <p class="clear">
        </p>
    </div>
</asp:Content>
