<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="RoleAdd.aspx.cs" Inherits="CMS.User.RoleAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/!css/user.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            //父导航选中事件
            $('.p_nav').find('input[type=checkbox]').click(function () {
                var items = $(this).parent().find('.item_nav').find('input[type=checkbox]');
                if ($(this).attr('checked')) {
                    items.attr('checked', 'checked');
                }
                else {
                    items.removeAttr('checked');
                }
            }).each(function () {
                var parent = $(this);
                var children = $(this).parent().find('.item_nav').find('input[type=checkbox]');
                //子导航选中事件
                children.click(function () {
                    //如果是选中操作，则同时选中父导航
                    if ($(this).attr('checked')) {
                        parent.attr('checked', 'checked');
                    }
                    //如果是取消，判断如果仍有选中的子项，则保持父项的选中，否则取消父项的选中
                    else {
                        parent.removeAttr('checked');
                        children.each(function () {
                            if ($(this).attr('checked')) {
                                parent.attr('checked', 'checked');
                            }
                        });
                    }
                });
            });

            //初始化（直接通过ID查找）
            var navlist = $('[id$=hfnavlist]').val().split(',');
            for (var i = 0; i < navlist.length; i++) {
                $('#' + navlist[i]).attr('checked', 'checked');
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        角色编辑
    </div>
    <div class="list_title">
        角色信息
        <asp:Label Text="" ID="lbMessage" runat="server" class="error" />
    </div>
    <div class="info">
        <p>
            <span class="info_left">角色名称：</span><asp:TextBox runat="server" ID="txtRoleName"
                class="txt_medium" />
        </p>
        <p>
            <span class="info_left">角色描述：</span><asp:TextBox runat="server" ID="txtDescription"
                class="txt_area" TextMode="MultiLine" />
        </p>
        <div>
            <span class="info_left">选择权限：</span>
            <!--只用于加载，提交数据时使用POST数据-->
            <asp:HiddenField ID="hfnavlist" runat="server" />
            <ul class="nav_panel">
                <asp:Repeater ID="repMain" runat="server">
                    <ItemTemplate>
                        <li class="p_nav">
                            <input type="checkbox" name="<%#nav_key %>" value="<%# (Container.DataItem as Navigation).NavigationId %>"
                                id="<%# (Container.DataItem as Navigation).NavigationId %>" />
                            <label for="<%# (Container.DataItem as Navigation).NavigationId %>" title="<%# (Container.DataItem as Navigation).Description %>">
                                <%# (Container.DataItem as Navigation).NavigationName %></label>
                            <div class="item_nav">
                                <asp:Repeater runat="server" DataSource="<%#GetChildren(Container.DataItem as Navigation)%>">
                                    <ItemTemplate>
                                        <span class="item_check">
                                            <input type="checkbox" name="<%#nav_key %>" value="<%# (Container.DataItem as Navigation).NavigationId %>"
                                                id="<%# (Container.DataItem as Navigation).NavigationId %>" />
                                            <label for="<%# (Container.DataItem as Navigation).NavigationId %>" title="<%# (Container.DataItem as Navigation).Description %>">
                                                <%# (Container.DataItem as Navigation).NavigationName %></label>
                                        </span>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <p class="clear">
                            </p>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        <p>
            <span class="info_left">&nbsp;</span>
            <asp:Button Text="确定" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
        </p>
    </div>
</asp:Content>
