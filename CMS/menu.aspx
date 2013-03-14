<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="CMS.menu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Left Menu</title>
    <link href="/!css/frame.css" rel="stylesheet" type="text/css" />
    <script src="/!js/jquery-1.7.1.js" type="text/javascript"></script>
    <script src="/!js/default.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            var index = Cookies.get('p_menuIndex') == "" ? 0 : Cookies.get('p_menuIndex');

            $('#menu .menu_panel').hide().eq(index).slideDown();

            var menu_title = $('#menu .menu_title');
            menu_title.each(function (i) {
                $(this).click(function () {
                    if (i != index) {
                        menu_title.eq(index).next('.menu_panel').slideUp();
                        $(this).next('.menu_panel').slideDown();
                        index = i;
                        Cookies.set('p_menuIndex', index);
                    }
                    return false;
                });
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%" height="280" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEF2FB">
        <tr>
            <td width="182" valign="top">
                <div id="menu">
                    <asp:Repeater runat="server" ID="repMain">
                        <ItemTemplate>
                            <h1 class="menu_title">
                                <a href="">
                                    <%#(Container.DataItem as Navigation).NavigationName %></a></h1>
                            <div class="menu_panel">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <img src="/!images/menu_topline.gif" width="182" height="5" alt="" />
                                        </td>
                                    </tr>
                                </table>
                                <ul class="menu_item">
                                    <asp:Repeater runat="server" DataSource="<%#GetChild(Container.DataItem as Navigation)%>">
                                        <ItemTemplate>
                                            <li><a href="<%#(Container.DataItem as Navigation).Url%>" target="main">
                                                <%#(Container.DataItem as Navigation).NavigationName %></a></li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <h1 class="menu_title">
                        <a href="">信息分类添加</a></h1>
                    <div class="menu_panel">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="/!images/menu_topline.gif" width="182" height="5" alt="" />
                                </td>
                            </tr>
                        </table>
                        <ul class="menu_item">
                            <asp:Repeater ID="repInfoNav" runat="server">
                                <ItemTemplate>
                                    <li><a href="<%#(Container.DataItem as FrontendNavigation).State==0?"javascript:void(0)":"/Information/InformationAdd.aspx?navid="+(Container.DataItem as FrontendNavigation).NavId%>"
                                        target="main"><span <%#(Container.DataItem as FrontendNavigation).State==0?"class='bold'":""%>>
                                            <%#(Container.DataItem as FrontendNavigation).NavName%></span> </a></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
