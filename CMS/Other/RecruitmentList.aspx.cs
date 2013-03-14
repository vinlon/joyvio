using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using WSI.ServiceLocator;

namespace CMS.Other
{
    public partial class RecruitmentList : BackendPageBase
    {
        private readonly IRecruitmentService service = ServiceLocator.Instance.GetService<IRecruitmentService>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindRecruitment();
            }
        }

        private void bindRecruitment()
        {
            int count;
            repMain.DataSource = service.GetPagedRecruit(AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize, out count);
            repMain.DataBind();

            AspNetPager1.RecordCount = count;
        }

        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            bindRecruitment();
        }
    }
}