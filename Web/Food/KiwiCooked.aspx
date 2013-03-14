<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="KiwiCooked.aspx.cs" Inherits="Web.Food.KiwiCooked" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>营养熟食（猕猴桃）-佳沃官方网站</title>
    <link href="/!css/style.css" rel="Stylesheet" type="text/css" />
    <link href="/!css/food.css" rel="Stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <%if (nav != null)
          { 
        %>
        <%if (parent != null)
          { 
        %>
        <div class="pagenavi">
            <p class="home">
                <a href="/Index.aspx">
                    <img src="/!images/icon_home.jpg" alt="首页" /></a>
            </p>
            <p class="fl">
                > <a href="/Food/Recipe.aspx">美食生活</a> > <a href="/Food/Recipe.aspx">美味食谱</a> >
                <span>
                    <%=nav.NavName %>（<%=parent.NavName %>）</span></p>
            <p class="clear">
            </p>
        </div>
        <p class="kiwi_title">
            <%=parent.NavName %><%=nav.NavName %></p>
        <%
            } %>
        <p class="clear">
        </p>
        <div class="kiwi_list">
            <ul>
                <asp:Repeater runat="server" ID="repMain">
                    <ItemTemplate>
                        <li <%#(Container.ItemIndex+1)%4==0?"class='fourli'":"" %>>
                            <p>
                                <a href="/Food/KiwiDetail.aspx?cbid=<%#(Container.DataItem as CookBook).CookBookId %>">
                                    <img src="<%#Common.CMS_URL+ (Container.DataItem as CookBook).ImageUrl %>" alt="<%#(Container.DataItem as CookBook).CookBookName %>"
                                        width="268" height="268" /></a></p>
                            <div class="kiwi_info">
                                <div class="list_title">
                                    <p class="fl">
                                        <%#(Container.DataItem as CookBook).CookBookName %></p>
                                    <p class="icon_kiwi">
                                        <img src="/!images/icon_kiwi.gif" /></p>
                                    <p class="clear">
                                    </p>
                                </div>
                                <p class="list_info" title="<%#(Container.DataItem as CookBook).Summary%>">
                                    <%#(Container.DataItem as CookBook).Summary.SubStr(35,"...")%></p>
                                <p class="readall">
                                    <a href="/Food/KiwiDetail.aspx?cbid=<%#(Container.DataItem as CookBook).CookBookId %>">
                                        阅读全文...</a></p>
                            </div>
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
        <%
            } %>
    </div>
    <p class="clear">
    </p>
</asp:Content>
