<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="TheGateWebSite.Admin.Orders" %>

<%@ Register TagPrefix="site" Namespace="UnorderedListDataPager" Assembly="UnorderedListDataPager" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageTitleText" runat="server">
    Orders
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageShortDescription" runat="server">
    <p>Manage orders.</p>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="row">
        <div class="span12">
            <div class="review">
                <asp:UpdatePanel ID="UpdatePanelOrders" runat="server">
                    <ContentTemplate>
                        <div class="navbar-form">
                            <asp:HyperLink ID="hyperlinkAddContact" runat="server" Text="Add Order" CssClass="btn btn-primary" NavigateUrl="OrderDetails.aspx" />
                            <div class="pull-right">
                                <asp:TextBox ID="textboxSearchQuery" runat="server" />
                                <asp:Button ID="buttonSearch" runat="server" Text="Search" CssClass="btn" OnClick="buttonSearch_Click" />
                            </div>
                        </div>
                        <asp:Panel ID="pnlError" runat="server" CssClass="alert alert-error" Visible="false">
                            <asp:Label ID="lblErrorMsg" runat="server" />
                        </asp:Panel>
                        <asp:Panel ID="pnlSuccess" runat="server" CssClass="alert alert-success" Visible="false">
                            <asp:Label ID="lblSuccessMsg" runat="server" />
                        </asp:Panel>
                        <asp:ListView ID="ListViewOrders" runat="server">
                            <LayoutTemplate>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center;">Order ID</th>
                                            <th>Account</th>
                                            <th>Contact</th>
                                            <th>Status</th>
                                            <th>Date Made</th>
                                            <th>Date Shipped</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                    </tbody>
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr>

                                    <td style="text-align: center;">
                                        <asp:HyperLink ID="hyperlinkContact" runat="server" Text='<%# Eval("orderID") %>' NavigateUrl='<%# GenOrderDetailLink(Container.DataItem as TheGateWebSite.Model.Order) %>' /></td>
                                    <td><%# GetOrderAccount(Container.DataItem as TheGateWebSite.Model.Order) %></td>
                                    <td><%# GetOrderContact(Container.DataItem as TheGateWebSite.Model.Order) %></td>
                                    <td><%# GetOrderStatus(Container.DataItem as TheGateWebSite.Model.Order) %></td>
                                    <td><%# GetOrderDateMade(Container.DataItem as TheGateWebSite.Model.Order) %></td>
                                    <td><%# GetOrderDateShipped(Container.DataItem as TheGateWebSite.Model.Order) %></td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <div class="cta">
                                    <p style="text-align: center;">No orders found.</p>
                                </div>
                            </EmptyDataTemplate>
                        </asp:ListView>
                        <div class="pagination">
                            <site:UnorderedListDataPager ID="DataPagerOrders" runat="server" PagedControlID="ListViewOrders"
                                PageSize="5" OnPreRender="DataPagerOrders_PreRender">
                                <Fields>
                                    <asp:NextPreviousPagerField ShowNextPageButton="false" ShowFirstPageButton="True" FirstPageText="&laquo;" PreviousPageText="&lsaquo;" />
                                    <asp:NumericPagerField ButtonCount="10" PreviousPageText="&hellip;" NextPageText="&hellip;" />
                                    <asp:NextPreviousPagerField ShowPreviousPageButton="false" ShowLastPageButton="True" LastPageText="&raquo;" NextPageText="&rsaquo;" />
                                </Fields>
                            </site:UnorderedListDataPager>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ListViewOrders" />
                        <asp:PostBackTrigger ControlID="buttonSearch" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="UpdateProgressOrders" AssociatedUpdatePanelID="UpdatePanelOrders" runat="server">
                    <ProgressTemplate>
                        <div class="update-progress-back">
                            <img id="Img1" src="~/img/301.gif" runat="server" />
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>

