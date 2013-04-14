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

        private string[] rPV = new string[3];
        private string[] rPT = new string[3];
        private string[] rPID = new string[3];
        public string rPV1, rPV2, rPV3;
        public string rPT1, rPT2, rPT3;

        public string rV1, rV2, rV3;
        public string rPID1, rPID2, rPID3;

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
            if (Product.onHand <= 0)
            {
                BtnAdd.Visible = false;
                TextBoxQuantity.Visible = false;
            }
            if (Product.imageID != null)
                PictureValue = "Handlers/Image.ashx?ID=" + Product.imageID.ToString();
            else
                PictureValue = "img/photos/s1.jpg";
            recommendItem();
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

        private void recommendItem()
        {
            int catID = Convert.ToInt32(Product.categoryID);
            List<Product> list = theGateContext.Products.Where(p => p.categoryID == catID).ToList();
            int count = 0;
            foreach (Product products in list)
            {
                if (products.productID != Product.productID)
                {
                    if (products.imageID != null)
                        rPV[count] = "Handlers/Image.ashx?ID=" + products.imageID.ToString();
                    else
                        rPV[count] = "img/photos/s1.jpg";
                    rPT[count] = products.productName;
                    rPID[count] = products.productID.ToString();
                    count++;
                    if (count == 3)
                        break;
                }
            }

            //Picture Value
            if (rPV[0] != null)
            {
                rPV1 = rPV[0];
                rV1 = "visible";
            }
            else
            {
                rPV1 = "";
                rV1 = "hidden";
            }
            if (rPV[1] != null)
            {
                rPV2 = rPV[1];
                rV2 = "visible";
            }
            else
            {
                rPV2 = "";
                rV2 = "hidden";
            }
            if (rPV[2] != null)
            {
                rPV3 = rPV[2];
                rV3 = "visible";
            }
            else
            {
                rPV3 = "";
                rV3 = "hidden";
            }

            //Picture Title
            if (rPT[0] != null)
                rPT1 = rPT[0];
            else
                rPT1 = "";
            if (rPT[1] != null)
                rPT2 = rPT[1];
            else
                rPT2 = "";
            if (rPT[2] != null)
                rPT3 = rPT[2];
            else
                rPT3 = "";

            //Product Title
            if (rPID[0] != null)
                rPID1 = rPID[0];
            else
                rPID1 = "";
            if (rPID[1] != null)
                rPID2 = rPID[1];
            else
                rPID2 = "";
            if (rPID[2] != null)
                rPID3 = rPID[2];
            else
                rPID3 = "";

        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            if (TextBoxQuantity.Text != "")
            {
                int quantity = Convert.ToInt32(TextBoxQuantity.Text);
                if (Session["cartHashTable"] != null)
                {
                    Dictionary<string, int> ht = (Dictionary<string, int>)Session["cartHashTable"];
                    if (ht.ContainsKey(Product.productID.ToString()))
                    {
                        int prAmt = (int)ht[Product.productID.ToString()];
                        prAmt += quantity;
                        ht[Product.productID.ToString()] = prAmt;
                        Session["cartHashTable"] = ht;
                    }
                    else
                    {
                        ht.Add(Product.productID.ToString(), quantity);
                        Session["cartHashTable"] = ht;
                    }
                }
                else
                {
                    Dictionary<string, int> ht = new Dictionary<string, int>();
                    ht.Add(Product.productID.ToString(), quantity);
                    Session["cartHashTable"] = ht;
                }
                Response.Redirect("Cart.aspx");
            }
        }

    }
}