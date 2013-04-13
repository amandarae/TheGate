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
    public partial class Timesheets : SitePage
    {
        protected Employee employee
        {
            get
            {
                return theGateContext.Employees.First(em => em.contactID == contact.contactID);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (employee == null)
                UpdatePanelTimesheets.Visible = false;
        }

        protected void ButtonAddTimesheet_Click(object sender, EventArgs e)
        {
            try
            {
                var newTimeEntry = new TheGateWebSite.Model.TimeEntry()
                {
                    date = DateTime.Parse(TextBoxDate.Text),
                    hours = decimal.Parse(TextBoxTime.Text),
                    category = ddlCategory.SelectedValue,
                    employeeID = employee.employeeID
                };


                theGateContext.TimeEntries.Add(newTimeEntry);
                theGateContext.SaveChanges();
                TextBoxDate.Text = string.Empty;
                TextBoxTime.Text = string.Empty;
                ddlCategory.SelectedIndex = 0;
                LoadTimesheets();
            }
            catch (Exception ex)
            {
                PanelAddAlertError.Visible = true;
                LabelAddAlert.Text = "Error adding new time entry: " + ex.Message;
            }
        }

        private void LoadTimesheets()
        {
            ListViewTimesheets.DataSource = theGateContext.TimeEntries.Where(te => te.employeeID == employee.employeeID).OrderByDescending(te => te.date).ToList();
            ListViewTimesheets.DataBind();
        }

        protected void DataPagerTimesheets_PreRender(object sender, EventArgs e)
        {
            LoadTimesheets();
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
    }
}