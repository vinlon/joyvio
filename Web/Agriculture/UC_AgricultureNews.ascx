<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_AgricultureNews.ascx.cs"
    Inherits="Web.Agriculture.UC_AgricultureNews" %>
<script type="text/javascript">
    $(function () {
        var navid = getQueryString('navid');
        $('#' + navid).addClass('trendsselected');
    });
</script>
<%if (isIndex)
  { 
%>
<p class="trends_title">
    <%=nav.NavName%></p>
<p>
    <img src="/!images/agriculture_pic4.jpg" alt="" /></p>
<%
    }
  else
  {
%>
<p class="trends_title">
    产业链动态 相关文章</p>
<%
    } %>
<%if (nav != null)
  { 
%>
<div class="trends_list">
    <ul>
        <asp:Repeater runat="server" ID="repRight">
            <ItemTemplate>
                <li id="<%#(Container.DataItem as FrontendNavigation).NavId %>" class="<%#(Container.ItemIndex%2==0)?"odd":"even" %>">
                    <p class="trends_stitle">
                        ·
                        <%#(Container.DataItem as FrontendNavigation).NavName %></p>
                    <asp:Repeater runat="server" DataSource="<%#GetInformations(Container.DataItem as FrontendNavigation) %>">
                        <ItemTemplate>
                            <p class="trends_linfo">
                                <a href="/News/ReportDetail.aspx?infoid=<%#(Container.DataItem as Information).InfoId %>&navid=<%#(((RepeaterItem)Container.Parent.Parent).DataItem as FrontendNavigation).NavId.ToString() %>"
                                    title="<%#(Container.DataItem as Information).Title%>">
                                    <%#(Container.DataItem as Information).Title.SubStr(24,"...")%></a></p>
                        </ItemTemplate>
                    </asp:Repeater>
                    <p class="trends_listmore">
                        <a href="/Agriculture/Trends.aspx?navid=<%#(Container.DataItem as FrontendNavigation).NavId %>">
                            更多>></a></p>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>
<p class="clear">
</p>
<%
    } %>
