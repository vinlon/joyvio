<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="InformationList.aspx.cs" Inherits="CMS.Information.InformationList" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/!css/info.css" rel="stylesheet" type="text/css" />
    <!--datepicker-->
    <script src="/!js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            //datepicker
            $('[id$=txtFrom]').click(function () {
                WdatePicker({ dateFmt: "yyyy-MM-dd" });
            });
            $('[id$=txtTo]').click(function () {
                WdatePicker({ dateFmt: "yyyy-MM-dd" });
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        信息列表
    </div>
    <div class="list_title">
        搜索： <span>标题：<asp:TextBox runat="server" ID="txtTitle" class="txt_long" />&nbsp;&nbsp;
            所属栏目：
            <asp:DropDownList runat="server" ID="ddlNav">
            </asp:DropDownList>
            发布时间：
            <asp:TextBox runat="server" ID="txtFrom" class="txt_medium" />~<asp:TextBox runat="server"
                ID="txtTo" class="txt_medium" />
            <asp:Button Text="搜索" runat="server" OnClick="Search" />
        </span><a href="InformationAdd.aspx" class="button_add">添加新信息</a>
    </div>
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="list_table">
        <tr>
            <th>
                标题
            </th>
            <th>
                来源
            </th>
            <th style="width: 300px;">
                所属栏目
            </th>
            <th>
                是否置顶
            </th>
            <th>
                添加人
            </th>
            <th style="width: 100px;">
                附件
            </th>
            <th>
                发布时间
            </th>
            <th>
                创建时间
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
        <asp:Repeater runat="server" ID="repMain">
            <ItemTemplate>
                <tr title='<%#(Container.DataItem as Information).Summary%>'>
                    <td class="infolist_title">
                        <img src="../!images/pdf.gif" alt="【PDF】" <%#(Container.DataItem as Information).ResourcePath==""?"class='hide'":"" %> />
                        <%#(Container.DataItem as Information).Title%>
                    </td>
                    <td>
                        <%#(Container.DataItem as Information).Source%>
                    </td>
                    <td>
                        <%#string.Join(",",(Container.DataItem as Information).NavigationList.Select(n=>n.NavName).ToList())%>
                    </td>
                    <td>
                        <%#(Container.DataItem as Information).IsTop?"置顶":""%>
                    </td>
                    <td>
                        <%#(Container.DataItem as Information).Adder%>
                    </td>
                    <td>
                        <a href="AttachmentList.aspx?infoid=<%#(Container.DataItem as Information).InfoId%>">
                            查看附件</a>【<%#(Container.DataItem as Information).Attachments.Count%>】
                    </td>
                    <td>
                        <%#(Container.DataItem as Information).PublishTime.ToString(Common.DATETIME_FORMAT_FULL)%>
                    </td>
                    <td>
                        <%#(Container.DataItem as Information).CreateTime.ToString(Common.DATETIME_FORMAT_SHORT)%>
                    </td>
                    <td>
                        <a target="_blank" href="<%#GetPreviewUrl(Container.DataItem as Information) %>">预览</a>
                    </td>
                    <td>
                        <a href="/Information/InformationAdd.aspx?infoid=<%#(Container.DataItem as Information).InfoId%>">
                            <img src="/!images/icon_edit.png" title="点击编辑" alt="编辑" />
                        </a>
                    </td>
                    <td class="command">
                        <!--JS调用在default.js中-->
                        <!--参数-->
                        <input type="hidden" name="entity_state" value="<%#(Container.DataItem as Information).State %>" />
                        <input type="hidden" name="command_url" value="/handler/command/InformationCommand.ashx" />
                        <input type="hidden" name="command_argument" value="<%#(Container.DataItem as Information).InfoId %>" />
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
