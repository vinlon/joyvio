using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using WSI.ServiceLocator;
using WSI.Model.Entities;

namespace CMS.Information
{
    public partial class AttachmentEdit : BackendPageBase
    {
        private readonly string attid = HttpContext.Current.Request.Params["attid"] ?? "";

        private readonly IAttachmentService service = ServiceLocator.Instance.GetService<IAttachmentService>();


        private Attachment attach;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (attid != "")
            {
                attach = service.GetDetail(attid);
            }
            if (!IsPostBack)
            {
                txtDesc.Text = attach.Description;
                txtSortIndex.Text = attach.SortIndex.ToString();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int sortIndex = 0;
            int.TryParse(txtSortIndex.Text.Trim(), out sortIndex);
            string desc = txtDesc.Text.Trim();

            service.UpdateAttach(attid, desc, sortIndex);

            base.RefreshFrame("AttachmentList.aspx?infoid=" + attach.InformationId);
            //Response.Redirect("AttachmentList.aspx?infoid=" + attach.InformationId);
        }
    }
}