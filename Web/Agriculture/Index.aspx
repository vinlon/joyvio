<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="Index.aspx.cs" Inherits="Web.Agriculture.Index" %>

<%@ Register TagPrefix="UC" TagName="AgricultureNews" Src="~/Agriculture/UC_AgricultureNews.ascx" %>
<%@ Register TagPrefix="UC" TagName="IdeaItems" Src="~/Agriculture/UC_IdeaItems.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>现代农业-佳沃官方网站</title>
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
                > <span>现代农业</span></p>
            <p class="clear">
            </p>
        </div>
        <p class="clear">
        </p>
        <div class="companybar">
            <div class="about_left">
                <p>
                    <img src="/!images/agriculture_pic1.jpg" alt="现代农业" /></p>
                <div class="aidea_bar">
                    <div class="aidea_title">
                        现代农业理念</div>
                    <p>
                        关于现代农业的理念，业界从不同角度有各种理解和定义，在佳沃看来：现代农业是借鉴现代产业（工业和服务业）的理念和知识来改造农业的生产和经营活动。</p>
                    <p>
                        它主要有四个特点：生产单元规模化、作业标准化、技术管理集约化和营销品牌化。在我国，发展现代农业的关键是要在保证生态友好的前提下，提高生产效率和产出品质量，节约水等辅助资源消耗，消减自然灾害影响，并提高农民、农业经营者等从业者工作的社会成就感和荣誉感。</p>
                </div>
                <div class="modernabar">
                    <div class="modernaleft">
                        <p>
                            <img src="/!images/agriculture_pic2.jpg" alt="" /></p>
                        <div class="modernalbg">
                            <p class="modernatitle">
                                现代农业</p>
                            <ul class="moderna_info">
                                <li><span class="bold">品种</span>改良（杂交技术和基因技术）</li>
                                <li>科学化、标准化<span class="bold">作业</span></li>
                                <li>专业化、社会化<span class="bold">分工</span></li>
                                <li>规模化、集约化的<span class="bold">生存经营组织</span></li>
                                <li>品牌化<span class="bold">销售和消费</span>（突破地域限制）</li>
                            </ul>
                        </div>
                    </div>
                    <div class="modernaright">
                        <p>
                            <img src="/!images/agriculture_pic3.jpg" alt="" /></p>
                        <div class="modernarbg">
                            <p class="modernatitle">
                                传统农业</p>
                            <ul class="moderna_info">
                                <li>品种自然演化（纯系品种和自然授粉品种）</li>
                                <li>个性化、原始作业（仅凭直觉经验和简单工具）</li>
                                <li>自然分工（简单、随机）</li>
                                <li>个人/家庭作坊式小生产组织</li>
                                <li>就近销售和消费、品质和供应无组织信誉保证</li>
                            </ul>
                        </div>
                    </div>
                    <p class="clear">
                    </p>
                </div>
                <%if (leftNav != null)
                  {
                %>
                <div class="atrends_bar">
                    <p class="atrends_title">
                        <%=leftNav.NavName %>相关文章</p>
                    <ul class="atrends_list">
                        <UC:IdeaItems ID="IdeaItems1" ItemCount="3" TitleLength="50" runat="server" />
                    </ul>
                    <p class="atrends_more">
                        <a href="<%=Common.GetNavigationUrl(leftNav) %>">更多>></a></p>
                </div>
                <%
                    } %>
            </div>
            <div class="about_right">
                <UC:AgricultureNews ID="indexNews" isIndex="true" runat="server" />
            </div>
            <p class="clear">
            </p>
        </div>
    </div>
</asp:Content>
