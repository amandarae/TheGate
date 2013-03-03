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
            using (Image image = GetImage(context.Request.QueryString["ID"]))
            {
                context.Response.ContentType = "image/jpeg";
                image.Save(context.Response.OutputStream, ImageFormat.Jpeg);
            }
        }

        private Image GetImage(string p)
        {
            int i;
            if (!int.TryParse(p, out i))
                return null;

            using(var theGateContext = new TheGateContext())
            {
                var file = theGateContext.Files.First(f => f.fileID == i);
                Image image;
                using (MemoryStream inStream = new MemoryStream())
                {
                    inStream.Write(file.Data, 0, file.Data.Length);

                    image = Bitmap.FromStream(inStream);
                }

                return image;
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