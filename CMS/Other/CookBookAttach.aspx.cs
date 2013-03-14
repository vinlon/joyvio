using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using WSI.ServiceLocator;
using System.IO;

namespace CMS.Other
{
    public partial class CookBookAttach : BackendPageBase
    {
        private readonly string cbid = HttpContext.Current.Request.Params["cbid"] ?? "";

        protected WSI.Model.Entities.CookBook cb;

        protected readonly ICookBookService service = ServiceLocator.Instance.GetService<ICookBookService>();

        //key
        protected readonly int drag_width = 200;//截图框的默认宽度
        protected readonly string drag_width_name = "drag_width";
        protected readonly string show_width_name = "show_width";
        protected readonly string cut_top_name = "cut_top";
        protected readonly string cut_left_name = "cut_left";

        private readonly string ATTACH_IMAGE_DIR = "/Other/CookBookAttach";
        private readonly string IMAGE_EXT = ".jpg";

        private readonly int cover_width = 68;
        private readonly int cover_height = 68;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (cbid != "")
            {
                cb = service.GetDetail(cbid);
            }
            if (!IsPostBack)
            {
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //原图
            System.Drawing.Image img = null;
            string path = GetUniqueFileName(IMAGE_EXT);
            string savePath = Server.MapPath(path);
            var sourcePath = Server.MapPath(Request.Params["img_path"] ?? "");
            try
            {
                if (!File.Exists(sourcePath))
                {
                    throw new FileNotFoundException("原图未找到");
                }

                img = System.Drawing.Image.FromFile(sourcePath);

                ImageProcess(0, img.Width, cover_width, cover_height, savePath);
            }
            catch (Exception ex)
            {
                base.AlertGo(@"服务器异常：" + ex.Message, Request.Url.ToString());
            }
            finally
            {
                if (img != null)
                {
                    img.Dispose();
                    //删除临时图片
                    Utility.ImageProcess.DeleteImage(sourcePath);
                }
            }

            //更新数据
            service.UpdateImage(cbid, path);
            Response.Redirect("CookBook.aspx");
        }

        private void ImageProcess(int index, int sourceWidth, int destWidth, int destHeight, string savePath)
        {
            //原图路径
            var path = Server.MapPath(Request.Params["img_path"] ?? "");


            //截图框的宽度
            int dragWidth = int.Parse(Request.Params[drag_width_name].Split(',')[index].ToString());
            //图片显示的宽度
            int showWidth = int.Parse(Request.Params[show_width_name].Split(',')[index].ToString());
            //截图框的上位移（相对于显示图片）
            int cutTop = int.Parse(Request.Params[cut_top_name].Split(',')[index].ToString());
            //截图框的左位移（相对于显示图片） 
            int cutLeft = int.Parse(Request.Params[cut_left_name].Split(',')[index].ToString());

            //原图相对于显示图的比例
            decimal ratio = (decimal)sourceWidth / (decimal)showWidth;
            //截图框在原图上的起始坐标
            int destX = (int)(cutLeft * ratio);
            int destY = (int)(cutTop * ratio);

            //截图框在原图上的真实尺寸
            int width = (int)(dragWidth * ratio);
            int height = width * destHeight / destWidth;

            string thumbPath = service.GetThumbPath(savePath);

            //截出对的比例(原图)
            Utility.ImageProcess.CutImage(path, destX, destY, width, height, savePath);

            //截出对的尺寸（缩略图）
            Utility.ImageProcess.ImageToProperSize(savePath, destWidth, destHeight, thumbPath);

        }

        //获得唯一文件名，虚拟路径
        private string GetUniqueFileName(string ext)
        {
            return string.Format("{0}/{1}{2}{3}", ATTACH_IMAGE_DIR, DateTime.Now.ToString(Common.DATETIME_FORMAT_STRING), new Random().Next(1000, 10000), ext);
        }

    }

}