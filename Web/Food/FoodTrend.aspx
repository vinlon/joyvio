<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="FoodTrend.aspx.cs" Inherits="Web.Food.FoodTrend" %>

<%@ Register TagPrefix="UC" TagName="CookBookRecommend" Src="~/Food/UC_CookBookRecommend.ascx" %>
<%@ Register TagPrefix="UC" TagName="FoodNewsRecommend" Src="~/Food/UC_FoodNewsRecommend.ascx" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>
        <%=nav.GetPropertyOrDefault(n=>n.NavName) %>-佳沃官方网站</title>
    <link href="/!css/style.css" rel="Stylesheet" type="text/css" />
    <link href="/!css/food.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        //左右两侧等高
        var left_div = "left";
        var right_div = "right";
        function change(id1, id2) {
            var con1 = document.getElementById(id1);
            var con2 = document.getElementById(id2);
            if (con1.offsetHeight < con2.offsetHeight) {
                con1.style.height = con2.offsetHeight - 208 + "px";
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
                > <a href="/Food/Recipe.aspx">美食生活</a> > <span>
                    <%=nav.GetPropertyOrDefault(n=>n.NavName) %></span>
            </p>
            <p class="clear">
            </p>
        </div>
        <p class="clear">
        </p>
        <div class="food_left">
            <p>
                <%if (navid == CommonHelper.NAVIGATION_FOODTREND_ID)
                  { 
                %>
                <img src="/!images/foodtrend_pic.jpg" alt="食尚潮流" /></p>
            <%
                }
                  else
                  {
            %>
            <img src="/!images/healthsafety_pic1.jpg" alt="健康安全" /></p>
            <%
                } %>
            <div class="hs_info" id="left">
                <ul>
                    <asp:Repeater runat="server" ID="repMain">
                        <ItemTemplate>
                            <li>
                                <p class="hs_title">
                                    <a href="/Food/FoodDetail.aspx?infoid=<%#(Container.DataItem as Information).InfoId %>&navid=<%#navid %>"
                                        title="<%#(Container.DataItem as Information).Title %>">
                                        <%#(Container.DataItem as Information).Title %></a></p>
                                <p>
                                    <%#(Container.DataItem as Information).Summary %></p>
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
        <div class="food_right" id="right">
            <!--热门推荐-->
            <UC:CookBookRecommend ID="recommend" runat="server" />
            <!--更多推荐-->
            <UC:FoodNewsRecommend ID="foodNews" runat="server" />
        </div>
    </div>
</asp:Content>
