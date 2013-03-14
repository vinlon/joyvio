using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using WSI.ServiceLocator;
using Utility;

namespace CMS.User
{
    public partial class LogDetail : System.Web.UI.Page
    {
        private readonly string logid = HttpContext.Current.Request.Params["logid"] ?? "";

        private readonly ILogService service = ServiceLocator.Instance.GetService<ILogService>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindLog();
            }
        }

        private void bindLog()
        {
            if (logid != "")
            {
                var log = service.GetDetail(logid);
                if (log != null)
                {
                    var content = log.Content.ToObject<Dictionary<string, string>>();
                    repMain.DataSource = content;
                    repMain.DataBind();
                }
            }
        }
    }
}