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

namespace CMS
{
    public partial class menu : BackendPageBase
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
            repMain.DataSource = Common.VerifiedNavigationList
                .Where(n => n.Parent == null && n.AsMenu == true)
                .OrderBy(n => n.SortIndex);
            repMain.DataBind();

            var toplist = service.GetTopList();
            var datasource = new List<FrontendNavigation>();
            foreach (var top in toplist)
            {
                if (top.Type == (int)NavigationType.List)
                {
                    top.State = 0;//此处state用于标记是否显示链接
                    datasource.Add(top);
                    var leaves = service.GetLeafNavigationsByRootId(top.NavId.ToString()).Where(n => n.State == (int)EnumHelper.State.Enable);

                    foreach (var leaf in leaves)
                    {
                        datasource.Add(leaf);
                    }
                }
            }

            repInfoNav.DataSource = datasource;
            repInfoNav.DataBind();
        }


        protected IList<Navigation> GetChild(Navigation nav)
        {
            return Common.VerifiedNavigationList
                .Where(n => n.ParentId == nav.NavigationId && n.AsMenu)
                .OrderBy(n => n.SortIndex)
                .ToList();
        }
    }
}
