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
    public partial class Products : SitePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadDropDowns();
        }

        protected void ButtonAddProduct_Click(object sender, EventArgs e)
        {
            try
            {
                var newProduct = new Product()
                {
                    productName = TextBoxProductName.Text,
                    description = TextBoxProductDescription.Text,
                    categoryID = int.Parse(ddlCategories.SelectedValue),
                    price = decimal.Parse(TextBoxPrice.Text)
                };

                if (FileUploadImage.HasFile)
                {
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
                    newProduct.imageID = newFile.fileID;
                }

                theGateContext.Products.Add(newProduct);
                theGateContext.SaveChanges();
                TextBoxProductName.Text = string.Empty;
                TextBoxProductDescription.Text = string.Empty;
                TextBoxPrice.Text = string.Empty;
                ddlCategories.SelectedIndex = 0;
                LoadProducts();
            }
            catch (Exception ex)
            {
                PanelAddAlertError.Visible = true;
                LabelAddAlert.Text = "Error adding new category: " + ex.Message;
            }
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

        private void LoadProducts()
        {
            ListViewProducts.DataSource = theGateContext.Products.OrderBy(p => p.productID).ToList();
            ListViewProducts.DataBind();
        }

        protected void DataPagerProducts_PreRender(object sender, EventArgs e)
        {
            LoadProducts();
        }

        private void ShowSuccess(string p)
        {
            pnlCategorySuccess.Visible = true;
            lblCategorySuccessMsg.Text = p;
        }

        private void ClearAlerts()
        {
            pnlCategoryError.Visible = false;
            pnlCategorySuccess.Visible = false;
        }

        private void ShowError(string p)
        {
            pnlCategoryError.Visible = true;
            lblCategoryErrorMsg.Text = p;
        }

        protected void ListViewProducts_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            ClearAlerts();
            switch (e.CommandName.ToString())
            {
                case "ProductManage":
                    Response.Redirect("~/Admin/ProductDetails.aspx?productID=" + e.CommandArgument);
                    break;
                case "ProductDelete":
                    int pId;
                    if (!int.TryParse(e.CommandArgument.ToString(), out pId))
                    {
                        ShowError("Invalid product ID.");
                        return;
                    }

                    try
                    {
                        var product = theGateContext.Products.FirstOrDefault(p => p.productID == pId);
                        if (product == null)
                        {
                            ShowError("Category not found.");
                            return;
                        }

                        theGateContext.Products.Remove(product);
                        theGateContext.SaveChanges();
                        ShowSuccess("Product item successfully deleted.");

                        ListViewProducts.EditIndex = -1;
                        LoadProducts();
                    }
                    catch (Exception ex)
                    {
                        ShowError("Unable to action item. Error: " + ex.Message);
                    }

                    break;
                default:
                    break;
            }
        }
    }
}