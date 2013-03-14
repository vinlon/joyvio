using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.Model.Entities;
using WSI.IService;
using WSI.ServiceLocator;
using Utility;

namespace CMS.Information
{
    public partial class TagInformationRela : BackendPageBase
    {
        private ITagService service = ServiceLocator.Instance.GetService<ITagService>();
        private IInformationService infoService = ServiceLocator.Instance.GetService<IInformationService>();

        protected readonly string tid = HttpContext.Current.Request["tid"] ?? "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (tid != "")
            {


                //加载信息
                bindInformation();
            }
        }

        private void bindInformation()
        {
            //标签名称
            Tag tag = service.GetDetail(tid);
            if (tag != null)
            {
                lbTagName.Text = tag.TagName;
                var list = service.GetInformationsByTagCode(tag.TagCode);

                hfOldOrder.Value = string.Join(",", list.Select(i => i.InfoId));
                repMain.DataSource = list;
                repMain.DataBind();
            }
        }

        protected void AttachInformation(object sender, EventArgs e)
        {
            string title = txtInfoTitle.Text.Trim();

            var info = infoService.GetInformationByTitle(title);

            if (info == null)
            {
                lbMessage.Text = "未找到该条信息!";
                return;

            }
            if (info.State == (int)EnumHelper.State.Disable)
            {
                lbMessage.Text = "该信息状态为禁用！";
                return;
            }
            service.UpdateTagInformation(tid, info.InfoId.ToString());

            //刷新页面 
            Response.Redirect(Request.Url.ToString());
        }

        protected void repMain_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            //移除一条信息
            if (e.CommandName == "remove")
            {
                string infoid = e.CommandArgument.ToString();
                service.RemoveInformation(tid, infoid);
            }
            Response.Redirect(Request.Url.ToString());
        }

    }
}