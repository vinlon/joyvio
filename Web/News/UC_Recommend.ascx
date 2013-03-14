<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_Recommend.ascx.cs"
    Inherits="Web.News.UC_Recommend" %>
<div class="rdetail_right" id="right">
    <p class="related_title">
        精彩推荐</p>
    <div class="related_list">
        <ul>
            <asp:Repeater runat="server" ID="repMain">
                <ItemTemplate>
                    <li>
                        <p>
                            <a href="/News/ReportDetail.aspx?infoid=<%#(Container.DataItem as Information).InfoId %>&navid=<%#(GetDefaultNavigation(Container.DataItem as Information)).GetPropertyOrDefault(n=>n.NavId).ToString() %>"
                                title="<%#(Container.DataItem as Information).Title %>">
                                <%#(Container.DataItem as Information).Title.SubStr(18,"...") %></a></p>
                        <p>
                            <!--显示默认第一个类别-->
                            <%#(GetDefaultNavigation(Container.DataItem as Information)).GetPropertyOrDefault(n=>n.NavName) %>
                            <span class="line">|</span><span class="time"><%#(Container.DataItem as Information).PublishTime.ToString("yyyy-MM-dd HH:mm:ss")%></span></p>
                        <p class="clear">
                        </p>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
            <%--<li>
                <p>
                    <a href="">联想进军现代农业 来蒲江种猕猴桃首期10万亩</a></p>
                <p>
                    公司动态<span class="line">|</span><span class="time">2013-01-29 09:20</span></p>
                <p class="clear">
                </p>
            </li>
            <li>
                <p>
                    <a href="">联想进军现代农业 来蒲江种猕猴桃首期10万亩</a></p>
                <p>
                    公司动态<span class="line">|</span><span class="time">2013-01-29 09:20</span></p>
                <p class="clear">
                </p>
            </li>
            <li>
                <p>
                    <a href="">联想进军现代农业 来蒲江种猕猴桃首期10万亩</a></p>
                <p>
                    公司动态<span class="line">|</span><span class="time">2013-01-29 09:20</span></p>
                <p class="clear">
                </p>
            </li>--%>
        </ul>
    </div>
</div>
