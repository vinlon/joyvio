using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using WSI.ServiceLocator;

namespace CMS.User
{
    public partial class LogList : System.Web.UI.Page
    {
        private readonly ILogService service = ServiceLocator.Instance.GetService<ILogService>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindLog();
            }
        }

        private void bindLog()
        {
            int count;
            repMain.DataSource = service.GetPagedList(AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize, out count);
            repMain.DataBind();

            AspNetPager1.RecordCount = count;
        }

        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            bindLog();
        }
    }
}