<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="CMS.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        欢迎界面
    </div>
    <div style="width: 50%">
        <div class="info">
            <div class="info_title">
                用户信息
            </div>
            <p>
                上次登录时间：<%=Common.VerifiedUser.LastVisitTime.ToString(Common.DATETIME_FORMAT_SHORT) %>
            </p>
            <p>
                个人信息：<a href="/User/Profile.aspx">修改</a>
            </p>
            <p>
                修改密码：<a href="/User/ChangePassword.aspx">修改</a>
            </p>
        </div>
        <div class="info">
            <div class="info_title">
                系统信息
            </div>
            <p>
                所属角色：
                <%=string.Join(",",Common.VerifiedUser.RoleList.Select(r=>r.RoleName).ToList()) %>
            </p>
        </div>
    </div>
</asp:Content>
