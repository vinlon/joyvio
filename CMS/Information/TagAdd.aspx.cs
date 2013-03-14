using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using WSI.Model.Entities;

namespace CMS.Information
{
    public partial class TagAdd : BackendPageBase
    {
        private readonly ITagService service = WSI.ServiceLocator.ServiceLocator.Instance.GetService<ITagService>();

        private readonly string tagId = HttpContext.Current.Request["tid"] ?? "";

        public string Pid
        {
            get
            {
                if (Request["pid"] == null)
                {
                    Tag tag = service.GetDetail(tagId);
                    if (tag != null)
                    {
                        return tag.ParentId.ToString();
                    }
                }
                return Request["pid"] ?? "";
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Pid != "")
                {
                    Tag parent = service.GetDetail(Pid);
                    if (parent != null)
                    {
                        lbParent.Text = parent.TagName;
                    }
                }
                if (tagId != "")
                {
                    initTag();
                }
            }
        }

        private void initTag()
        {
            Tag tag = service.GetDetail(tagId);
            if (tag != null)
            {
                txtTagName.Text = tag.TagName;
                txtTagCode.Text = tag.TagCode;
                txtDescription.Text = tag.Description;
            }
        }



        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (isValidInput())
            {
                if (tagId == "")
                {
                    service.AddTag(Pid, txtTagName.Text.Trim(), txtTagCode.Text.Trim(), txtDescription.Text.Trim());
                }
                else
                {
                    service.UpdateTag(tagId, Pid, txtTagName.Text.Trim(), txtTagCode.Text.Trim(), txtDescription.Text.Trim());
                }
                Response.Redirect("TagList.aspx");
            }
        }


        #region 输入验证

        private bool isValidInput()
        {
            if (txtTagName.Text.Trim() == "")
            {
                showMessage("标签名称不能为空");
                return false;
            }
            if (txtTagCode.Text.Trim() == "")
            {
                showMessage("标签编码不能为空");
                return false;
            }
            else
            {
                if (service.CodeExists(txtTagCode.Text.Trim(), tagId))
                {
                    showMessage("标签编码重复");
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

        #endregion
    }
}