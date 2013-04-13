<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="DataExport.aspx.cs" Inherits="TheGateWebSite.Admin.Management.DataExport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageTitleText" runat="server">
    Export System Data
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageShortDescription" runat="server">
    <p>Export current system data to CSV for archive purposes.</p>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentMain" runat="server">
    <p>&nbsp;</p>
    <asp:Button ID="ButtonExportOrders" runat="server" Text="Export Orders" CssClass="btn btn-primary btn-large" OnClick="ButtonExportOrders_Click" />
    <asp:Button ID="ButtonExportProduct" runat="server" Text="Export Products" CssClass="btn btn-primary btn-large" OnClick="ButtonExportProduct_Click" />
    <asp:Button ID="ButtonExportTimeEntries" runat="server" Text="Export Time Entries" CssClass="btn btn-primary btn-large" OnClick="ButtonExportTimeEntries_Click" />
    <p>&nbsp;</p><p>&nbsp;</p>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
