using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.Model.Entities;
using WSI.IService;
using WSI.ServiceLocator;
using System.IO;
using System.Net;

namespace Web.News
{
    public partial class ReportDetail : System.Web.UI.Page
    {
        private readonly string infoid = HttpContext.Current.Request.Params["infoid"] ?? "";
        private readonly string navid = HttpContext.Current.Request.Params["navid"] ?? "";

        //当前栏目
        protected FrontendNavigation nav;

        protected Information info;
        //上一条
        protected Information prev;
        //下一条
        protected Information next;

        protected readonly IInformationService service = ServiceLocator.Instance.GetService<IInformationService>();
        private readonly IFrontendNavigationService navService = ServiceLocator.Instance.GetService<IFrontendNavigationService>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (infoid != "")
            {
                info = service.GetDetailIncludeAll(infoid);
            }
            if (navid != null)
            {
                nav = navService.GetDetail(navid);
                prev = service.GetPrevRecord(infoid, navid);
                next = service.GetNextRecord(infoid, navid);
            }
            if (!IsPostBack)
            {

            }
        }



        protected string WriteNavigationBar(FrontendNavigation nav)
        {
            string result = string.Format(" > <a href='{0}'>{1}</a>", Common.GetNavigationUrl(nav), nav.NavName);
            if (nav.ParentId != null)
            {
                var parent = navService.GetDetail(nav.ParentId.ToString());
                return WriteNavigationBar(parent) + result;
            }
            else
            {
                return result;
            }

        }

        //下载
        //文件保存在另一个站点，无法读取文件流
        //直接将IIS的MIME类型 .pdf  设置为application/octet-stream，但是在谷歌下不能兼容
        protected void ResourceDownload(object sender, EventArgs e)
        {
            string cms_path = Common.CMS_URL + info.ResourcePath;

            WebClient client = new WebClient();
            try
            {
                byte[] data = client.DownloadData(cms_path);

                if (data.Length != 0)
                {
                    System.Web.HttpContext.Current.Response.Clear();
                    System.Web.HttpContext.Current.Response.ClearHeaders();
                    System.Web.HttpContext.Current.Response.Buffer = false;
                    System.Web.HttpContext.Current.Response.ContentType = "application/octet-stream";
                    System.Web.HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(Path.GetFileName(cms_path), System.Text.Encoding.UTF8));
                    System.Web.HttpContext.Current.Response.AppendHeader("Content-Length", data.Length.ToString());
                    System.Web.HttpContext.Current.Response.BinaryWrite(data);
                    System.Web.HttpContext.Current.Response.Flush();
                    System.Web.HttpContext.Current.Response.End();
                }
            }
            catch (Exception)
            {

            }

        }
    }
}