<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="UserAdd.aspx.cs" Inherits="CMS.User.UserAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        //权限选择
        $(function () {
            var target = $('[id$=hfRoleList]');
            var rolelist = $('input[name=role]');

            var idlist = target.val().split(',');
            for (var i = 0; i < idlist.length; i++) {
                $('input[value=' + idlist[i] + ']').attr('checked', 'checked');
            }

            rolelist.click(function () {
                var idlist = '';
                rolelist.each(function () {
                    if ($(this).attr('checked')) {
                        idlist += $(this).val() + ',';
                    }
                });
                if (idlist.length != 0) {
                    idlist = idlist.substr(0, idlist.length - 1);
                }
                target.val(idlist);
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        用户编辑
    </div>
    <div class="list_title">
        帐户信息
        <asp:Label Text="" ID="lbMessage" class="error" runat="server" />
    </div>
    <div class="info">
        <p>
            <span class="info_left">用户名：</span><asp:TextBox runat="server" ID="txtUserName" class="txt_medium" />
        </p>
        <%if (uid == "")
          {
        %>
        <p>
            <span class="info_left">密码：</span><asp:TextBox runat="server" ID="txtPassword" class="txt_medium" />
        </p>
        <p>
            <span class="info_left">确认密码：</span>
            <asp:TextBox runat="server" ID="txtPasswordConfirm" class="txt_medium" />
        </p>
        <%
            } %>
        <p>
            <span class="info_left">选择角色：</span>
            <asp:HiddenField ID="hfRoleList" Value="" runat="server" />
            <asp:Repeater runat="server" ID="repRole">
                <ItemTemplate>
                    <input type="checkbox" name="role" value="<%#(Container.DataItem as RoleInfo).RoleInfoId %>" /><%#(Container.DataItem as RoleInfo).RoleName %>
                </ItemTemplate>
            </asp:Repeater>
        </p>
        <p>
            <span class="info_left">&nbsp;</span>
            <asp:Button Text="确定" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
        </p>
    </div>
</asp:Content>
