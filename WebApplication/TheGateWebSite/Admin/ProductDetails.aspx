<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="TheGateWebSite.Admin.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageTitleText" runat="server">
    Product Details
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

                <asp:Panel ID="PanelProductForm" runat="server" CssClass="form-horizontal">
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
                                ErrorMessage="Please enter a valid price (decimal value ie. 51.99)." ValidationGroup="ValidationGroupAddProduct" ValidationExpression="^(-)?\d+(\.\d\d)?$" ForeColor="Red" />
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label runat="server" ID="LabelOnHand" AssociatedControlID="TextBoxOnHand"
                            CssClass="control-label">On Hand:</asp:Label>
                        <div class="controls">
                            <asp:TextBox runat="server" ID="TextBoxOnHand" CssClass="input-mini" MaxLength="8"></asp:TextBox>
                            <span class="field-required">*</span>
                            <asp:RequiredFieldValidator ID="rfvOnHand" runat="server" ErrorMessage="Price"
                                Text="Price is a required field." ToolTip="Price is a required field." ControlToValidate="TextBoxOnHand"
                                ValidationGroup="ValidationGroupAddProduct" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revOnHand" ControlToValidate="TextBoxOnHand" runat="server"
                                ErrorMessage="Please enter a valid number (positive integer)." ValidationGroup="ValidationGroupAddProduct" ValidationExpression="[0-9]{0,8}" ForeColor="Red" />
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label runat="server" ID="LabelOnOrder" AssociatedControlID="TextBoxOnOrder"
                            CssClass="control-label">On Order:</asp:Label>
                        <div class="controls">
                            <asp:TextBox runat="server" ID="TextBoxOnOrder" CssClass="input-mini" MaxLength="8"></asp:TextBox>
                            <span class="field-required">*</span>
                            <asp:RequiredFieldValidator ID="rfvOnOrder" runat="server" ErrorMessage="Price"
                                Text="Price is a required field." ToolTip="Price is a required field." ControlToValidate="TextBoxOnOrder"
                                ValidationGroup="ValidationGroupAddProduct" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revOnOrder" ControlToValidate="TextBoxOnOrder" runat="server"
                                ErrorMessage="Please enter a valid number (positive integer)." ValidationGroup="ValidationGroupAddProduct" ValidationExpression="[0-9]{0,8}" ForeColor="Red" />
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label runat="server" ID="LabelImage" AssociatedControlID="FileUploadImage"
                            CssClass="control-label">Image:</asp:Label>
                        <div class="controls">
                            <asp:Panel ID="PanelImageFile" runat="server">
                                <asp:Image ID="ImageFile" runat="server" CssClass="file-image" />
                                <hr />
                                <p>Upload a new image:</p>
                            </asp:Panel>
                            <asp:FileUpload ID="FileUploadImage" runat="server" />
                        </div>
                    </div>
                    <div class="form-actions">
                        <asp:Button ID="ButtonUpdateProduct" runat="server" CssClass="btn btn-primary"
                            ValidationGroup="ValidationGroupAddProduct" CausesValidation="true" OnClick="ButtonUpdateProduct_Click" Text="Update Product" />
                        <asp:HyperLink ID="HyperLinkProductListing" runat="server" CssClass="btn" Text="Return to Product Listing" NavigateUrl="~/Admin/Products.aspx" />
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
