<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TheGateWebSite.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Breadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageTitleText" runat="server">
    Register an Account
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentFull" runat="server">

    <div class="row">
        <div class="span12">

            <!-- Register starts -->

            <div class="logreg">
                <div class="row">
                    <div class="span12">
                        <div class="logreg-page">
                            <h3>Register with <span class="color">Site Name</span></h3>
                            <hr />
                            <div class="form">
                                <!-- Register form -->
                                <div class="form-horizontal">
                                    <div class="control-group">
                                        <asp:Label runat="server" ID="LabelEmail" AssociatedControlID="TextBoxEmail" CssClass="control-label">Email:</asp:Label>
                                        <div class="controls">
                                            <asp:TextBox runat="server" ID="TextBoxEmail" CssClass="input-xlarge"></asp:TextBox>
                                            <span class="field-required">*</span>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Email Address"
                                                Text="Please enter a valid email address." ToolTip="Please enter a valid email address." ControlToValidate="TextBoxEmail"
                                                ValidationGroup="ValidationGroupRegister" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server"
                                                ErrorMessage="" Text="Please enter a valid email address." ToolTip="Please enter a valid email address."
                                                ControlToValidate="TextBoxEmail" ValidationExpression="^[a-zA-Z]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z]*)*\s+&amp;lt;(\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,3})&amp;gt;$|^(\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,3})$"
                                                ValidationGroup="ValidationGroupRegister" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <asp:Label runat="server" ID="LabelPassword" AssociatedControlID="TextBoxPassword"
                                            CssClass="control-label">Password:</asp:Label>
                                        <div class="controls">
                                            <asp:TextBox runat="server" ID="TextBoxPassword" TextMode="Password"></asp:TextBox>
                                            <span class="field-required">*</span>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="Password"
                                                Text="Please enter a password." ToolTip="Please enter a password." ControlToValidate="TextBoxPassword"
                                                ValidationGroup="ValidationGroupRegister" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <asp:Label runat="server" ID="LabelPasswordConfirm" AssociatedControlID="TextBoxPasswordConfirm"
                                            CssClass="control-label">Confirm Password:</asp:Label>
                                        <div class="controls">
                                            <asp:TextBox runat="server" ID="TextBoxPasswordConfirm" TextMode="Password"></asp:TextBox>
                                            <span class="field-required">*</span>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPasswordConfirm" runat="server"
                                                ErrorMessage="Confirm Password" Text="Please enter your password again to confirm." ToolTip="Please enter your password again to confirm."
                                                ControlToValidate="TextBoxPasswordConfirm" ValidationGroup="ValidationGroupRegister"
                                                ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidatorPasswords" runat="server" ErrorMessage=""
                                                Text="Passwords do not match." ForeColor="Red" ControlToCompare="TextBoxPassword"
                                                ValidationGroup="ValidationGroupRegister" ControlToValidate="TextBoxPasswordConfirm" Display="Dynamic"></asp:CompareValidator>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <asp:Label runat="server" ID="LabelFirstName" AssociatedControlID="TextBoxFirstName"
                                            CssClass="control-label">First Name:</asp:Label>
                                        <div class="controls">
                                            <asp:TextBox runat="server" ID="TextBoxFirstName"></asp:TextBox>
                                            <span class="field-required">*</span>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server" ErrorMessage="First Name"
                                                Text="Please enter your first name." ToolTip="Please enter your first name." ControlToValidate="TextBoxFirstName"
                                                ValidationGroup="ValidationGroupRegister" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <asp:Label runat="server" ID="LabelLastName" AssociatedControlID="TextBoxLastName"
                                            CssClass="control-label">Last Name:</asp:Label>
                                        <div class="controls">
                                            <asp:TextBox runat="server" ID="TextBoxLastName"></asp:TextBox>
                                            <span class="field-required">*</span>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" runat="server" ErrorMessage="Last Name"
                                                Text="Please enter your last name." ToolTip="Please enter your last name." ControlToValidate="TextBoxLastName"
                                                ValidationGroup="ValidationGroupRegister" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <asp:Label ID="lblContactPhone" runat="server" Text="Phone Number:"
                                            AssociatedControlID="txtContactPhone" CssClass="control-label" />
                                        <div class="controls">
                                            <asp:TextBox ID="txtContactPhone" runat="server" CssClass="input-small" />
                                            <asp:RequiredFieldValidator ID="rfvContactPhone" runat="server" ControlToValidate="txtContactPhone"
                                                ValidationGroup="ValidationGroupRegister" Display="Dynamic" CssClass="field-error-inline"
                                                Text="Phone Number is a required field" />
                                            <asp:RegularExpressionValidator ID="revContactPhone" runat="server" ControlToValidate="txtContactPhone"
                                                ValidationGroup="ValidationGroupRegister" Display="Dynamic" CssClass="field-error-inline"
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

                                        <!-- Buttons -->
                                        <div class="form-actions">
                                            <!-- Buttons -->
                                            <asp:Button ID="ButtonRegister" runat="server" CssClass="btn btn-large"
                                                ValidationGroup="ValidationGroupRegister" CausesValidation="true" OnClick="ButtonRegister_Click" Text="Register"></asp:Button>
                                            <button type="reset" class="btn">Reset</button>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="lregister">
                                        Already have account with us? <a href="~/Login.aspx" runat="server">Login</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Login ends -->

                <!-- CTA starts -->

                <div class="cta">
                    <div class="row">
                        <div class="span9">
                            <!-- First line -->
                            <p class="cbig">Lorem ipsum consectetur dolor sit amet, consectetur adipiscing.</p>
                            <!-- Second line -->
                            <p class="csmall">Duis vulputate consectetur malesuada eros nec odio consect eturegestas et netus et in dictum nisi vehicula.</p>
                        </div>
                        <div class="span2">
                            <!-- Button -->
                            <div class="button"><a href="#">Get A Free Trail</a></div>
                        </div>
                    </div>
                </div>

                <!-- CTA Ends -->

            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
