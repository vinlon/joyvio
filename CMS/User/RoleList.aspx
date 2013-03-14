<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="RoleList.aspx.cs" Inherits="CMS.User.RoleList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        角色列表
    </div>
    <asp:Panel ID="panelSiteManager" runat="server" Visible="false">
        <div class="list_title">
            站点管理员角色
        </div>
        <div class="info">
            <p>
                <span class="info_left">说明：</span>开发时，需要为客户创建专门的【站点管理员角色】以及相应的用户，而不是直接将系统管理员帐户交给客户使用;
            </p>
            <p>
                <span class="info_left">&nbsp;</span>而【站点管理员角色】所拥有的权限即为最后分配给客户使用的权限;
            </p>
            <p>
                <span class="info_left">&nbsp;</span> <a href="/User/RoleAdd.aspx">添加一个站点管理员角色</a>
            </p>
        </div>
    </asp:Panel>
    <asp:Panel ID="panelRoleList" runat="server">
        <div class="list_title">
            角色列表 <a class="button_add" href="/User/RoleAdd.aspx">添加角色</a>
        </div>
        <table width="100%" border="0" cellspacing="1" cellpadding="0" class="list_table">
            <tr>
                <th>
                    角色名
                </th>
                <th>
                    描述
                </th>
                <th>
                    添加时间
                </th>
                <th>
                    编辑
                </th>
                <th>
                    管理
                </th>
            </tr>
            <asp:Repeater runat="server" ID="repMain">
                <ItemTemplate>
                    <tr>
                        <td <%#(Container.DataItem as RoleInfo).RoleType==(int)RoleType.SiteManager?"class='success'":"" %>>
                            <%#(Container.DataItem as RoleInfo).RoleName%>
                        </td>
                        <td>
                            <%#(Container.DataItem as RoleInfo).Description%>
                        </td>
                        <td>
                            <%#(Container.DataItem as RoleInfo).CreateTime.ToString(Common.DATETIME_FORMAT_SHORT) %>
                        </td>
                        <td>
                            <a href="RoleAdd.aspx?rid=<%#(Container.DataItem as RoleInfo).RoleInfoId %>">
                                <img src="/!images/icon_edit.png" title="点击编辑" alt="编辑" />
                            </a>
                        </td>
                        <td class="command">
                            <!--JS调用在default.js中-->
                            <!--参数-->
                            <input name="entity_state" type="hidden" value="<%#(Container.DataItem as RoleInfo).State %>" />
                            <input name="command_url" type="hidden" value="/handler/command/RoleInfoCommand.ashx" />
                            <input name="command_argument" type="hidden" value="<%#(Container.DataItem as RoleInfo).RoleInfoId %>" />
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
    </asp:Panel>
</asp:Content>
