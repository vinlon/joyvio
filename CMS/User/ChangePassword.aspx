<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="ChangePassword.aspx.cs" Inherits="CMS.User.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        修改密码
    </div>
    <div class="list_title">
        修改密码：
    </div>
    <div class="info">
        <p>
            <span class="info_left">原密码：</span><asp:TextBox runat="server" ID="txtPsw" />
        </p>
        <p>
            <span class="info_left">新密码：</span><asp:TextBox runat="server" ID="txtNewPsw" />
        </p>
        <p>
            <span class="info_left">确认新密码：</span><asp:TextBox runat="server" ID="txtNewPswConfirm" />
        </p>
        <p>
            <span class="info_left">&nbsp;</span>
            <asp:Button Text="确定" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
        </p>
        <p>
            <span class="info_left"></span>
            <asp:Label Text="" ID="lbMessage" runat="server" class="error" />
        </p>
    </div>
</asp:Content>
