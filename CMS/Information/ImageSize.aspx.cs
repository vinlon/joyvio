using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using WSI.IService;
using WSI.ServiceLocator;

namespace CMS.Information
{
    public partial class ImageSize : BackendPageBase
    {
        private IImageSizeService service = ServiceLocator.Instance.GetService<IImageSizeService>();
        private string sid = HttpContext.Current.Request.Params["sid"] ?? "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindSize();
                initSize();
            }
        }

        private void initSize()
        {
            if (sid != "")
            {
                var size = service.GetDetail(sid);
                if (size != null)
                {
                    txtSizeName.Text = size.SizeName;
                    txtWidth.Text = size.Width.ToString();
                    txtHeight.Text = size.Height.ToString();
                    txtThumbWidth.Text = size.ThumbWidth.ToString();
                    txtThumbHeight.Text = size.ThumbHeight.ToString();
                    txtCoverWidth.Text = size.CoverWidth.ToString();
                    txtCoverHeight.Text = size.CoverHeight.ToString();
                    btnSubmit.Text = "修改";
                }
            }
        }

        private void bindSize()
        {
            repMain.DataSource = service.GetList();
            repMain.DataBind();
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int width = 0;
            int height = 0;
            int thumb_width = 0;
            int thumb_height = 0;
            int cover_width = 0;
            int cover_height = 0;
            try
            {
                if (txtWidth.Text.Trim() != "")
                {
                    width = int.Parse(txtWidth.Text.Trim());
                }
                if (txtHeight.Text.Trim() != "")
                {
                    height = int.Parse(txtHeight.Text.Trim());
                }
                if (txtThumbWidth.Text.Trim() != "")
                {
                    thumb_width = int.Parse(txtThumbWidth.Text.Trim());
                }
                if (txtThumbHeight.Text.Trim() != "")
                {
                    thumb_height = int.Parse(txtThumbHeight.Text.Trim());
                }
                if (txtCoverWidth.Text.Trim() != "")
                {
                    cover_width = int.Parse(txtCoverWidth.Text.Trim());
                }
                if (txtCoverHeight.Text.Trim() != "")
                {
                    cover_height = int.Parse(txtCoverHeight.Text.Trim());
                }

            }
            catch (Exception)
            {
                return;
            }
            IList<string> errors = null;
            if (sid == "")
            {

                if (service.AddSize(txtSizeName.Text.Trim(),
                    width,
                    height,
                    thumb_width,
                    thumb_height,
                    cover_width,
                    cover_height,
                    out errors
                    ))
                {
                    base.AlertGo("添加成功", Request.Url.ToString());
                }
                else
                {
                    showMessage(errors);
                }
            }
            else
            {
                if (service.UpdateSize(sid,
                    txtSizeName.Text.Trim(),
                    width,
                    height,
                    thumb_width,
                    thumb_height,
                    cover_width,
                    cover_height,
                    out errors
                ))
                {
                    base.AlertGo("修改成功", Request.Url.AbsolutePath.ToString());
                }
                else
                {
                    showMessage(errors);
                }
            }

        }

        private void showMessage(IList<string> errors)
        {
            base.Alert(string.Join("\\;\\n", errors));
        }
    }
}