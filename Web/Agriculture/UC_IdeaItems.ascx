<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_IdeaItems.ascx.cs"
    Inherits="Web.Agriculture.UC_IdeaItems" %>
<asp:Repeater runat="server" ID="repMain">
    <ItemTemplate>
        <li><a href="/News/ReportDetail.aspx?infoid=<%#(Container.DataItem as Information).InfoId %>&navid=<%#Common.AGRICLUTURE_IDEA_ID %>"
            title="<%#(Container.DataItem as Information).Title%>">
            <%#(Container.DataItem as Information).Title.SubStr(TitleLength,"...") %></a></li>
    </ItemTemplate>
</asp:Repeater>
