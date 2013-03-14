<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="HR.aspx.cs" Inherits="Web.JoinUs.HR" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>人才招聘-佳沃官方网站</title>
    <link href="/!css/style.css" rel="Stylesheet" type="text/css" />
    <link href="/!css/about.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        //左右两侧等高
        var left_div = "left";
        var right_div = "right";
        function change(id1, id2) {
            var con1 = document.getElementById(id1);
            var con2 = document.getElementById(id2);
            if (con1.offsetHeight < con2.offsetHeight) {
                con1.style.height = con2.offsetHeight - 114 + "px";
            }
            else {
                con2.style.height = con1.offsetHeight + "px";
            }
        }
        $(function () {
            change(left_div, right_div);

            $('.postlist tr.item').hover(function () {
                $(this).toggleClass('hover');
            });

        });


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
                > <a href="/JoinUs/Index.aspx">加入我们</a> > <span>人才招聘</span></p>
            <p class="clear">
            </p>
        </div>
        <p class="clear">
        </p>
        <div class="companybar">
            <div class="about_left">
                <div class="hr_list" id="left">
                    <p class="about_title">
                        人才招聘</p>
                    <div class="postlist">
                        <div class="post_table">
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
                        <div class="pages">
                            <webdiyer:AspNetPager ID="AspNetPager1" runat="server" NextPageText="下一页" PrevPageText="上一页"
                                FirstPageText="首页" LastPageText="末页" ShowPageIndexBox="Never" PageSize="5" OnPageChanged="AspNetPager1_PageChanged"
                                PagingButtonSpacing="0px" UrlPageIndexName="page" UrlPaging="true" ShowBoxThreshold="30"
                                PagingButtonLayoutType="Span" CurrentPageButtonClass="page_on" AlwaysShow="true">
                            </webdiyer:AspNetPager>
                        </div>
                    </div>
                </div>
                <p class="join_addr">
                    <span class="bold">联系地址：</span>北京市海淀区彩和坊路6号朔黄发展大厦6层（100080） 佳沃有限公司 人力资源部<br />
                    <span class="bold">招聘邮箱：</span><a href="mailto:recruitment@joyvio.com.cn">recruitment@joyvio.com.cn</a></p>
            </div>
            <div class="about_right" id="right">
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
    </div>
</asp:Content>
