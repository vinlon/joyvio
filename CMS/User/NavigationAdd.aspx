<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="NavigationAdd.aspx.cs" Inherits="CMS.User.NavigationAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        添加页面访问权限
    </div>
    <div class="list_title">
        权限/导航信息
    </div>
    <div class="info">
        <p>
            <span class="info_left">名称：</span><asp:TextBox runat="server" ID="txtNavName" class="txt_medium" />
        </p>
        <p>
            <span class="info_left">页面路径：</span><asp:TextBox runat="server" ID="txtUrl" class="txt_long" />
        </p>
        <p>
            <span class="info_left">权限说明：</span><asp:TextBox runat="server" ID="txtDesc" class="txt_area"
                TextMode="MultiLine" />
        </p>
        <p>
            <span class="info_left">父权限：</span>
            <asp:DropDownList runat="server" ID="ddlParent">
            </asp:DropDownList>
            <asp:CheckBox Text="将当前权限添加父权限" runat="server" ID="ckbAsParent" />
        </p>
        <p>
            <span class="info_left">&nbsp;</span>
            <img src="/!images/icon_backend.png" alt="" />
            <asp:CheckBox Text="是否作为导航" runat="server" ID="ckbAsMenu" />
        </p>
        <p>
            <span class="info_left">&nbsp;</span>
            <asp:Button Text="确定" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
        </p>
        <p>
            <span class="info_left">&nbsp;</span>
            <asp:Label Text="" ID="lbMessage" runat="server" class="error" />
        </p>
    </div>
</asp:Content>
