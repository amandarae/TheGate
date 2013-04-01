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
    public partial class ContactDetails : SitePage
    {
        protected Contact ContactA;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                // add contact setup
                ButtonContactAction.Text = "Add Contact";
                ButtonContactAction.Click += ButtonContactActionAdd_Click;
                pnlAddresses.Visible = false;
                return;
            }

            int i = int.Parse(Request.QueryString["id"] != null ? Request.QueryString["id"] : "0");
            ContactA = theGateContext.Contacts.FirstOrDefault(c => c.contactID == i);

            if (ContactA == null)
            {
                ShowError("Contact not found.");
                PanelContactForm.Visible = false;
                return;
            }

            ButtonContactAction.Text = "Update Contact";
            ButtonContactAction.Click += ButtonContactActionUpdate_Click;

            if (Page.IsPostBack)
                return;

            txtContactFirstName.Text = ContactA.firstName;
            txtContactLastName.Text = ContactA.lastName;
            txtContactEmail.Text = ContactA.email;
            txtContactPhone.Text = ContactA.phone;
            txtContactFax.Text = ContactA.fax;

            if (ContactA.shippingAddress != null)
            {
                pnlShippingAddress.Visible = true;
                buttonAddShippingAddress.Visible = false;
                txtShippingAddress1.Text = ContactA.Address.line1;
                txtShippingAddress2.Text = ContactA.Address.line2;
                txtShippingCity.Text = ContactA.Address.city;
                ddlShippingProvince.SelectedValue = ContactA.Address.state;
                txtShippingPostalCode.Text = ContactA.Address.zipcode;
                ckbSameAsShipping.Enabled = true;
            }

            if (ContactA.billingAddress != null)
            {
                pnlBillingAddress.Visible = true;
                buttonAddBillingAddress.Visible = false;
                if (contact.shippingAddress == ContactA.billingAddress)
                {
                    ckbSameAsShipping.Checked = true;
                    pnlBillingAddressDetails.Enabled = false;
                }
                else
                {
                    txtBillingAddress1.Text = ContactA.Address1.line1;
                    txtBillingAddress2.Text = ContactA.Address1.line2;
                    txtBillingCity.Text = ContactA.Address1.city;
                    ddlBillingProvince.SelectedValue = ContactA.Address1.state;
                    txtBillingPostalCode.Text = ContactA.Address1.zipcode;
                }
            }

            if (ContactA.shippingAddress == ContactA.billingAddress)
            {
                ckbSameAsShipping.Checked = true;
                pnlBillingAddressDetails.Enabled = false;
            }

            if (Page.IsPostBack)
                return;

        }

        private void ButtonContactActionAdd_Click(object sender, EventArgs e)
        {
            var newContact = new Contact();
            newContact = LoadContact(newContact);
            theGateContext.Contacts.Add(newContact);
            theGateContext.SaveChanges();
            Response.Redirect("ContactDetails.aspx?id=" + newContact.contactID);
        }

        protected void ButtonContactActionUpdate_Click(object sender, EventArgs e)
        {
            ClearAlerts();
            try
            {
                int i = int.Parse(Request.QueryString["id"] != null ? Request.QueryString["id"] : "0");
                var newContact = theGateContext.Contacts.FirstOrDefault(c => c.contactID == i);

                newContact = LoadContact(newContact);

                if (pnlShippingAddress.Visible)
                {
                    if (newContact.shippingAddress == null)
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
                        newContact.shippingAddress = sa.addressID;
                    }
                    else
                    {
                        newContact.Address.line1 = txtShippingAddress1.Text;
                        newContact.Address.line2 = txtShippingAddress2.Text;
                        newContact.Address.city = txtShippingCity.Text;
                        newContact.Address.state = ddlShippingProvince.SelectedValue;
                        newContact.Address.zipcode = txtShippingPostalCode.Text;
                    }
                }

                if (pnlBillingAddress.Visible)
                {
                    if (ckbSameAsShipping.Checked)
                        newContact.billingAddress = newContact.shippingAddress;
                    else
                    {
                        if (newContact.billingAddress == null || newContact.shippingAddress == newContact.billingAddress)
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
                            newContact.billingAddress = ba.addressID;
                        }
                        else
                        {
                            newContact.Address1.line1 = txtBillingAddress1.Text;
                            newContact.Address1.line2 = txtBillingAddress2.Text;
                            newContact.Address1.city = txtBillingCity.Text;
                            newContact.Address1.state = ddlBillingProvince.SelectedValue;
                            newContact.Address1.zipcode = txtBillingPostalCode.Text;
                        }
                    }
                }

                theGateContext.SaveChanges();
                ShowSuccess("Contact successfully updated.");
            }
            catch (Exception ex)
            {
                ShowError("Error updating product: " + ex.Message);
            }
        }

        private Model.Contact LoadContact(Model.Contact c)
        {
            c.firstName = txtContactFirstName.Text;
            c.lastName = txtContactLastName.Text;
            c.email = txtContactEmail.Text;
            c.phone = txtContactPhone.Text;
            c.fax = txtContactFax.Text;

            return c;
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

        protected void ckbSameAsShipping_CheckedChanged(object sender, EventArgs e)
        {
            pnlBillingAddressDetails.Enabled = !ckbSameAsShipping.Checked;
        }

        protected void buttonAddBillingAddress_Click(object sender, EventArgs e)
        {
            if (ContactA.shippingAddress == null)
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