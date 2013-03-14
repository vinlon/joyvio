<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="LogDetail.aspx.cs" Inherits="CMS.User.LogDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        <!--标题-->
        日志详细
    </div>
    <div class="list_title">
        <!--说明-->
        日志详细
    </div>
    <table border="0" cellpadding="0" cellspacing="1" class="list_table" width="98%">
        <tr>
            <th>
                字段名
            </th>
            <th>
                字段值
            </th>
        </tr>
        <asp:Repeater runat="server" ID="repMain">
            <ItemTemplate>
                <tr>
                    <td>
                        <%#Eval("key") %>
                    </td>
                    <td>
                        <%#Eval("value") %>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
</asp:Content>
