using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheGateWebSite.Model;

namespace TheGateWebSite.Admin.Management
{
    public partial class DataExport : SitePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonExportOrders_Click(object sender, EventArgs e)
        {
            WriteOrdersToCSV(theGateContext.Orders.OrderBy(o => o.orderID).ToList());
        }

        public void WriteOrdersToCSV(List<Order> orders)
        {
            string attachment = "attachment; filename=OrderList.csv";
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.AddHeader("content-disposition", attachment);
            HttpContext.Current.Response.ContentType = "text/csv";
            HttpContext.Current.Response.AddHeader("Pragma", "public");
            WriteOrderColumnName();
            foreach (Order o in orders)
            {
                WriteOrderInfo(o);
            }
            HttpContext.Current.Response.End();
        }

        private void WriteOrderInfo(Order o)
        {
            StringBuilder stringBuilder = new StringBuilder();
            AddComma(o.orderID.ToString(), stringBuilder);
            AddComma(o.Contact.firstName + " " + o.Contact.lastName, stringBuilder);
            AddComma(o.accountID == null ? string.Empty : o.Account.accountName, stringBuilder);
            AddComma(o.OrderState.name, stringBuilder);
            AddComma(o.dateMade.ToString(), stringBuilder);
            AddComma(o.dateShipped == null ? string.Empty : o.dateShipped.ToString(), stringBuilder);
            AddComma(string.Format("{0:C2}", GetOrderTotal(o)), stringBuilder);
            HttpContext.Current.Response.Write(stringBuilder.ToString());
            HttpContext.Current.Response.Write(Environment.NewLine);
        }

        private string GetOrderTotal(Order o)
        {
            var total = new decimal();
            foreach (var od in o.OrderLines)
            {
                total += od.price * od.quantity;
            }
            return total.ToString();
        }

        private void AddComma(string value, StringBuilder stringBuilder)
        {
            stringBuilder.Append(value.Replace(',', ' '));
            stringBuilder.Append(", ");
        }

        private void WriteOrderColumnName()
        {
            string columnNames = "OrderID, Contact, Account, Status, Date Made, Date Shipped, Total";
            HttpContext.Current.Response.Write(columnNames);
            HttpContext.Current.Response.Write(Environment.NewLine);
        }

        protected void ButtonExportProduct_Click(object sender, EventArgs e)
        {
            WriteProductsToCSV(theGateContext.Products.OrderBy(p => p.productID).ToList());
        }

        public void WriteProductsToCSV(List<Product> products)
        {
            string attachment = "attachment; filename=ProductList.csv";
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.AddHeader("content-disposition", attachment);
            HttpContext.Current.Response.ContentType = "text/csv";
            HttpContext.Current.Response.AddHeader("Pragma", "public");
            WriteProductColumnName();
            foreach (Product p in products)
            {
                WriteProductInfo(p);
            }
            HttpContext.Current.Response.End();
        }

        private void WriteProductInfo(Product p)
        {
            StringBuilder stringBuilder = new StringBuilder();
            AddComma(p.productID.ToString(), stringBuilder);
            AddComma(p.productName, stringBuilder); 
            AddComma(string.Format("{0:C2}", p.price), stringBuilder);
            AddComma(p.onHand.ToString(), stringBuilder);
            AddComma(p.onOrder.ToString(), stringBuilder);
            HttpContext.Current.Response.Write(stringBuilder.ToString());
            HttpContext.Current.Response.Write(Environment.NewLine);
        }

        private void WriteProductColumnName()
        {
            string columnNames = "ProductID, Name, Price, Quantity on Hand, Quantity on Order";
            HttpContext.Current.Response.Write(columnNames);
            HttpContext.Current.Response.Write(Environment.NewLine);
        }

        protected void ButtonExportTimeEntries_Click(object sender, EventArgs e)
        {
            WriteTimeEntriesToCSV(theGateContext.TimeEntries.OrderByDescending(te => te.timeID).ToList());
        }

        public void WriteTimeEntriesToCSV(List<TimeEntry> timeentries)
        {
            string attachment = "attachment; filename=TimeEntryList.csv";
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.AddHeader("content-disposition", attachment);
            HttpContext.Current.Response.ContentType = "text/csv";
            HttpContext.Current.Response.AddHeader("Pragma", "public");
            WriteTimeEntriesColumnName();
            foreach (TimeEntry te in timeentries)
            {
                WriteTimeEntriesInfo(te);
            }
            HttpContext.Current.Response.End();
        }

        private void WriteTimeEntriesInfo(TimeEntry te)
        {
            StringBuilder stringBuilder = new StringBuilder();
            AddComma(te.timeID.ToString(), stringBuilder);
            AddComma(te.date.ToShortDateString(), stringBuilder);
            AddComma(te.hours.ToString(), stringBuilder);
            AddComma(te.category, stringBuilder);
            AddComma(te.Employee.Contact.firstName + " " + te.Employee.Contact.lastName, stringBuilder);
            HttpContext.Current.Response.Write(stringBuilder.ToString());
            HttpContext.Current.Response.Write(Environment.NewLine);
        }

        private void WriteTimeEntriesColumnName()
        {
            string columnNames = "timeID, date, hours, category, employee name";
            HttpContext.Current.Response.Write(columnNames);
            HttpContext.Current.Response.Write(Environment.NewLine);
        }
    }
}