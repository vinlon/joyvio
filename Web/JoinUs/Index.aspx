<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="Index.aspx.cs" Inherits="Web.JoinUs.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>加入我们-佳沃官方网站</title>
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
                > <span>加入我们</span></p>
            <p class="clear">
            </p>
        </div>
        <p class="clear">
        </p>
        <div class="companybar">
            <div class="about_left">
                <p>
                    <img src="/!images/joinus_pic1.jpg" alt="加入我们" /></p>
                <div class="joinus_info">
                    <div class="about_title">
                        人才招聘<span class="join_more"><a href="/JoinUs/HR.aspx">更多>></a></span></div>
                    <p>
                        佳沃是一个没有天花板的舞台！我们选择认同佳沃企业文化的员工，我们关注员工的成长和发展，以工作业绩作为评价人才的基本标准。</p>
                    <p>
                        佳沃是一个实现梦想的基地！我们将个人的梦想与企业愿景结合在一起，在追求企业愿景的过程中实现个人梦想。</p>
                    <div class="postlist">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <th class="postname">
                                    职位
                                </th>
                                <th class="department">
                                    部门
                                </th>
                                <th class="addr">
                                    工作地点
                                </th>
                                <th class="lastth">
                                    发布日期
                                </th>
                            </tr>
                            <asp:Repeater runat="server" ID="repMain">
                                <ItemTemplate>
                                    <tr class="item">
                                        <td class="postname">
                                            <a href="/JoinUs/HRDetail.aspx?rid=<%#(Container.DataItem as Recruitment).RecruitId %>">
                                                <%#(Container.DataItem as Recruitment).Position%></a>
                                        </td>
                                        <td class="department">
                                            <%#(Container.DataItem as Recruitment).Department%>
                                        </td>
                                        <td class="addr">
                                            <%#(Container.DataItem as Recruitment).WorkPlace%>
                                        </td>
                                        <td class="lasttd">
                                            <%#(Container.DataItem as Recruitment).PublishTime.ToString("yyyy-MM-dd")%>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </div>
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
                    佳沃有限公司竭诚欢迎具有共同经营理念， 从事水果销售及运营的相关企业合作加盟共同开拓事业，致力于为消费者提供安全、高品质的制品和食品，推动中国现代农业发展。</p>
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
    </div>
</asp:Content>
