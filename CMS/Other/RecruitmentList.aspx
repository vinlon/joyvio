<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="RecruitmentList.aspx.cs" Inherits="CMS.Other.RecruitmentList" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        <!--标题-->
        职位列表
    </div>
    <div class="list_title">
        <!--说明-->
        职位列表 <a class="button_add" href="RecruitmentAdd.aspx">添加职位</a>
    </div>
    <table border="0" cellpadding="0" cellspacing="1" class="list_table" width="98%">
        <tr>
            <th>
                职位名称
            </th>
            <th>
                工作部门
            </th>
            <th>
                工作地点
            </th>
            <th>
                发布时间
            </th>
            <th>
                编辑
            </th>
            <th>
                管理
            </th>
        </tr>
        <asp:Repeater ID="repMain" runat="server">
            <ItemTemplate>
                <tr>
                    <td>
                        <%#(Container.DataItem as Recruitment).Position %>
                    </td>
                    <td>
                        <%#(Container.DataItem as Recruitment).Department%>
                    </td>
                    <td>
                        <%#(Container.DataItem as Recruitment).WorkPlace%>
                    </td>
                    <td>
                        <%#(Container.DataItem as Recruitment).PublishTime.ToString(Common.DATETIME_FORMAT_SHORT)%>
                    </td>
                    <td>
                        <a href="RecruitmentAdd.aspx?rid=<%#(Container.DataItem as Recruitment).RecruitId%>">
                            <img alt="编辑" src="/!images/icon_edit.png" title="点击编辑" />
                        </a>
                    </td>
                    <td class="command">
                        <!--JS调用在default.js中-->
                        <!--参数-->
                        <input name="entity_state" type="hidden" value="<%#(Container.DataItem as Recruitment).State%>" />
                        <input name="command_url" type="hidden" value="/handler/command/RecruitmentCommand.ashx" />
                        <input name="command_argument" type="hidden" value="<%#(Container.DataItem as Recruitment).RecruitId%>" />
                        <!--修改状态-->
                        <a href="javascript:void()" name="disable">
                            <img alt="禁用" src="/!images/icon_enable.png" title="点击禁用" /></a> <a href="javascript:void()"
                                name="enable">
                                <img alt="启用" src="/!images/icon_disable.png" title="点击启用" /></a>
                        <!--删除-->
                        <a href="javascript:void()" name="delete">
                            <img alt="删除" src="/!images/icon_delete.png" title="点击删除" />
                        </a>
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
