<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="TheGateWebSite.ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageTitleText" runat="server">
    Shopping Cart
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageShortDescription" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentMain" runat="server">
    <h3><asp:Label ID="BlankCart" runat="server"></asp:Label></h3>
    <asp:ListView ID="ShoppingCartLV" runat="server" OnItemCommand="ShoppingCartLV_ItemCommand">
        <LayoutTemplate>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Product Name</th>
                        <th style="text-align: center;">Price</th>
                        <th style="text-align: center;">Quantity</th>
                        <th style="text-align: center;">Item total</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                </tbody>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%# ((System.Collections.Generic.Dictionary<string, string>)Container.DataItem)["Col1"].ToString()%></td>
                <td style="text-align: center;"><%# ((System.Collections.Generic.Dictionary<string, string>)Container.DataItem)["Col2"].ToString()%></td>
                <td style="text-align: center;"><%# ((System.Collections.Generic.Dictionary<string, string>)Container.DataItem)["Col3"].ToString()%></td>
                <td style="text-align: center;"><%# ((System.Collections.Generic.Dictionary<string, string>)Container.DataItem)["Col4"].ToString()%></td>
                <td>
                    <asp:Button ID="CartItemDelete" CommandName="ProductDelete" CommandArgument='<%# ((System.Collections.Generic.Dictionary<string, string>)Container.DataItem)["Col0"].ToString()%>' runat="server" CssClass="btn btn-small" ToolTip="Delete" Text="Delete" /></td>
            </tr>
        </ItemTemplate>
    </asp:ListView>

    <div style="text-align: right;">
        <h4><%Response.Write(GrandTotal); %></h4>
        <br />
        <asp:HyperLink ID="HyperLinkReturn" runat="server" CssClass="btn" Text="Return to Catalog" NavigateUrl="Catalog.aspx" />
        <asp:HyperLink ID="HyperLinkCheckout" runat="server" CssClass="btn" Text="Checkout" NavigateUrl="Checkout.aspx" />
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
