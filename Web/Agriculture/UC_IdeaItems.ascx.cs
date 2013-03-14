using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using WSI.ServiceLocator;

namespace Web.Agriculture
{
    public partial class UC_IdeaItems : System.Web.UI.UserControl
    {
        /// <summary>
        /// 显示个数
        /// </summary>
        public int ItemCount { get; set; }

        public int TitleLength { get; set; }

        private readonly IInformationService service = ServiceLocator.Instance.GetService<IInformationService>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int count;
                repMain.DataSource = service.GetActivePagedInfosByNavId(Common.AGRICLUTURE_IDEA_ID, 1, ItemCount, out count);
                repMain.DataBind();
            }
        }
    }
}