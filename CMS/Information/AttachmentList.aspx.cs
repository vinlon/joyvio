using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using WSI.ServiceLocator;

namespace CMS.Information
{
    public partial class AttachmentList : BackendPageBase
    {
        protected readonly string infoid = HttpContext.Current.Request["infoid"] ?? "";
        private readonly IInformationService service = ServiceLocator.Instance.GetService<IInformationService>();
        private readonly IImageSizeService sizeService = ServiceLocator.Instance.GetService<IImageSizeService>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindAttach();
                bindSize();
            }
        }

        private void bindAttach()
        {
            var info = service.GetDetailIncludeAll(infoid);
            if (info != null)
            {
                repMain.DataSource = info.Attachments.OrderBy(a => a.SortIndex);
                repMain.DataBind();
            }
        }

        private void bindSize()
        {
            repSize.DataSource = sizeService.GetActiveList();
            repSize.DataBind();
        }
    }
}