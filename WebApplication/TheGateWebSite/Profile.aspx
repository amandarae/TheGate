<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="TheGateWebSite.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Breadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageTitle" runat="server">
    My Account
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentFull" runat="server">
    <div class="row">
        <div class="span12">
            <p>Please complete the form below to register a new account.</p>
            <p>&nbsp;</p>
        </div>
    </div>
    <div class="row">
        <div class="span8">
            <div class="form-horizontal">
                <fieldset>
                    <%--<legend>New User Registration</legend>--%>
                    <div class="control-group">
                        <asp:Label runat="server" ID="LabelEmail" AssociatedControlID="TextBoxEmail" CssClass="control-label">Email:</asp:Label>
                        <div class="controls">
                            <asp:TextBox runat="server" ID="TextBoxEmail" CssClass="input-xlarge"></asp:TextBox> <span class="field-required">*</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Email Address"
                                Text="Please enter a valid email address." ToolTip="Please enter a valid email address." ControlToValidate="TextBoxEmail"
                                ValidationGroup="ValidationGroupRegister" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server"
                                ErrorMessage="" Text="Please enter a valid email address." ToolTip="Please enter a valid email address."
                                ControlToValidate="TextBoxEmail" ValidationExpression="^[a-zA-Z]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z]*)*\s+&amp;lt;(\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,3})&amp;gt;$|^(\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,3})$"
                                ValidationGroup="ValidationGroupUpdateProfile" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label runat="server" ID="LabelFirstName" AssociatedControlID="TextBoxFirstName"
                            CssClass="control-label">First Name:</asp:Label>
                        <div class="controls">
                            <asp:TextBox runat="server" ID="TextBoxFirstName"></asp:TextBox> <span class="field-required">*</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server" ErrorMessage="First Name"
                                Text="Please enter your first name." ToolTip="Please enter your first name." ControlToValidate="TextBoxFirstName"
                                ValidationGroup="ValidationGroupUpdateProfile" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label runat="server" ID="LabelLastName" AssociatedControlID="TextBoxLastName"
                            CssClass="control-label">Last Name:</asp:Label>
                        <div class="controls">
                            <asp:TextBox runat="server" ID="TextBoxLastName"></asp:TextBox> <span class="field-required">*</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" runat="server" ErrorMessage="Last Name"
                                Text="Please enter your last name." ToolTip="Please enter your last name." ControlToValidate="TextBoxLastName"
                                ValidationGroup="ValidationGroupUpdateProfile" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label ID="lblContactPhone" runat="server" Text="Phone Number:"
                            AssociatedControlID="txtContactPhone" CssClass="control-label" />
                        <div class="controls">
                            <asp:TextBox ID="txtContactPhone" runat="server" CssClass="input-small" />
                            <asp:RequiredFieldValidator ID="rfvContactPhone" runat="server" ControlToValidate="txtContactPhone"
                                ValidationGroup="ValidationGroupUpdateProfile" Display="Dynamic" CssClass="field-error-inline"
                                Text="Phone Number is a required field" />
                            <asp:RegularExpressionValidator ID="revContactPhone" runat="server" ControlToValidate="txtContactPhone"
                                ValidationGroup="ValidationGroupUpdateProfile" Display="Dynamic" CssClass="field-error-inline"
                                Text="Please enter a valid 10 digit phone number."
                                ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$" />
                            <asp:Label ID="LabelPhoneHelp" runat="server" CssClass="help-text" Text="i.e. 416-555-1234" />
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <asp:Panel ID="PanelRegisterAlertError" runat="server" CssClass="alert alert-error"
                                Visible="false">
                                <asp:Label ID="LabelRegisterAlert" runat="server"></asp:Label>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="form-actions">
                        <asp:Button ID="ButtonUpdateProfile" runat="server" CssClass="btn btn-inverse"
                            ValidationGroup="ValidationGroupUpdateProfile" CausesValidation="true" OnClick="ButtonUpdateProfile_Click" Text="Update Profile"></asp:Button>
                    </div>
                </fieldset>
            </div>
        </div>
        <div class="span4">
            <h3>Address Details</h3>
            <asp:HyperLink ID="lnkAddBillingAddress" runat="server" Text="Add a billing address" />

            <asp:Panel ID="pnlBillingAddress" runat="server">
                <h4>Billing Address</h4>
            </asp:Panel>
            <asp:Panel ID="pnlShippingAddress" runat="server">
                <h4>Shipping Address</h4>
            </asp:Panel>
        </div>
    </div>
    
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
