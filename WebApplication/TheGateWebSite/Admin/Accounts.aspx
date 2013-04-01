<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="Accounts.aspx.cs" Inherits="TheGateWebSite.Admin.Accounts" %>

<%@ Register TagPrefix="site" Namespace="UnorderedListDataPager" Assembly="UnorderedListDataPager" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageTitleText" runat="server">
    Accounts
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageShortDescription" runat="server">
    <p>Add and manage accounts.</p>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="row">
        <div class="span12">
            <div class="review">
                <asp:UpdatePanel ID="UpdatePanelAccounts" runat="server">
                    <ContentTemplate>
                        <div class="navbar-form">
                            <asp:HyperLink ID="hyperlinkAddAccount" runat="server" Text="Add Account" CssClass="btn btn-primary" NavigateUrl="AccountDetails.aspx" />
                            <div class="pull-right">
                                <asp:TextBox ID="textboxSearchQuery" runat="server" />
                                <asp:Button ID="buttonSearch" runat="server" Text="Search" CssClass="btn" OnClick="buttonSearch_Click" />
                            </div>
                        </div>
                        <asp:Panel ID="pnlError" runat="server" CssClass="alert alert-error" Visible="false">
                            <asp:Label ID="lblErrorMsg" runat="server" />
                        </asp:Panel>
                        <asp:Panel ID="pnlSuccess" runat="server" CssClass="alert alert-success" Visible="false">
                            <asp:Label ID="lblSuccessMsg" runat="server" />
                        </asp:Panel>
                        <asp:ListView ID="ListViewAccounts" runat="server">
                            <LayoutTemplate>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center;">Account ID</th>
                                            <th>Account Number</th>
                                            <th>Account Name</th>
                                            <th>Primary Contact</th>
                                            <th>Phone</th>
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
                                        <asp:HyperLink ID="hyperlinkContact" runat="server" Text='<%# Eval("accountID") %>' NavigateUrl='<%# GetAccountDetailLink(Container.DataItem as TheGateWebSite.Model.Account) %>' /></td>
                                    <td><%# Eval("accountNumber") %></td>
                                    <td><%# Eval("accountName") %></td>
                                    <td><%# GetAccountPrimaryContactLink(Container.DataItem as TheGateWebSite.Model.Account) %></td>
                                    <td><%# Eval("phone") %></td>
                                    <td></td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <div class="cta">
                                    <p style="text-align: center;">No accounts found.</p>
                                </div>
                            </EmptyDataTemplate>
                        </asp:ListView>
                        <div class="pagination">
                            <site:UnorderedListDataPager ID="DataPagerAccounts" runat="server" PagedControlID="ListViewAccounts"
                                PageSize="5" OnPreRender="DataPagerAccounts_PreRender">
                                <Fields>
                                    <asp:NextPreviousPagerField ShowNextPageButton="false" ShowFirstPageButton="True" FirstPageText="&laquo;" PreviousPageText="&lsaquo;" />
                                    <asp:NumericPagerField ButtonCount="10" PreviousPageText="&hellip;" NextPageText="&hellip;" />
                                    <asp:NextPreviousPagerField ShowPreviousPageButton="false" ShowLastPageButton="True" LastPageText="&raquo;" NextPageText="&rsaquo;" />
                                </Fields>
                            </site:UnorderedListDataPager>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ListViewAccounts" />
                        <asp:PostBackTrigger ControlID="buttonSearch" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="UpdateProgressAccounts" AssociatedUpdatePanelID="UpdatePanelAccounts" runat="server">
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
</asp:Content>

