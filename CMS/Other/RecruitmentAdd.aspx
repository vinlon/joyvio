<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="RecruitmentAdd.aspx.cs" Inherits="CMS.Other.RecruitmentAdd" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--datepicker-->
    <script src="/!js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            //datepicker
            $('[id$=txtPublishTime]').click(function () {
                WdatePicker();
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        招聘信息
    </div>
    <div class="list_title">
        发布职位
    </div>
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="info_table">
        <tr>
            <td class="info_left">
                职位名称<span class="required">*</span>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtPosition" class="txt_long" />
            </td>
        </tr>
        <tr>
            <td class="info_left">
                工作部门<span class="required">*</span>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtDepartment" class="txt_long" />
            </td>
        </tr>
        <tr>
            <td class="info_left">
                工作地点<span class="required">*</span>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtWorkplace" class="txt_medium" />
            </td>
        </tr>
        <tr>
            <td class="info_left">
                发布时间<span class="required">*</span>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtPublishTime" class="txt_medium" />
            </td>
        </tr>
        <tr>
            <td class="info_left">
                工作职责<span class="required">*</span>
            </td>
            <td>
                <CKEditor:CKEditorControl ID="txtDuty" BasePath="/!js/ckeditor" ContentsCss="/!js/ckeditor/contents.css"
                    runat="server"></CKEditor:CKEditorControl>
            </td>
        </tr>
        <tr>
            <td class="info_left">
                任职资格<span class="required">*</span>
            </td>
            <td>
                <CKEditor:CKEditorControl ID="txtRequirement" BasePath="/!js/ckeditor" ContentsCss="/!js/ckeditor/contents.css"
                    runat="server"></CKEditor:CKEditorControl>
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
