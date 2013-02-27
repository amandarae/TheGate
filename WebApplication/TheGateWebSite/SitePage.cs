using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using TheGateWebSite.Model;

namespace TheGateWebSite
{
    public class SitePage : System.Web.UI.Page
    {
        private TheGateContext _theGateContext;
        private Contact _contact;

        public SitePage() 
        {
            _theGateContext = new TheGateContext();
            var userID = Membership.GetUser() != null ? (Guid)Membership.GetUser().ProviderUserKey : Guid.Empty;
            _contact = theGateContext.Contacts.Where(c => c.userID == userID).FirstOrDefault();
        }

        public TheGateContext theGateContext
        {
            get { return _theGateContext; }
        }

        public Contact contact
        {
            get { return _contact; }
        }

        protected void RedirectToLoginCheck()
        {
            if (!Request.IsAuthenticated)
                Response.Redirect("~/Login.aspx");

            if (contact == null)
                Response.Redirect("~/Profile.aspx");
        }
    }
}