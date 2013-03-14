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
    public partial class UC_FoodNewsRecommend : System.Web.UI.UserControl
    {
        private readonly ITagService service = ServiceLocator.Instance.GetService<ITagService>();

        private readonly int size = 3;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindInformation();
            }
        }

        private void bindInformation()
        {
            repMain.DataSource = service.GetInformationsByTagCode(Common.FOOD_NEWS_RECOMMEND_TAG_CODE).Take(size);
            repMain.DataBind();
        }
    }
}