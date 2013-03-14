using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using WSI.Model.Entities;
using WSI.ServiceLocator;

namespace Web.Food
{
    public partial class FoodDetail : System.Web.UI.Page
    {
        private readonly string infoid = HttpContext.Current.Request.Params["infoid"] ?? "";
        private readonly string navid = HttpContext.Current.Request.Params["navid"] ?? "";

        //当前栏目
        protected FrontendNavigation nav;

        protected Information info;
        //上一条
        protected Information prev;
        //下一条
        protected Information next;

        protected readonly IInformationService service = ServiceLocator.Instance.GetService<IInformationService>();
        private readonly IFrontendNavigationService navService = ServiceLocator.Instance.GetService<IFrontendNavigationService>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (infoid != "")
            {
                info = service.GetDetailIncludeAll(infoid);
            }
            if (navid != null)
            {
                nav = navService.GetDetail(navid);
                prev = service.GetPrevRecord(infoid, navid);
                next = service.GetNextRecord(infoid, navid);
            }
            if (!IsPostBack)
            {

            }
        }



        protected string WriteNavigationBar(FrontendNavigation nav)
        {
            string result = string.Format(" > <a href='{0}'>{1}</a>", Common.GetNavigationUrl(nav), nav.NavName);
            if (nav.ParentId != null)
            {
                var parent = navService.GetDetail(nav.ParentId.ToString());
                return WriteNavigationBar(parent) + result;
            }
            else
            {
                return result;
            }

        }
    }
}