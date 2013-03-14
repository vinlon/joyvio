using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.Model.Entities;
using WSI.IService;

namespace CMS.User
{
    public partial class NavigationAdd : BackendPageBase
    {
        protected readonly string nid = HttpContext.Current.Request["nid"] ?? "";
        private readonly string pid = HttpContext.Current.Request["pid"] ?? "";

        private readonly INavigationService service = WSI.ServiceLocator.ServiceLocator.Instance.GetService<INavigationService>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindParent();
                initNav();
            }
        }

        private void initNav()
        {
            Navigation nav = service.GetDetail(nid);
            if (nav != null)
            {
                txtNavName.Text = nav.NavigationName;
                txtUrl.Text = nav.Url;
                txtDesc.Text = nav.Description;
                ckbAsMenu.Checked = nav.AsMenu;
                if (nav.ParentId == null)
                {
                    //ddlParent.Enabled = false;
                    ckbAsParent.Checked = true;
                }
                else
                {
                    ddlParent.SelectedValue = nav.ParentId.ToString();
                }
            }
        }

        protected void bindParent()
        {
            ddlParent.DataSource = service.GetActiveTopNavigation();
            ddlParent.DataTextField = "NavigationName";
            ddlParent.DataValueField = "NavigationId";
            ddlParent.DataBind();
            ddlParent.Items.Insert(0, new ListItem("=请选择=", ""));

            if (pid != "")
            {
                ddlParent.SelectedValue = pid;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //检查输入
            if (!isValidInput())
            {
                return;
            }
            string navName = txtNavName.Text.Trim();
            string url = txtUrl.Text.Trim();
            string description = txtDesc.Text.Trim();
            string parentId = ckbAsParent.Checked ? "" : ddlParent.SelectedValue;

            if (!string.IsNullOrEmpty(nid))
            {
                service.UpdateNavigation(nid, navName, url, description, parentId, ckbAsMenu.Checked);
            }
            else
            {
                service.AddNavigation(navName, url, description, parentId, ckbAsMenu.Checked);
            }

            Response.Redirect("NavigationList.aspx");
        }


        private bool isValidInput()
        {
            //名称不能为空
            if (txtNavName.Text.Trim() == "")
            {
                showMessage("用户名不能为空！");
                return false;
            }
            else
            {
                if (service.NameExists(nid, txtNavName.Text.Trim()))
                {
                    showMessage("名称不允许重复！");
                    return false;
                }
            }
            //非父权限
            if (!ckbAsParent.Checked)
            {
                if (txtUrl.Text.Trim() == "")
                {
                    showMessage("页面路径不能为空！");
                    return false;
                }
                if (ddlParent.SelectedIndex == 0)
                {
                    showMessage("请选择父权限！");
                    return false;
                }
            }
            return true;
        }
        //显示错误信息
        private void showMessage(string mes)
        {
            lbMessage.Text = mes;
        }
    }
}