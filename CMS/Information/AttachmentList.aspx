<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="AttachmentList.aspx.cs" Inherits="CMS.Information.AttachmentList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/!js/colorbox/jquery.colorbox.js" type="text/javascript"></script>
    <link href="/!js/colorbox/colorbox.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        //colorbox
        $(function () {
            //图片预览
            $('.img_preview').colorbox({
                rel: 'preview',
                photo: true
            });
            //修改
            $('.attach_edit').colorbox({
                iframe: true,
                width: 500,
                height: 300
            });


            //选择添加图片的尺寸
            $('#addImg').click(function () {
                $(this).find('div').toggle();
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        <!--标题-->
        附件列表
    </div>
    <div class="list_title">
        <!--说明-->
        显示指定信息的所有附件
        <%if (infoid == "")
          { 
        %>
        <label class="error">
            未指定任何信息</label>
        <%
            } %>
        <div id="addImg" class="button_add">
            添加图片
            <div class="button_add_child">
                <ul>
                    <asp:Repeater runat="server" ID="repSize">
                        <ItemTemplate>
                            <li><a href="AttachmentAdd.aspx?infoid=<%#infoid %>&sizeid=<%#(Container.DataItem as ImageSize).SizeId %>">
                                <%#(Container.DataItem as ImageSize).SizeName %></a> </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </div>
        <!--暂时用不到-->
        <a class="button_add" href="AttachmentAddMedia.aspx?infoid=<%=infoid %>">添加视频/音频</a>
    </div>
    <table border="0" cellpadding="0" cellspacing="1" class="list_table" width="100%">
        <tr>
            <th style="width: 800px;">
                附件描述
            </th>
            <th>
                预览
            </th>
            <th>
                排序
            </th>
            <th>
                添加时间
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
                <tr>
                    <td>
                        <%#(Container.DataItem as Attachment).Description %>
                    </td>
                    <td>
                        <a class="img_preview" href="<%#(Container.DataItem as Attachment).SourceUrl %>">预览</a>
                    </td>
                    <td>
                        <%#(Container.DataItem as Attachment).SortIndex%>
                    </td>
                    <td>
                        <%#(Container.DataItem as Attachment).CreateTime.ToString(Common.DATETIME_FORMAT_SHORT) %>
                    </td>
                    <td>
                        <a class="attach_edit" href="AttachmentEdit.aspx?attid=<%#(Container.DataItem as Attachment).AttachmentId %>">
                            <img alt="编辑" src="/!images/icon_edit.png" title="点击编辑" />
                        </a>
                    </td>
                    <td class="command">
                        <!--参数-->
                        <input type="hidden" name="entity_state" value="<%#(Container.DataItem as Attachment).State %>" />
                        <input type="hidden" name="command_url" value="/handler/command/AttachmentCommand.ashx" />
                        <input type="hidden" name="command_argument" value="<%#(Container.DataItem as Attachment).AttachmentId %>" />
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
</asp:Content>
