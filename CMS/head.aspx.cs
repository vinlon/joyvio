using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMS
{
    public partial class head : BackendPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Common.IsVerified)
            {
                Response.Redirect(Common.URL_LOGIN);
            }
        }
    }
}