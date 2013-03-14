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
    public partial class CookBook : System.Web.UI.Page
    {
        protected readonly ICookBookService service = ServiceLocator.Instance.GetService<ICookBookService>();
        private readonly IFrontendNavigationService navService = ServiceLocator.Instance.GetService<IFrontendNavigationService>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindCookBook();
            }
        }

        private void bindCookBook()
        {
            int count;
            repMain.DataSource = service.GetPagedList(AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize, out count);
            repMain.DataBind();

            AspNetPager1.RecordCount = count;
        }

        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            bindCookBook();
        }

        protected string GetParentNavigationName(FrontendNavigation nav)
        {
            if (nav.ParentId != null)
            {
                var parent = navService.GetDetail(nav.ParentId.ToString());
                if (parent != null)
                {
                    return parent.NavName;
                }
            }
            return "";
        }
    }
}