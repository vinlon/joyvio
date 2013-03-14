<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="LogList.aspx.cs" Inherits="CMS.User.LogList" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        <!--标题-->
        操作日志
    </div>
    <div class="list_title">
        <!--说明-->
        搜索：
    </div>
    <table border="0" cellpadding="0" cellspacing="1" class="list_table" width="98%">
        <tr>
            <th>
                用户
            </th>
            <th>
                目标
            </th>
            <th>
                操作
            </th>
            <th>
                查看
            </th>
            <th>
                IP地址
            </th>
            <th>
                发生时间
            </th>
        </tr>
        <asp:Repeater ID="repMain" runat="server">
            <ItemTemplate>
                <tr>
                    <td>
                        <%#(Container.DataItem as Log).User %>
                    </td>
                    <td>
                        <%#(Container.DataItem as Log).Target.Split('_')[0] %>
                    </td>
                    <td>
                        <%# EnumHelper.GetEnumDesc(typeof(LogType),(Container.DataItem as Log).Type) %>
                    </td>
                    <td>
                        <a href="LogDetail.aspx?logid=<%#(Container.DataItem as Log).LogId%>">查看 </a>
                    </td>
                    <td>
                        <%#(Container.DataItem as Log).IpAddress%>
                    </td>
                    <td>
                        <%#(Container.DataItem as Log).CreateTime.ToString(Common.DATETIME_FORMAT_FULL)%>
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
