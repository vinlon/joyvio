<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="Affiliate.aspx.cs" Inherits="Web.JoinUs.Affiliate" %>

<%@ Register TagPrefix="UC" TagName="Recommend" Src="~/News/UC_Recommend.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>合作加盟-佳沃官方网站</title>
    <link href="/!css/style.css" rel="Stylesheet" type="text/css" />
    <link href="/!css/about.css" rel="Stylesheet" type="text/css" />
    <link href="/!css/news.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
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
        <div class="pagenavi">
            <p class="home">
                <a href="/Index.aspx">
                    <img src="/!images/icon_home.jpg" alt="首页" /></a>
            </p>
            <p class="fl">
                > <a href="/JoinUs/Index.aspx">加入我们</a> > <span>合作加盟</span></p>
            <p class="clear">
            </p>
        </div>
        <p class="clear">
        </p>
        <div class="companybar">
            <div class="about_left" id="left">
                <p class="fl">
                    <img src="/!images/joinus_pic3.jpg" alt="" /></p>
                <div class="affiliate_txt">
                    <p>
                        作为联想控股成员企业，佳沃有限公司在全球化经营、产业整合、企业管理、品牌营销等方面拥有独特优势，佳沃有限公司竭诚欢迎凭持相同经营理念，从事企业化水果种植，以及水果深加工、销售、区域拓展、大客户团购等全产业链相关领域业务的企业合作加盟，共同携手拓展业务，为消费者提供安全、高品质的农产品和食品，推动中国现代农业的发展。</p>
                    <p class="contact_txt">
                        <span class="bold">联系我们：</span><a href="mailto:hezuojiameng@joyvio.com.cn">hezuojiameng@joyvio.com.cn</a></p>
                </div>
                <p class="clear">
                </p>
                <p class="table_title">
                    佳沃有限公司合作加盟信息表 <asp:Label ID="lbMessage" Text="" runat="server" Style="color: Red; font-size:15px;" /></p>
                <div class="table_bar">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                公司名称
                            </td>
                            <td>
                                <asp:TextBox ID="txtCompanyName" CssClass="input_text1" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                公司地址
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddress" CssClass="input_text1" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                联系电话
                            </td>
                            <td>
                                <asp:TextBox ID="txtPhone" CssClass="input_text2" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                联络人
                            </td>
                            <td>
                                <asp:TextBox ID="txtLinkman" CssClass="input_text2" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                邮件地址
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmail" CssClass="input_text1" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                公司类型
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlCompanyType" runat="server" class="select_txt">
                                    <asp:ListItem Text="==请选择公司类型==" Value="" />
                                    <asp:ListItem Text="规模化水果种植" Value="规模化水果种植" />
                                    <asp:ListItem Text="合作社" Value="合作社" />
                                    <asp:ListItem Text="个体" Value="个体" />
                                </asp:DropDownList>
                            </td>
                            <td>
                                种植品种
                            </td>
                            <td>
                                <asp:TextBox ID="txtPlantingSpecies" CssClass="input_text2" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                种植区域
                            </td>
                            <td>
                                <asp:TextBox ID="txtPlantingRegion" CssClass="input_text2" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                供应季节
                            </td>
                            <td>
                                <asp:TextBox ID="txtSupplySeason" CssClass="input_text2" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                注册资金
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlRegisteredFund" runat="server" class="select_txt">
                                    <asp:ListItem Text="==请选择注册资金==" Value="" />
                                    <asp:ListItem Text="10W～50W" Value="10W～50W" />
                                    <asp:ListItem Text="50W~200W" Value="50W~200W" />
                                    <asp:ListItem Text="200W～1000W" Value="200W～1000W" />
                                    <asp:ListItem Text="1000W以上" Value="1000W以上" />
                                </asp:DropDownList>
                            </td>
                            <td>
                                合作意向
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlIntention" runat="server" class="select_txt">
                                    <asp:ListItem Text="==请选择合作意向==" Value="" />
                                    <asp:ListItem Text="销售代理" Value="销售代理" />
                                    <asp:ListItem Text="原料购买" Value="原料购买" />
                                    <asp:ListItem Text="合作基地" Value="合作基地" />
                                    <asp:ListItem Text="基地转让" Value="基地转让" />
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                种植时间
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlDuration" runat="server" class="select_txt">
                                    <asp:ListItem Text="==请选择种植时间==" Value="" />
                                    <asp:ListItem Text="1年～3年" Value="1年～3年" />
                                    <asp:ListItem Text="3年～5年" Value="3年～5年" />
                                    <asp:ListItem Text="5年～10年" Value="5年～10年" />
                                    <asp:ListItem Text="10年以上" Value="10年以上" />
                                </asp:DropDownList>
                            </td>
                            <td class="txt_pad">
                                现有年产量
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlCurrentAnnualOutput" runat="server" class="select_txt">
                                    <asp:ListItem Text="==请选择现有年产量==" Value="" />
                                    <asp:ListItem Text="100吨以下" Value="100吨以下" />
                                    <asp:ListItem Text="100吨-500吨" Value="100吨-500吨" />
                                    <asp:ListItem Text="500吨-1000吨" Value="500吨-1000吨" />
                                    <asp:ListItem Text="1000吨-2000吨" Value="1000吨-2000吨" />
                                    <asp:ListItem Text="2000吨-5000吨" Value="2000吨-5000吨" />
                                    <asp:ListItem Text="5000吨-1万吨" Value="5000吨-1万吨" />
                                    <asp:ListItem Text="1万吨以上" Value="1万吨以上" />
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="txt_pad">
                                丰产年产量
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlBestAnnualOutput" runat="server" class="select_txt">
                                    <asp:ListItem Text="==请选择丰产年产量==" Value="" />
                                    <asp:ListItem Text="100吨以下" Value="100吨以下" />
                                    <asp:ListItem Text="100吨-500吨" Value="100吨-500吨" />
                                    <asp:ListItem Text="500吨-1000吨" Value="500吨-1000吨" />
                                    <asp:ListItem Text="1000吨-2000吨" Value="1000吨-2000吨" />
                                    <asp:ListItem Text="2000吨-5000吨" Value="2000吨-5000吨" />
                                    <asp:ListItem Text="5000吨-1万吨" Value="5000吨-1万吨" />
                                    <asp:ListItem Text="1万吨以上" Value="1万吨以上" />
                                </asp:DropDownList>
                            </td>
                            <td class="txt_pad">
                                年销售收入
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlAnnualIncome" runat="server" class="select_txt">
                                    <asp:ListItem Text="==请选择年销售收入==" Value="" />
                                    <asp:ListItem Text="50W～200W/年" Value="50W～200W/年" />
                                    <asp:ListItem Text="200W～1000W/年" Value="200W～1000W/年" />
                                    <asp:ListItem Text="1000W～5000W/年" Value="1000W～5000W/年" />
                                    <asp:ListItem Text="5000W/年以上" Value="5000W/年以上" />
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                种植面积
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlPlantingArea" runat="server" class="select_txt">
                                    <asp:ListItem Text="==请选择种植面积==" Value="" />
                                    <asp:ListItem Text="100亩以下" Value="100亩以下" />
                                    <asp:ListItem Text="100亩-500亩" Value="100亩-500亩" />
                                    <asp:ListItem Text="500亩-2000亩" Value="500亩-2000亩" />
                                    <asp:ListItem Text="2000亩-1万亩" Value="2000亩-1万亩" />
                                    <asp:ListItem Text="1万亩以上" Value="1万亩以上" />
                                </asp:DropDownList>
                            </td>
                            <td>
                                仓储能力
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlStorageCapicity" runat="server" class="select_txt">
                                    <asp:ListItem Text="==请选择仓储能力==" Value="" />
                                    <asp:ListItem Text="10吨～50吨" Value="10吨～50吨" />
                                    <asp:ListItem Text="50吨～200吨" Value="50吨～200吨" />
                                    <asp:ListItem Text="200吨～1000吨" Value="200吨～1000吨" />
                                    <asp:ListItem Text="1000吨-5000吨" Value="1000吨-5000吨" />
                                    <asp:ListItem Text="5000吨以上" Value="5000吨以上" />
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                备注信息
                            </td>
                            <td colspan="3">
                                <textarea id="txtRemark" class="textarea_bg" runat="server"></textarea>
                            </td>
                        </tr>
                    </table>
                    <p class="btnsubmit">
                        <asp:LinkButton ID="btnSubmit" runat="server" OnClick="SubmitApply">
                            <img src="/!images/btn_submit.jpg" alt="提交" /></asp:LinkButton></p>
                </div>
            </div>
            <UC:Recommend ID="recommend" runat="server" />
            <p class="clear">
            </p>
        </div>
    </div>
</asp:Content>
