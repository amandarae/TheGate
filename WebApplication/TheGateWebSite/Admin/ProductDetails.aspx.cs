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
    public partial class ProductDetails : SitePage
    {
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
            if (Product == null)
            {
                ShowError("Product not found.");
                PanelProductForm.Visible = false;
                return;
            }

            if (Page.IsPostBack)
                return;

            LoadDropDowns();
            TextBoxProductName.Text = Product.productName;
            TextBoxProductDescription.Text = Product.description;
            TextBoxPrice.Text = Product.price.ToString();
            TextBoxOnHand.Text = Product.onHand.ToString();
            TextBoxOnOrder.Text = Product.onOrder.ToString();
            ddlCategories.SelectedValue = Product.categoryID.ToString();
            if (Product.imageID != null)
                ImageFile.ImageUrl = "~/Handlers/Image.ashx?ID=" + Product.imageID.ToString();
            else
                PanelImageFile.Visible = false;
        }

        private void LoadDropDowns()
        {
            if (ddlCategories != null)
            {
                ddlCategories.Items.Clear();
                var categories = theGateContext.Categories.OrderBy(c => c.categoryID).Select(e => new { Name = e.name, ID = e.categoryID });
                categories.ToList().ForEach(s => ddlCategories.Items.Add(new ListItem(s.Name, s.ID.ToString())));
            }
        }

        private void ShowError(string p)
        {
            PanelAlertError.Visible = false;
            LabelAlertError.Text = p;
        }

        private void ShowSuccess(string p)
        {
            PanelAlertSuccess.Visible = true;
            LabelAlertSuccess.Text = p;
        }

        private void ClearAlerts()
        {
            PanelAlertError.Visible = false;
            PanelAlertSuccess.Visible = false;
        }

        protected void ButtonUpdateProduct_Click(object sender, EventArgs e)
        {
            ClearAlerts();
            try
            {
                Product.productName = TextBoxProductName.Text;
                Product.description = TextBoxProductDescription.Text;
                Product.categoryID = int.Parse(ddlCategories.SelectedValue);
                Product.price = decimal.Parse(TextBoxPrice.Text);
                Product.categoryID = int.Parse(ddlCategories.SelectedValue.ToString());
                Product.onHand = int.Parse(TextBoxOnHand.Text);
                Product.onOrder = int.Parse(TextBoxOnOrder.Text);

                if (FileUploadImage.HasFile)
                {
                    var oldFile = Product.File;
                    if (oldFile != null)
                    {
                        theGateContext.Files.Attach(oldFile);
                        theGateContext.Files.Remove(oldFile);
                    }

                    Stream fs = FileUploadImage.PostedFile.InputStream;
                    BinaryReader br = new BinaryReader(fs);
                    Byte[] fileBytes = br.ReadBytes((Int32)fs.Length);

                    var newFile = new TheGateWebSite.Model.File()
                    {
                        ContentType = FileUploadImage.PostedFile.ContentType,
                        Size = FileUploadImage.PostedFile.ContentLength,
                        Data = fileBytes,
                        name = FileUploadImage.PostedFile.FileName
                    };
                    theGateContext.Files.Add(newFile);
                    Product.imageID = newFile.fileID;
                    PanelImageFile.Visible = true;
                    ImageFile.ImageUrl = "~/Handlers/Image.ashx?ID=" + Product.imageID.ToString();
                }

                theGateContext.SaveChanges();
                ShowSuccess("Product successfully updated.");
            }
            catch (Exception ex)
            {
                ShowError("Error updating product: " + ex.Message);
            }
        }
    }
}