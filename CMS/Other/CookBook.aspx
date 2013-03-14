<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="CookBook.aspx.cs" Inherits="CMS.Other.CookBook" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        <!--标题-->
        美味食谱
    </div>
    <div class="list_title">
        <!--说明-->
        食谱列表 <a class="button_add" href="CookBookAdd.aspx">添加食谱</a>
    </div>
    <table border="0" cellpadding="0" cellspacing="1" class="list_table" width="98%">
        <tr>
            <th>
                食谱名称
            </th>
            <th>
                所属栏目
            </th>
            <th>
                喜欢人数
            </th>
            <th>
                添加图片
            </th>
            <th>
                预览
            </th>
            <th>
                编辑
            </th>
            <th>
                管理
            </th>
        </tr>
        <asp:Repeater ID="repMain" runat="server">
            <ItemTemplate>
                <tr title="<%#(Container.DataItem as CookBook).Summary %>">
                    <td class="t_alignleft">
                        <%#(Container.DataItem as CookBook).CookBookName %>
                    </td>
                    <td>
                        <%#(Container.DataItem as CookBook).Navigation.NavName %>
                        【
                        <%#GetParentNavigationName((Container.DataItem as CookBook).Navigation)%>】
                    </td>
                    <td>
                        <%#(Container.DataItem as CookBook).LikeCount%>
                    </td>
                    <td>
                        <a href="CookBookAttach.aspx?cbid=<%#(Container.DataItem as CookBook).CookBookId%>">
                            <img src="<%#service.GetThumbPath((Container.DataItem as CookBook).ImageUrl)%>" alt="添加图片"
                                width="35px" height="35px" <%#string.IsNullOrEmpty((Container.DataItem as CookBook).ImageUrl)?"class='hide'":"" %> />
                            <%#string.IsNullOrEmpty((Container.DataItem as CookBook).ImageUrl) ? "添加图片" : ""%>
                        </a>
                    </td>
                    <td>
                        <a target="_blank" href="<%#Common.SITE_URL %>/Food/KiwiDetail.aspx?cbid=<%#(Container.DataItem as CookBook).CookBookId%>">
                            预览</a>
                    </td>
                    <td>
                        <a href="CookBookAdd.aspx?cbid=<%#(Container.DataItem as CookBook).CookBookId%>">
                            <img alt="编辑" src="/!images/icon_edit.png" title="点击编辑" />
                        </a>
                    </td>
                    <td class="command">
                        <!--JS调用在default.js中-->
                        <!--参数-->
                        <input name="entity_state" type="hidden" value="<%#(Container.DataItem as CookBook).State%>" />
                        <input name="command_url" type="hidden" value="/handler/command/CookBookCommand.ashx" />
                        <input name="command_argument" type="hidden" value="<%#(Container.DataItem as CookBook).CookBookId%>" />
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
    </table>
    <div class="pager">
        <webdiyer:AspNetPager ID="AspNetPager1" runat="server" FirstPageText="首页" LastPageText="尾页"
            NextPageText="下一页" PrevPageText="上一页" PageSize="15" Font-Size="12px" ShowInputBox="Always"
            AlwaysShow="true" OnPageChanged="AspNetPager1_PageChanged" UrlPaging="true" CustomInfoHTML="共%PageCount%页，当前为第%CurrentPageIndex%页，每页%PageSize%条"
            ShowCustomInfoSection="Right">
        </webdiyer:AspNetPager>
    </div>
</asp:Content>
