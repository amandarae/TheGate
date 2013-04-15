using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheGateWebSite.Model;

namespace TheGateWebSite
{
    public partial class Profile : SitePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
                Response.Redirect("~/Login.aspx");

            if (contact == null)
            {
                ShowErrorMessage("Contact record not found.  Please re-register or contact support.");
                return;
            }

            TextBoxFirstName.Text = contact.firstName;
            TextBoxLastName.Text = contact.lastName;
            TextBoxEmail.Text = contact.email;
            txtContactPhone.Text = contact.phone;

            //if (contact.Address1 != null)
            //{
            //    lnkBillingAddress.Text = "Edit billing address";
            //}

            //if (contact.Address != null)
            //{
            //    lnkShippingAddress.Text = "Edit shipping address";
            //}
        }

        private void ShowErrorMessage(string p)
        {
            throw new NotImplementedException();
        }

        protected void ButtonUpdateProfile_Click(object sender, EventArgs e)
        {
            
        }

        protected string GetOrderState(Order order)
        {
            var orderState = theGateContext.OrderStates.Where(os => os.orderStateID == order.state).FirstOrDefault();
            return orderState.name;
        }

        protected string GetOrderTotalPrice(Order order)
        {
            var orderTotal = theGateContext.OrderLines.Where(ol => ol.orderID == order.orderID).Sum(ol => ol.quantity * ol.price);
            return "$" + orderTotal.ToString();
        }

        protected void DataPagerOrderHistory_PreRender(object sender, EventArgs e)
        {
            ListViewOrderHistory.DataSource = theGateContext.Orders.Where(o => o.contactID == contact.contactID).OrderBy(o => o.dateMade).ToList();
            ListViewOrderHistory.DataBind();
        }
    }
}