using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using WSI.ServiceLocator;
using WSI.Model.Entities;

namespace CMS.User
{
    public partial class RoleAdd : BackendPageBase
    {
        private readonly IRoleInfoService service = ServiceLocator.Instance.GetService<IRoleInfoService>();
        private readonly INavigationService navService = ServiceLocator.Instance.GetService<INavigationService>();
        private readonly string roleid = HttpContext.Current.Request["rid"] ?? "";
        protected readonly string nav_key = "navigation";
        private IList<Navigation> baseNavigations = null;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                baseNavigations = navService.GetActiveList();

                //如果已存在站点管理员角色，则其它角色的权限都以站点管理员角色为准
                if (service.SiteManager != null)
                {
                    baseNavigations = service.SiteManager.Navigations.ToList();
                }
                bindNavigation(baseNavigations);

                initRole();
            }
        }

        private void bindNavigation(IList<Navigation> baseNavigations)
        {
            if (baseNavigations != null)
            {
                repMain.DataSource = baseNavigations
                    .Where(n => n.Parent == null)
                    .OrderBy(n => n.SortIndex)
                    .ToList();
                repMain.DataBind();
            }
        }

        protected IList<Navigation> GetChildren(Navigation parent)
        {
            return baseNavigations
                .Where(n => n.Parent == parent)
                .OrderBy(n => n.SortIndex)
                .ToList();
        }

        private void initRole()
        {
            var role = service.GetDetailIncludeAll(roleid);
            if (role != null)
            {
                //如果要修改的是站点管理员角色
                if (role.RoleType == (int)RoleType.SiteManager)
                {
                    baseNavigations = navService.GetActiveList();
                    bindNavigation(baseNavigations);
                }


                txtRoleName.Text = role.RoleName;
                txtDescription.Text = role.Description;

                //已选的权限
                hfnavlist.Value = string.Join(",", role.Navigations.Select(n => n.NavigationId).ToList());
            }


        }

        //添加角色
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var navlist = (Request.Form[nav_key] ?? "").Split(',').ToList();
            if (isValidInput())
            {
                string roleName = txtRoleName.Text.Trim();
                string desc = txtDescription.Text.Trim();
                if (string.IsNullOrEmpty(roleid))
                {
                    //如果没有
                    service.Add(roleName, desc, navlist);
                }
                else
                {
                    service.UpdateRoleInfo(roleid, roleName, desc, navlist);
                }
                Response.Redirect("RoleList.aspx");
            }
        }

        #region 输入验证

        private bool isValidInput()
        {
            if (txtRoleName.Text.Trim() == "")
            {
                showMessage("角色名称不能为空");
                return false;
            }
            if (Request.Form[nav_key] == null)
            {
                showMessage("角色权限不能为空");
                return false;
            }
            return true;
        }
        //显示错误信息
        private void showMessage(string mes)
        {
            lbMessage.Text = mes;
        }

        #endregion
    }
}