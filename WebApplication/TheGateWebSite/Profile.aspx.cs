using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheGateWebSite.Model;

namespace TheGateWebSite
{
    public partial class Profile : SitePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
                Response.Redirect("~/Login.aspx");

            if (contact == null)
            {
                ShowErrorMessage("Contact record not found.  Please re-register or contact support.");
                return;
            }

            TextBoxFirstName.Text = contact.firstName;
            TextBoxLastName.Text = contact.lastName;
            TextBoxEmail.Text = contact.email;
            txtContactPhone.Text = contact.phone;
        }

        private void ShowErrorMessage(string p)
        {
            throw new NotImplementedException();
        }

        protected void ButtonUpdateProfile_Click(object sender, EventArgs e)
        {
            
        }
    }
}