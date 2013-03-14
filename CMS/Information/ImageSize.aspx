<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="ImageSize.aspx.cs" Inherits="CMS.Information.ImageSize" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        <!--标题-->
        图片尺寸管理
    </div>
    <div class="list_title">
        <!--说明-->
        添加尺寸
        <asp:Label Text="" ID="lbMessage" class="error" runat="server" />
    </div>
    <div class="info">
        <p>
            <span class="info_left">尺寸名称：</span>
            <asp:TextBox runat="server" ID="txtSizeName" class="txt_medium" /><span class="required">*</span>
        </p>
        <p>
            <span class="info_left">尺寸项：</span>系统将为每一组尺寸（长&宽）生成一张图片；长与宽均为空(0)则不生成该类图片。
        </p>
        <div>
            <span class="info_left">&nbsp;</span>
            <div style="display: inline-block; padding-bottom: 10px;">
                <div style="line-height: 40px;">
                    显示图，
                    <!---->
                    宽：<asp:TextBox runat="server" ID="txtWidth" class="txt_small" />
                    高：<asp:TextBox runat="server" ID="txtHeight" class="txt_small" />
                    <span class="required">*</span>
                </div>
                <div style="line-height: 40px;">
                    缩略图，
                    <!---->
                    宽：<asp:TextBox runat="server" ID="txtThumbWidth" class="txt_small" />
                    高：<asp:TextBox runat="server" ID="txtThumbHeight" class="txt_small" />
                </div>
                <div style="line-height: 40px;">
                    封面图，
                    <!---->
                    宽：<asp:TextBox runat="server" ID="txtCoverWidth" class="txt_small" />
                    高：<asp:TextBox runat="server" ID="txtCoverHeight" class="txt_small" />
                </div>
            </div>
        </div>
        <p>
            <span class="info_left">&nbsp;</span>
            <asp:Button Text="提交" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
        </p>
    </div>
    <table border="0" cellpadding="0" cellspacing="1" class="list_table" width="98%">
        <tr>
            <th>
                尺寸名称
            </th>
            <th>
                显示图
            </th>
            <th>
                缩略图
            </th>
            <th>
                封面图
            </th>
            <th>
                修改
            </th>
            <th>
                管理
            </th>
        </tr>
        <asp:Repeater ID="repMain" runat="server">
            <ItemTemplate>
                <tr>
                    <td>
                        <%#(Container.DataItem as ImageSize).SizeName %>
                    </td>
                    <td>
                        <%#string.Format("{0}X{1}",(Container.DataItem as ImageSize).Width,(Container.DataItem as ImageSize).Height) %>
                    </td>
                    <td>
                        <%#string.Format("{0}X{1}",(Container.DataItem as ImageSize).ThumbWidth,(Container.DataItem as ImageSize).ThumbHeight) %>
                    </td>
                    <td>
                        <%#string.Format("{0}X{1}",(Container.DataItem as ImageSize).CoverWidth,(Container.DataItem as ImageSize).CoverHeight) %>
                    </td>
                    <td>
                        <a href="ImageSize.aspx?sid=<%#(Container.DataItem as ImageSize).SizeId %>">
                            <img alt="编辑" src="/!images/icon_edit.png" title="点击编辑" />
                        </a>
                    </td>
                    <td class="command">
                        <!--JS调用在default.js中-->
                        <!--参数-->
                        <input name="entity_state" type="hidden" value="<%#(Container.DataItem as ImageSize).State %>" />
                        <input name="command_url" type="hidden" value="/handler/command/ImageSizeCommand.ashx" />
                        <input name="command_argument" type="hidden" value="<%#(Container.DataItem as ImageSize).SizeId %>" />
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
