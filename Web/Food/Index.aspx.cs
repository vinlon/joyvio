using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using WSI.ServiceLocator;

namespace Web.Food
{
    public partial class Index : System.Web.UI.Page
    {
        private readonly string navid = Utility.CommonHelper.NAVIGATION_COOKBOOK_ID;

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
            repMain.DataSource = navService.GetSortedListByParentId(navid);
            repMain.DataBind();
        }
    }
}