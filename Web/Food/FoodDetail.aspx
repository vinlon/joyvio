<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="FoodDetail.aspx.cs" Inherits="Web.Food.FoodDetail" %>

<%@ Register TagPrefix="UC" TagName="CookBookRecommend" Src="~/Food/UC_CookBookRecommend.ascx" %>
<%@ Register TagPrefix="UC" TagName="FoodNewsRecommend" Src="~/Food/UC_FoodNewsRecommend.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>
        <%=info.GetPropertyOrDefault(i=>i.Title )%>_
        <%=nav.GetPropertyOrDefault(n=>n.NavName) %>-佳沃官方网站s</title>
    <link href="/!css/style.css" rel="Stylesheet" type="text/css" />
    <link href="/!css/food.css" rel="Stylesheet" type="text/css" />
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
                <!--面包屑-->
                <%=WriteNavigationBar(nav) %>
                > <span>
                    <%=info.Title.SubStr(30,"...") %></span></p>
            </p>
            <p class="clear">
            </p>
        </div>
        <%
            } %>
        <p class="clear">
        </p>
        <%if (info != null)
          { 
        %>
        <div class="food_left">
            <div class="kiwi_title">
                <%=info.Title %>
            </div>
            <div class="food_info">
                <%if (info.Source != "")
                  {
                %>
                <p class="food_source">
                    <%=info.Source %></p>
                <p class="food_line">
                    |</p>
                <%
                    }%>
                <!--作者-->
                <%if (info.Author != "")
                  { 
                %>
                <p class="food_source">
                    <%=info.Author %></p>
                <p class="food_line">
                    |</p>
                <%
                    } %>
                <%if (info.ReferenceUrl != "")
                  { 
                %>
                <p class="food_source">
                    <a target="_blank" href="<%=info.ReferenceUrl %>">源文链接</a></p>
                <p class="food_line">
                    |</p>
                <%
                    } %>
                <div class="share">
                    <!-- JiaThis Button BEGIN -->
                    <div id="ckepop">
                        <span class="jiathis_txt">分享到：</span> <a class="jiathis_button_qzone"></a><a class="jiathis_button_douban">
                        </a><a class="jiathis_button_renren"></a><a class="jiathis_button_tqq"></a><a class="jiathis_button_tsina">
                        </a>
                    </div>
                    <script type="text/javascript" src="http://v2.jiathis.com/code/jia.js" charset="utf-8"></script>
                    <!-- JiaThis Button END -->
                </div>
            </div>
            <p class="t_center" style="margin-bottom: 10px;">
                <%var attach = info.Attachments.Where(a => a.State == (int)EnumHelper.State.Enable).ToList().ElementAtOrDefault(0); %>
                <%if (attach != null)
                  { 
                %>
                <img src="<%= Common.CMS_URL+attach.SourceUrl %>" width="480" height="300" alt="" />
                <p style="line-height: 30px; text-align: center;">
                    <%=attach.Description%>
                </p>
                <%
                    } %>
            </p>
            <p class="clear">
            </p>
            <div class="food_infobar">
                <%=info.Content %>
            </div>
            <div class="article">
                <%if (nav != null)
                  { 
                %>
                <%if (prev != null)
                  { 
                %>
                <p>
                    上一篇：<a href="FoodDetail.aspx?infoid=<%=prev.InfoId %>&navid=<%=nav.NavId.ToString() %>"
                        title="<%=prev.Title %>"><%=prev.Title.SubStr(45,"...") %></a></p>
                <%
                    } %>
                <%if (next != null)
                  { 
                %>
                <p>
                    下一篇：<a href="FoodDetail.aspx?infoid=<%=next.InfoId %>&navid=<%=nav.NavId.ToString() %>"
                        title="<%=next.Title %>"><%=next.Title.SubStr(45,"...") %></a></p>
                <%
                    } %>
                <p class="return_list">
                    <a href="<%=Common.GetNavigationUrl(nav)%>">返回<%=nav.NavName %></a></p>
                <%
                    } %>
            </div>
        </div>
        <%
            } %>
        <div class="food_right">
            <!--热门推荐-->
            <UC:CookBookRecommend ID="recommend" runat="server" />
            <!--更多推荐-->
            <UC:FoodNewsRecommend ID="foodNews" runat="server" />
        </div>
    </div>
</asp:Content>
