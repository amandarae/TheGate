<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="TheGateWebSite.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageTitleText" runat="server">
    Check Out
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageShortDescription" runat="server">
    <asp:Label runat="server" ID="successLbl" Visible="false" Text="Update successful!"></asp:Label>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentMain" runat="server">
    <asp:Panel runat="server" ID="billingNull">
        <div>
            <div style="float: left; margin-right: 50px; margin-bottom: 50px">
                <h4>Billing Address:</h4>
                <div class="control-group">
                    <asp:Label runat="server" ID="line1Lbl" AssociatedControlID="line1TxtBox" CssClass="control-label">Line 1:</asp:Label>
                    <div class="controls">
                        <asp:TextBox runat="server" ID="line1TxtBox" CssClass="input-xlarge"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorLine1" runat="server" ErrorMessage="*"
                            Text="*" ToolTip="Line 1 is required." ControlToValidate="line1TxtBox"
                            ValidationGroup="ValidationGroupAddAddress" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="control-group">
                    <asp:Label runat="server" ID="line2Lbl" AssociatedControlID="line2TxtBox" CssClass="control-label">Line 2:</asp:Label>
                    <div class="controls">
                        <asp:TextBox runat="server" ID="line2TxtBox" CssClass="input-xlarge"></asp:TextBox>
                    </div>
                </div>
                <div class="control-group">
                    <asp:Label runat="server" ID="cityLbl" AssociatedControlID="cityTxtBox" CssClass="control-label">City</asp:Label>
                    <div class="controls">
                        <asp:TextBox runat="server" ID="cityTxtBox" CssClass="input-xlarge"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorcity" runat="server" ErrorMessage="*"
                            Text="*" ToolTip="City is required." ControlToValidate="cityTxtBox"
                            ValidationGroup="ValidationGroupAddAddress" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="control-group">
                    <asp:Label runat="server" ID="stateLbl" AssociatedControlID="stateTxtBox" CssClass="control-label">State:</asp:Label>
                    <div class="controls">
                        <asp:TextBox runat="server" ID="stateTxtBox" CssClass="input-xlarge"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorstate" runat="server" ErrorMessage="*"
                            Text="*" ToolTip="State is required." ControlToValidate="stateTxtBox"
                            ValidationGroup="ValidationGroupAddAddress" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="control-group">
                    <asp:Label runat="server" ID="zipcodeLbl" AssociatedControlID="zipcodeTxtBox" CssClass="control-label">Zip Code:</asp:Label>
                    <div class="controls">
                        <asp:TextBox runat="server" ID="zipcodeTxtBox" CssClass="input-xlarge"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorzipcode" runat="server" ErrorMessage="*"
                            Text="*" ToolTip="Zip Code is required." ControlToValidate="zipcodeTxtBox"
                            ValidationGroup="ValidationGroupAddAddress" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div style="float: left; margin-left: 50px;">
                <h4>Shipping Address:</h4>
                <div class="control-group">
                    <asp:Label runat="server" ID="sline1Lbl" AssociatedControlID="sline1TxtBox" CssClass="control-label">Line 1:</asp:Label>
                    <div class="controls">
                        <asp:TextBox runat="server" ID="sline1TxtBox" CssClass="input-xlarge"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorsline1" runat="server" ErrorMessage="*"
                            Text="*" ToolTip="Line 1 is required." ControlToValidate="sline1TxtBox"
                            ValidationGroup="ValidationGroupAddAddress" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="control-group">
                    <asp:Label runat="server" ID="sline2Lbl" AssociatedControlID="sline2TxtBox" CssClass="control-label">Line 2:</asp:Label>
                    <div class="controls">
                        <asp:TextBox runat="server" ID="sline2TxtBox" CssClass="input-xlarge"></asp:TextBox>
                    </div>
                </div>
                <div class="control-group">
                    <asp:Label runat="server" ID="scityLbl" AssociatedControlID="scityTxtBox" CssClass="control-label">City</asp:Label>
                    <div class="controls">
                        <asp:TextBox runat="server" ID="scityTxtBox" CssClass="input-xlarge"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorscity" runat="server" ErrorMessage="*"
                            Text="*" ToolTip="scity is required." ControlToValidate="scityTxtBox"
                            ValidationGroup="ValidationGroupAddAddress" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="control-group">
                    <asp:Label runat="server" ID="sstateLbl" AssociatedControlID="sstateTxtBox" CssClass="control-label">State:</asp:Label>
                    <div class="controls">
                        <asp:TextBox runat="server" ID="sstateTxtBox" CssClass="input-xlarge"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorsstate" runat="server" ErrorMessage="*"
                            Text="*" ToolTip="sstate is required." ControlToValidate="sstateTxtBox"
                            ValidationGroup="ValidationGroupAddAddress" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="control-group">
                    <asp:Label runat="server" ID="szipcodeLbl" AssociatedControlID="szipcodeTxtBox" CssClass="control-label">Zip Code:</asp:Label>
                    <div class="controls">
                        <asp:TextBox runat="server" ID="szipcodeTxtBox" CssClass="input-xlarge"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorszipcode" runat="server" ErrorMessage="*"
                            Text="*" ToolTip="Zip Code is required." ControlToValidate="szipcodeTxtBox"
                            ValidationGroup="ValidationGroupAddAddress" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div style="float:right;">
                    <asp:Button runat="server" ID="shipSameAsBillBtn" Text="Shipping is same as Billing" CssClass="btn" OnClick="shipSameAsBillBtn_Click" />
                    <asp:Button runat="server" ID="sSaveBtn" Text="Update" CssClass="btn" OnClick="sSaveBtn_Click" ValidationGroup="ValidationGroupAddAddress" />
                </div>
            </div>
        </div>

        <asp:ListView ID="ShoppingCartLV" runat="server" OnItemCommand="ShoppingCartLV_ItemCommand">
            <LayoutTemplate>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Product Name</th>
                            <th style="text-align: center;">Price</th>
                            <th style="text-align: center;">Quantity</th>
                            <th style="text-align: center;">Item total</th>
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
                    <td><%# ((System.Collections.Generic.Dictionary<string, string>)Container.DataItem)["Col1"].ToString()%></td>
                    <td style="text-align: center;"><%# ((System.Collections.Generic.Dictionary<string, string>)Container.DataItem)["Col2"].ToString()%></td>
                    <td style="text-align: center;"><%# ((System.Collections.Generic.Dictionary<string, string>)Container.DataItem)["Col3"].ToString()%></td>
                    <td style="text-align: center;"><%# ((System.Collections.Generic.Dictionary<string, string>)Container.DataItem)["Col4"].ToString()%></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>

        <div style="text-align: right;">
            <h4><%Response.Write(GrandTotal); %></h4>
            <br />
            <asp:HyperLink ID="HyperLinkReturn" runat="server" CssClass="btn" Text="Return to Cart" NavigateUrl="Cart.aspx" />
            <asp:Button ID="ProceedBtn" runat="server" CssClass="btn" Text="Place Order" OnClick="ProceedBtn_Click" ValidationGroup="ValidationGroupAddAddress" />
        </div>

    </asp:Panel>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
