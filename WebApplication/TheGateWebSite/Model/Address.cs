//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TheGateWebSite.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Address
    {
        public Address()
        {
            this.Accounts = new HashSet<Account>();
            this.AccountsBilling = new HashSet<Account>();
            this.Contacts = new HashSet<Contact>();
            this.Contacts1 = new HashSet<Contact>();
        }
    
        public int addressID { get; set; }
        public string line1 { get; set; }
        public string line2 { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public string zipcode { get; set; }
    
        public virtual ICollection<Account> Accounts { get; set; }
        public virtual ICollection<Account> AccountsBilling { get; set; }
        public virtual ICollection<Contact> Contacts { get; set; }
        public virtual ICollection<Contact> Contacts1 { get; set; }
    }
}
