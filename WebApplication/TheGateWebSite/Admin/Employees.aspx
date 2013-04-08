<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="TheGateWebSite.Admin.Employees" %>

<%@ Register TagPrefix="site" Namespace="UnorderedListDataPager" Assembly="UnorderedListDataPager" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <link rel="stylesheet" href="/css/jquery-ui-1.9.2.custom.css" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageTitleText" runat="server">
    Employees
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageShortDescription" runat="server">
    <p>Add and manage employees.</p>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="row">
        <div class="span12">
            <div class="review">
                <asp:UpdatePanel ID="UpdatePanelEmployees" runat="server">
                    <ContentTemplate>
                        <div class="accordion" id="accordion2">
                            <div class="accordion-group">
                                <div class="accordion-heading accordion-inverse">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#addProduct">
                                        <h5><i class="icon-plus"></i>&nbsp;Add a new employee</h5>
                                    </a>
                                </div>
                                <div id="addProduct" class="accordion-body collapse" style="height: 0px;">
                                    <div class="accordion-inner">
                                        <div class="form-horizontal">
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
                                                <div class="controls">
                                                    <asp:Panel ID="PanelAddAlertError" runat="server" CssClass="alert alert-error"
                                                        Visible="false">
                                                        <asp:Label ID="LabelAddAlert" runat="server"></asp:Label>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                            <div class="form-actions">
                                                <asp:Button ID="ButtonAddEmployee" runat="server" CssClass="btn btn-primary"
                                                    ValidationGroup="ValidationGroupAddEmployee" CausesValidation="true" OnClick="ButtonAddEmployee_Click" Text="Add Employee" />
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
                        <asp:ListView ID="ListViewEmployees" runat="server" OnItemCommand="ListViewEmployees_ItemCommand">
                            <LayoutTemplate>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center;">Employee Number</th>
                                            <th>Contact</th>
                                            <th style="text-align: center;">Salary</th>
                                            <th style="text-align: center;">Hourly Rate</th>
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
                                    <td style="text-align: center;"><%# Eval("employeeNumber") %></td>
                                    <td><%# Eval("contactID") %></td>
                                    <td style="text-align: center;"><%# Eval("salary").ToString() %></td>
                                    <td style="text-align: center;"><%# Eval("hourlyRate").ToString() %></td>
                                    <td style="text-align: left;">
                                        <asp:Button ID="ButtonCategoryManage" CommandName="EmployeeManage" CommandArgument='<%# Bind("employeeID") %>' runat="server" CssClass="btn btn-small" ToolTip="Manage" Text="Manage" />
                                        <asp:Button ID="ButtonCategoryDelete" CommandName="EmployeeDelete" CommandArgument='<%# Bind("employeeID") %>' runat="server" CssClass="btn btn-small" ToolTip="Delete" Text="Delete" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <div class="cta">
                                    <p style="text-align: center;">No employees found.</p>
                                </div>
                            </EmptyDataTemplate>
                        </asp:ListView>
                        <div class="pagination">
                            <site:UnorderedListDataPager ID="DataPagerEmployees" runat="server" PagedControlID="ListViewEmployees"
                                PageSize="5" OnPreRender="DataPagerEmployees_PreRender">
                                <Fields>
                                    <asp:NextPreviousPagerField ShowNextPageButton="false" ShowFirstPageButton="True" FirstPageText="&laquo;" PreviousPageText="&lsaquo;" />
                                    <asp:NumericPagerField ButtonCount="10" PreviousPageText="&hellip;" NextPageText="&hellip;" />
                                    <asp:NextPreviousPagerField ShowPreviousPageButton="false" ShowLastPageButton="True" LastPageText="&raquo;" NextPageText="&rsaquo;" />
                                </Fields>
                            </site:UnorderedListDataPager>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ListViewEmployees" />
                        <asp:PostBackTrigger ControlID="ButtonAddEmployee" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="UpdateProgressProducts" AssociatedUpdatePanelID="UpdatePanelEmployees" runat="server">
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
    <script src="/js/jquery-ui-1.9.2.custom.js"></script>
    <script>
        $(function () {
            $("#<%=TextBoxStartDate.ClientID %>").datepicker();
        });
  </script>
</asp:Content>

