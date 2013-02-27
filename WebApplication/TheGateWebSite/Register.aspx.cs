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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButtonRegister_Click(object sender, EventArgs e)
        {
            MembershipCreateStatus createStatus;
            MembershipUser newUser = Membership.CreateUser(TextBoxEmail.Text, TextBoxPassword.Text, TextBoxEmail.Text, null, null, true, out createStatus);
            switch (createStatus)
            {
                case MembershipCreateStatus.Success:
                    PanelRegisterAlertError.Visible = true;
                    LabelRegisterAlert.Text = "The user account was successfully created! ";
                    
                    try
                    {
                        var contact = new Contact() {
                            firstName = TextBoxFirstName.Text,
                            lastName = TextBoxLastName.Text,
                            email = TextBoxEmail.Text, 
                        };

                        using (var db = new TheGateContext())
                        {
                            db.Contacts.Add(contact);
                            db.SaveChanges();
                        }

                        if (Membership.ValidateUser(TextBoxEmail.Text.Trim(), TextBoxPassword.Text))
                        {
                            FormsAuthenticationTicket tkt;
                            string cookiestr;
                            HttpCookie ck;
                            tkt = new FormsAuthenticationTicket(TextBoxEmail.Text.Trim(), true, 30);
                            cookiestr = FormsAuthentication.Encrypt(tkt);
                            ck = new HttpCookie(FormsAuthentication.FormsCookieName, cookiestr);
                            ck.Expires = tkt.Expiration;
                            ck.Path = FormsAuthentication.FormsCookiePath;
                            Response.Cookies.Add(ck);

                            Response.Redirect("~/Profile.aspx?NewUser=Yes", true);
                        }

                        // Not valid login throw exception
                    }
                    catch (Exception ex)
                    {
                        PanelRegisterAlertError.Visible = true;
                        LabelRegisterAlert.Text = ex.Message;
                            //+ " " + ((ex.InnerException != null) ? ex.InnerException.Message : "");
                    }
                    break;
                case MembershipCreateStatus.DuplicateUserName:
                    PanelRegisterAlertError.Visible = true;
                    LabelRegisterAlert.Text = "There already exists a user with this email address/username.  Please contact support@thegate.com.";
                    break;
                case MembershipCreateStatus.DuplicateEmail:
                    PanelRegisterAlertError.Visible = true;
                    LabelRegisterAlert.Text = "There already exists a user with this email address/username.  Please contact support@thegate.com.";
                    break;
                case MembershipCreateStatus.InvalidEmail:
                    PanelRegisterAlertError.Visible = true;
                    LabelRegisterAlert.Text = "There email address provided is not valid.  Please correct and try again.";
                    break;
                case MembershipCreateStatus.InvalidAnswer:
                    PanelRegisterAlertError.Visible = true;
                    LabelRegisterAlert.Text = "There security answer was invalid.";
                    break;
                case MembershipCreateStatus.InvalidPassword:
                    PanelRegisterAlertError.Visible = true;
                    LabelRegisterAlert.Text = "The password provided is not valid. Passwords are required to be at least 6 characters long.";
                    break;
                default:
                    PanelRegisterAlertError.Visible = true;
                    LabelRegisterAlert.Text = "There was an unknown error; the user account has not created.";
                    break;
            }
        }
    }
}