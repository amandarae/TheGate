<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="TheGateWebSite.Admin.Products" %>

<%@ Register TagPrefix="site" Namespace="UnorderedListDataPager" Assembly="UnorderedListDataPager" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageTitleText" runat="server">
    Products
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageShortDescription" runat="server">
    <p>Add and manage products.</p>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="row">
        <div class="span12">
            <div class="review">
                <asp:UpdatePanel ID="UpdatePanelProducts" runat="server">
                    <ContentTemplate>
                        <div class="accordion" id="accordion2">
                            <div class="accordion-group">
                                <div class="accordion-heading accordion-inverse">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#addProduct">
                                        <h5><i class="icon-plus"></i>&nbsp;Add a new category</h5>
                                    </a>
                                </div>
                                <div id="addProduct" class="accordion-body collapse" style="height: 0px;">
                                    <div class="accordion-inner">
                                        <div class="form-horizontal">
                                            <div class="control-group">
                                                <asp:Label runat="server" ID="LabelProductName" AssociatedControlID="TextBoxProductName"
                                                    CssClass="control-label">Product Name:</asp:Label>
                                                <div class="controls">
                                                    <asp:TextBox runat="server" ID="TextBoxProductName" CssClass="input-xlarge"></asp:TextBox>
                                                    <span class="field-required">*</span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server" ErrorMessage="First Name"
                                                        Text="Product name is a required field." ToolTip="Product name is a required field." ControlToValidate="TextBoxProductName"
                                                        ValidationGroup="ValidationGroupAddProduct" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <asp:Label runat="server" ID="LabelProductDescription" AssociatedControlID="TextBoxProductDescription"
                                                    CssClass="control-label">Description:</asp:Label>
                                                <div class="controls">
                                                    <asp:TextBox runat="server" ID="TextBoxProductDescription" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <asp:Label runat="server" ID="LabelCategory" AssociatedControlID="ddlCategories"
                                                    CssClass="control-label">Category:</asp:Label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlCategories" runat="server" />
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <asp:Label runat="server" ID="LabelPrice" AssociatedControlID="TextBoxPrice"
                                                    CssClass="control-label">Price:</asp:Label>
                                                <div class="controls">
                                                    <div class="input-prepend">
                                                        <span class="add-on"><i class="icon-money"></i></span>
                                                        <asp:TextBox runat="server" ID="TextBoxPrice" CssClass="input-mini"></asp:TextBox>
                                                    </div>
                                                    <span class="field-required">*</span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Price"
                                                        Text="Price is a required field." ToolTip="Price is a required field." ControlToValidate="TextBoxPrice"
                                                        ValidationGroup="ValidationGroupAddProduct" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="rvDecimal" ControlToValidate="TextBoxPrice" runat="server"
                                                        ErrorMessage="Please enter a valid price." ValidationGroup="ValidationGroupAddProduct" ValidationExpression="^(-)?\d+(\.\d\d)?$" ForeColor="Red" />
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
                        <asp:Panel ID="pnlCategoryError" runat="server" CssClass="alert alert-error" Visible="false">
                            <asp:Label ID="lblCategoryErrorMsg" runat="server" />
                        </asp:Panel>
                        <asp:Panel ID="pnlCategorySuccess" runat="server" CssClass="alert alert-success" Visible="false">
                            <asp:Label ID="lblCategorySuccessMsg" runat="server" />
                        </asp:Panel>
                        <asp:ListView ID="ListViewProducts" runat="server" OnItemCommand="ListViewProducts_ItemCommand">
                            <LayoutTemplate>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center;">Product ID</th>
                                            <th>Name</th>
                                            <th style="text-align: center;">Price</th>
                                            <th style="text-align: center;">Quantity On Hand</th>
                                            <th style="text-align: center;">Quantity On Order</th>
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
                                    <td style="text-align: center;"><%# Eval("productID") %></td>
                                    <td><%# Eval("productName") %></td>
                                    <td style="text-align: center;"><%# Eval("price").ToString() %></td>
                                    <td style="text-align: center;"><%# Eval("onHand").ToString() %></td>
                                    <td style="text-align: center;"><%# Eval("onHand").ToString() %></td>
                                    <td style="text-align: left;">
                                        <asp:Button ID="ButtonCategoryManage" CommandName="ProductManage" CommandArgument='<%# Bind("productID") %>' runat="server" CssClass="btn btn-small" ToolTip="Manage" Text="Manage" />
                                        <asp:Button ID="ButtonCategoryDelete" CommandName="ProductDelete" CommandArgument='<%# Bind("productID") %>' runat="server" CssClass="btn btn-small" ToolTip="Delete" Text="Delete" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <div class="cta">
                                    <p style="text-align: center;">No products found.</p>
                                </div>
                            </EmptyDataTemplate>
                        </asp:ListView>
                        <div class="pagination">
                            <site:UnorderedListDataPager ID="DataPagerProducts" runat="server" PagedControlID="ListViewProducts"
                                PageSize="5" OnPreRender="DataPagerProducts_PreRender">
                                <Fields>
                                    <asp:NextPreviousPagerField ShowNextPageButton="false" ShowFirstPageButton="True" FirstPageText="&laquo;" PreviousPageText="&lsaquo;" />
                                    <asp:NumericPagerField ButtonCount="10" PreviousPageText="&hellip;" NextPageText="&hellip;" />
                                    <asp:NextPreviousPagerField ShowPreviousPageButton="false" ShowLastPageButton="True" LastPageText="&raquo;" NextPageText="&rsaquo;" />
                                </Fields>
                            </site:UnorderedListDataPager>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ListViewProducts" />
                        <asp:AsyncPostBackTrigger ControlID="ButtonAddProduct" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="UpdateProgressProducts" AssociatedUpdatePanelID="UpdatePanelProducts" runat="server">
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

