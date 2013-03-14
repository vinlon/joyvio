using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using WSI.ServiceLocator;
using Utility;
using WSI.Model.Entities;

namespace Web.News
{
    public partial class UC_Recommend : System.Web.UI.UserControl
    {
        private readonly string tagCode = Common.NEWS_RECOMMEND_TAG_CODE;

        private readonly ITagService service = ServiceLocator.Instance.GetService<ITagService>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //绑定该标签下的可用信息
                repMain.DataSource = service.GetInformationsByTagCode(tagCode)
                    .Where(i => i.State == (int)EnumHelper.State.Enable);
                repMain.DataBind();
            }
        }
        protected FrontendNavigation GetDefaultNavigation(Information info)
        {
            return info.NavigationList.ElementAtOrDefault(0);
        }
    }
}