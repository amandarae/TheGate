using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheGateWebSite.Model;

namespace TheGateWebSite.Admin
{
    public partial class OrderDetails : SitePage
    {
        protected Order orderA;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                // add order setup
                if (!Page.IsPostBack)
                    LoadDropdowns();
                ButtonOrderAction.Text = "Add Order";
                ButtonOrderAction.Click += ButtonOrderActionAdd_Click;
                ButtonOrderCancelled.Visible = false;
                ButtonOrderShipped.Visible = false;
                ButtonOrderRecieved.Visible = false;
                PanelOrderDetails.Visible = false;
                ddlState.SelectedValue = "1";
                ddlState.Enabled = false;
                return;
            }

            int i = int.Parse(Request.QueryString["id"] != null ? Request.QueryString["id"] : "0");
            orderA = theGateContext.Orders.FirstOrDefault(o => o.orderID == i);

            if (orderA == null)
            {
                ShowError("Order not found.");
                PanelOrderForm.Visible = false;
                return;
            }

            ButtonOrderAction.Text = "Update Order";
            ButtonOrderAction.Click += ButtonOrderActionUpdate_Click;

            if (Page.IsPostBack)
                return;


            ButtonOrderCancelled.Visible = true;
            ButtonOrderShipped.Visible = true;
            LoadDropdowns();
            ddlState.Enabled = false;
            if (orderA.type != 3)
                ButtonOrderRecieved.Visible = false;

            ddlType.SelectedValue = orderA.type.ToString();

            if (orderA.state == 4)
            {
                ButtonOrderShipped.Enabled = false;
                ButtonOrderCancelled.Enabled = false;
                ButtonOrderAction.Enabled = false;
                ButtonOrderRecieved.Enabled = false;
                PanelOrderFormControls.Enabled = false;
            }

            ddlState.SelectedValue = orderA.state.ToString();
            if (orderA.accountID != null)
                ddlAccount.SelectedValue = orderA.accountID.ToString();
            else
            {
                ddlAccount.SelectedIndex = -1;
                ddlAccount.Enabled = false;
            }
            ddlContact.SelectedValue = orderA.contactID.ToString();

            lblDateMadeData.Text = orderA.dateMade.ToString("g");
            if (orderA.dateShipped != null)
            {
                lblDateShippedData.Text = orderA.dateShipped.GetValueOrDefault().ToString("g");
                ButtonOrderShipped.Enabled = false;
            }
            if (orderA.dateRecieved != null) 
            {
                lblDateRecievedData.Text = orderA.dateRecieved.GetValueOrDefault().ToString("g");
                ButtonOrderRecieved.Enabled = false;
            }

