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
    public partial class Catalog : SitePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadProducts();
            }
        }

        private void LoadProducts()
        {
            ProductList.DataSource = theGateContext.Products.OrderBy(p => p.productID).ToList();
            ProductList.DataBind();
        }

        protected void DataPagerProducts_PreRender(object sender, EventArgs e)
        {
            LoadProducts();
        }

        protected void ProductList_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            switch (e.CommandName.ToString())
            {
                case "ItemDetail":
                    Response.Redirect("ItemDetail.aspx?productID=" + e.CommandArgument);
                    break;
                case "AddItem":
                    TextBox tb = (TextBox)e.Item.FindControl("TextBoxQuantity");
                    int quantity = Convert.ToInt32(tb.Text);
                    if (Session["cartHashTable"] != null)
                    {
                        Dictionary<string,int> ht = (Dictionary<string,int>)Session["cartHashTable"];
                        if (ht.ContainsKey(e.CommandArgument.ToString()))
                        {
                            int prAmt = (int)ht[e.CommandArgument.ToString()];
                            prAmt += quantity;
                            ht[e.CommandArgument.ToString()] = prAmt;
                            Session["cartHashTable"] = ht;
                        }
                        else
                        {
                            ht.Add(e.CommandArgument.ToString(), quantity);
                            Session["cartHashTable"] = ht;
                        }
                    }
                    else
                    {
                        Dictionary<string,int> ht = new Dictionary<string,int>();
                        ht.Add(e.CommandArgument.ToString(), quantity);
                        Session["cartHashTable"] = ht;
                    }
                    Response.Redirect("ShoppingCart.aspx");
                    break;
                default:
                    break;
            }
        }
    }
}