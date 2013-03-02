using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheGateWebSite.Model;

namespace TheGateWebSite.Admin
{
    public partial class Categories : SitePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Pre_Init(object sender, EventArgs e)
        {
            
        }

        protected void ButtonAddCategory_Click(object sender, EventArgs e)
        {
            try
            {
                var newCategory = new Category()
                {
                    name = TextBoxName.Text
                };

                theGateContext.Categories.Add(newCategory);
                theGateContext.SaveChanges();
                TextBoxName.Text = string.Empty;

                LoadCategories();
            }
            catch (Exception ex)
            {
                PanelAddAlertError.Visible = true;
                LabelAddAlert.Text = "Error adding new category: " + ex.Message;
            }
        }

        private void LoadCategories()
        {
            ListViewCategories.DataSource = theGateContext.Categories.OrderBy(c => c.categoryID).ToList();
            ListViewCategories.DataBind();
        }

        protected void DataPagerCategories_PreRender(object sender, EventArgs e)
        {
            LoadCategories();
        }

        private void ShowCategorySuccess(string p)
        {
            pnlCategorySuccess.Visible = true;
            lblCategorySuccessMsg.Text = p;
        }

        private void ClearCategoryAlerts()
        {
            pnlCategoryError.Visible = false;
            pnlCategorySuccess.Visible = false;
        }

        private void ShowCategoryError(string p)
        {
            pnlCategoryError.Visible = true;
            lblCategoryErrorMsg.Text = p;
        }

        protected void ListViewCategories_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            ClearCategoryAlerts();
            switch (e.CommandName.ToString())
            {
                case "CategoryEdit":
                    ListViewCategories.EditIndex = e.Item.DataItemIndex;
                    LoadCategories();
                    break;
                case "CategoryCancel":
                    ListViewCategories.EditIndex = -1;
                    LoadCategories();
                    break;
                case "CategoryUpdate":
                case "CategoryDelete":
                    int cId;
                    if (!int.TryParse(e.CommandArgument.ToString(), out cId))
                    {
                        ShowCategoryError("Invalid category ID.");
                        return;
                    }

                    try
                    {
                        var category = theGateContext.Categories.FirstOrDefault(c => c.categoryID == cId);
                        if (category == null)
                        {
                            ShowCategoryError("Category not found.");
                            return;
                        }

                        if (e.CommandName == "CategoryUpdate")
                        {
                            category.name = ((TextBox)ListViewCategories.EditItem.FindControl("TextBoxCategoryName")).Text;
                            theGateContext.SaveChanges();
                            ShowCategorySuccess("Category item successfully updated.");
                        }
                        else if (e.CommandName == "CategoryDelete")
                        {
                            theGateContext.Categories.Remove(category);
                            theGateContext.SaveChanges();
                            ShowCategorySuccess("Category item successfully deleted.");
                        }

                        ListViewCategories.EditIndex = -1;
                        LoadCategories();
                    }
                    catch (Exception ex)
                    {
                        ShowCategoryError("Unable to action item. Error: " + ex.Message);
                    }

                    break;
                default:
                    break;
            }
        }
    }
}