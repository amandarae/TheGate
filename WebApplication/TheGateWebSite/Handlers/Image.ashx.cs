using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using TheGateWebSite.Model;

namespace TheGateWebSite.Handlers
{
    /// <summary>
    /// Summary description for Image
    /// </summary>
    public class ImageHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            Int32 id;
            if (context.Request.QueryString["ID"] != null)
                id = Convert.ToInt32(context.Request.QueryString["ID"]);
            else
                throw new ArgumentException("No parameter specified");

            context.Response.ContentType = "image/jpeg";
            Stream strm = ShowImage(id);
            byte[] buffer = new byte[4096];
            int byteSeq = strm.Read(buffer, 0, 4096);

            while (byteSeq > 0)
            {
                context.Response.OutputStream.Write(buffer, 0, byteSeq);
                byteSeq = strm.Read(buffer, 0, 4096);
            }
        }

        private Stream ShowImage(int id)
        {
            using (var theGateContext = new TheGateContext())
            {
                var file = theGateContext.Files.First(f => f.fileID == id);
                return new MemoryStream(file.Data);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}