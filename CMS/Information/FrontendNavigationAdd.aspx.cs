using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.Model.Entities;
using WSI.IService;

namespace CMS.Information
{
    public partial class FrontendNavigationAdd : BackendPageBase
    {
        private IFrontendNavigationService service = WSI.ServiceLocator.ServiceLocator.Instance.GetService<IFrontendNavigationService>();

        private readonly string nid = HttpContext.Current.Request["nid"] ?? "";

        public String Pid
        {
            get
            {
                if (Request["pid"] == null)
                {
                    var nav = service.GetDetail(nid);
                    if (nav != null)
                    {
                        return nav.ParentId.ToString();
                    }
                }
                return Request["pid"] ?? "";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindType();
                initNav();
            }
        }

        private void bindType()
        {
            var list = Utility.EnumHelper.GetEnumList<NavigationType>();
            ddlType.DataSource = list;
            ddlType.DataTextField = "description";
            ddlType.DataValueField = "value";
            ddlType.DataBind();

            ddlType.SelectedValue = ((int)NavigationType.List).ToString();
        }

        private void initNav()
        {
            if (Pid == "")
            {
                lbParent.Text = "一级栏目";
            }
            else
            {
                var parent = service.GetDetail(Pid);
                if (parent != null)
                {
                    lbParent.Text = parent.NavName;
                }
            }
            var nav = service.GetDetail(nid);
            if (nav != null)
            {
                txtNavName.Text = nav.NavName;
                txtDescription.Text = nav.Description;
                txtUrl.Text = nav.Url;
                ddlType.SelectedValue = nav.Type.ToString();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (nid == "")
            {
                service.AddNavigation(Pid, txtNavName.Text.Trim(), txtUrl.Text.Trim(), int.Parse(ddlType.SelectedValue), txtDescription.Text.Trim());
            }
            else
            {
                service.UpdateNavigation(nid, Pid, txtNavName.Text.Trim(), txtUrl.Text.Trim(), int.Parse(ddlType.SelectedValue), txtDescription.Text.Trim());
            }
            Response.Redirect("FrontendNavigationList.aspx");
        }
    }
}