<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="TagInformationRela.aspx.cs" Inherits="CMS.Information.TagInformationRela" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--sortable-->
    <script src="/!js/jquery_ui/jquery.ui.core.js" type="text/javascript"></script>
    <script src="/!js/jquery_ui/jquery.ui.widget.js" type="text/javascript"></script>
    <script src="/!js/jquery_ui/jquery.ui.mouse.js" type="text/javascript"></script>
    <script src="/!js/jquery_ui/jquery.ui.sortable.js" type="text/javascript"></script>
    <!--sortable-->
    <script type="text/javascript">
        $(function () {
            $('#sorted').sortable(
            {
                stop: function (event, ui) {
                    var hf_oldorder = $('[id$=hfOldOrder]');
                    var old_order = hf_oldorder.val();
                    var node = ui.item;
                    var children = $(node).parent().children(".ui-state-default");
                    var sortedid = [];
                    for (var i = 0; i < children.length; i++) {
                        sortedid.push($(children[i]).attr("id"));
                    }
                    var new_order = sortedid.join(',');
                    if (old_order != new_order) {
                        $.ajax(
                        {
                            url: "/handler/sort/taginformationsort.ashx",
                            type: "POST",
                            data: { 'new_order': new_order, 'old_order': old_order, 'tagid': '<%=tid %>' },
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
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        <!--标题-->
        标签管理
    </div>
    <div class="list_title">
        <!--说明-->
        添加信息
        <asp:Label Text="" ID="lbMessage" class="error" runat="server" />
    </div>
    <div class="info">
        <p>
            <span class="info_left">标签名称：</span><asp:Label ID="lbTagName" Text="" runat="server" />
        </p>
        <p>
            <span class="info_left">文章标题：</span>
            <asp:TextBox runat="server" ID="txtInfoTitle" class="txt_long"></asp:TextBox>
        </p>
        <p>
            <span class="info_left">&nbsp;</span><asp:Button Text="添加" runat="server" OnClick="AttachInformation" />
        </p>
    </div>
    <div class="list_title">
        <!--说明-->
        关联信息列表
    </div>
    <table border="0" cellpadding="0" cellspacing="1" class="list_table" width="100%">
        <tr class="ui-state-disabled">
            <th>
                标题
            </th>
            <th>
                编辑
            </th>
            <th>
                移除
            </th>
        </tr>
        <tbody id="sorted">
            <asp:HiddenField ID="hfOldOrder" runat="server" Value="" />
            <asp:Repeater ID="repMain" runat="server" OnItemCommand="repMain_ItemCommand">
                <ItemTemplate>
                    <tr class="ui-state-default" id="<%#(Container.DataItem as Information).InfoId %>">
                        <td class="t_alignleft">
                            <%#(Container.DataItem as Information).Title %>
                        </td>
                        <td>
                            <a href="InformationList.aspx?title=<%#(Container.DataItem as Information).Title %>">
                                <img alt="编辑" src="/!images/icon_edit.png" title="点击编辑" />
                            </a>
                        </td>
                        <td>
                            <asp:LinkButton ID="lbtnRemove" runat="server" CommandName="remove" CommandArgument="<%#(Container.DataItem as Information).InfoId %>"
                                OnClientClick="return confirm('确认移除该条信息吗？')">
                            <img alt="删除" src="/!images/icon_delete.png" title="点击删除" />
                            </asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>
</asp:Content>
