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
    public partial class KiwiCooked : System.Web.UI.Page
    {
        private readonly string navid = HttpContext.Current.Request.Params["navid"] ?? "";

        protected FrontendNavigation nav;

        protected FrontendNavigation parent;

        private readonly IFrontendNavigationService navService = ServiceLocator.Instance.GetService<IFrontendNavigationService>();

        private readonly ICookBookService service = ServiceLocator.Instance.GetService<ICookBookService>();

        public readonly int PAGE_SIZE = 12;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (navid != "")
            {
                nav = navService.GetDetail(navid);
                if (nav != null && nav.ParentId != null)
                {
                    parent = navService.GetDetail(nav.ParentId.ToString());
                }
            }
            if (!IsPostBack)
            {
                bindCookBook();
            }
        }

        private void bindCookBook()
        {
            int count;
            repMain.DataSource = service.GetActiveSortedPagedListByNavId(navid, AspNetPager1.CurrentPageIndex, PAGE_SIZE, out count);
            repMain.DataBind();

            AspNetPager1.PageSize = PAGE_SIZE;
            AspNetPager1.RecordCount = count;
        }

        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            bindCookBook();
        }

    }
}