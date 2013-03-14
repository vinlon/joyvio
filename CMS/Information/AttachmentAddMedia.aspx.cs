using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMS.Information
{
    public partial class AttachmentAddMedia : BackendPageBase
    {
        protected readonly string infoid = HttpContext.Current.Request["infoid"] ?? "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}