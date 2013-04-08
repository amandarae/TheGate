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
    public partial class EmployeeDetails : SitePage
    {
        protected Employee Employee
        {
            get
            {
                int i = int.Parse(Request.QueryString["id"]);
                return theGateContext.Employees.First(em => em.employeeID == i);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Employee == null)
            {
                ShowError("Product not found.");
                PanelEmployeeForm.Visible = false;
                return;
            }

            if (Page.IsPostBack)
                return;

            LoadDropDowns();
            ddlContact.SelectedValue = Employee.contactID.ToString();
            TextBoxEmployeeNumber.Text = Employee.employeeNumber;
            TextBoxSalary.Text = Employee.salary.ToString();
            TextBoxHourlyRate.Text = Employee.hourlyRate.ToString();
            TextBoxStartDate.Text = Employee.startDate.ToShortDateString();
            TextBoxEndDate.Text = Employee.endDate != null ? Employee.endDate.GetValueOrDefault().ToShortDateString() : string.Empty;
            ddlContact.Enabled = false;
        }

        private void LoadDropDowns()
        {
            if (ddlContact != null)
            {
                ddlContact.Items.Clear();
                var contacts = theGateContext.Contacts.OrderBy(c => c.contactID).Select(e => new { Name = e.firstName + " " + e.lastName, ID = e.contactID });
                contacts.ToList().ForEach(s => ddlContact.Items.Add(new ListItem(s.Name, s.ID.ToString())));
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

        protected void ButtonUpdateEmployee_Click(object sender, EventArgs e)
        {
            ClearAlerts();
            try
            {
                Employee.employeeNumber = TextBoxEmployeeNumber.Text;
                Employee.salary = decimal.Parse(TextBoxSalary.Text);
                Employee.hourlyRate = decimal.Parse(TextBoxHourlyRate.Text);
                Employee.startDate = DateTime.Parse(TextBoxStartDate.Text);
                if (!string.IsNullOrEmpty(TextBoxEndDate.Text))
                    Employee.endDate = DateTime.Parse(TextBoxEndDate.Text);

                theGateContext.SaveChanges();
                ShowSuccess("Employee successfully updated.");
            }
            catch (Exception ex)
            {
                ShowError("Error updating employee: " + ex.Message);
            }
        }
    }
}