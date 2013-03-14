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
    public partial class UC_AgricultureNews : System.Web.UI.UserControl
    {
        /// <summary>
        /// 是否显示在首页
        /// </summary>
        public bool isIndex { get; set; }

        private readonly IFrontendNavigationService service = ServiceLocator.Instance.GetService<IFrontendNavigationService>();
        private readonly IInformationService infoService = ServiceLocator.Instance.GetService<IInformationService>();

        private readonly string navid = Common.AGRICLUTURE_NEWS_ID;
        private readonly int NEWS_COUNT = 4;

        protected FrontendNavigation nav;  //产业链动态
        protected void Page_Load(object sender, EventArgs e)
        {
            nav = service.GetDetail(navid);
            if (!IsPostBack)
            {
                if (nav != null)
                {
                    //绑定产业链动态的子栏目
                    repRight.DataSource = service.GetSortedListByParentId(navid).Where(n => n.State == (int)EnumHelper.State.Enable);
                    repRight.DataBind();
                }
            }
        }

        protected IList<Information> GetInformations(FrontendNavigation nav)
        {
            if (nav != null)
            {
                int count;
                return infoService.GetActivePagedInfosByNavId(nav.NavId.ToString(), 1, NEWS_COUNT, out count);
            }
            return null;
        }
    }
}