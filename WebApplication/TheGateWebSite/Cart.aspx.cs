using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheGateWebSite.Model;

namespace TheGateWebSite
{
    public partial class ShoppingCart : SitePage
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadCart();
            }
        }

        private void LoadCart()
        {
            try
            {
                BlankCart.Text = "";
                double gt = 0;
                Dictionary<string, int> ht = (Dictionary<string, int>)Session["cartHashTable"];
                List<Dictionary<string, string>> dList = new List<Dictionary<string, string>>();
                foreach (var pair in ht)
                {
                    Session["currentKey"] = pair.Key;
                    Dictionary<string, string> dict = new Dictionary<string, string>();
                    dict.Add("Col0", pair.Key);
                    dict.Add("Col1", Product.productName);
                    dict.Add("Col2", Convert.ToString(Product.price));
                    dict.Add("Col3", pair.Value.ToString());
                    dict.Add("Col4", Convert.ToString(pair.Value * Product.price));
                    dList.Add(dict);
                    gt += Convert.ToDouble(pair.Value * Product.price);
                }

                ShoppingCartLV.DataSource = dList;
                ShoppingCartLV.DataBind();
                GrandTotal = "Grand Total:  $" + gt;
            }
            catch
            {
                BlankCart.Text = "You have no items in your cart!";
            }
        }

        protected void ShoppingCartLV_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            switch (e.CommandName.ToString())
            {
                case "ProductDelete":
                    Dictionary<string, int> ht = (Dictionary<string, int>)Session["cartHashTable"];
                    ht.Remove(e.CommandArgument.ToString());
                    Session["cartHashTable"] = ht;
                    LoadCart();
                    break;
                default:
                    break;
            }
        }
    }
}