<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TheGateWebSite.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Breadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageTitleText" runat="server">
    Register an Account
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="row">
        <div class="span12">
            <p>Please complete the form below to register a new account.</p>
            <p>&nbsp;</p>
        </div>
    </div>
    <div class="form-horizontal">
                <fieldset>
                    <%--<legend>New User Registration</legend>--%>
                    <div class="control-group">
                        <asp:Label runat="server" ID="LabelEmail" AssociatedControlID="TextBoxEmail" CssClass="control-label">Email:</asp:Label>
                        <div class="controls">
                            <asp:TextBox runat="server" ID="TextBoxEmail" CssClass="input-xlarge"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Email Address"
                                Text="*" ToolTip="Please enter a valid email address." ControlToValidate="TextBoxEmail"
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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="Password"
                                Text="*" ToolTip="Please enter a password." ControlToValidate="TextBoxPassword"
                                ValidationGroup="ValidationGroupRegister" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label runat="server" ID="LabelPasswordConfirm" AssociatedControlID="TextBoxPasswordConfirm"
                            CssClass="control-label">Confirm Password:</asp:Label>
                        <div class="controls">
                            <asp:TextBox runat="server" ID="TextBoxPasswordConfirm" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPasswordConfirm" runat="server"
                                ErrorMessage="Confirm Password" Text="*" ToolTip="Please enter your password again to confirm."
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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server" ErrorMessage="First Name"
                                Text="*" ToolTip="Please enter your first name." ControlToValidate="TextBoxFirstName"
                                ValidationGroup="ValidationGroupRegister" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label runat="server" ID="LabelLastName" AssociatedControlID="TextBoxLastName"
                            CssClass="control-label">Last Name:</asp:Label>
                        <div class="controls">
                            <asp:TextBox runat="server" ID="TextBoxLastName"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" runat="server" ErrorMessage="Last Name"
                                Text="*" ToolTip="Please enter your last name." ControlToValidate="TextBoxLastName"
                                ValidationGroup="ValidationGroupRegister" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <%--<div class="control-group">
                            <asp:Label runat="server" ID="LabelCompany" AssociatedControlID="TextBoxCompany"
                                CssClass="control-label">Company:</asp:Label>
                            <div class="controls">
                                <asp:TextBox runat="server" ID="TextBoxCompany" CssClass="input-xlarge"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCompany" runat="server" ErrorMessage="Company"
                                    Text="*" ToolTip="Please enter your company name." ControlToValidate="TextBoxCompany"
                                    ValidationGroup="ValidationGroupRegister" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="control-group">
                            <asp:Label runat="server" ID="LabelJobTitle" AssociatedControlID="TextBoxJobTitle"
                                CssClass="control-label">Job Title:</asp:Label>
                            <div class="controls">
                                <asp:TextBox runat="server" ID="TextBoxJobTitle" CssClass="input-xlarge"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorJobTitle" runat="server" ErrorMessage="Job Title."
                                    Text="*" ToolTip="Please enter your job title." ControlToValidate="TextBoxJobTitle"
                                    ValidationGroup="ValidationGroupRegister" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <asp:CheckBox runat="server" ID="CheckBoxOptInNewContent" Checked="false" CssClass="aspcheckbox-group"
                                    Text="Opt-In for new member content notifications" />
                                <asp:CheckBox runat="server" ID="CheckBoxOptInMarketing" Checked="false" CssClass="aspcheckbox-group"
                                    Text="Opt-In for SPM Learning news (blogs, articles, newsletters) and marketing promotions" />
                            </div>
                        </div>--%>
                    <div class="control-group">
                        <div class="controls">
                            <asp:ValidationSummary ID="ValidationSummaryRegistration" runat="server" HeaderText="Please review the following fields to continue.  * indicates a required field."
                                ShowSummary="true" DisplayMode="BulletList" EnableClientScript="true" ValidationGroup="ValidationGroupRegister"
                                CssClass="alert alert-error" />
                            <asp:Panel ID="PanelRegisterAlertError" runat="server" CssClass="alert alert-error"
                                Visible="false">
                                <asp:Label ID="LabelRegisterAlert" runat="server"></asp:Label>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="form-actions">
                        <asp:LinkButton ID="LinkButtonRegister" runat="server" CssClass="btn btn-large btn-inverse"
                            ValidationGroup="ValidationGroupRegister" CausesValidation="true" OnClick="LinkButtonRegister_Click">Register</asp:LinkButton>
                    </div>
                </fieldset>
            </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
