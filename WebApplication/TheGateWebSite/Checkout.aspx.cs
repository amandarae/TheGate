using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheGateWebSite.Model;

namespace TheGateWebSite
{
    public partial class Checkout : SitePage
    {
        public string GrandTotal;

        protected Product Product
        {
            get
            {
                int i = int.Parse(Session["currentKey"].ToString());
                return theGateContext.Products.First(p => p.productID == i);
            }
        }

        protected Address _address
        {
            get
            {
                return theGateContext.Addresses.First(a => a.line1 == line1TxtBox.Text
                    && a.line2 == line2TxtBox.Text
                    && a.city == cityTxtBox.Text
                    && a.state == stateTxtBox.Text
                    && a.zipcode == zipcodeTxtBox.Text);
            }
        }

        protected Address _saddress
        {
            get
            {
                return theGateContext.Addresses.First(a => a.line1 == sline1TxtBox.Text
                    && a.line2 == sline2TxtBox.Text
                    && a.city == scityTxtBox.Text
                    && a.state == sstateTxtBox.Text
                    && a.zipcode == szipcodeTxtBox.Text);
            }
        }

        protected Address getAddress
        {
            get
            {
                int id = Convert.ToInt32(Session["addressID"].ToString());
                return theGateContext.Addresses.First(a => a.addressID == id);
            }
        }

        protected Address sgetAddress
        {
            get
            {
                int id = Convert.ToInt32(Session["saddressID"].ToString());
                return theGateContext.Addresses.First(a => a.addressID == id);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                successLbl.Visible = false;
                checkAddress();
                LoadCart();
            }
        }

        private void checkAddress()
        {
            try
            {
                if (contact.billingAddress == null)
                {
                    Session["newBilling"] = "true";
                }
                else
                {
                    Session["newBilling"] = "false";
                    int addressID = (int)contact.billingAddress;
                    displayBillingInfo(addressID);
                }

                if (contact.shippingAddress == null)
                {
                    Session["newShipping"] = "true";
                }
                else
                {
                    Session["newShipping"] = "false";
                    int addressID = (int)contact.shippingAddress;
                    displayShippingInfo(addressID);
                }
            }
            catch
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        private void displayBillingInfo(int addressID)
        {
            Session["addressID"] = addressID;
            line1TxtBox.Text = getAddress.line1;
            line2TxtBox.Text = getAddress.line2;
            cityTxtBox.Text = getAddress.city;
            stateTxtBox.Text = getAddress.state;
            zipcodeTxtBox.Text = getAddress.zipcode;
        }

        private void displayShippingInfo(int addressID)
        {
            Session["sAddressID"] = addressID;
            sline1TxtBox.Text = sgetAddress.line1;
            sline2TxtBox.Text = sgetAddress.line2;
            scityTxtBox.Text = sgetAddress.city;
            sstateTxtBox.Text = sgetAddress.state;
            szipcodeTxtBox.Text = sgetAddress.zipcode;
        }

        private void LoadCart()
        {
            double gt = 0;
            Dictionary<string, int> ht = (Dictionary<string, int>)Session["cartHashTable"];
            List<Dictionary<string, string>> dList = new List<Dictionary<string, string>>();
            foreach (var pair in ht)
            {
                Session["currentKey"] = pair.Key;
                Dictionary<string, string> dict = new Dictionary<string, string>();
                dict.Add("Col0", pair.Key);
                dict.Add("Col1", Product.productName);
                dict.Add("Col2", Product.price.ToString("C2"));
                dict.Add("Col3", pair.Value.ToString());
                dict.Add("Col4", (pair.Value * Product.price).ToString("C2"));
                dList.Add(dict);
                gt += Convert.ToDouble(pair.Value * Product.price);
            }

            ShoppingCartLV.DataSource = dList;
            ShoppingCartLV.DataBind();
            GrandTotal = "Grand Total: " + gt.ToString("C2");
        }

        protected void sSaveBtn_Click(object sender, EventArgs e)
        {
            if (Session["newBilling"].ToString() == "true")
            {
                var address = new Address()
                {
                    line1 = line1TxtBox.Text,
                    line2 = line2TxtBox.Text,
                    city = cityTxtBox.Text,
                    state = stateTxtBox.Text,
                    zipcode = zipcodeTxtBox.Text
                };

                theGateContext.Addresses.Add(address);
                theGateContext.SaveChanges();

                int billingAddressID = _address.addressID;
                contact.billingAddress = billingAddressID;
                theGateContext.SaveChanges();
                Session["newBilling"] = "false";
            }
            else if (Session["newBilling"].ToString() == "false")
            {
                getAddress.line1 = line1TxtBox.Text;
                getAddress.line2 = line2TxtBox.Text;
                getAddress.city = cityTxtBox.Text;
                getAddress.state = stateTxtBox.Text;
                getAddress.zipcode = zipcodeTxtBox.Text;
                theGateContext.SaveChanges();
            }

            if (Session["newShipping"].ToString() == "true")
            {
                var address = new Address()
                {
                    line1 = sline1TxtBox.Text,
                    line2 = sline2TxtBox.Text,
                    city = scityTxtBox.Text,
                    state = sstateTxtBox.Text,
                    zipcode = szipcodeTxtBox.Text
                };

                theGateContext.Addresses.Add(address);
                theGateContext.SaveChanges();

                int shippingAddressID = _saddress.addressID;
                contact.shippingAddress = shippingAddressID;
                theGateContext.SaveChanges();
                Session["newShipping"] = "false";
            }
            else if (Session["newShipping"].ToString() == "false")
            {
                sgetAddress.line1 = sline1TxtBox.Text;
                sgetAddress.line2 = sline2TxtBox.Text;
                sgetAddress.city = scityTxtBox.Text;
                sgetAddress.state = sstateTxtBox.Text;
                sgetAddress.zipcode = szipcodeTxtBox.Text;
                theGateContext.SaveChanges();
            }
            successLbl.Visible = true;
        }

        protected void ShoppingCartLV_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

        }

        protected void ProceedBtn_Click(object sender, EventArgs e)
        {
            var order = new Order()
            {
                type = 1,
                state = 1,
                contactID = contact.contactID,
                accountID = contact.accountID,
                dateMade = DateTime.Now
            };

            theGateContext.Orders.Add(order);
            theGateContext.SaveChanges();
            int orderIdVal = order.orderID;

            Dictionary<string, int> ht = (Dictionary<string, int>)Session["cartHashTable"];
            foreach (var pair in ht)
            {
                Session["currentKey"] = pair.Key;
                var orderline = new OrderLine()
                {
                    orderID = orderIdVal,
                    productID = Product.productID,
                    quantity = pair.Value,
                    price = pair.Value * Product.price
                };
                theGateContext.OrderLines.Add(orderline);
                theGateContext.SaveChanges();
            }

            Dictionary<string, int> clearHT = new Dictionary<string, int>();
            Session["cartHashTable"] = clearHT;

            Response.Redirect("OrderSuccess.aspx");
        }

        protected void shipSameAsBillBtn_Click(object sender, EventArgs e)
        {
            sline1TxtBox.Text = line1TxtBox.Text;
            sline2TxtBox.Text = line2TxtBox.Text;
            scityTxtBox.Text = cityTxtBox.Text;
            sstateTxtBox.Text = stateTxtBox.Text;
            szipcodeTxtBox.Text = zipcodeTxtBox.Text;
        }
    }
}