<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="TheGateWebSite.Admin.Categories" %>

<%@ Register TagPrefix="site" Namespace="UnorderedListDataPager" Assembly="UnorderedListDataPager" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageTitleText" runat="server">
    Categories
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageShortDescription" runat="server">
    <p>Add and manage product categories.</p>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="row">
        <div class="span12">
                    <div class="review">
            <asp:UpdatePanel ID="UpdatePanelCategories" runat="server">
                <ContentTemplate>

                        <div class="accordion" id="accordion2">
                            <div class="accordion-group">
                                <div class="accordion-heading accordion-inverse">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#addCategory">
                                        <h5><i class="icon-plus"></i>&nbsp;Add a new category</h5>
                                    </a>
                                </div>
                                <div id="addCategory" class="accordion-body collapse" style="height: 0px;">
                                    <div class="accordion-inner">
                                        <div class="form-horizontal">
                                            <div class="control-group">
                                                <asp:Label runat="server" ID="LabelName" AssociatedControlID="TextBoxName"
                                                    CssClass="control-label">Category Name:</asp:Label>
                                                <div class="controls">
                                                    <asp:TextBox runat="server" ID="TextBoxName" CssClass="input-xlarge"></asp:TextBox>
                                                    <span class="field-required">*</span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server" ErrorMessage="First Name"
                                                        Text="Category name is a required field." ToolTip="Category name is a required field." ControlToValidate="TextBoxName"
                                                        ValidationGroup="ValidationGroupAddCategory" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
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
                                                <asp:Button ID="ButtonAddCategory" runat="server" CssClass="btn btn-primary"
                                                    ValidationGroup="ValidationGroupAddCategory" CausesValidation="true" OnClick="ButtonAddCategory_Click" Text="Add Category" />
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
                        <asp:ListView ID="ListViewCategories" runat="server" OnItemCommand="ListViewCategories_ItemCommand">
                            <LayoutTemplate>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center;">Category ID
                                            </th>
                                            <th>Name
                                            </th>
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
                                    <td style="text-align: center;">
                                        <%# Eval("categoryID") %></td>
                                    <td><%# Eval("name") %></td>
                                    <td style="text-align: left;">
                                        <asp:Button ID="ButtonCategoryEdit" CommandName="CategoryEdit" runat="server" CssClass="btn btn-small" ToolTip="Edit" Text="Edit" />
                                        <asp:Button ID="ButtonCategoryDelete" CommandName="CategoryDelete" CommandArgument='<%# Bind("categoryID") %>' runat="server" CssClass="btn btn-small" ToolTip="Delete" Text="Delete" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <tr>
                                    <td style="text-align: center;"><%# Eval("categoryID") %></td>
                                    <td>
                                        <asp:TextBox ID="TextBoxCategoryName" runat="server" Text='<%# Bind("name") %>' />
                                        <asp:RequiredFieldValidator ID="rfvCategoryName" runat="server" ControlToValidate="TextBoxCategoryName" Display="Dynamic" ErrorMessage="*" ForeColor="Red" /></td>
                                    <td>
                                        <asp:Button ID="ButtonCategoryUpdate" CommandName="CategoryUpdate" CommandArgument='<%# Bind("categoryID") %>' runat="server" CssClass="btn btn-small" ToolTip="Update" Text="Update" CausesValidation="true" />
                                        <asp:Button ID="ButtonCategoryCancel" CommandName="CategoryCancel" runat="server" CssClass="btn btn-small" ToolTip="Cancel" Text="Cancel" CausesValidation="false" />
                                    </td>
                                </tr>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <div class="cta">
                                    <p style="text-align: center;">No categories found.</p>
                                </div>
                            </EmptyDataTemplate>
                        </asp:ListView>
                        <div class="pagination">
                            <site:UnorderedListDataPager ID="DataPagerCategories" runat="server" PagedControlID="ListViewCategories"
                                PageSize="15" OnPreRender="DataPagerCategories_PreRender">
                                <Fields>
                                    <asp:NextPreviousPagerField ShowNextPageButton="false" ShowFirstPageButton="True" FirstPageText="&laquo;" PreviousPageText="&lsaquo;" />
                                    <asp:NumericPagerField ButtonCount="10" PreviousPageText="&hellip;" NextPageText="&hellip;" />
                                    <asp:NextPreviousPagerField ShowPreviousPageButton="false" ShowLastPageButton="True" LastPageText="&raquo;" NextPageText="&rsaquo;" />
                                </Fields>
                            </site:UnorderedListDataPager>
                        </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ListViewCategories" />
                    <asp:AsyncPostBackTrigger ControlID="ButtonAddCategory" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:UpdateProgress ID="UpdateProgressCategories" AssociatedUpdatePanelID="UpdatePanelCategories" runat="server">
                <ProgressTemplate>
                    <div class="update-progress-back">
                        <img src="~/img/301.gif" runat="server" />
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
                    </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
