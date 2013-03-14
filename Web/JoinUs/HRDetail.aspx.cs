using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using WSI.ServiceLocator;
using WSI.Model.Entities;

namespace Web.JoinUs
{
    public partial class HRDetail : System.Web.UI.Page
    {
        private readonly string rid = HttpContext.Current.Request.Params["rid"] ?? "";

        private readonly IRecruitmentService service = ServiceLocator.Instance.GetService<IRecruitmentService>();

        protected Recruitment recruit;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (rid != "")
            {
                recruit = service.GetDetail(rid);
            }
        }
    }
}