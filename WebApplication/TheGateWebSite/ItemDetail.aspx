<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="ItemDetail.aspx.cs" Inherits="TheGateWebSite.ItemDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageTitleText" runat="server">
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

                <asp:Panel ID="PanelItemForm" runat="server">
                    <h3><%Response.Write(ProductNameValue); %></h3>
                    <div class="row" style="margin-top:20px;">
                        <div class="span4" style="float: left">
                            <img src="<%Response.Write(PictureValue); %>" alt="" />

                        </div>
                        <div class="span6" style="float: left; margin-left: 100px">
                            <p style="font-size:20px;font-weight:bold;margin-top:20px;"><%Response.Write(ProductPriceValue); %></p>
                            <h4><%Response.Write(ProductOnHandValue); %></h4>
                            <p>
                                <asp:TextBox runat="server" ID="TextBoxQuantity" CssClass="input-small" MaxLength="8" Style="width: 30px; height: 15px;">1</asp:TextBox>
                                <asp:RegularExpressionValidator ID="revQuantity" ControlToValidate="TextBoxQuantity" runat="server"
                                    ErrorMessage="*" ValidationGroup="ValidationGroupAddProduct" ValidationExpression="[0-9]{0,8}" ForeColor="Red" />
                                <asp:Button ID="BtnAdd" CommandName="AddItem" CommandArgument='<%# Bind("productID") %>' runat="server" Text="Add" ToolTip="Add" CssClass="btn" ValidationGroup="ValidationGroupAddProduct" OnClick="BtnAdd_Click" />

                                <asp:HyperLink ID="HyperLinkItemListing" runat="server" CssClass="btn btn-inverse"
                                    Text="Return to Catalog" NavigateUrl="Catalog.aspx" />
                            </p>
                            <p><%= ProductDescriptionValue %></p>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>

    <div style="margin: 0 auto;">
        <h3 style="margin-left: 80px;">Recommended Items:</h3>
        <div style="float: left; width: 230px; margin-left: 80px; visibility: <%Response.Write(rV1); %>">
            <a href="ItemDetail.aspx?productID=<%Response.Write(rPID1); %>">
                <img src="<%Response.Write(rPV1); %>" alt="" style="height: 150px; width: 200px" />
                <h5><%Response.Write(rPT1); %></h5>
            </a>
        </div>
        <div style="float: left; width: 230px; margin-left: 80px; visibility: <%Response.Write(rV2); %>">
            <a href="ItemDetail.aspx?productID=<%Response.Write(rPID2); %>">
                <img src="<%Response.Write(rPV2); %>" alt="" style="height: 150px; width: 200px" />
                <h5><%Response.Write(rPT2); %></h5>
            </a>
        </div>
        <div style="float: left; width: 230px; margin-left: 80px; visibility: <%Response.Write(rV3); %>">
            <a href="ItemDetail.aspx?productID=<%Response.Write(rPID3); %>">
                <img src="<%Response.Write(rPV3); %>" alt="" style="height: 150px; width: 200px" />
                <h5><%Response.Write(rPT3); %></h5>
            </a>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
