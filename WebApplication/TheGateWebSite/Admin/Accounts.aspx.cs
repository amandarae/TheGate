using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheGateWebSite.Model;

namespace TheGateWebSite.Admin
{
    public partial class Accounts : SitePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadDropDowns();
        }

        private void LoadDropDowns()
        {
        }

        private void LoadAccounts(List<Account> accounts)
        {
            ListViewAccounts.DataSource = accounts;
            ListViewAccounts.DataBind();
        }

        protected void DataPagerAccounts_PreRender(object sender, EventArgs e)
        {
            var accounts = new List<Account>();
            var searchQuery = Request.QueryString["query"];
            if (!string.IsNullOrEmpty(searchQuery))
                accounts = theGateContext.Accounts.Where(a => a.accountName.Contains(searchQuery) || a.accountNumber.Contains(searchQuery) || a.phone.Contains(searchQuery)).OrderBy(a => a.accountID).ToList();
            else
                accounts = theGateContext.Accounts.OrderBy(a => a.accountID).ToList();
            LoadAccounts(accounts);
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
            Response.Redirect("Accounts.aspx?query=" + textboxSearchQuery.Text);
        }

        protected string GetAccountDetailLink(Account a)
        {
            return "AccountDetails.aspx?id=" + a.accountID.ToString();
        }

        protected string GetAccountPrimaryContactLink(Account a)
        {
            return string.Format("<a href='ContactDetails.aspx?id={0}'>{1} {2}</a>", a.Contact.contactID.ToString(), a.Contact.firstName, a.Contact.lastName);
        }
    }
}