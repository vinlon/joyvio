<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="InformationAdd.aspx.cs" Inherits="CMS.Information.InformationAdd" %>

<%@ Register TagPrefix="UC" TagName="TreeView" Src="~/Information/UCTreeView.ascx" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/!css/info.css" rel="stylesheet" type="text/css" />
    <!--datepicker-->
    <script src="/!js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {

            //datepicker
            $('[id$=txtPublishTime]').click(function () {
                WdatePicker();
            });


            //显示和隐藏所属栏目选择区域
            //$('#selectNav').click(function () {
            //    $('#navPanel')
            //            .attr('position', 'absolute')
            //            .offset({ top: $(this).offset().top + $(this).height(), left: $(this).offset().left + $(this).width() }); ;
            //});
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        信息添加
    </div>
    <div class="list_title">
        请输入你要添加的内容
        <asp:Label Text="" ID="lbMessage" runat="server" class="error" />
    </div>
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="info_table">
        <tr>
            <td class="info_left">
                标题<span class="required">*</span>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtTitle" class="txt_long" />
            </td>
        </tr>
        <tr>
            <td class="info_left">
                副标题
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtSubTitle" class="txt_long" />
            </td>
        </tr>
        <tr>
            <td class="info_left">
                来源
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtSource" class="txt_medium" />
                发布时间<span class="required">*</span>
                <asp:TextBox runat="server" ID="txtPublishTime" class="txt_medium" />
            </td>
        </tr>
        <tr>
            <td class="info_left">
                作者
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtAuthor" class="txt_medium" />
            </td>
        </tr>
        <tr>
            <td class="info_left">
                &nbsp;
            </td>
            <td>
                <asp:CheckBox Text="是否置顶" runat="server" ID="ckbTop" />
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
                正文<span class="required">*</span>
            </td>
            <td>
                <CKEditor:CKEditorControl ID="txtContent" BasePath="/!js/ckeditor" ContentsCss="/!js/ckeditor/contents.css"
                    runat="server"></CKEditor:CKEditorControl>
            </td>
        </tr>
        <tr>
            <td class="info_left">
                关键字
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtKeyword" class="txt_long" />（使用 , 分隔）
            </td>
        </tr>
        <tr>
            <td class="info_left">
                引用路径:
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtReference" class="txt_long" />（以http:// 开头）
            </td>
        </tr>
        <tr>
            <td class="info_left">
                PDF上传:
            </td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Panel runat="server" ID="fileManage" Visible="false">
                    已上传文件：<asp:Label ID="filePath" Text="" runat="server" />
                    <asp:LinkButton Text="删除附件" runat="server" OnClick="DeleteResource" />
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="info_left">
                所属栏目
            </td>
            <td>
                &raquo;<a id="selectNav" href="javascript:void(0)">选择</a>
                <div id="navPanel">
                    <UC:TreeView ID="treeNav" runat="server" Width="400" />
                </div>
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
