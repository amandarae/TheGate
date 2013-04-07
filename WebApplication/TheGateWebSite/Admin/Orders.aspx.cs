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
    public partial class Orders : SitePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadDropDowns();
        }

        private void LoadDropDowns()
        {
        }

        private void LoadOrders(List<Order> orders)
        {
            ListViewOrders.DataSource = orders;
            ListViewOrders.DataBind();
        }

        protected void DataPagerOrders_PreRender(object sender, EventArgs e)
        {
            var orders = new List<Order>();
            var searchQuery = Request.QueryString["query"];
            if (!string.IsNullOrEmpty(searchQuery))
                orders = theGateContext.Orders.Where(o => o.Contact.firstName.Contains(searchQuery) || o.Contact.lastName.Contains(searchQuery)).OrderBy(o => o.orderID).ToList();
            else
                orders = theGateContext.Orders.OrderBy(o => o.orderID).ToList();
            LoadOrders(orders);
        }

        private void ShowSuccess(string p)
        {
            pnlSuccess.Visible = true;
            lblSuccessMsg.Text = p;
        }

        private void ClearAlerts()
        {
            pnlError.Visible = false;
            pnlSuccess.Visible = false;
        }

        private void ShowError(string p)
        {
            pnlError.Visible = true;
            lblErrorMsg.Text = p;
        }

        protected void buttonSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("Orders.aspx?query=" + textboxSearchQuery.Text);
        }

        protected string GenOrderDetailLink(Order o)
        {
            return "OrderDetails.aspx?id=" + o.orderID.ToString();
        }

        protected string GetOrderDateMade(Order o)
        {
            return o.dateMade.ToString("g");
        }

        protected string GetOrderDateShipped(Order o)
        {
            return o.dateShipped != null ? o.dateShipped.GetValueOrDefault().ToString("g") : string.Empty;
        }

        protected string GetOrderStatus(Order o)
        {
            return o.OrderState.name;
        }

        protected string GetOrderContact(Order o)
        {
            return string.Format("{0} {1}", o.Contact.firstName, o.Contact.lastName);
        }

        protected string GetOrderAccount(Order o)
        {
            return o.accountID != null ? o.Account.accountName : string.Empty;
        }
    }
}