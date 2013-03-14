<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="NavigationList.aspx.cs" Inherits="CMS.User.NavigationList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--sortable-->
    <script src="/!js/jquery_ui/jquery.ui.core.js" type="text/javascript"></script>
    <script src="/!js/jquery_ui/jquery.ui.widget.js" type="text/javascript"></script>
    <script src="/!js/jquery_ui/jquery.ui.mouse.js" type="text/javascript"></script>
    <script src="/!js/jquery_ui/jquery.ui.sortable.js" type="text/javascript"></script>
    <!--sortable-->
    <script type="text/javascript">
        $(function () {
            //排序
            //父权限排序
            var container = $('#navContainer');
            container.disableSelection();
            container.sortable(
            {
                stop: function (event, ui) {
                    sort(ui.item);
                }
            });
            container.find("tbody").each(function () {
                //子权限排序
                $(this).disableSelection();
                $(this).sortable(
                {
                    stop: function (event, ui) {
                        sort(ui.item);
                    }
                });
            });


            //排序操作异步提交到数据库
            function sort(node) {
                var sortedid = [];
                var hf_oldorder = $(node).parent().find('input[type=hidden]');
                var old_order = hf_oldorder.val();
                var children = $(node).parent().children(".ui-state-default");
                for (var i = 0; i < children.length; i++) {
                    sortedid.push($(children[i]).attr("id"));
                }
                var new_order = sortedid.join(',');

                //如果顺序改变则执行ajax请求
                if (new_order != old_order) {
                    $.ajax(
                        {
                            url: "/handler/sort/navigationsort.ashx",
                            type: "POST",
                            data: { 'new_order': new_order, 'old_order': old_order },
                            success: function (response) {
                                if (response == "1") {
                                    //更新old_order
                                    hf_oldorder.val(new_order);
                                }
                                else {
                                    alert(response);
                                }
                            }
                        });
                }
            }



            //展开/收起
            $('[name=expand]').click(function () {
                $(this).parent().next().toggle();
            });

            //只显示菜单
            $('[name=showMenuOnly]').click(function () {
                $(this).parent().next().find('[name=notmenu]').toggle();
                return false;
            });


        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        导航/权限列表
    </div>
    <div id="navContainer">
        <asp:HiddenField ID="hfParentOrder" runat="server" />
        <asp:Repeater runat="server" ID="repMain" OnItemCommand="repMain_ItemCommand" OnItemDataBound="repMain_ItemDataBound">
            <ItemTemplate>
                <div id="<%#(Container.DataItem as Navigation).NavigationId %>" style="margin-bottom: 20px;
                    border: 1px solid #CCC; padding: 1px;" class="ui-state-default">
                    <div class="list_title" style="cursor: pointer">
                        <%#(Container.DataItem as Navigation).NavigationName %>
                        <a name="expand" href="#">收起/展开</a>
                        <!--显示菜单-->
                        <a name="showMenuOnly" href="#">
                            <img src="/!images/icon_backend.png" alt="" />只显示菜单</a>
                        <!--command-->
                        <asp:LinkButton ID="deleteParent" Text="删除" runat="server" CommandArgument="<%#(Container.DataItem as Navigation).NavigationId %>"
                            CommandName="delete" Visible="false" OnClientClick="return confirm('确认删除该项吗？');" />
                        <!--add-->
                        <a class="button_add" href="/User/NavigationAdd.aspx?pid=<%#(Container.DataItem as Navigation).NavigationId %>">
                            添加新权限</a>
                    </div>
                    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="list_table">
                        <tr class="ui-state-disabled">
                            <th>
                                名称
                            </th>
                            <th>
                                页面路径
                            </th>
                            <th>
                                父权限
                            </th>
                            <th>
                                菜单显示
                            </th>
                            <th>
                                编辑
                            </th>
                            <th>
                                操作
                            </th>
                        </tr>
                        <tbody>
                            <input type="hidden" class="old_order" value="<%#string.Join(",",(Container.DataItem as Navigation).Children.OrderBy(n=>n.SortIndex).Select(n=>n.NavigationId)) %>" />
                            <asp:Repeater runat="server" DataSource="<%#(Container.DataItem as Navigation).Children.OrderBy(n=>n.SortIndex) %>">
                                <ItemTemplate>
                                    <tr id="<%#(Container.DataItem as Navigation).NavigationId %>" title="<%#(Container.DataItem as Navigation).Description%>"
                                        class="ui-state-default" name="<%#(Container.DataItem as Navigation).AsMenu?"":"notmenu"%>">
                                        <td class="t_alignleft">
                                            <%#(Container.DataItem as Navigation).NavigationName%>
                                        </td>
                                        <td class="t_alignleft">
                                            <%#(Container.DataItem as Navigation).Url%>&nbsp;&nbsp; <a href="<%#(Container.DataItem as Navigation).Url%>"
                                                <%#showPreview(Container.DataItem as Navigation)?"":"style='display:none'"%>>
                                                <img src="/!images/icon-to.gif" alt="查看" />
                                            </a>
                                        </td>
                                        <td>
                                            <%#(Container.DataItem as Navigation).Parent.GetPropertyOrDefault(n=>n.NavigationName,"")%>
                                        </td>
                                        <td>
                                            <img name="asMenu" src="/!images/icon_backend.png" alt="YES" <%#(Container.DataItem as Navigation).AsMenu?"":"style='display:none'"%> />
                                        </td>
                                        <td>
                                            <a href="/User/NavigationAdd.aspx?nid=<%#(Container.DataItem as Navigation).NavigationId%>">
                                                <img src="/!images/icon_edit.png" title="点击编辑" alt="编辑" />
                                            </a>
                                        </td>
                                        <td class="command">
                                            <!--JS调用在default.js中-->
                                            <!--参数-->
                                            <input name="entity_state" type="hidden" value="<%#(Container.DataItem as Navigation).State %>" />
                                            <input name="command_url" type="hidden" value="/handler/command/NavigationCommand.ashx" />
                                            <input name="command_argument" type="hidden" value="<%#(Container.DataItem as Navigation).NavigationId %>" />
                                            <!--修改状态-->
                                            <a href="javascript:void()" name="disable">
                                                <img alt="禁用" src="/!images/icon_enable.png" title="点击禁用" /></a> <a href="javascript:void()"
                                                    name="enable">
                                                    <img alt="启用" src="/!images/icon_disable.png" title="点击启用" /></a>
                                            <!--删除-->
                                            <a href="javascript:void()" name="delete">
                                                <img alt="删除" src="/!images/icon_delete.png" title="点击删除" />
                                            </a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
