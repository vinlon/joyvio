<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_CookBookRecommend.ascx.cs"
    Inherits="Web.Food.UC_CookBookRecommend" %>
<p>
    <img src="/!images/kiwi_pic2.jpg" alt="热门推荐" /></p>
<div class="food_rlist">
    <ul>
        <asp:Repeater runat="server" ID="repMain">
            <ItemTemplate>
                <li>
                    <p class="food_pic">
                        <a href="KiwiDetail.aspx?cbid=<%#(Container.DataItem as CookBook).CookBookId %>">
                            <img src="<%#Common.CMS_URL+service.GetThumbPath((Container.DataItem as CookBook).ImageUrl) %>"
                                alt="" /></a>
                    </p>
                    <div class="rlist_info">
                        <p class="kiwi_rtitle">
                            <a href="KiwiDetail.aspx?cbid=<%#(Container.DataItem as CookBook).CookBookId %>">
                                <%#(Container.DataItem as CookBook).CookBookName %></a></p>
                        <p>
                            <%#(Container.DataItem as CookBook).Summary.SubStr(30,"...") %></p>
                    </div>
                    <p class="clear">
                    </p>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
    <p class="food_more">
        <a href="Recipe.aspx">更多>></a></p>
</div>
