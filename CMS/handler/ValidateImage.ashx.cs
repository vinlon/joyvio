using System;
using System.Web;
using System.Web.SessionState;
using System.Drawing;
using System.Text;
using System.Drawing.Imaging;

namespace CMS.handler
{
    /// <summary>
    /// Summary description for ValidateImage1
    /// </summary>
    public class ValidateImage1 : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext hc)
        {
            hc.Response.ContentType = "image/gif";
            Bitmap b = new Bitmap(180, 60);
            Graphics g = Graphics.FromImage(b);

            g.FillRectangle(new SolidBrush(Color.Wheat), 0, 0, 180, 60);

            Font font = new Font(FontFamily.GenericSerif, 48, FontStyle.Bold, GraphicsUnit.Pixel);
            Random r = new Random();
            string strLetters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            StringBuilder s = new StringBuilder();

            for (int i = 0; i < 4; i++)
            {
                s.Append(strLetters.Substring(r.Next(0, strLetters.Length - 1), 1));
                g.DrawString(s[s.Length - 1].ToString(), font, new SolidBrush(Color.BlueViolet), i * 40, r.Next(0, 10));
            }

            Pen pen = new Pen(new SolidBrush(Color.Gray), 2);

            for (int i = 0; i < 6; i++)
            {
                g.DrawLine(pen, new Point(r.Next(0, 199), r.Next(0, 59)), new Point(r.Next(0, 199), r.Next(0, 59)));
            }
            b.Save(hc.Response.OutputStream, ImageFormat.Gif);
            hc.Session[CMS.Common.SESSION_KEY_VERIFYCODE] = s.ToString();
            hc.Response.End();
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