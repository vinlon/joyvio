using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Drawing;
using System.Web.SessionState;
using Utility;
namespace CMS.handler
{
    public class fileupload : IHttpHandler, IRequiresSessionState
    {

        //安全措施1：在处理文件中定义文件夹，以免暴露文件夹信息
        private static string tempFolder = "/UploadFile/Temp/"; //(HttpContext.Current.Session["targetFolder"] ?? "/UploadFile/").ToString();
        private static string videoFolder = "/UploadFile/Video/";
        //安全措施2：文件扩展名检查
        string[] imgExts = { ".jpg", ".png" };
        string[] videoExts = { ".mp4" };
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Write(UploadFile(context));
        }

        private string UploadFile(HttpContext context)
        {
            if (!Common.IsVerified)
            {
                return "error:身份验证失败";
            }

            HttpFileCollection files = context.Request.Files;
            if (files.Count == 0)
            {
                return "error:未找到上传文件！";
            }

            List<string> retValue = new List<string>();
            foreach (string name in files)
            {
                HttpPostedFile file = files[name];
                string ext = Path.GetExtension(file.FileName).ToLower();
                if (imgExts.Contains(ext))
                {
                    //图片的验证
                    Stream fileStream = file.InputStream;
                    Image img = null;
                    try
                    {
                        img = Image.FromStream(fileStream);

                        //此处可对图片的宽、高等信息进行验证
                    }
                    catch (Exception)
                    {
                        //类型转换失败则证明图片不合法
                        return "error:非法的图片！";
                    }
                    finally
                    {
                        img.Dispose();
                    }
                    string filePath = tempFolder + DateTime.Now.ToString("yyyyMMddHHmmssffff") + ext;

                    string dir = context.Server.MapPath(tempFolder);
                    if (!Directory.Exists(dir))
                    {
                        Directory.CreateDirectory(dir);
                    }

                    file.SaveAs(context.Server.MapPath(filePath));

                    retValue.Add(filePath);//执行成功返回文件名
                }
                else if (videoExts.Contains(ext))
                {
                    string filePath = videoFolder + DateTime.Now.ToString("yyyyMMddHHmmssffff") + ext;
                    string dir = context.Server.MapPath(videoFolder);
                    if (!Directory.Exists(dir))
                    {
                        Directory.CreateDirectory(dir);
                    }

                    file.SaveAs(context.Server.MapPath(filePath));
                    retValue.Add(filePath);//执行成功返回文件名
                }
                else
                {
                    return "error:文件格式不合法";
                }
            }
            return retValue.ToJson();

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