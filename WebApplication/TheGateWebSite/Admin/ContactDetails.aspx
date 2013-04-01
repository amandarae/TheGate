<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="ContactDetails.aspx.cs" Inherits="TheGateWebSite.Admin.ContactDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageTitleText" runat="server">
    Contact Details
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

                <asp:Panel ID="PanelContactForm" runat="server" CssClass="form-horizontal">
                    <div class="control-group">
                        <asp:Label ID="lblContactFirstName" runat="server" Text="First Name:"
                            AssociatedControlID="txtContactFirstName" CssClass="control-label" />
                        <div class="controls">
                            <asp:TextBox ID="txtContactFirstName" runat="server" CssClass="input-medium" /><span class="field-required">*</span>
                            <asp:RequiredFieldValidator ID="rfvContactFirstName" runat="server" ControlToValidate="txtContactFirstName"
                                ValidationGroup="PersonalProfile" Display="Dynamic" CssClass="field-error-inline"
                                Text="First Name is a required field." />
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label ID="lblContactLastName" runat="server" Text="Last Name:"
                            AssociatedControlID="txtContactLastName" CssClass="control-label" />
                        <div class="controls">
                            <asp:TextBox ID="txtContactLastName" runat="server" CssClass="input-large" /><span class="field-required">*</span>
                            <asp:RequiredFieldValidator ID="rfvContactLastName" runat="server" ControlToValidate="txtContactLastName"
                                ValidationGroup="PersonalProfile" Display="Dynamic" CssClass="field-error-inline"
                                Text="Last Name is a required field." />
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label ID="lblContactEmail" runat="server" Text="Email:"
                            AssociatedControlID="txtContactEmail" CssClass="control-label" />
                        <div class="controls">
                            <asp:TextBox ID="txtContactEmail" runat="server" CssClass="input-xlarge" /><span class="field-required">*</span>
                            <asp:RequiredFieldValidator ID="rfvContactEmail" runat="server" ControlToValidate="txtContactEmail"
                                ValidationGroup="PersonalProfile" Display="Dynamic" CssClass="field-error-inline"
                                Text="Email is a required field." />
                            <asp:RegularExpressionValidator ID="revContactEmail" runat="server" ControlToValidate="txtContactEmail"
                                ValidationGroup="PersonalProfile" Display="Dynamic" CssClass="field-error-inline"
                                Text="Please enter a valid email address." ValidationExpression="^[a-zA-Z]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z]*)*\s+&amp;lt;(\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,3})&amp;gt;$|^(\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,3})$" />
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label ID="lblContactPhone" runat="server" Text="Phone Number:"
                            AssociatedControlID="txtContactPhone" CssClass="control-label" />
                        <div class="controls">
                            <asp:TextBox ID="txtContactPhone" runat="server" CssClass="input-small" /><span class="field-required">*</span>
                            <asp:RequiredFieldValidator ID="rfvContactPhone" runat="server" ControlToValidate="txtContactPhone"
                                ValidationGroup="PersonalProfile" Display="Dynamic" CssClass="field-error-inline"
                                Text="Phone Number is a required field." />
                            <asp:RegularExpressionValidator ID="revContactPhone" runat="server" ControlToValidate="txtContactPhone"
                                ValidationGroup="PersonalProfile" Display="Dynamic" CssClass="field-error-inline"
                                Text="Please enter a valid 10 digit phone number."
                                ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$" />
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label ID="lblContactFax" runat="server" Text="Fax Number:"
                            AssociatedControlID="txtContactFax" CssClass="control-label" />
                        <div class="controls">
                            <asp:TextBox ID="txtContactFax" runat="server" CssClass="input-small" />
                            <asp:RegularExpressionValidator ID="revContactFax" runat="server" ControlToValidate="txtContactFax"
                                ValidationGroup="PersonalProfile" Display="Dynamic" CssClass="field-error-inline"
                                Text="Please enter a valid 10 digit Fax number."
                                ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$" />
                        </div>
                    </div>
                    <asp:Panel ID="pnlAddresses" runat="server">
                        <div class="control-group">
                            <div class="controls">
                                <asp:Button ID="buttonAddShippingAddress" runat="server" Text="Add Shipping Address" OnClick="buttonAddShippingAddress_Click" CssClass="btn" />
                            </div>
                        </div>
                        <asp:Panel ID="pnlShippingAddress" runat="server" Visible="false">
                            <h5>Shipping Address</h5>
                            <div class="control-group">
                                <asp:Label ID="lblShippingAddress1" runat="server" Text="Address Line 1:"
                                    AssociatedControlID="txtShippingAddress1" CssClass="control-label" />
                                <div class="controls">
                                    <asp:TextBox ID="txtShippingAddress1" runat="server" CssClass="input-xlarge" /><span class="field-required">*</span>
                                    <asp:RequiredFieldValidator ID="rfvShippingAddress1" runat="server" ControlToValidate="txtShippingAddress1"
                                        ValidationGroup="PersonalProfile" Display="Dynamic" CssClass="field-error-inline"
                                        Text="Address Line 1 is a required field." />
                                </div>
                            </div>
                            <div class="control-group">
                                <asp:Label ID="lblShippingAddress2" runat="server" Text="Address Line 2:"
                                    AssociatedControlID="txtShippingAddress2" CssClass="control-label" />
                                <div class="controls">
                                    <asp:TextBox ID="txtShippingAddress2" runat="server" CssClass="input-xlarge" />
                                </div>
                            </div>
                            <div class="control-group">
                                <asp:Label ID="lblShippingCity" runat="server" Text="City:"
                                    AssociatedControlID="txtShippingCity" CssClass="control-label" />
                                <div class="controls">
                                    <asp:TextBox ID="txtShippingCity" runat="server" CssClass="input-medium" /><span class="field-required">*</span>
                                    <asp:RequiredFieldValidator ID="rfvShippingCity" runat="server" ControlToValidate="txtShippingCity"
                                        ValidationGroup="PersonalProfile" Display="Dynamic" CssClass="field-error-inline"
                                        Text="City is a required field." />
                                </div>
                            </div>
                            <div class="control-group">
                                <asp:Label ID="lblShippingProvince" runat="server" Text="Province:" AssociatedControlID="ddlShippingProvince" CssClass="control-label" />
                                <div class="controls">
                                    <asp:DropDownList ID="ddlShippingProvince" runat="server">
                                        <asp:ListItem Text="Ontario" Value="Ontario" />
                                        <asp:ListItem Text="Quebec" Value="Quebec" />
                                        <asp:ListItem Text="British Columbia" Value="British Columbia" />
                                        <asp:ListItem Text="Alberta" Value="Alberta" />
                                        <asp:ListItem Text="Manitoba" Value="Manitoba" />
                                        <asp:ListItem Text="Saskatchewan" Value="Saskatchewan" />
                                        <asp:ListItem Text="Nova Scotia" Value="Nova Scotia" />
                                        <asp:ListItem Text="New Brunswick" Value="New Brunswick" />
                                        <asp:ListItem Text="Newfoundland and Labrador" Value="Newfoundland and Labrador" />
                                        <asp:ListItem Text="Prince Edward Island" Value="Prince Edward Island" />
                                        <asp:ListItem Text="Northwest Territories" Value="Northwest Territories" />
                                        <asp:ListItem Text="Yukon" Value="Yukon" />
                                        <asp:ListItem Text="Nunavut" Value="Nunavut" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="control-group">
                                <asp:Label ID="lblShippingPostalCode" runat="server" Text="Postal Code:"
                                    AssociatedControlID="txtShippingPostalCode" CssClass="control-label" />
                                <div class="controls">
                                    <asp:TextBox ID="txtShippingPostalCode" runat="server" CssClass="input-mini input-caps" MaxLength="7" /><span class="field-required">*</span>
                                    <asp:Label ID="lblShippingPostalCodeHelpText" runat="server" CssClass="help-text" Text="i.e. A1B2C3" />
                                    <asp:RequiredFieldValidator ID="rfvShippingPostalCode" runat="server" ControlToValidate="txtShippingPostalCode"
                                        ValidationGroup="PersonalProfile" Display="Dynamic" CssClass="field-error-inline"
                                        Text="postal Code is a required field." />
                                </div>
                            </div>
                            <hr />
                        </asp:Panel>
                        
                        <div class="control-group">
                            <div class="controls">
                                <asp:Button ID="buttonAddBillingAddress" runat="server" Text="Add Billing Address" OnClick="buttonAddBillingAddress_Click" CssClass="btn" />
                            </div>
                        </div>
                        
                        <asp:Panel ID="pnlBillingAddress" runat="server" Visible="false">
                            <h5>Billing Address</h5>
                            <div class="control-group">
                                <div class="controls">
                                    <asp:Label ID="lblSameAsShipping" runat="server" CssClass="checkbox" AssociatedControlID="ckbSameAsShipping">
                                <asp:CheckBox ID="ckbSameAsShipping" runat="server" OnCheckedChanged="ckbSameAsShipping_CheckedChanged" AutoPostBack="true" /><asp:Literal ID="ltlSameAsShipping"
                                    runat="server" Text="Same as shipping adddress" /></asp:Label>
                                </div>
                            </div>
                            <asp:Panel ID="pnlBillingAddressDetails" runat="server">
                                <div class="control-group">
                                    <asp:Label ID="lblBillingAddress1" runat="server" Text="Address Line 1:"
                                        AssociatedControlID="txtBillingAddress1" CssClass="control-label" />
                                    <div class="controls">
                                        <asp:TextBox ID="txtBillingAddress1" runat="server" CssClass="input-xlarge" /><span class="field-required">*</span>
                                        <asp:RequiredFieldValidator ID="rfvBillingAddress1" runat="server" ControlToValidate="txtBillingAddress1"
                                            ValidationGroup="PersonalProfile" Display="Dynamic" CssClass="field-error-inline"
                                            Text="Address Line 1 is a required field." />
                                    </div>
                                </div>
                                <div class="control-group">
                                    <asp:Label ID="lblBillingAddress2" runat="server" Text="Address Line 2:"
                                        AssociatedControlID="txtBillingAddress2" CssClass="control-label" />
                                    <div class="controls">
                                        <asp:TextBox ID="txtBillingAddress2" runat="server" CssClass="input-xlarge" />
                                    </div>
                                </div>
                                <div class="control-group">
                                    <asp:Label ID="lblBillingCity" runat="server" Text="City:"
                                        AssociatedControlID="txtBillingCity" CssClass="control-label" />
                                    <div class="controls">
                                        <asp:TextBox ID="txtBillingCity" runat="server" CssClass="input-medium" /><span class="field-required">*</span>
                                        <asp:RequiredFieldValidator ID="rfvBillingCity" runat="server" ControlToValidate="txtBillingCity"
                                            ValidationGroup="PersonalProfile" Display="Dynamic" CssClass="field-error-inline"
                                            Text="City is a required field." />
                                    </div>
                                </div>
                                <div class="control-group">
                                    <asp:Label ID="lblBillingProvince" runat="server" Text="Province:" AssociatedControlID="ddlBillingProvince" CssClass="control-label" />
                                    <div class="controls">
                                        <asp:DropDownList ID="ddlBillingProvince" runat="server">
                                            <asp:ListItem Text="Ontario" Value="Ontario" />
                                            <asp:ListItem Text="Quebec" Value="Quebec" />
                                            <asp:ListItem Text="British Columbia" Value="British Columbia" />
                                            <asp:ListItem Text="Alberta" Value="Alberta" />
                                            <asp:ListItem Text="Manitoba" Value="Manitoba" />
                                            <asp:ListItem Text="Saskatchewan" Value="Saskatchewan" />
                                            <asp:ListItem Text="Nova Scotia" Value="Nova Scotia" />
                                            <asp:ListItem Text="New Brunswick" Value="New Brunswick" />
                                            <asp:ListItem Text="Newfoundland and Labrador" Value="Newfoundland and Labrador" />
                                            <asp:ListItem Text="Prince Edward Island" Value="Prince Edward Island" />
                                            <asp:ListItem Text="Northwest Territories" Value="Northwest Territories" />
                                            <asp:ListItem Text="Yukon" Value="Yukon" />
                                            <asp:ListItem Text="Nunavut" Value="Nunavut" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <asp:Label ID="lblBillingPostalCode" runat="server" Text="Postal Code:"
                                        AssociatedControlID="txtBillingPostalCode" CssClass="control-label" />
                                    <div class="controls">
                                        <asp:TextBox ID="txtBillingPostalCode" runat="server" CssClass="input-mini input-caps" MaxLength="7" /><span class="field-required">*</span>
                                        <asp:Label ID="lblBillingPostalCodeHelpText" runat="server" CssClass="help-text" Text="i.e. A1B2C3" />
                                        <asp:RequiredFieldValidator ID="rfvBillingPostalCode" runat="server" ControlToValidate="txtBillingPostalCode"
                                            ValidationGroup="PersonalProfile" Display="Dynamic" CssClass="field-error-inline"
                                            Text="postal Code is a required field." />
                                    </div>
                                </div>
                            </asp:Panel>
                        </asp:Panel>
                    </asp:Panel>
                    <div class="form-actions">
                        <asp:Button ID="ButtonContactAction" runat="server" CssClass="btn btn-primary"
                            ValidationGroup="ValidationGroupContact" CausesValidation="true" Text="Contact Action" />
                        <asp:HyperLink ID="HyperLinkContactListing" runat="server" CssClass="btn" Text="Return to Contact Listing" NavigateUrl="~/Admin/Contacts.aspx" />
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
