using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.Model.Entities;
using WSI.IService;
using WSI.ServiceLocator;
using Utility;

namespace Web.Agriculture
{
    public partial class Index : System.Web.UI.Page
    {

        private readonly IFrontendNavigationService service = ServiceLocator.Instance.GetService<IFrontendNavigationService>();

        protected FrontendNavigation leftNav; //现代农业理念

        protected void Page_Load(object sender, EventArgs e)
        {
            leftNav = service.GetDetail(Common.AGRICLUTURE_IDEA_ID);
        }
    }
}