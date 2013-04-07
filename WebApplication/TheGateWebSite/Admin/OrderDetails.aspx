<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="TheGateWebSite.Admin.OrderDetails" %>
<%@ Register TagPrefix="site" Namespace="UnorderedListDataPager" Assembly="UnorderedListDataPager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageTitleText" runat="server">
    Order Details
</asp:Content>
<asp:Content ID="COntent5" ContentPlaceHolderID="PageShortDescription" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="row">
        <div class="span12">
            <div class="review">

                <asp:Panel ID="PanelAlertError" runat="server" CssClass="alert alert-error"
                    Visible="false">
                    <asp:Label ID="LabelAlertError" runat="server"></asp:Label>
                </asp:Panel>

                <asp:Panel ID="PanelAlertSuccess" runat="server" CssClass="alert alert-success"
                    Visible="false">
                    <asp:Label ID="LabelAlertSuccess" runat="server"></asp:Label>
                </asp:Panel>

                <asp:Panel ID="PanelOrderForm" runat="server" CssClass="form-horizontal">
                    <asp:Panel ID="PanelOrderFormControls"  runat="server">
                    <div class="control-group">
                        <asp:Label ID="lblType" runat="server" Text="Order Type:"
                            AssociatedControlID="ddlType" CssClass="control-label" />
                        <div class="controls">
                            <asp:DropDownList ID="ddlType" runat="server" /> <span class="field-required">*</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorType" runat="server" ErrorMessage="Order Type"
                                Text="Order Type is a required field." ToolTip="Order Type is a required field." ControlToValidate="ddlType"
                                ValidationGroup="ValidationGroupOrder" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label ID="lblState" runat="server" Text="State:"
                            AssociatedControlID="ddlState" CssClass="control-label" />
                        <div class="controls">
                            <asp:DropDownList ID="ddlState" runat="server" />
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label ID="lblAccount" runat="server" Text="Account:"
                            AssociatedControlID="ddlAccount" CssClass="control-label" />
                        <div class="controls">
                            <asp:DropDownList ID="ddlAccount" runat="server" />
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label ID="lblContact" runat="server" Text="Contact:"
                            AssociatedControlID="ddlContact" CssClass="control-label" />
                        <div class="controls">
                            <asp:DropDownList ID="ddlContact" runat="server" /> <span class="field-required">*</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Contact" InitialValue="0"
                                Text="Contact is a required field." ToolTip="Contact is a required field." ControlToValidate="ddlContact"
                                ValidationGroup="ValidationGroupOrder" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label ID="lblDateMade" runat="server" Text="Date Made:"
                            AssociatedControlID="lblDateMadeData" CssClass="control-label" />
                        <div class="controls">
                            <asp:Label ID="lblDateMadeData" runat="server" />
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label ID="lblDateShipped" runat="server" Text="Date Shipped:"
                            AssociatedControlID="lblDateShippedData" CssClass="control-label" />
                        <div class="controls">
                            <asp:Label ID="lblDateShippedData" runat="server" />
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label ID="lblDateRecieved" runat="server" Text="Date Recieved:"
                            AssociatedControlID="lblDateRecievedData" CssClass="control-label" />
                        <div class="controls">
                            <asp:Label ID="lblDateRecievedData" runat="server" />
                        </div>
                    </div>
                        </asp:Panel>
                    <div class="form-actions">
                        <asp:Button ID="ButtonOrderAction" runat="server" CssClass="btn btn-primary"
                            ValidationGroup="ValidationGroupOrder" CausesValidation="true" Text="Order Action" />
                        <asp:Button ID="ButtonOrderShipped" runat="server" CssClass="btn btn-info"
                            ValidationGroup="ValidationGroupOrder" CausesValidation="true" Text="Mark Order Shipped" OnClick="ButtonOrderShipped_Click" />
                        <asp:Button ID="ButtonOrderRecieved" runat="server" CssClass="btn btn-success"
                            ValidationGroup="ValidationGroupOrder" CausesValidation="true" Text="Mark Order Recieved" OnClick="ButtonOrderRecieved_Click" />
                        <asp:Button ID="ButtonOrderCancelled" runat="server" CssClass="btn btn-danger"
                            ValidationGroup="ValidationGroupOrder" CausesValidation="true" Text="Cancel Order" OnClick="ButtonOrderCancelled_Click" />
                        <asp:HyperLink ID="HyperLinkOrderListing" runat="server" CssClass="btn" Text="Return to Order Listing" NavigateUrl="~/Admin/Orders.aspx" />
                    </div>
                </asp:Panel>
                <asp:Panel ID="PanelOrderDetails" runat="server">
                    <hr />
                    <h3>Order Details</h3>
                    <div class="accordion" id="accordion2">
                            <div class="accordion-group">
                                <div class="accordion-heading accordion-inverse">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#addProduct">
                                        <h5><i class="icon-plus"></i>&nbsp;Add a new product</h5>
                                    </a>
                                </div>
                                <div id="addProduct" class="accordion-body collapse" style="height: 0px;">
                                    <div class="accordion-inner">
                                        <div class="form-horizontal">
                                            <div class="control-group">
                                                <asp:Label runat="server" ID="lblProduct" AssociatedControlID="ddlProduct"
                                                    CssClass="control-label">Product:</asp:Label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlProduct" runat="server" />
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <asp:Label runat="server" ID="lblQuantity" AssociatedControlID="TextBoxProductQuantity"
                                                    CssClass="control-label">Quantity:</asp:Label>
                                                <div class="controls">
                                                    <asp:TextBox runat="server" ID="TextBoxProductQuantity" CssClass="input-small"></asp:TextBox>
                                                    <span class="field-required">*</span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorQuantity" runat="server" ErrorMessage="First Name"
                                                        Text="Product name is a required field." ToolTip="Product quantity is a required field." ControlToValidate="TextBoxProductQuantity"
                                                        ValidationGroup="ValidationGroupAddProduct" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <div class="controls">
                                                    <asp:Panel ID="PanelAddAlertError" runat="server" CssClass="alert alert-error"
                                                        Visible="false">
                                                        <asp:Label ID="LabelAddAlert" runat="server"></asp:Label>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                            <div class="form-actions">
                                                <asp:Button ID="ButtonAddProduct" runat="server" CssClass="btn btn-primary"
                                                    ValidationGroup="ValidationGroupAddProduct" CausesValidation="true" OnClick="ButtonAddProduct_Click" Text="Add Product" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    <asp:ListView ID="ListViewOrderDetails" runat="server" OnItemCommand="ListViewOrderDetails_ItemCommand">
                            <LayoutTemplate>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Product</th>
                                            <th>Quantity</th>
                                            <th>Item Price</th>
                                            <th>Product Total</th>
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
                                    <td><%# GetOrderLineProduct(Container.DataItem as TheGateWebSite.Model.OrderLine) %></td>
                                    <td><%# Eval("quantity") %></td>
                                    <td><%# GetOrderLinePrice(Container.DataItem as TheGateWebSite.Model.OrderLine) %></td>
                                    <td><%# GetOrderLineTotal(Container.DataItem as TheGateWebSite.Model.OrderLine) %></td>
                                    <td>
                                        <asp:Button ID="ButtonOrderLineDelete" CommandName="OrderLineDelete" CommandArgument='<%# Bind("orderLineID") %>' runat="server" CssClass="btn btn-small" ToolTip="Delete" Text="Delete" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <div class="cta">
                                    <p style="text-align: center;">No orders found.</p>
                                </div>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    <p class="pull-right">
                        <strong>Order Total: </strong><asp:Literal ID="ltOrderTotal" runat="server" />
                    </p>
                    <p class="clearfix"></p>
                </asp:Panel>

            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
