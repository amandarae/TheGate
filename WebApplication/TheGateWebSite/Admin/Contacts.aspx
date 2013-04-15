<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="Contacts.aspx.cs" Inherits="TheGateWebSite.Admin.Contacts" %>

<%@ Register TagPrefix="site" Namespace="UnorderedListDataPager" Assembly="UnorderedListDataPager" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageTitleText" runat="server">
    Contacts
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageShortDescription" runat="server">
    <p>Add and manage contacts.</p>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="row">
        <div class="span12">
            <div class="review">
                <asp:UpdatePanel ID="UpdatePanelContacts" runat="server">
                    <ContentTemplate>
                        <div class="navbar-form">
                            <asp:HyperLink ID="hyperlinkAddContact" runat="server" Text="Add Contact" CssClass="btn btn-primary" NavigateUrl="ContactDetails.aspx" />
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
                        <asp:ListView ID="ListViewContacts" runat="server">
                            <LayoutTemplate>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center;">Contact ID</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Email</th>
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
                                        <asp:HyperLink ID="hyperlinkContact" runat="server" Text='<%# Eval("contactID") %>' NavigateUrl='<%# GenContactDetailLink(Container.DataItem as TheGateWebSite.Model.Contact) %>' /></td>
                                    <td><%# Eval("firstName") %></td>
                                    <td><%# Eval("lastName") %></td>
                                    <td><%# Eval("email") %></td>
                                    <td><%# Eval("phone") %></td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <div class="cta">
                                    <p style="text-align: center;">No contacts found.</p>
                                </div>
                            </EmptyDataTemplate>
                        </asp:ListView>
                        <div class="pagination">
                            <site:UnorderedListDataPager ID="DataPagerContacts" runat="server" PagedControlID="ListViewContacts"
                                PageSize="5" OnPreRender="DataPagerContacts_PreRender">
                                <Fields>
                                    <asp:NextPreviousPagerField ShowNextPageButton="false" ShowFirstPageButton="True" FirstPageText="&laquo;" PreviousPageText="&lsaquo;" />
                                    <asp:NumericPagerField ButtonCount="10" PreviousPageText="&hellip;" NextPageText="&hellip;" />
                                    <asp:NextPreviousPagerField ShowPreviousPageButton="false" ShowLastPageButton="True" LastPageText="&raquo;" NextPageText="&rsaquo;" />
                                </Fields>
                            </site:UnorderedListDataPager>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ListViewContacts" />
                        <asp:PostBackTrigger ControlID="buttonSearch" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="UpdateProgressContacts" AssociatedUpdatePanelID="UpdatePanelContacts" runat="server">
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

