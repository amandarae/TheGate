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
    public partial class AccountDetails : SitePage
    {
        protected Account accountA;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["id"]) && !Page.IsPostBack)
            {
                var a = new Model.Account()
                    {
                        accountName = "A",
                        accountNumber = "A",
                        primaryContact = 8,
                        phone = "1"
                    };
                theGateContext.Accounts.Add(a);
                theGateContext.SaveChanges();

                // add contact setup
                LoadDropdowns();
                ButtonAccountAction.Text = "Add Account";
                ButtonAccountAction.Click += ButtonAccountActionAdd_Click;
                pnlAddresses.Visible = false;
                return;
            }

            int i = int.Parse(Request.QueryString["id"] != null ? Request.QueryString["id"] : "0");
            accountA = theGateContext.Accounts.FirstOrDefault(a => a.accountID == i);

            if (accountA == null)
            {
                ShowError("Account not found.");
                PanelAccountForm.Visible = false;
                return;
            }

            ButtonAccountAction.Text = "Update Account";
            ButtonAccountAction.Click += ButtonAccountActionUpdate_Click;

            if (Page.IsPostBack)
                return;

            LoadDropdowns();

            // account text fields
            txtAccountName.Text = accountA.accountName;
            txtAccountNumber.Text = accountA.accountNumber;
            txtWebsite.Text = accountA.website;
            txtGeneralEmail.Text = accountA.generalEmail;
            txtAccountPhone.Text = accountA.phone;
            txtAccountFax.Text = accountA.fax;
            ddlPrimaryContact.SelectedValue = accountA.primaryContact.ToString();

            if (accountA.address != null)
            {
                pnlShippingAddress.Visible = true;
                buttonAddShippingAddress.Visible = false;
                txtShippingAddress1.Text = accountA.AddressA.line1;
                txtShippingAddress2.Text = accountA.AddressA.line2;
                txtShippingCity.Text = accountA.AddressA.city;
                ddlShippingProvince.SelectedValue = accountA.AddressA.state;
                txtShippingPostalCode.Text = accountA.AddressA.zipcode;
                ckbSameAsShipping.Enabled = true;
            }

            if (accountA.billingAddress != null)
            {
                pnlBillingAddress.Visible = true;
                buttonAddBillingAddress.Visible = false;
                if (accountA.address == accountA.billingAddress)
                {
                    ckbSameAsShipping.Checked = true;
                    pnlBillingAddressDetails.Enabled = false;
                }
                else
                {
                    txtBillingAddress1.Text = accountA.BillingAddressA.line1;
                    txtBillingAddress2.Text = accountA.BillingAddressA.line2;
                    txtBillingCity.Text = accountA.BillingAddressA.city;
                    ddlBillingProvince.SelectedValue = accountA.BillingAddressA.state;
                    txtBillingPostalCode.Text = accountA.BillingAddressA.zipcode;
                }
            }

            if (accountA.address == accountA.billingAddress)
            {
                ckbSameAsShipping.Checked = true;
                pnlBillingAddressDetails.Enabled = false;
            }

            if (Page.IsPostBack)
                return;

        }

        private void LoadDropdowns()
        {
            if (ddlPrimaryContact != null)
            {
                ddlPrimaryContact.Items.Clear();
                var contacts = theGateContext.Contacts.OrderBy(c => c.contactID).Select(e => new { Name = e.firstName + " " + e.lastName, ID = e.contactID });
                contacts.ToList().ForEach(s => ddlPrimaryContact.Items.Add(new ListItem(s.Name, s.ID.ToString())));
            }
        }

        private void ButtonAccountActionAdd_Click(object sender, EventArgs e)
        {
            var newAccountA = new Model.Account();
            newAccountA = LoadAccount(newAccountA);
            theGateContext.Accounts.Add(newAccountA);
            theGateContext.SaveChanges();
            Response.Redirect("AccountDetails.aspx?id=" + newAccountA.accountID);
        }

        protected void ButtonAccountActionUpdate_Click(object sender, EventArgs e)
        {
            ClearAlerts();
            try
            {
                int i = int.Parse(Request.QueryString["id"] != null ? Request.QueryString["id"] : "0");
                var newAccount = theGateContext.Accounts.FirstOrDefault(a => a.accountID == i);

                newAccount = LoadAccount(newAccount);

                if (pnlShippingAddress.Visible)
                {
                    if (newAccount.address == null)
                    {
                        var sa = new Address()
                        {
                            line1 = txtShippingAddress1.Text,
                            line2 = txtShippingAddress2.Text,
                            city = txtShippingCity.Text,
                            state = ddlShippingProvince.SelectedValue,
                            zipcode = txtShippingPostalCode.Text
                        };
                        theGateContext.Addresses.Add(sa);
                        theGateContext.SaveChanges();
                        newAccount.address = sa.addressID;
                    }
                    else
                    {
                        newAccount.AddressA.line1 = txtShippingAddress1.Text;
                        newAccount.AddressA.line2 = txtShippingAddress2.Text;
                        newAccount.AddressA.city = txtShippingCity.Text;
                        newAccount.AddressA.state = ddlShippingProvince.SelectedValue;
                        newAccount.AddressA.zipcode = txtShippingPostalCode.Text;
                    }
                }

                if (pnlBillingAddress.Visible)
                {
                    if (ckbSameAsShipping.Checked)
                        newAccount.billingAddress = newAccount.address;
                    else
                    {
                        if (newAccount.billingAddress == null || newAccount.address == newAccount.billingAddress)
                        {
                            var ba = new Address()
                            {
                                line1 = txtBillingAddress1.Text,
                                line2 = txtBillingAddress2.Text,
                                city = txtBillingCity.Text,
                                state = ddlBillingProvince.SelectedValue,
                                zipcode = txtBillingPostalCode.Text
                            };
                            theGateContext.Addresses.Add(ba);
                            theGateContext.SaveChanges();
                            newAccount.billingAddress = ba.addressID;
                        }
                        else
                        {
                            newAccount.BillingAddressA.line1 = txtBillingAddress1.Text;
                            newAccount.BillingAddressA.line2 = txtBillingAddress2.Text;
                            newAccount.BillingAddressA.city = txtBillingCity.Text;
                            newAccount.BillingAddressA.state = ddlBillingProvince.SelectedValue;
                            newAccount.BillingAddressA.zipcode = txtBillingPostalCode.Text;
                        }
                    }
                }

                theGateContext.SaveChanges();
                ShowSuccess("Account successfully updated.");
            }
            catch (Exception ex)
            {
                ShowError("Error updating account: " + ex.Message);
            }
        }

        private Model.Account LoadAccount(Model.Account a)
        {
            a.accountNumber = txtAccountNumber.Text;
            a.accountName = txtAccountName.Text;
            a.primaryContact = int.Parse(ddlPrimaryContact.SelectedValue);
            a.phone = txtAccountPhone.Text;
            a.fax = txtAccountFax.Text;
            a.website = txtWebsite.Text;
            a.generalEmail = txtGeneralEmail.Text;

            return a;
        }

        private void ShowError(string p)
        {
            PanelAlertError.Visible = true;
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

        protected void ckbSameAsShipping_CheckedChanged(object sender, EventArgs e)
        {
            pnlBillingAddressDetails.Enabled = !ckbSameAsShipping.Checked;
        }

        protected void buttonAddBillingAddress_Click(object sender, EventArgs e)
        {
            if (accountA.address == null)
                ckbSameAsShipping.Enabled = false;
            buttonAddBillingAddress.Visible = false;
            pnlBillingAddress.Visible = true;
        }

        protected void buttonAddShippingAddress_Click(object sender, EventArgs e)
        {
            ckbSameAsShipping.Enabled = true;
            buttonAddShippingAddress.Visible = false;
            pnlShippingAddress.Visible = true;
        }
    }
}