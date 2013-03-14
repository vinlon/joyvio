<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="TagAdd.aspx.cs" Inherits="CMS.Information.TagAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        标签添加
    </div>
    <div class="list_title">
        输入标签信息
        <asp:Label Text="" ID="lbMessage" class="error" runat="server" />
    </div>
    <div class="info">
        <p>
            <span class="info_left">父标签：</span>
            <asp:Label ID="lbParent" Text="添加顶级标签" runat="server" />
        </p>
        <p>
            <span class="info_left">标签名称：</span>
            <asp:TextBox runat="server" ID="txtTagName" class="txt_medium" />
        </p>
        <p>
            <span class="info_left">标签编码：</span>
            <asp:TextBox runat="server" ID="txtTagCode" class="txt_medium" />
        </p>
        <p>
            <span class="info_left">标签描述：</span>
            <asp:TextBox runat="server" ID="txtDescription" TextMode="MultiLine" class="txt_area" />
        </p>
        <p>
            <span class="info_left"></span>
            <asp:Button Text="确定" runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" />
        </p>
    </div>
</asp:Content>
