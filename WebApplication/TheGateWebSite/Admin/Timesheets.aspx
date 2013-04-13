<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="Timesheets.aspx.cs" Inherits="TheGateWebSite.Admin.Timesheets" %>

<%@ Register TagPrefix="site" Namespace="UnorderedListDataPager" Assembly="UnorderedListDataPager" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <link rel="stylesheet" href="/css/jquery-ui-1.9.2.custom.css" />
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
                <asp:UpdatePanel ID="UpdatePanelTimesheets" runat="server">
                    <ContentTemplate>
                        <div class="accordion" id="accordion2">
                            <div class="accordion-group">
                                <div class="accordion-heading accordion-inverse">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#addProduct">
                                        <h5><i class="icon-plus"></i>&nbsp;Add a new timesheet</h5>
                                    </a>
                                </div>
                                <div id="addProduct" class="accordion-body collapse" style="height: 0px;">
                                    <div class="accordion-inner">
                                        <div class="form-horizontal">
                                            <div class="control-group">
                                                <asp:Label runat="server" ID="LabelDate" AssociatedControlID="TextBoxDate"
                                                    CssClass="control-label">Date:</asp:Label>
                                                <div class="controls">
                                                        <asp:TextBox runat="server" ID="TextBoxDate" CssClass="input-mini"></asp:TextBox>
                                                    <span class="field-required">*</span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" runat="server" ErrorMessage="Time"
                                                        Text="Date is a required field." ToolTip="Date is a required field." ControlToValidate="TextBoxDate"
                                                        ValidationGroup="ValidationGroupAddTimesheet" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <asp:Label runat="server" ID="LabelTime" AssociatedControlID="TextBoxTime"
                                                    CssClass="control-label">Time:</asp:Label>
                                                <div class="controls">
                                                    <asp:TextBox runat="server" ID="TextBoxTime" CssClass="input-xlarge"></asp:TextBox>
                                                    <span class="field-required">*</span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTime" runat="server" ErrorMessage="Time"
                                                        Text="Time is a required field." ToolTip="Time is a required field." ControlToValidate="TextBoxTime"
                                                        ValidationGroup="ValidationGroupAddTimesheet" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorTime" ControlToValidate="TextBoxTime" runat="server" Display="Dynamic"
                                                        ValidationExpression="^\d{1,2}(\.(\d{1,2})?)?$" ForeColor="Red" Text="Hour Range 0.00 - 99.99" />
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <asp:Label runat="server" ID="LabelCategory" AssociatedControlID="ddlCategory"
                                                    CssClass="control-label">Category:</asp:Label>
                                                <div class="controls">
                                                    <asp:DropDownList ID="ddlCategory" runat="server">
                                                        <asp:ListItem Text="Administration" Value="Administration" />
                                                        <asp:ListItem Text="Cash" Value="Cash" />
                                                        <asp:ListItem Text="Sales" Value="Sales" />
                                                        <asp:ListItem Text="Inventory" Value="Inventory" />
                                                        <asp:ListItem Text="Shipping/Recieving" Value="Shipping/Recieving" />
                                                    </asp:DropDownList>
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
                                                <asp:Button ID="ButtonAddTimesheet" runat="server" CssClass="btn btn-primary"
                                                    ValidationGroup="ValidationGroupAddTimesheet" CausesValidation="true" OnClick="ButtonAddTimesheet_Click" Text="Add Time Entry" />
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
                        <asp:ListView ID="ListViewTimesheets" runat="server">
                            <LayoutTemplate>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center;">Time ID</th>
                                            <th style="text-align: center;">Date</th>
                                            <th style="text-align: center;">Time</th>
                                            <th>Category</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                    </tbody>
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td style="text-align: center;"><%# Eval("timeID") %></td>
                                    <td style="text-align: center;"><%# Eval("date", "{0:MMM/dd/yyyy}") %></td>
                                    <td style="text-align: center;"><%# Eval("hours").ToString() %></td>
                                    <td><%# Eval("category") %></td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <div class="cta">
                                    <p style="text-align: center;">No time entries found.</p>
                                </div>
                            </EmptyDataTemplate>
                        </asp:ListView>
                        <div class="pagination">
                            <site:UnorderedListDataPager ID="DataPagerTimesheets" runat="server" PagedControlID="ListViewTimesheets"
                                PageSize="25" OnPreRender="DataPagerTimesheets_PreRender">
                                <Fields>
                                    <asp:NextPreviousPagerField ShowNextPageButton="false" ShowFirstPageButton="True" FirstPageText="&laquo;" PreviousPageText="&lsaquo;" />
                                    <asp:NumericPagerField ButtonCount="10" PreviousPageText="&hellip;" NextPageText="&hellip;" />
                                    <asp:NextPreviousPagerField ShowPreviousPageButton="false" ShowLastPageButton="True" LastPageText="&raquo;" NextPageText="&rsaquo;" />
                                </Fields>
                            </site:UnorderedListDataPager>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ListViewTimesheets" />
                        <asp:PostBackTrigger ControlID="ButtonAddTimesheet" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="UpdateProgressTimesheets" AssociatedUpdatePanelID="UpdatePanelTimesheets" runat="server">
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
            $("#<%=TextBoxDate.ClientID %>").datepicker();
        });
  </script>
</asp:Content>

