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
    public partial class Profile : BackendPageBase
    {
        private readonly IUserInfoService service = WSI.ServiceLocator.ServiceLocator.Instance.GetService<IUserInfoService>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                initProfile();
            }
        }

        private void initProfile()
        {
            UserInfo user = Common.VerifiedUser;
            if (user != null)
            {
                user = service.GetDetailIncludeAll(user.UserInfoId.ToString());
                if (user.Profile != null)
                {
                    txtRealName.Text = user.Profile.RealName;
                    txtEmail.Text = user.Profile.Email;
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            UserInfo user = Common.VerifiedUser;
            if (user != null)
            {

                if (user.Profile != null)
                {
                    user.Profile.RealName = txtRealName.Text.Trim();
                    user.Profile.Email = txtEmail.Text.Trim();
                    user.Profile.UpdateTime = DateTime.Now;

                }
                else
                {
                    user.Profile = new UserProfile()
                    {
                        RealName = txtRealName.Text.Trim(),
                        Email = txtEmail.Text.Trim(),
                        UpdateTime = DateTime.Now
                    };
                }

                service.Update(user);
            }

            Response.Redirect(Common.URL_DEFAULT);
        }
    }
}