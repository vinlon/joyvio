using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.Model.Entities;
using WSI.IService;
using WSI.ServiceLocator;

namespace Web.Food
{
    public partial class FoodTrend : System.Web.UI.Page
    {
        protected readonly string navid = HttpContext.Current.Request.Params["navid"] ?? "";

        protected FrontendNavigation nav;

        private readonly IFrontendNavigationService navService = ServiceLocator.Instance.GetService<IFrontendNavigationService>();
        private readonly IInformationService service = ServiceLocator.Instance.GetService<IInformationService>();

        private readonly int PAGE_SIZE = 8;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (navid != "")
            {
                nav = navService.GetDetail(navid);
            }
            if (!IsPostBack)
            {
                bindInformation();
            }
        }

        private void bindInformation()
        {
            int count;
            repMain.DataSource = service.GetActivePagedInfosByNavId(navid, AspNetPager1.CurrentPageIndex, PAGE_SIZE, out count);
            repMain.DataBind();

            AspNetPager1.RecordCount = count;
            AspNetPager1.PageSize = PAGE_SIZE;
        }

        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            bindInformation();
        }


    }
}