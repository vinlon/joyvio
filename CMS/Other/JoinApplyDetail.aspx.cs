using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using WSI.ServiceLocator;
using WSI.Model.Entities;

namespace CMS.Other
{
    public partial class JoinApplyDetail : System.Web.UI.Page
    {
        private readonly string applyid = HttpContext.Current.Request.Params["applyid"] ?? "";
        private readonly IJoinApplyService service = ServiceLocator.Instance.GetService<IJoinApplyService>();

        protected JoinApply apply;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (applyid != "")
            {
                apply = service.GetDetail(applyid);
            }
        }
    }
}