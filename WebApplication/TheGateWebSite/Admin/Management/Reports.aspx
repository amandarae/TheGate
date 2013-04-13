<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="TheGateWebSite.Admin.Management.Reports" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageTitleText" runat="server">
    Dashboard
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageShortDescription" runat="server">
    <p>Summary information.</p>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="row">
        <div class="span6" style="background: #fff;">
            <h3>Products - Quanity on Hand</h3>
            <div style="text-align: center;">
            <asp:Chart ID="Chart1" runat="server" DataSourceID="LinqDataSource1" Height="400px" Width="400px">
                <Series>
                    <asp:Series Name="Series1" XValueMember="productName" YValueMembers="onHand" ChartType="Bar">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="TheGateWebSite.Model.TheGateContext" EntityTypeName="" Select="new (productName, onHand)" TableName="Products">
            </asp:LinqDataSource>
                </div>
        </div>
        <div class="span6" style="background: #fff;">
            <h3>Products - Quanity on Hand</h3>
            <div style="text-align: center;">
            <asp:Chart ID="Chart2" runat="server" DataSourceID="LinqDataSource2" Height="400px" Width="400px">
                <Series>
                    <asp:Series Name="Series1" XValueMember="state" YValueMembers="Count" ChartType="Pie">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="TheGateWebSite.Model.TheGateContext" EntityTypeName="" Select="new (key as state, it as Orders, Count() as Count)" TableName="Orders" GroupBy="state">
            </asp:LinqDataSource>
                </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
