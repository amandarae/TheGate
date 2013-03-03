using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheGateWebSite.Model;

namespace TheGateWebSite.Admin
{
    public partial class ProductDetails : SitePage
    {
        protected Product Product
        {
            get { return theGateContext.Products.First(p => p.productID == int.Parse(Request.QueryString["productID"])); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}