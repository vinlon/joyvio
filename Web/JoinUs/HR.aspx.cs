using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using WSI.ServiceLocator;

namespace Web.JoinUs
{
    public partial class HR : System.Web.UI.Page
    {
        private readonly IRecruitmentService service = ServiceLocator.Instance.GetService<IRecruitmentService>();

        private readonly int PAGE_SIZE = 10;

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
            repMain.DataSource = service.GetActivePagedList(AspNetPager1.CurrentPageIndex, PAGE_SIZE, out count);
            repMain.DataBind();

            AspNetPager1.PageSize = PAGE_SIZE;
            AspNetPager1.RecordCount = count;
        }

        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            bindRecruitment();
        }
    }
}