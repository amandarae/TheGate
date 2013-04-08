<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="EmployeeDetails.aspx.cs" Inherits="TheGateWebSite.Admin.EmployeeDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <link rel="stylesheet" href="/css/jquery-ui-1.9.2.custom.css" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageTitleText" runat="server">
    Employee Details
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

                <asp:Panel ID="PanelEmployeeForm" runat="server" CssClass="form-horizontal">
                    <div class="control-group">
                        <asp:Label runat="server" ID="LabelContact" AssociatedControlID="ddlContact"
                            CssClass="control-label">Contact:</asp:Label>
                        <div class="controls">
                            <asp:DropDownList ID="ddlContact" runat="server" />
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label runat="server" ID="LabelEmployeeNumber" AssociatedControlID="TextBoxEmployeeNumber"
                            CssClass="control-label">Employee Number:</asp:Label>
                        <div class="controls">
                            <asp:TextBox runat="server" ID="TextBoxEmployeeNumber" CssClass="input-small"></asp:TextBox><span class="field-required">*</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Price"
                                Text="Price is a required field." ToolTip="Employee Number is a required field." ControlToValidate="TextBoxEmployeeNumber"
                                ValidationGroup="ValidationGroupAddEmployee" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label runat="server" ID="LabelSalary" AssociatedControlID="TextBoxSalary"
                            CssClass="control-label">Salary:</asp:Label>
                        <div class="controls">
                            <asp:TextBox runat="server" ID="TextBoxSalary" MaxLength="9" CssClass="input-small"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revSalary" ControlToValidate="TextBoxSalary" runat="server" Display="Dynamic"
                                ValidationExpression="^\d{1,6}(\.(\d{1,2})?)?$" ForeColor="Red" Text="Salary Range 0.00 - 999,99.99" />
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label runat="server" ID="LabelHourlyRate" AssociatedControlID="TextBoxHourlyRate"
                            CssClass="control-label">Hourly Rate:</asp:Label>
                        <div class="controls">
                            <asp:TextBox runat="server" ID="TextBoxHourlyRate" MaxLength="5" CssClass="input-small"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TextBoxHourlyRate" runat="server" Display="Dynamic"
                                ValidationExpression="^\d{1,2}(\.(\d{1,2})?)?$" ForeColor="Red" Text="Hourly Rate Range 0.00 - 99.99" />
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label runat="server" ID="LabelStartDate" AssociatedControlID="TextBoxStartDate"
                            CssClass="control-label">Start Date:</asp:Label>
                        <div class="controls">
                            <asp:TextBox runat="server" ID="TextBoxStartDate" CssClass="input-small"></asp:TextBox>
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label runat="server" ID="LabelEndDate" AssociatedControlID="TextBoxEndDate"
                            CssClass="control-label">End Date:</asp:Label>
                        <div class="controls">
                            <asp:TextBox runat="server" ID="TextBoxEndDate" CssClass="input-small"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-actions">
                        <asp:Button ID="ButtonUpdateEmployee" runat="server" CssClass="btn btn-primary"
                            ValidationGroup="ValidationGroupAddEmployee" CausesValidation="true" OnClick="ButtonUpdateEmployee_Click" Text="Update Employee" />
                        <asp:HyperLink ID="HyperLinkEmployeeListing" runat="server" CssClass="btn" Text="Return to Product Listing" NavigateUrl="~/Admin/Employees.aspx" />
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="Scripts" runat="server">
    <script src="/js/jquery-ui-1.9.2.custom.js"></script>
    <script>
        $(function () {
            $("#<%=TextBoxStartDate.ClientID %>").datepicker();

            $("#<%=TextBoxEndDate.ClientID %>").datepicker();
        });
  </script>
</asp:Content>
