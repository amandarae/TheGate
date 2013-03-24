<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="Catalog.aspx.cs" Inherits="TheGateWebSite.Catalog" %>

<%@ Register TagPrefix="site" Namespace="UnorderedListDataPager" Assembly="UnorderedListDataPager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageTitleText" runat="server">
    Product Listing
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageShortDescription" runat="server">
    <asp:Label runat="server" ID="testing"></asp:Label>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="accordion" id="accordion2">
        <div class="accordion-group">
            <div class="accordion-heading accordion-inverse">
                <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#search">
                    <h5><i class="icon-plus"></i>&nbsp;Search</h5>
                </a>
            </div>
            <div id="search" class="accordion-body collapse" style="height: 0px;">
                <div class="accordion-inner">
                    <div class="form-horizontal">
                        <div class="control-group">
                            <asp:Label runat="server" ID="LabelName" CssClass="control-label">Search:</asp:Label>
                            <div class="controls">
                                <asp:TextBox runat="server" ID="SearchBoxName" CssClass="input-xlarge"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-actions">
                            <asp:Button ID="SearchBtn" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="SearchBtn_Click" />
                            <asp:Button ID="ClearSearchBtn" runat="server" CssClass="btn btn-primary" Text="Clear Results" OnClick="ClearSearchBtn_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <asp:ListView ID="ProductList" runat="server" OnItemCommand="ProductList_ItemCommand">
        <LayoutTemplate>
            <div id="portfolio">
                <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="element">
                <asp:Panel ID="ImageNotNull" runat="server" Visible='<%# Eval("imageID") != null %>'>
                    <a href="Handlers/Image.ashx?ID=<%# Eval("imageID") %>" class="prettyPhoto[pp_gal]">
                        <img src="Handlers/Image.ashx?ID=<%# Eval("imageID") %>" alt="" />
                    </a>
                </asp:Panel>
                <asp:Panel ID="ImageNull" runat="server" Visible='<%# Eval("imageID") == null %>'>
                    <img src="img/photos/s1.jpg" alt="" />
                </asp:Panel>
                <div class="pcap">
                    <h5><%# Eval("productName") %></h5>
                    <p>Price: $<%# Eval("price").ToString() %></p>
                </div>
                <div class="controls">
                    Quantity:
                    <asp:TextBox runat="server" ID="TextBoxQuantity" CssClass="input-mini" MaxLength="8" Style="width: 30px; height: 15px; margin-top: 10px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revQuantity" ControlToValidate="TextBoxQuantity" runat="server"
                        ErrorMessage="*" ValidationGroup="ValidationGroupAddProduct" ValidationExpression="[0-9]{0,8}" ForeColor="Red" />
                    <asp:Button ID="BtnAdd" CommandName="AddItem" CommandArgument='<%# Bind("productID") %>' runat="server" Text="Add" ToolTip="Add" CssClass="btn btn-mini" ValidationGroup="ValidationGroupAddProduct" />
                    <asp:Button ID="BtnDetail" CommandName="ItemDetail" CommandArgument='<%# Bind("productID") %>' runat="server" Text="Detail" ToolTip="Detail" CssClass="btn btn-mini" />
                </div>
            </div>
        </ItemTemplate>
        <EmptyDataTemplate>
            <p>Sorry, there are such product(s).</p>
        </EmptyDataTemplate>
    </asp:ListView>
    <div class="pagination">
        <site:UnorderedListDataPager ID="DataPagerProducts" runat="server" PagedControlID="ProductList" PageSize="8" OnPreRender="DataPagerProducts_PreRender">
            <Fields>
                <asp:NextPreviousPagerField ShowNextPageButton="false" ShowFirstPageButton="True" FirstPageText="&laquo;" PreviousPageText="&lsaquo;" />
                <asp:NumericPagerField ButtonCount="10" PreviousPageText="&hellip;" NextPageText="&hellip;" />
                <asp:NextPreviousPagerField ShowPreviousPageButton="false" ShowLastPageButton="True" LastPageText="&raquo;" NextPageText="&rsaquo;" />
            </Fields>
        </site:UnorderedListDataPager>
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="Scripts" runat="server">
    <script type="text/javascript">
        /* Isotope */
        var $container = $('#portfolio');
        // initialize isotope
        $container.isotope({
            // options...
        });
    </script>
</asp:Content>
