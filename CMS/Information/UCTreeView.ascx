<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCTreeView.ascx.cs"
    Inherits="CMS.Information.UCTreeView" %>
<div>
    <asp:TreeView ID="tvMain" runat="server" ImageSet="Arrows">
        <HoverNodeStyle Font-Underline="False" ForeColor="#5555DD" />
        <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" />
        <ParentNodeStyle Font-Bold="False" />
    </asp:TreeView>
</div>
