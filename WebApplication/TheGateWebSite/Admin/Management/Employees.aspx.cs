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
    public partial class Employees : SitePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                LoadDropDowns();
        }

        protected string GetContactName(Employee em)
        {
            var contact = theGateContext.Contacts.Where(c => c.contactID == em.contactID).FirstOrDefault();
            if (contact != null)
                return contact.firstName + " " + contact.lastName;
            else
                return string.Empty;
        }

        protected void ButtonAddEmployee_Click(object sender, EventArgs e)
        {
            ClearAlerts();
            try
            {
                int cid = int.Parse(ddlContact.SelectedValue);
                decimal salary = 0, hourlyRate = 0;
                decimal.TryParse(TextBoxSalary.Text, out salary);
                decimal.TryParse(TextBoxHourlyRate.Text, out hourlyRate);

                var newEmployee = new Employee()
                {
                    contactID = cid,
                    employeeNumber = TextBoxEmployeeNumber.Text,
                    salary = salary,
                    hourlyRate = hourlyRate,
                    startDate = DateTime.Parse(TextBoxStartDate.Text)
                };

                theGateContext.Employees.Add(newEmployee);
                theGateContext.SaveChanges();
                TextBoxEmployeeNumber.Text = string.Empty;
                TextBoxSalary.Text = string.Empty;
                TextBoxHourlyRate.Text = string.Empty;
                TextBoxStartDate.Text = string.Empty;
                ddlContact.SelectedIndex = 0;
                LoadEmployees();
            }
            catch (Exception ex)
            {
                PanelAddAlertError.Visible = true;
                LabelAddAlert.Text = "Error adding new employee: " + ex.Message;
            }
        }

        private void LoadDropDowns()
        {
            if (ddlContact != null)
            {
                ddlContact.Items.Clear();
                var contacts1 = from c in theGateContext.Contacts
                                join em in theGateContext.Employees on c.contactID equals em.contactID into cem
                                from em in cem.DefaultIfEmpty()
                                where (em.employeeID == null)
                                select(new { Name = c.firstName + " " + c.lastName, ID = c.contactID });
                //var contacts = contacts1.Select(e => new { Name = e.firstName + " " + e.lastName, ID = e.contactID });
                contacts1.ToList().ForEach(s => ddlContact.Items.Add(new ListItem(s.Name, s.ID.ToString())));
            }
        }

        private void LoadEmployees()
        {
            ListViewEmployees.DataSource = theGateContext.Employees.OrderBy(em => em.employeeID).ToList();
            ListViewEmployees.DataBind();
        }

        protected void DataPagerEmployees_PreRender(object sender, EventArgs e)
        {
            LoadEmployees();
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

        protected void ListViewEmployees_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            ClearAlerts();
            switch (e.CommandName.ToString())
            {
                case "EmployeeManage":
                    Response.Redirect("~/Admin/EmployeeDetails.aspx?id=" + e.CommandArgument);
                    break;
                case "EmployeeDelete":
                    int eId;
                    if (!int.TryParse(e.CommandArgument.ToString(), out eId))
                    {
                        ShowError("Invalid employee ID.");
                        return;
                    }

                    try
                    {
                        var employee = theGateContext.Employees.FirstOrDefault(em => em.employeeID == eId);
                        if (employee == null)
                        {
                            ShowError("Employee not found.");
                            return;
                        }

                        theGateContext.Employees.Remove(employee);
                        theGateContext.SaveChanges();
                        ShowSuccess("Employee successfully deleted.");

                        ListViewEmployees.EditIndex = -1;
                        LoadEmployees();
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