<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TheGateWebSite.Login" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentFull" runat="server">
    <div class="row">
        <div class="span12">

            <!-- Login starts -->

            <div class="logreg">
                <div class="row">
                    <div class="offset3 span6">
                        <div class="logreg-page">
                            <h3>Sign In to <span class="color">The Gate</span></h3>
                            <hr />
                            <asp:Login ID="Login1" runat="server" RenderOuterTable="false" DestinationPageUrl="~/Profile.aspx">
                                <LayoutTemplate>
                                    <div class="form">
                                        <!-- Login form (not working)-->
                                        <div class="form-horizontal">
                                            <!-- Username -->
                                            <div class="control-group">
                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" CssClass="control-label">User Name:</asp:Label>
                                                <div class="controls">
                                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" CssClass="field-required" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="loginPage">*</asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <!-- Password -->
                                            <div class="control-group">
                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" CssClass="control-label">Password:</asp:Label>
                                                <div class="controls">
                                                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" CssClass="field-required" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="loginPage">*</asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <div class="controls">
                                                    <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." CssClass="aspcheckbox-group" />
                                                </div>
                                            </div>
                                            <div class="field-error-inline">
                                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                            </div>
                                            <!-- Buttons -->
                                            <div class="form-actions">
                                                <!-- Buttons -->
                                                <asp:Button ID="LoginButton" runat="server" CssClass="btn" CommandName="Login" Text="Log In" ValidationGroup="loginPage" />
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="lregister">
                                            Don't have Account? <a href="/Register.aspx" runat="server">Register</a>
                                        </div>
                                    </div>


                                </LayoutTemplate>
                            </asp:Login>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Login ends -->

        </div>
    </div>

</asp:Content>
