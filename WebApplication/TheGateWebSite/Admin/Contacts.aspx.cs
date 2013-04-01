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
    public partial class Contacts : SitePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadDropDowns();
        }

        private void LoadDropDowns()
        {
        }

        private void LoadContacts(List<Contact> contacts)
        {
            ListViewContacts.DataSource = contacts;
            ListViewContacts.DataBind();
        }

        protected void DataPagerContacts_PreRender(object sender, EventArgs e)
        {
            var contacts = new List<Contact>();
            var searchQuery = Request.QueryString["query"];
            if (!string.IsNullOrEmpty(searchQuery))
                contacts = theGateContext.Contacts.Where(c => c.firstName.Contains(searchQuery) || c.lastName.Contains(searchQuery) || c.email.Contains(searchQuery)).OrderBy(c => c.contactID).ToList();
            else
                contacts = theGateContext.Contacts.OrderBy(c => c.contactID).ToList();
            LoadContacts(contacts);
        }

        private void ShowSuccess(string p)
        {
            pnlSuccess.Visible = true;
            lblSuccessMsg.Text = p;
        }

        private void ClearAlerts()
        {
            pnlError.Visible = false;
            pnlSuccess.Visible = false;
        }

        private void ShowError(string p)
        {
            pnlError.Visible = true;
            lblErrorMsg.Text = p;
        }

        protected void buttonSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contacts.aspx?query=" + textboxSearchQuery.Text);
        }

        protected string GenContactDetailLink(Contact c)
        {
            return "ContactDetails.aspx?id=" + c.contactID.ToString();
        }
    }
}