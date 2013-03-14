<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="FrontendNavigationList.aspx.cs" Inherits="CMS.Information.FrontendNavigationList" %>

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
        前台栏目
    </div>
    <div class="list_title">
        前台栏目列表 <a href="FrontendNavigationAdd.aspx" class="button_add">添加一级栏目</a>
    </div>
    <div class="front_nav">
        <asp:TreeView ID="treeMain" runat="server" ImageSet="Simple" ShowLines="True" NodeIndent="20">
            <HoverNodeStyle BackColor="#E1E5EE" />
            <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" HorizontalPadding="5px"
                NodeSpacing="0px" VerticalPadding="0px" />
            <ParentNodeStyle Font-Bold="False" />
            <SelectedNodeStyle ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="0px" />
        </asp:TreeView>
    </div>
    <div class="front_nav">
        <!--sort_url-->
        <input type="hidden" id="sort_url" value="<%=sort_url%>" />
        <%=getNavListHtml() %>
    </div>
</asp:Content>
