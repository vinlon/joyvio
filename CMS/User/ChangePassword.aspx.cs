using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.Model.Entities;
using Utility;
using WSI.IService;
namespace CMS.User
{
    public partial class ChangePassword : BackendPageBase
    {
        private readonly IUserInfoService service = WSI.ServiceLocator.ServiceLocator.Instance.GetService<IUserInfoService>();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            UserInfo user = Common.VerifiedUser;
            if (user == null)
            {
                showMessage("登录用户已过期！");
                return;
            }
            if (user.UserPassword != service.GetEncryptPassword(txtPsw.Text.Trim()))
            {
                showMessage("原密码错误！");
                return;
            }
            if (txtNewPsw.Text.Trim() != txtNewPswConfirm.Text.Trim())
            {
                showMessage("两次密码输入不一致！");
                return;
            }

            user.UserPassword = service.GetEncryptPassword(txtNewPsw.Text.Trim());

            service.Update(user);
        }

        private void showMessage(string mes)
        {
            lbMessage.Text = mes;
        }
    }
}