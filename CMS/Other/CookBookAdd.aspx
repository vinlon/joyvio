<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="CookBookAdd.aspx.cs" Inherits="CMS.Other.CookBookAdd" %>

<%@ Register TagPrefix="UC" TagName="TreeView" Src="~/Information/UCTreeView.ascx" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        添加食谱
    </div>
    <div class="list_title">
        请输入你要添加的内容
        <asp:Label Text="" ID="lbMessage" runat="server" class="error" />
    </div>
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="info_table">
        <tr>
            <td class="info_left">
                食谱名称<span class="required">*</span>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtName" class="txt_long" />
            </td>
        </tr>
        <tr>
            <td class="info_left">
                概述<span class="required">*</span>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtSummary" class="txt_area" TextMode="MultiLine" />
            </td>
        </tr>
        <tr>
            <td class="info_left">
                &nbsp;
            </td>
            <td>
                <asp:CheckBox Text="是否推荐" runat="server" ID="ckbRecommend" /><span class="required">*</span>
            </td>
        </tr>
        <tr>
            <td class="info_left">
                来源
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtSource" class="txt_medium" />
                路径:<asp:TextBox runat="server" ID="txtReferenceUrl" class="txt_long" />（以http://
                开头）
            </td>
        </tr>
        <tr>
            <td class="info_left">
                材料<span class="required">*</span>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtMaterial" class="txt_area" TextMode="MultiLine" />
            </td>
        </tr>
        <tr>
            <td class="info_left">
                功效<span class="required">*</span>
            </td>
            <td>
                <CKEditor:CKEditorControl ID="txtBenifits" BasePath="/!js/ckeditor" ContentsCss="/!js/ckeditor/contents.css"
                    Height="120px" runat="server"></CKEditor:CKEditorControl>
            </td>
        </tr>
        <tr>
            <td class="info_left">
                做法<span class="required">*</span>
            </td>
            <td>
                <CKEditor:CKEditorControl ID="txtPractice" BasePath="/!js/ckeditor" ContentsCss="/!js/ckeditor/contents.css"
                    Height="120px" runat="server"></CKEditor:CKEditorControl>
            </td>
        </tr>
        <tr>
            <td class="info_left">
                小诀窍
            </td>
            <td>
                <CKEditor:CKEditorControl ID="txtTips" BasePath="/!js/ckeditor" ContentsCss="/!js/ckeditor/contents.css"
                    Height="120px" runat="server"></CKEditor:CKEditorControl>
            </td>
        </tr>
        <tr>
            <td class="info_left">
                所属栏目
            </td>
            <td>
                <UC:TreeView ID="treeNav" runat="server" Width="400" />
            </td>
        </tr>
        <tr>
            <td class="info_left">
                &nbsp;
            </td>
            <td>
                <asp:Button Text="确定" runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
