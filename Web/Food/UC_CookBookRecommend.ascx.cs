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
    public partial class UC_CookBookRecommend : System.Web.UI.UserControl
    {
        protected readonly ICookBookService service = ServiceLocator.Instance.GetService<ICookBookService>();
        private readonly int size = 3;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindRecommend();
            }
        }

        private void bindRecommend()
        {
            repMain.DataSource = service.GetRecommendList(size);
            repMain.DataBind();
        }
    }
}