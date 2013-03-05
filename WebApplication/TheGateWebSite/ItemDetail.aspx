<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="ItemDetail.aspx.cs" Inherits="TheGateWebSite.ItemDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageTitleText" runat="server">
    Item Detail
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageShortDescription" runat="server">
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

                <asp:Panel ID="PanelItemForm" runat="server" CssClass="form-horizontal">
                    <div class="control-group">
                        <div class="span4">
                            <h3><%Response.Write(ProductNameValue); %></h3>
                            <p><%Response.Write(ProductDescriptionValue); %></p>
                            <img src="<%Response.Write(PictureValue); %>" alt="" />
                            <p><%Response.Write(ProductPriceValue); %></p>
                            <h4><%Response.Write(ProductOnHandValue); %></h4>
                        </div>
                    </div>
                    <asp:HyperLink ID="HyperLinkItemListing" runat="server" CssClass="btn" 
                        Text="Return to Catalog" NavigateUrl="Catalog.aspx" />
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
