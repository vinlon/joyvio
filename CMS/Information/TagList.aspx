<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="TagList.aspx.cs" Inherits="CMS.Information.TagList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/!css/info.css" rel="stylesheet" type="text/css" />
    <script src="/!js/sortedtree.js" type="text/javascript"></script>
    <!--sortable-->
    <script src="/!js/jquery_ui/jquery.ui.core.js" type="text/javascript"></script>
    <script src="/!js/jquery_ui/jquery.ui.widget.js" type="text/javascript"></script>
    <script src="/!js/jquery_ui/jquery.ui.mouse.js" type="text/javascript"></script>
    <script src="/!js/jquery_ui/jquery.ui.sortable.js" type="text/javascript"></script>
    <!--sortable-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        <!--标题-->
        标签管理
    </div>
    <div class="list_title">
        <!--说明-->
        标签列表 <a class="button_add" href="TagAdd.aspx">添加新标签</a>
    </div>
    <div class="front_nav">
        <!--sort_url-->
        <input type="hidden" id="sort_url" value="<%=sort_url%>" />
        <%=getTagListHtml() %>
    </div>
</asp:Content>
