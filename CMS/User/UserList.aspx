<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="UserList.aspx.cs" Inherits="CMS.User.UserList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        用户列表
    </div>
    <div class="list_title">
        用户列表 <a class="button_add" href="/User/UserAdd.aspx">添加用户</a>
    </div>
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="list_table">
        <tr>
            <th>
                用户名
            </th>
            <th>
                角色
            </th>
            <th>
                真实姓名
            </th>
            <th>
                Email
            </th>
            <th>
                创建时间
            </th>
            <th>
                最后一次登录
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
                    <td>
                        <%#(Container.DataItem as UserInfo).UserName %>
                    </td>
                    <td>
                        <%#string.Join(",",(Container.DataItem as UserInfo).RoleList.Select(r=>r.RoleName).ToList())%>
                    </td>
                    <td>
                        <%#(Container.DataItem as UserInfo).Profile.GetPropertyOrDefault(p=>p.RealName,"未设置")%>
                    </td>
                    <td>
                        <%#(Container.DataItem as UserInfo).Profile.GetPropertyOrDefault(p=>p.Email,"")%>
                    </td>
                    <td>
                        <%#(Container.DataItem as UserInfo).CreateTime.ToString(Common.DATETIME_FORMAT_SHORT) %>
                    </td>
                    <td>
                        <%#(Container.DataItem as UserInfo).LastVisitTime.ToString(Common.DATETIME_FORMAT_FULL)%>
                    </td>
                    <td>
                        <a href="/User/UserAdd.aspx?uid=<%#(Container.DataItem as UserInfo).UserInfoId%>">
                            <img src="/!images/icon_edit.png" title="点击编辑" alt="编辑" />
                        </a>
                    </td>
                    <td class="command">
                        <!--JS调用在default.js中-->
                        <!--参数-->
                        <input name="entity_state" type="hidden" value="<%#(Container.DataItem as UserInfo).State %>" />
                        <input name="command_url" type="hidden" value="/handler/command/UserInfoCommand.ashx" />
                        <input name="command_argument" type="hidden" value="<%#(Container.DataItem as UserInfo).UserInfoId %>" />
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
</asp:Content>
