using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility;
using WSI.IService;
using WSI.Model.Entities;
namespace CMS.User
{
    public partial class UserList : BackendPageBase
    {
        private readonly IUserInfoService service = WSI.ServiceLocator.ServiceLocator.Instance.GetService<IUserInfoService>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindUser();
            }
        }

        //绑定用户信息
        private void bindUser()
        {
            IList<UserInfo> list = service.GetUserListIncludeAll();

            int roletype = Common.VerifiedUser.RoleList.Max(r => r.RoleType);

            //只能查看下级的用户
            list = list.Where(u => u.RoleList.Where(r => r.RoleType < roletype).Count() > 0).ToList();  //角色列表中不包含系统管理员

            repMain.DataSource = list;
            repMain.DataBind();

        }
    }
}