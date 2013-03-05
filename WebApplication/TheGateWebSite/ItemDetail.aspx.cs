using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheGateWebSite.Model;

namespace TheGateWebSite
{
    public partial class ItemDetail : SitePage
    {
        public string ProductNameValue;
        public string ProductDescriptionValue;
        public string ProductPriceValue;
        public string ProductOnHandValue;
        public string PictureValue;

        protected Product Product
        {
            get
            {
                int i = int.Parse(Request.QueryString["productID"]);
                return theGateContext.Products.First(p => p.productID == i);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ProductNameValue = Product.productName;
            ProductDescriptionValue = Product.description;
            ProductPriceValue = "Price: $" + Product.price.ToString();
            ProductOnHandValue = checkstock();
            if (Product.imageID != null)
                PictureValue = "Handlers/Image.ashx?ID=" + Product.imageID.ToString();
            else
                PictureValue = "img/photos/s1.jpg";
        }

        private string checkstock()
        {
            if (Product.onHand > 0)
            {
                return "In Stock!";
            }
            else
            {
                return "Not Available";
            }
        }

    }
}