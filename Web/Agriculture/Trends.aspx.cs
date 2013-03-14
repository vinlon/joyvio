using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.Model.Entities;
using WSI.IService;
using WSI.ServiceLocator;

namespace Web.Agriculture
{
    public partial class Trends : System.Web.UI.Page
    {
        private string navid = HttpContext.Current.Request.Params["navid"] ?? "";

        private readonly IFrontendNavigationService service = ServiceLocator.Instance.GetService<IFrontendNavigationService>();
        private readonly IInformationService infoService = ServiceLocator.Instance.GetService<IInformationService>();

        protected FrontendNavigation nav;

        private readonly int PAGE_SIZE = 10;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (navid != "")
            {
                nav = service.GetDetail(navid);
                var children = service.GetSortedListByParentId(navid);
                if (children.Count > 0)
                {
                    Response.Redirect("/Agriculture/Trends.aspx?navid=" + children[0].NavId.ToString());
                }
            }

            if (!IsPostBack)
            {
                bindInformation();
            }
        }

        private void bindInformation()
        {
            int count;
            repMain.DataSource = infoService.GetActivePagedInfosByNavId(navid, AspNetPager1.CurrentPageIndex, PAGE_SIZE, out count);
            repMain.DataBind();

            AspNetPager1.PageSize = PAGE_SIZE;
            AspNetPager1.RecordCount = count;
        }


        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            bindInformation();
        }
    }
}