using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using WSI.ServiceLocator;

namespace CMS.Other
{
    public partial class RecruitmentAdd : BackendPageBase
    {
        private readonly string rid = HttpContext.Current.Request.Params["rid"] ?? "";

        private readonly IRecruitmentService service = ServiceLocator.Instance.GetService<IRecruitmentService>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                initRecruitment();
            }
        }

        //初始化数据
        private void initRecruitment()
        {
            if (rid != "")
            {
                var recruit = service.GetDetail(rid);
                txtPosition.Text = recruit.Position;
                txtDepartment.Text = recruit.Department;
                txtWorkplace.Text = recruit.WorkPlace;
                txtPublishTime.Text = recruit.PublishTime.ToString(Common.DATETIME_FORMAT_FULL);
                txtDuty.Text = recruit.Duty;
                txtRequirement.Text = recruit.Requirement;
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DateTime publishTime = DateTime.Now;

            DateTime.TryParse(txtPublishTime.Text.Trim(), out publishTime);

            if (rid == "")
            {
                service.AddRecruitment(
                    txtPosition.Text.Trim(),
                    txtDepartment.Text.Trim(),
                    txtWorkplace.Text.Trim(),
                    txtDuty.Text,
                    txtRequirement.Text,
                    publishTime
                    );
            }
            else
            {
                service.UpdateRecruitment(
                    rid,
                    txtPosition.Text.Trim(),
                    txtDepartment.Text.Trim(),
                    txtWorkplace.Text.Trim(),
                    txtDuty.Text,
                    txtRequirement.Text,
                    publishTime
                    );
            }
            Response.Redirect("RecruitmentList.aspx");
        }

    }
}