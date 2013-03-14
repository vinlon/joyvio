using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.Model.Entities;
using WSI.IService;
using WSI.ServiceLocator;

namespace Web.Food
{
    public partial class KiwiDetail : System.Web.UI.Page
    {
        private readonly string cbid = HttpContext.Current.Request.Params["cbid"] ?? "";

        private readonly ICookBookService service = ServiceLocator.Instance.GetService<ICookBookService>();
        private readonly IFrontendNavigationService navService = ServiceLocator.Instance.GetService<IFrontendNavigationService>();

        protected CookBook cb;
        protected CookBook next;
        protected CookBook prev;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (cbid != "")
            {
                cb = service.GetDetail(cbid);
                next = service.GetNextRecord(cb);
                prev = service.GetPrevRecord(cb);
            }
        }

        protected string GetNavigationName(CookBook cb)
        {
            var nav = navService.GetDetail(cb.NavigationId.ToString());
            if (nav.ParentId != null)
            {
                var parent = navService.GetDetail(nav.ParentId.ToString());
                if (parent != null)
                {
                    return string.Format("{0}({1})", nav.NavName, parent.NavName);
                }
            }
            return nav.NavName;
        }
    }
}