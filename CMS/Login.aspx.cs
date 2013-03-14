using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using Utility;
using WSI.Model.Entities;
namespace CMS
{
    public partial class Login : System.Web.UI.Page
    {
        private readonly IUserInfoService service = WSI.ServiceLocator.ServiceLocator.Instance.GetService<IUserInfoService>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        //登录
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (isValidInput())
            {
                string username = txtUserName.Text.Trim();
                string password = txtPassword.Text.Trim();
                UserInfo user = service.GetUserByName(username);
                if (user == null)
                {
                    lbMessage.Text = "用户名不存在！";
                    return;
                }
                if (user.UserPassword != service.GetEncryptPassword(password))
                {
                    lbMessage.Text = "密码不正确！";
                    return;
                }

                if (user.State != (int)EnumHelper.State.Enable)
                {
                    lbMessage.Text = "用户状态不可用";
                    return;
                }

                //登记Session
                Session[Common.SESSION_KEY_USERINFO] = user;

                //修改最后登录时间
                user.LastVisitTime = DateTime.Now;
                service.Update(user);

                Response.Redirect(Common.FRAME_INDEX);
            }
        }
        //测试登录
        protected void Test_Login(object sender, EventArgs e)
        {
            string username = "admin"; //txtUserName.Text.Trim();
            string password = "admin!@#$%^";// txtPassword.Text.Trim();
            UserInfo user = service.GetUserByName(username);
            if (user == null)
            {
                lbMessage.Text = "用户名不存在！";
                return;
            }
            if (user.UserPassword != service.GetEncryptPassword(password))
            {
                lbMessage.Text = "密码不正确！";
                return;
            }

            if (user.State != (int)EnumHelper.State.Enable)
            {
                lbMessage.Text = "用户状态不可用";
                return;
            }

            //登记Session
            Session[Common.SESSION_KEY_USERINFO] = user;

            //修改最后登录时间
            user.LastVisitTime = DateTime.Now;
            service.Update(user);

            Response.Redirect(Common.FRAME_INDEX);
        }

        //判断是否是有效输入 
        private bool isValidInput()
        {
            if (txtUserName.Text.Trim() == "")
            {
                showMessage("请输入用户名！");
                return false;
            }
            if (txtPassword.Text.Trim() == "")
            {
                showMessage("请输入密码！");
                return false;
            }
            if (Session[Common.SESSION_KEY_VERIFYCODE] != null)
            {
                if (txtVerifyCode.Text.Trim().ToLower() != (Session[Common.SESSION_KEY_VERIFYCODE].ToString().ToLower()))
                {
                    showMessage("验证码错误！");
                    return false;
                }
            }
            else
            {
                showMessage("验证码已过期！");
                return false;
            }


            return true;
        }

        private void showMessage(string mes)
        {
            lbMessage.Text = mes;
        }
    }
}