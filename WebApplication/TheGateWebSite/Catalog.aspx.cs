﻿using System;
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
                default:
                    break;
            }
        }
    }
}