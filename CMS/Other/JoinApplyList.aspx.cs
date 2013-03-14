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
    public partial class JoinApplyList : BackendPageBase
    {
        private readonly IJoinApplyService service = ServiceLocator.Instance.GetService<IJoinApplyService>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindApply();
            }
        }

        private void bindApply()
        {
            int count;
            repMain.DataSource = service.GetPagedList(AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize, out count);
            repMain.DataBind();

            AspNetPager1.RecordCount = count;
        }

        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            bindApply();
        }
    }
}