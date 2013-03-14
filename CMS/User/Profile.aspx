<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="Profile.aspx.cs" Inherits="CMS.User.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        个人信息
    </div>
    <div class="list_title">
        完善您的个人信息
    </div>
    <div class="info">
        <p>
            <span class="info_left">真实姓名：</span><asp:TextBox runat="server" ID="txtRealName" />
        </p>
        <p>
            <span class="info_left">电子邮件：</span><asp:TextBox runat="server" ID="txtEmail" />
        </p>
        <p>
            <span class="info_left">&nbsp;</span>
            <asp:Button Text="确定" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
        </p>
    </div>
</asp:Content>
