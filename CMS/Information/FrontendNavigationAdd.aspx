<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="FrontendNavigationAdd.aspx.cs" Inherits="CMS.Information.FrontendNavigationAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        前台栏目编辑
    </div>
    <div class="list_title">
        填写前台栏目信息
    </div>
    <div class="info">
        <p>
            <span class="info_left">父栏目：</span>
            <asp:Label Text="" runat="server" ID="lbParent" />
        </p>
        <p>
            <span class="info_left">栏目名称：</span><asp:TextBox runat="server" ID="txtNavName" class="txt_medium" />
        </p>
        <p>
            <span class="info_left">页面路径：</span><asp:TextBox runat="server" ID="txtUrl" class="txt_long" />
        </p>
        <p>
            <span class="info_left">栏目类型：</span>
            <asp:DropDownList ID="ddlType" runat="server">
            </asp:DropDownList>
        </p>
        <p>
            <span class="info_left">栏目描述：</span><asp:TextBox runat="server" ID="txtDescription"
                TextMode="MultiLine" class="txt_area" />
        </p>
        <p>
            <span class="info_left">&nbsp;</span>
            <asp:Button Text="确定" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
        </p>
    </div>
</asp:Content>
