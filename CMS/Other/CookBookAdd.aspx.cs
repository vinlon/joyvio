using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using WSI.ServiceLocator;
using Utility;

namespace CMS.Other
{
    public partial class CookBookAdd : System.Web.UI.Page
    {
        private readonly string cbid = HttpContext.Current.Request.Params["cbid"] ?? "";

        private readonly string LIST_URL = "CookBook.aspx";

        private readonly ICookBookService service = ServiceLocator.Instance.GetService<ICookBookService>();
        private readonly IFrontendNavigationService navService = ServiceLocator.Instance.GetService<IFrontendNavigationService>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindMenu();
                initCookBook();
            }
        }

        private void initCookBook()
        {
            if (cbid != "")
            {
                var cb = service.GetDetail(cbid);
                if (cb != null)
                {
                    txtName.Text = cb.CookBookName;
                    txtSummary.Text = cb.Summary;
                    ckbRecommend.Checked = cb.IsRecommend;
                    txtSource.Text = cb.Source;
                    txtReferenceUrl.Text = cb.ReferenceUrl;
                    txtMaterial.Text = cb.Material;
                    txtBenifits.Text = cb.Benifits;
                    txtPractice.Text = cb.Practice;
                    txtTips.Text = cb.Tips;
                    treeNav.CheckedValues = new List<string>() { cb.NavigationId.ToString() };
                }
            }
        }

        private void bindMenu()
        {
            treeNav.DataSource = navService.GetSortedListByParentId(CommonHelper.NAVIGATION_COOKBOOK_ID);
            treeNav.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (isValidInput())
            {
                if (cbid == "")
                {
                    service.AddCookBook(
                        txtName.Text.Trim(),
                        txtSummary.Text.Trim(),
                        txtSource.Text.Trim(),
                        txtReferenceUrl.Text.Trim(),
                        txtMaterial.Text.Trim(),
                        txtBenifits.Text,
                        txtPractice.Text,
                        txtTips.Text,
                        treeNav.CheckedValues[0],
                        ckbRecommend.Checked
                        );
                }
                else
                {
                    service.UpdateCookBook(
                        cbid,
                        txtName.Text.Trim(),
                        txtSummary.Text.Trim(),
                        txtSource.Text.Trim(),
                        txtReferenceUrl.Text.Trim(),
                        txtMaterial.Text.Trim(),
                        txtBenifits.Text,
                        txtPractice.Text,
                        txtTips.Text,
                        treeNav.CheckedValues[0],
                        ckbRecommend.Checked
                        );
                }
                Response.Redirect(LIST_URL);
            }
        }

        #region 输入验证

        private bool isValidInput()
        {
            if (txtName.Text.Trim() == "")
            {
                txtName.Focus();
                showMessage("食谱名称不能为空");
                return false;
            }
            if (txtSummary.Text.Trim() == "")
            {
                txtSummary.Focus();
                showMessage("概述不能为空");
                return false;
            }
            if (txtBenifits.Text == "")
            {
                txtBenifits.Focus();
                showMessage("功效不能为空");
                return false;
            }
            if (txtMaterial.Text == "")
            {
                txtMaterial.Focus();
                showMessage("材料不能为空");
                return false;
            }
            if (treeNav.CheckedValues.Count == 0)
            {
                showMessage("请选择食谱所属的栏目");
                return false;
            }
            if (treeNav.CheckedValues.Count > 1)
            {
                showMessage("只能选择一个栏目");
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