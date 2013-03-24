﻿using System;
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
        protected Product Product
        {
            get
            {
                string i = SearchBoxName.Text.ToLower();
                return theGateContext.Products.First(p => p.productName.ToLower() == i);
            }
        }

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

        private void LoadProductsSearch()
        {
            string productSearch = Session["searchField"].ToString();
            ProductList.DataSource = theGateContext.Products.Where(p => p.productName == productSearch).ToList();
            ProductList.DataBind();
        }

        protected void DataPagerProducts_PreRender(object sender, EventArgs e)
        {
            if (Session["searchOnOff"] != null)
            {
                if (Session["searchOnOff"].ToString() == "true")
                {
                    LoadProductsSearch();
                }
                else 
                {
                    LoadProducts();
                }
            }
            else
            {
                LoadProducts();
            }

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
                    if (tb.Text == "")
                        break;
                    int quantity = Convert.ToInt32(tb.Text);
                    if (Session["cartHashTable"] != null)
                    {
                        Dictionary<string, int> ht = (Dictionary<string, int>)Session["cartHashTable"];
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
                        Dictionary<string, int> ht = new Dictionary<string, int>();
                        ht.Add(e.CommandArgument.ToString(), quantity);
                        Session["cartHashTable"] = ht;
                    }
                    Response.Redirect("Cart.aspx");
                    break;
                default:
                    break;
            }
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            Session["searchOnOff"] = "true";
            Session["searchField"] = SearchBoxName.Text;
            LoadProductsSearch();
        }

        protected void ClearSearchBtn_Click(object sender, EventArgs e)
        {
            Session["searchOnOff"] = "false";
            LoadProducts();
        }
    }
}