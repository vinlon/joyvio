using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.Model.Entities;
using WSI.IService;
using WSI.ServiceLocator;

namespace CMS.User
{
    public partial class UserAdd : BackendPageBase
    {
        private readonly IUserInfoService service = ServiceLocator.Instance.GetService<IUserInfoService>();
        private readonly IRoleInfoService roleService = ServiceLocator.Instance.GetService<IRoleInfoService>();

        protected readonly string uid = HttpContext.Current.Request["uid"] ?? "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindRole();
                initUser();
            }
        }


        //绑定角色信息
        private void bindRole()
        {
            IList<RoleInfo> list = roleService.GetActiveList();

            int roletype = Common.VerifiedUser.RoleList.Max(r => r.RoleType);

            //只允许设置同级或下级管理员
            list = list.Where(r => r.RoleType < roletype)
                .OrderByDescending(r => r.RoleType)
                .ToList();

            repRole.DataSource = list;
            repRole.DataBind();
        }

        //加载要修改的用户数据
        private void initUser()
        {
            UserInfo user = service.GetDetailIncludeAll(uid);
            if (user != null)
            {
                txtUserName.Text = user.UserName;
                hfRoleList.Value = string.Join(",", user.RoleList.Select(r => r.RoleInfoId).ToList());
            }


        }

        //添加或修改用户信息
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (isValidInput())
            {
                IList<string> roleidlist = hfRoleList.Value.Split(',').ToList();
                if (string.IsNullOrEmpty(uid))
                {
                    service.Add(txtUserName.Text.Trim(), txtPassword.Text.Trim(), roleidlist);
                }
                //修改
                else
                {
                    UserInfo user = service.GetDetail(uid);
                    if (user != null)
                    {
                        service.UpdateUser(uid, txtUserName.Text.Trim(), roleidlist);
                    }
                }

                Response.Redirect("UserList.aspx");
            }
        }

        #region 输入验证

        private bool isValidInput()
        {
            if (txtUserName.Text.Trim() == "")
            {
                showMessage("用户名不能为空");
                return false;
            }
            if (txtPassword.Text.Trim() == "" && string.IsNullOrEmpty(uid))
            {
                showMessage("密码不能为空");
                return false;
            }
            else if (txtPassword.Text.Trim() != txtPasswordConfirm.Text.Trim())
            {
                showMessage("两次密码输入不一致");
                return false;
            }
            if (hfRoleList.Value == "")
            {
                showMessage("至少选择一个角色");
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