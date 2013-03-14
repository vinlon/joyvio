<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="HRDetail.aspx.cs" Inherits="Web.JoinUs.HRDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>招聘信息-佳沃官方网站</title>
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
                > <a href="/JoinUs/Index.aspx">加入我们</a> > <a href="/JoinUs/HR.aspx">人才招聘</a> > <span>
                    <%=recruit.GetPropertyOrDefault(r=>r.Position,"找不到该职位") %></span></p>
            <p class="clear">
            </p>
        </div>
        <p class="clear">
        </p>
        <%if (recruit != null)
          { 
        %>
        <div class="companybar">
            <div class="about_left">
                <div class="hr_list hr_infoh">
                    <p class="post_title">
                        职位：<%=recruit.Position %>
                        【部门：<%=recruit.Department %>】</p>
                    <p class="post_stitle">
                        主要工作职责:</p>
                    <ul class="claim_list">
                        <%=recruit.Duty %>
                    </ul>
                    <p class="post_stitle">
                        主要任职资格：</p>
                    <ul class="claim_list">
                        <%=recruit.Requirement %>
                    </ul>
                </div>
                <p class="join_addr">
                    <span class="bold">联系地址：</span>北京市海淀区彩和坊路6号朔黄发展大厦6层（100080） 佳沃有限公司 人力资源部<br />
                    <span class="bold">招聘邮箱：</span><a href="mailto:recruitment@joyvio.com.cn">recruitment@joyvio.com.cn</a></p>
            </div>
            <div class="about_right">
                <p class="join_title">
                    合作加盟<span class="joinus_more"><a href="/JoinUs/Affiliate.aspx">更多>></a></span></p>
                <p>
                    <img src="/!images/joinus_pic2.jpg" alt="合作加盟" /></p>
                <p class="join_txt">
                    佳沃有限公司竭诚欢迎凭持相同经营理念， 具备服务全国连锁商超客户和地方重点商超客户，新鲜水果仓储物流配送的经验和能力的经销商合作伙伴加盟。共同致力于提供安全、高品质的农产品和食品，推动中国现代农业的发展。</p>
                <div class="infortable">
                    <p>
                        《合作加盟信息表》登记加盟公司信息及联系方式</p>
                    <p class="btn_infotab">
                        <a href="/JoinUs/Affiliate.aspx">
                            <img src="/!images/infortable.jpg" alt="合作加盟信息表" /></a></p>
                </div>
            </div>
            <p class="clear">
            </p>
        </div>
        <%
            } %>
    </div>
</asp:Content>