            LoadOrderDetails();

        }

        private void LoadOrderDetails()
        {
            ListViewOrderDetails.DataSource = orderA.OrderLines.ToList();
            ListViewOrderDetails.DataBind();

            decimal orderTotal = 0;
            foreach (var line in orderA.OrderLines)
            {
                orderTotal += line.price * line.quantity;
            }
            ltOrderTotal.Text = orderTotal.ToString("C");
        }

        private void LoadDropdowns()
        {
            if (ddlType != null)
            {
                ddlType.Items.Clear();
                var orderTypes = theGateContext.OrderTypes.OrderBy(ot => ot.orderTypeID).Select(e => new { Name = e.name, ID = e.orderTypeID });
                orderTypes.ToList().ForEach(s => ddlType.Items.Add(new ListItem(s.Name, s.ID.ToString())));
                ddlType.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            }
            if (ddlState != null)
            {
                ddlState.Items.Clear();
                var orderStates = theGateContext.OrderStates.OrderBy(os => os.orderStateID).Select(e => new { Name = e.name, ID = e.orderStateID });
                orderStates.ToList().ForEach(s => ddlState.Items.Add(new ListItem(s.Name, s.ID.ToString())));
                ddlState.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            }
            if (ddlAccount != null)
            {
                ddlAccount.Items.Clear();
                var accounts = theGateContext.Accounts.OrderBy(a => a.accountID).Select(e => new { Name = e.accountName, ID = e.accountID });
                accounts.ToList().ForEach(s => ddlAccount.Items.Add(new ListItem(s.Name, s.ID.ToString())));
                ddlAccount.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            }
            if (ddlContact != null)
            {
                ddlContact.Items.Clear();
                var contacts = theGateContext.Contacts.OrderBy(c => c.contactID).Select(e => new { Name = e.firstName + " " + e.lastName, ID = e.contactID });
                contacts.ToList().ForEach(s => ddlContact.Items.Add(new ListItem(s.Name, s.ID.ToString())));
                ddlContact.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            }
            if (ddlProduct != null)
            {
                ddlProduct.Items.Clear();
                var products = theGateContext.Products.OrderBy(p => p.productName).Select(e => new { Name = e.productName, ID = e.productID });
                products.ToList().ForEach(s => ddlProduct.Items.Add(new ListItem(s.Name, s.ID.ToString())));
                ddlProduct.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            }
        }

        private void ButtonOrderActionAdd_Click(object sender, EventArgs e)
        {
            var newOrderA = new Model.Order();
            newOrderA = LoadOrder(newOrderA);
            newOrderA.dateMade = DateTime.Now;
            theGateContext.Orders.Add(newOrderA);
            theGateContext.SaveChanges();
            Response.Redirect("OrderDetails.aspx?id=" + newOrderA.orderID);
        }

        protected void ButtonOrderActionUpdate_Click(object sender, EventArgs e)
        {
            ClearAlerts();
            try
            {
                int i = int.Parse(Request.QueryString["id"] != null ? Request.QueryString["id"] : "0");
                var newOrder = theGateContext.Orders.FirstOrDefault(o => o.orderID == i);

                newOrder = LoadOrder(newOrder);

                theGateContext.SaveChanges();
                ShowSuccess("Order successfully updated.");
            }
            catch (Exception ex)
            {
                ShowError("Error updating order: " + ex.Message);
            }
        }

        private Model.Order LoadOrder(Model.Order o)
        {
            o.type = int.Parse(ddlType.SelectedValue);
            o.state = int.Parse(ddlState.SelectedValue);
            if (!string.IsNullOrEmpty(ddlAccount.SelectedValue))
                o.accountID =  int.Parse(ddlAccount.SelectedValue);
            o.contactID = int.Parse(ddlContact.SelectedValue);
            return o;
        }

        private void ShowError(string p)
        {
            PanelAlertError.Visible = true;
            LabelAlertError.Text = p;
        }

        private void ShowSuccess(string p)
        {
            PanelAlertSuccess.Visible = true;
            LabelAlertSuccess.Text = p;
        }

        private void ClearAlerts()
        {
            PanelAlertError.Visible = false;
            PanelAlertSuccess.Visible = false;
        }

        protected void ButtonOrderShipped_Click(object sender, EventArgs e)
        {
            orderA.dateShipped = DateTime.Now;
            orderA.state = 2;
            theGateContext.SaveChanges();
            Response.Redirect("OrderDetails.aspx?id=" + Request.QueryString["id"]);
        }

        protected void ButtonOrderRecieved_Click(object sender, EventArgs e)
        {
            orderA.state = 3;
            orderA.dateRecieved = DateTime.Now;
            theGateContext.SaveChanges();
            Response.Redirect("OrderDetails.aspx?id=" + Request.QueryString["id"]);
        }

        protected void ButtonOrderCancelled_Click(object sender, EventArgs e)
        {
            orderA.state = 4;
            theGateContext.SaveChanges();
            Response.Redirect("OrderDetails.aspx?id=" + Request.QueryString["id"]);
        }

        protected string GetOrderLineProduct(OrderLine ol)
        {
            return ol.Product.productName;
        }

        protected string GetOrderLinePrice(OrderLine ol)
        {
            return ol.price.ToString("C");
        }

        protected string GetOrderLineTotal(OrderLine ol)
        {
            return (ol.price * ol.quantity).ToString("C");
        }

        protected void ButtonAddProduct_Click(object sender, EventArgs e)
        {
            try
            {
                int pid = int.Parse(ddlProduct.SelectedValue.ToString());
                var product = theGateContext.Products.Where(p => p.productID == pid).FirstOrDefault();
                var neworderline = new OrderLine()
                {
                    productID = product.productID,
                    quantity = int.Parse(TextBoxProductQuantity.Text),
                    orderID = orderA.orderID,
                    price = product.price
                };

                theGateContext.OrderLines.Add(neworderline);
                theGateContext.SaveChanges();
                TextBoxProductQuantity.Text = string.Empty;
                ddlProduct.SelectedIndex = 0;
                LoadOrderDetails();
            }
            catch (Exception ex)
            {
                PanelAddAlertError.Visible = true;
                LabelAddAlert.Text = "Error adding new product: " + ex.Message;
            }
        }

        protected void ListViewOrderDetails_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            ClearAlerts();
            switch (e.CommandName.ToString())
            {
                case "OrderLineDelete":
                    int olId;
                    if (!int.TryParse(e.CommandArgument.ToString(), out olId))
                    {
                        ShowError("Invalid order line ID.");
                        return;
                    }

                    try
                    {
                        var orderline = theGateContext.OrderLines.FirstOrDefault(ol => ol.orderLineID == olId);
                        if (orderline == null)
                        {
                            ShowError("Order line not found.");
                            return;
                        }

                        theGateContext.OrderLines.Remove(orderline);
                        theGateContext.SaveChanges();
                        ShowSuccess("Order line successfully deleted.");

                        ListViewOrderDetails.EditIndex = -1;
                        LoadOrderDetails();
                    }
                    catch (Exception ex)
                    {
                        ShowError("Unable to action item. Error: " + ex.Message);
                    }

                    break;
                default:
                    break;
            }
        }
    }
}