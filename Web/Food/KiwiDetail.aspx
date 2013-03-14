<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="KiwiDetail.aspx.cs" Inherits="Web.Food.KiwiDetail" %>

<%@ Register TagPrefix="UC" TagName="FoodNewsRecommend" Src="~/Food/UC_FoodNewsRecommend.ascx" %>
<%@ Register TagPrefix="UC" TagName="CookBookRecommend" Src="~/Food/UC_CookBookRecommend.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>
        <%=GetNavigationName(cb) %>-佳沃官方网站</title>
    <link href="/!css/style.css" rel="Stylesheet" type="text/css" />
    <link href="/!css/food.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            var favor = $('.favorite');
            favor.find('.fr').click(function () {
                var id = $(this).find('[name=cbid]').val();
                var showNum = favor.find('.mun_love');
                $.ajax(
                {
                    url: '/!helper/cookbookhandler.ashx',
                    data: { 'cbid': id },
                    success: function (response) {
                        showNum.html(response + '+');
                    }
                });
            });
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <%if (cb != null)
          { 
        %>
        <div class="pagenavi">
            <p class="home">
                <a href="/Index.aspx">
                    <img src="/!images/icon_home.jpg" alt="首页" /></a>
            </p>
            <p class="fl">
                > <a href="/Food/Recipe.aspx">美食生活</a> > <a href="/Food/Recipe.aspx">美味食谱</a> >
                <a href="KiwiCooked.aspx?navid=<%=cb.NavigationId %>">
                    <%=GetNavigationName(cb) %></a> > <span>
                        <%=cb.CookBookName %></span>
            </p>
            <p class="clear">
            </p>
        </div>
        <p class="clear">
        </p>
        <div class="food_left">
            <div class="kiwi_title">
                <%=cb.CookBookName %>
                <div class="favorite">
                    <p class="fr" style="cursor: pointer">
                        <input type="hidden" name="cbid" value="<%=cb.CookBookId %>" />
                        <img src="/!images/favorite.jpg" alt="收藏" /></p>
                    <span class="mun_love">
                        <%=cb.LikeCount %>+</span>
                </div>
            </div>
            <div class="food_info">
                <%if (cb.Source != "")
                  { 
                %>
                <p class="food_source">
                    <%=cb.Source%></p>
                <p class="food_line">
                    |</p>
                <%
                    } %>
                <%if (cb.ReferenceUrl != "")
                  { 
                %>
                <p class="food_source">
                    <a target="_blank" href="<%=cb.ReferenceUrl %>">源文链接</a></p>
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
            <p class="fl">
                <img src="<%=Common.CMS_URL+ cb.ImageUrl %>" alt="" width="290px" height="290px" /></p>
            <div class="banner_right">
                <p class="banner_info">
                    <%=cb.Summary %></p>
                <p class="clear">
                </p>
                <div class="kiwi_infobar">
                    <dl>
                        <dt class="firstdt">材料:</dt>
                        <dd>
                            <%=cb.Material %></dd>
                    </dl>
                </div>
            </div>
            <p class="clear">
            </p>
            <div class="kiwi_infobar">
                <dl>
                    <dt>营养功效:</dt>
                    <dd>
                        <%=cb.Benifits %>
                    </dd>
                    <dt>做法:</dt>
                    <dd>
                        <%=cb.Practice %>
                    </dd>
                    <dt>小诀窍:</dt>
                    <dd>
                        <%=cb.Tips %></dd>
                </dl>
            </div>
            <div class="article">
                <%if (prev != null)
                  { 
                %>
                <p>
                    上一篇：<a href="KiwiDetail.aspx?cbid=<%=prev.CookBookId %>" title="<%=prev.CookBookName %>"><%=prev.CookBookName %></a></p>
                <%
                    } %>
                <%if (next != null)
                  { 
                %>
                <p>
                    下一篇：<a href="KiwiDetail.aspx?cbid=<%=next.CookBookId %>" title="<%=next.CookBookName %>"><%=next.CookBookName %></a></p>
                <%
                    } %>
                <p class="return_list">
                    <a href="/Food/KiwiCooked.aspx?navid=<%=cb.NavigationId %>">返回<%=GetNavigationName(cb) %></a></p>
            </div>
        </div>
        <div class="food_right">
            <!--热门推荐-->
            <UC:CookBookRecommend ID="recommend" runat="server" />
            <!--更多推荐-->
            <UC:FoodNewsRecommend ID="foodNews" runat="server" />
            <%
                } %>
        </div>
</asp:Content>
