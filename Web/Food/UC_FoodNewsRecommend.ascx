<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_FoodNewsRecommend.ascx.cs"
    Inherits="Web.Food.UC_FoodNewsRecommend" %>
<p>
    <img src="/!images/kiwi_pic3.jpg" alt="更多推荐" /></p>
<div class="food_rlist">
    <ul>
        <asp:Repeater runat="server" ID="repMain">
            <ItemTemplate>
                <li>
                    <p class="kiwi_rtitle">
                        <a href="FoodDetail.aspx?infoid=<%#(Container.DataItem as Information).InfoId %>&navid=<%#(Container.DataItem as Information).NavigationList.ElementAtOrDefault(0).GetPropertyOrDefault(n=>n.NavId) %>">
                            <%#(Container.DataItem as Information).Title %></a></p>
                    <p title="<%#(Container.DataItem as Information).Summary%>">
                        <%#(Container.DataItem as Information).Summary.SubStr(50,"...")%></p>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
    <p class="food_more">
        <a href="Recipe.aspx">更多>></a></p>
</div>
