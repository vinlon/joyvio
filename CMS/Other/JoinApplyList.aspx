<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="JoinApplyList.aspx.cs" Inherits="CMS.Other.JoinApplyList" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/!js/colorbox/jquery.colorbox.js" type="text/javascript"></script>
    <link href="/!js/colorbox/colorbox.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            //查看详细
            $('.colorbox').colorbox({
                iframe: true,
                width: 600,
                height: 650
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        <!--标题-->
        合作加盟
    </div>
    <div class="list_title">
        <!--说明-->
        合作加盟申请列表
    </div>
    <table border="0" cellpadding="0" cellspacing="1" class="list_table" width="98%">
        <tr>
            <th>
                公司名称
            </th>
            <th>
                联系人
            </th>
            <th>
                申请时间
            </th>
            <th>
                查看
            </th>
            <th>
                管理
            </th>
        </tr>
        <asp:Repeater ID="repMain" runat="server">
            <ItemTemplate>
                <tr>
                    <td>
                        <%#(Container.DataItem as JoinApply).CompanyName %>
                    </td>
                    <td>
                        <%#(Container.DataItem as JoinApply).LinkMan %>
                    </td>
                    <td>
                        <%#(Container.DataItem as JoinApply).ApplyTime.ToString(Common.DATETIME_FORMAT_FULL)%>
                    </td>
                    <td>
                        <a class="colorbox" href="JoinApplyDetail.aspx?applyid=<%#(Container.DataItem as JoinApply).ApplyId %>">
                            查看</a>
                    </td>
                    <td class="command">
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    <div class="pager">
        <webdiyer:AspNetPager ID="AspNetPager1" runat="server" FirstPageText="首页" LastPageText="尾页"
            NextPageText="下一页" PrevPageText="上一页" PageSize="15" Font-Size="12px" ShowInputBox="Always"
            AlwaysShow="true" OnPageChanged="AspNetPager1_PageChanged" UrlPaging="true" CustomInfoHTML="共%PageCount%页，当前为第%CurrentPageIndex%页，每页%PageSize%条"
            ShowCustomInfoSection="Right">
        </webdiyer:AspNetPager>
    </div>
</asp:Content>
