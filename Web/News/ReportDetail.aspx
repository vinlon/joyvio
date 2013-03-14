<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="ReportDetail.aspx.cs" Inherits="Web.News.ReportDetail" %>

<%@ Register TagPrefix="UC" TagName="Recommend" Src="~/News/UC_Recommend.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>
        <%=info.GetPropertyOrDefault(i => i.Title, "信息未找到") + "-"%><%=nav.GetPropertyOrDefault(n=>n.NavName,"栏目未找到") %>-佳沃官方网站
    </title>
    <link href="/!css/style.css" rel="Stylesheet" type="text/css" />
    <link href="/!css/news.css" rel="Stylesheet" type="text/css" />
    <!--MyFocus-->
    <script src="/!js/myFocus2.0.4/myfocus-2.0.4.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        //设置
        myFocus.set({
            id: 'myFocus', //ID
            pattern: 'mF_pithy_tb'//风格
        });

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
        <%if (info != null)
          { 
        %>
        <div class="pagenavi">
            <%if (nav != null)
              { 
            %>
            <p class="home">
                <a href="/Index.aspx">
                    <img src="/!images/icon_home.jpg" alt="首页" /></a>
            </p>
            <p class="fl">
                <!--面包屑-->
                <%=WriteNavigationBar(nav) %>
                > <span>
                    <%=info.Title.SubStr(50,"...") %></span></p>
            <%
                } %>
            <p class="clear">
            </p>
        </div>
        <p class="clear">
        </p>
        <div class="newsdetail_left" id="left">
            <p class="title">
                <%=info.Title %></p>
            <div class="news_timebar">
                <!--媒体名称（信息来源）-->
                <%if (info.Source != "")
                  { 
                %>
                <p class="news_mtname">
                    <%=info.Source %></p>
                <p class="news_line">
                    |</p>
                <%
                    } %>
                <!--作者-->
                <%if (info.Author != "")
                  { 
                %>
                <p class="news_mtname">
                    <%=info.Author %></p>
                <p class="news_line">
                    |</p>
                <%
                    } %>
                <!--原文链接-->
                <%if (info.ReferenceUrl != "")
                  { 
                %>
                <p class="category">
                    <a href="<%=info.ReferenceUrl %>" target="_blank">原文链接</a>
                </p>
                <p class="news_line">
                    |</p>
                <%
                    } %>
                <!--资源下载-->
                <%if (!string.IsNullOrEmpty(info.ResourcePath))
                  { 
                %>
                <p class="fl" title="<%=System.IO.Path.GetFileName(info.ResourcePath) %>">
                    <asp:LinkButton ID="LinkButton1" Text="PDF下载" runat="server" OnClick="ResourceDownload" />
                    <%-- <a target="_blank" href="<%=Common.CMS_URL+info.ResourcePath %>">PDF下载</a>--%>
                </p>
                <p class="news_line">
                    |</p>
                <%
                    } %>
                <p class="news_time">
                    <%=info.PublishTime.ToString("yyyy-MM-dd") %>
                </p>
                <p class="news_line">
                    |</p>
                <div class="share">
                    <div id="ckepop">
                        <span class="jiathis_txt">分享到：</span> <a class="jiathis_button_tqq"></a><a class="jiathis_button_tsina">
                        </a>
                    </div>
                    <script type="text/javascript" src="http://v2.jiathis.com/code/jia.js" charset="utf-8"></script>
                </div>
                <p class="clear">
                </p>
            </div>
            <!--焦点图-->
            <%var attachlist = info.Attachments.Where(a => a.State == (int)EnumHelper.State.Enable).OrderBy(a => a.SortIndex).ToList(); %>
            <%if (attachlist.Count != 0)
              { 
            %>
            <div class="news_picbar">
                <%if (attachlist.Count == 1)
                  { 
                %>
                <img src="<%= Common.CMS_URL+attachlist[0].SourceUrl %>" width="480" height="300"
                    alt="" />
                <p style="line-height: 30px;">
                    <%=attachlist[0].Description %>
                </p>
                <%
                    }
                  else if (attachlist.Count > 1)
                  {
                %>
                <div id="myFocus" style="width: 480px; height: 300px;">
                    <!--焦点图盒子-->
                    <div class="loading">
                    </div>
                    <!--载入画面(可删除)-->
                    <div class="pic">
                        <!--图片列表-->
                        <ul>
                            <%foreach (var attach in attachlist)
                              {
                            %>
                            <li><a href="#<%=attachlist.IndexOf(attach)+1 %>">
                                <img style="width: 480px; height: 300px;" src="<%=Common.CMS_URL+attach.SourceUrl %>"
                                    thumb="<%=Common.CMS_URL+service.GetThumbPath(attach.SourceUrl) %>" alt="<%=attach.Description %>"
                                    text="<%=attach.Description %>" /></a></li>
                            <%
                                } %>
                        </ul>
                    </div>
                </div>
                <%
                    } %>
            </div>
            <%
                } %>
            <p class="clear">
            </p>
            <div class="s_info news_martop">
                <%=info.Content %>
                <%if (info.ResourcePath != "")
                  { 
                %>
                <p>
                    了解更多文章内容，<asp:LinkButton ID="LinkButton2" Text="点击下载PDF" runat="server" OnClick="ResourceDownload" />
                </p>
                <%
                    } %>
            </div>
            <div class="article">
                <%if (nav != null)
                  { 
                %>
                <%if (prev != null)
                  { 
                %>
                <p>
                    上一篇：<a href="ReportDetail.aspx?infoid=<%=prev.InfoId %>&navid=<%=nav.NavId.ToString() %>"
                        title="<%=prev.Title %>"><%=prev.Title.SubStr(45,"...") %></a></p>
                <%
                    } %>
                <%if (next != null)
                  { 
                %>
                <p>
                    下一篇：<a href="ReportDetail.aspx?infoid=<%=next.InfoId %>&navid=<%=nav.NavId.ToString() %>"
                        title="<%=next.Title %>"><%=next.Title.SubStr(45,"...") %></a></p>
                <%
                    } %>
                <p class="return_list">
                    <a href="<%=Common.GetNavigationUrl(nav)%>">返回<%=nav.NavName %></a></p>
                <%
                    } %>
            </div>
        </div>
        <UC:Recommend ID="newsRecommend" runat="server" />
        <%
            } %>
        <p class="clear">
        </p>
    </div>
</asp:Content>
