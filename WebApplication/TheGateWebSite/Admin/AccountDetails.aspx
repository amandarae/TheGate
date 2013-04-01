<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="AccountDetails.aspx.cs" Inherits="TheGateWebSite.Admin.AccountDetails" %>

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

                <asp:Panel ID="PanelAccountForm" runat="server" CssClass="form-horizontal">
                    <div class="control-group">
                        <asp:Label ID="lblAccountNumber" runat="server" Text="Account Number:"
                            AssociatedControlID="txtAccountNumber" CssClass="control-label" />
                        <div class="controls">
                            <asp:TextBox ID="txtAccountNumber" runat="server" CssClass="input-medium" /><span class="field-required">*</span>
                            <asp:RequiredFieldValidator ID="rfvAccountNumber" runat="server" ControlToValidate="txtAccountNumber"
                                ValidationGroup="PersonalProfile" Display="Dynamic" CssClass="field-error-inline"
                                Text="Account Number is a required field." />
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label ID="lblAccountName" runat="server" Text="Account Name:"
                            AssociatedControlID="txtAccountName" CssClass="control-label" />
                        <div class="controls">
                            <asp:TextBox ID="txtAccountName" runat="server" CssClass="input-large" /><span class="field-required">*</span>
                            <asp:RequiredFieldValidator ID="rfvAccountName" runat="server" ControlToValidate="txtAccountName"
                                ValidationGroup="PersonalProfile" Display="Dynamic" CssClass="field-error-inline"
                                Text="Account Name is a required field." />
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label ID="lblPrimaryContact" runat="server" Text="Primary Contact:"
                            AssociatedControlID="ddlPrimaryContact" CssClass="control-label" />
                        <div class="controls">
                            <asp:DropDownList ID="ddlPrimaryContact" runat="server" />
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label ID="lblGeneralEmail" runat="server" Text="General Email:"
                            AssociatedControlID="txtGeneralEmail" CssClass="control-label" />
                        <div class="controls">
                            <asp:TextBox ID="txtGeneralEmail" runat="server" CssClass="input-xlarge" /><span class="field-required">*</span>
                            <asp:RequiredFieldValidator ID="rfvGeneralEmail" runat="server" ControlToValidate="txtGeneralEmail"
                                ValidationGroup="PersonalProfile" Display="Dynamic" CssClass="field-error-inline"
                                Text="Email is a required field." />
                            <asp:RegularExpressionValidator ID="revGeneralEmail" runat="server" ControlToValidate="txtGeneralEmail"
                                ValidationGroup="PersonalProfile" Display="Dynamic" CssClass="field-error-inline"
                                Text="Please enter a valid email address." ValidationExpression="^[a-zA-Z]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z]*)*\s+&amp;lt;(\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,3})&amp;gt;$|^(\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,3})$" />
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label ID="lblAccountPhone" runat="server" Text="Phone Number:"
                            AssociatedControlID="txtAccountPhone" CssClass="control-label" />
                        <div class="controls">
                            <asp:TextBox ID="txtAccountPhone" runat="server" CssClass="input-small" /><span class="field-required">*</span>
                            <asp:RequiredFieldValidator ID="rfvAccountPhone" runat="server" ControlToValidate="txtAccountPhone"
                                ValidationGroup="PersonalProfile" Display="Dynamic" CssClass="field-error-inline"
                                Text="Phone Number is a required field." />
                            <asp:RegularExpressionValidator ID="revAccountPhone" runat="server" ControlToValidate="txtAccountPhone"
                                ValidationGroup="PersonalProfile" Display="Dynamic" CssClass="field-error-inline"
                                Text="Please enter a valid 10 digit phone number."
                                ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$" />
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label ID="lblAccountFax" runat="server" Text="Fax Number:"
                            AssociatedControlID="txtAccountFax" CssClass="control-label" />
                        <div class="controls">
                            <asp:TextBox ID="txtAccountFax" runat="server" CssClass="input-small" />
                            <asp:RegularExpressionValidator ID="revAccountFax" runat="server" ControlToValidate="txtAccountFax"
                                ValidationGroup="PersonalProfile" Display="Dynamic" CssClass="field-error-inline"
                                Text="Please enter a valid 10 digit Fax number."
                                ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$" />
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label ID="lblWebsite" runat="server" Text="Web Site:"
                            AssociatedControlID="txtWebsite" CssClass="control-label" />
                        <div class="controls">
                            <asp:TextBox ID="txtWebsite" runat="server" CssClass="input-xlarge" />
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
                        <asp:Button ID="ButtonAccountAction" runat="server" CssClass="btn btn-primary"
                            ValidationGroup="ValidationGroupContact" CausesValidation="true" Text="Account Action" />
                        <asp:HyperLink ID="HyperLinkContactListing" runat="server" CssClass="btn" Text="Return to Contact Listing" NavigateUrl="~/Admin/Accounts.aspx" />
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
