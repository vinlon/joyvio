<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="AttachmentAddMedia.aspx.cs" Inherits="CMS.Information.AttachmentAddMedia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        添加视频/音频
    </div>
    <div class="list_title">
        上传视频/音频
        <%if (infoid == "")
          { 
        %>
        <label class="error">
            未指定任何信息</label>
        <%
            } %>
    </div>
    <div class="info">
        <p>
            <span class="info_left">描述：</span>
            <asp:TextBox runat="server" ID="txtDesctiption" class="txt_area" TextMode="MultiLine" />
        </p>
        <p>
            <span class="info_left">时长：</span><asp:TextBox runat="server" ID="txtDuration" class="txt_small" />秒
        </p>
        <p>
            <span class="info_left">选择文件：</span>
        </p>
    </div>
</asp:Content>
