using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using WSI.Model.Entities;

namespace CMS.User
{
    public partial class RoleList : BackendPageBase
    {
        private readonly IRoleInfoService service = WSI.ServiceLocator.ServiceLocator.Instance.GetService<IRoleInfoService>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindRole();
            }
        }

        private void bindRole()
        {
            int roletype = Common.VerifiedUser.RoleList.Max(r => r.RoleType);

            //只能管理下级的角色
            var rolelist = service.GetList().Where(r => r.RoleType < roletype).ToList();

            repMain.DataSource = rolelist;
            repMain.DataBind();

            //如果当前登录用户为系统管理员，则显示设置站点管理员的区域
            if (Common.IsSystemManager)
            {
                //如果没有站点管理角色
                if (service.SiteManager == null)
                {
                    panelSiteManager.Visible = true;
                    panelRoleList.Visible = false;
                }
            }
        }


    }
}