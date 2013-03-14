using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using WSI.ServiceLocator;
using WSI.Model.Entities;
using Utility;
namespace Web
{
    public partial class Main : System.Web.UI.MasterPage
    {
        private readonly IFrontendNavigationService service = ServiceLocator.Instance.GetService<IFrontendNavigationService>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindMenu();
            }
        }

        private void bindMenu()
        {
            repMenu.DataSource = service.GetActiveTopList().OrderBy(n => n.SortIndex);
            repMenu.DataBind();
        }

        protected IList<FrontendNavigation> GetChildren(FrontendNavigation parent)
        {
            return service.GetSortedListByParentId(parent.NavId.ToString())
                .Where(n => n.State == (int)EnumHelper.State.Enable)
                .ToList();
        }
        
    }
}