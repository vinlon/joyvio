using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.Model.Entities;
using WSI.IService;
using WSI.ServiceLocator;
using System.Text.RegularExpressions;

namespace Web.JoinUs
{
    public partial class Affiliate : System.Web.UI.Page
    {
        private readonly IJoinApplyService service = ServiceLocator.Instance.GetService<IJoinApplyService>();
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void SubmitApply(object sender, EventArgs e)
        {
            if (isValidInput())
            {
                JoinApply apply = new JoinApply()
                {
                    CompanyName = txtCompanyName.Text.Trim(),
                    Address = txtAddress.Text.Trim(),
                    PhoneNo = txtPhone.Text.Trim(),
                    LinkMan = txtLinkman.Text.Trim(),
                    Email = txtEmail.Text.Trim(),
                    CompanyType = ddlCompanyType.SelectedValue,
                    PlantingSpecies = txtPlantingSpecies.Text.Trim(),
                    PlantingRegion = txtPlantingRegion.Text.Trim(),
                    SupplySeason = txtSupplySeason.Text.Trim(),
                    RegisteredFund = ddlRegisteredFund.SelectedValue,
                    Intention = ddlIntention.SelectedValue,
                    Duration = ddlDuration.SelectedValue,
                    CurrentAnnualOutput = ddlCurrentAnnualOutput.SelectedValue,
                    BestAnnualOutput = ddlBestAnnualOutput.SelectedValue,
                    AnnualIncome = ddlAnnualIncome.SelectedValue,
                    PlantingArea = ddlPlantingArea.SelectedValue,
                    StorageCapicity = ddlStorageCapicity.SelectedValue,
                    Remark = txtRemark.InnerText.Trim(),
                    ApplyState = 1,//默认状态
                    ApplyTime = DateTime.Now
                };

                service.Add(apply);

                AlertGo("申请提交成功", Request.Url.ToString());
            }
        }


        #region 输入验证

        private bool isValidInput()
        {
            if (txtCompanyName.Text.Trim() == "")
            {
                showMessage("公司名称不能为空");
                txtCompanyName.Focus();
                return false;
            }
            if (txtAddress.Text.Trim() == "")
            {
                showMessage("公司地址不能为空");
                txtAddress.Focus();
                return false;
            }
            if (txtPhone.Text.Trim() == "")
            {
                showMessage("联系电话不能为空");
                txtPhone.Focus();
                return false;
            }
            else
            {
                //联系电话只能包括数字和中划线
                Regex reg = new Regex("^[(0-9)-]*$");
                if (!reg.IsMatch(txtPhone.Text.Trim()))
                {
                    showMessage("电话号码只允许输入数字和短线");
                    txtPhone.Focus();
                    return false;
                }
            }

            if (txtLinkman.Text.Trim() == "")
            {
                showMessage("联系人不能为空");
                txtLinkman.Focus();
                return false;
            }
            if (txtEmail.Text.Trim() == "")
            {
                showMessage("邮件地址不能为空");
                txtEmail.Focus();
                return false;
            }
            else
            {
                Regex reg = new Regex(@"^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$");
                if (!reg.IsMatch(txtEmail.Text.Trim()))
                {
                    showMessage("请输入正确的电子邮件格式");
                    txtEmail.Focus();
                    return false;
                }
            }
            if (ddlCompanyType.SelectedIndex == 0)
            {
                showMessage("请选择公司类型");
                ddlCompanyType.Focus();
                return false;
            }
            if (txtPlantingSpecies.Text.Trim() == "")
            {
                showMessage("种植品种不能为空");
                txtPlantingSpecies.Focus();
                return false;
            }
            if (txtPlantingRegion.Text.Trim() == "")
            {
                showMessage("种植区域不能为空");
                txtPlantingRegion.Focus();
                return false;
            }
            if (txtSupplySeason.Text.Trim() == "")
            {
                showMessage("供应季节不能为空");
                txtSupplySeason.Focus();
                return false;
            }
            if (ddlRegisteredFund.SelectedIndex == 0)
            {
                showMessage("请选择注册资金");
                ddlRegisteredFund.Focus();
                return false;
            }
            if (ddlIntention.SelectedIndex == 0)
            {
                showMessage("请选择合作意向");
                ddlIntention.Focus();
                return false;
            }
            if (ddlDuration.SelectedIndex == 0)
            {
                showMessage("请选择种植时间");
                ddlDuration.Focus();
                return false;
            }
            if (ddlCurrentAnnualOutput.SelectedIndex == 0)
            {
                showMessage("请选择现有年产量");
                ddlCurrentAnnualOutput.Focus();
                return false;
            }
            if (ddlBestAnnualOutput.SelectedIndex == 0)
            {
                showMessage("请选择丰年年产量");
                ddlBestAnnualOutput.Focus();
                return false;
            }
            if (ddlAnnualIncome.SelectedIndex == 0)
            {
                showMessage("请选择年销售收入");
                ddlAnnualIncome.Focus();
                return false;
            }
            if (ddlPlantingArea.SelectedIndex == 0)
            {
                showMessage("请选择种植面积");
                ddlPlantingArea.Focus();
                return false;
            }
            if (ddlStorageCapicity.SelectedIndex == 0)
            {
                showMessage("请选择仓储能力");
                ddlStorageCapicity.Focus();
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


        #region JavaScript相关

        /// <summary>
        /// JS弹框
        /// 创建人：Amos Wnn
        /// 创建时间：2011-10-14
        /// </summary>
        /// <param name="page"></param>
        /// <param name="context"></param>
        private void Alert(string alertContext)
        {
            this.RunScript(alertContext, null, null);
        }

        /// <summary>
        /// JS弹框并跳转
        /// 创建人：Amos Wnn
        /// 创建时间：2011-10-14
        /// </summary>
        /// <param name="page"></param>
        /// <param name="context"></param>
        private void AlertGo(string alertContext, string url)
        {
            this.RunScript(alertContext, url, null);
        }

        /// <summary>
        /// JS弹框并跳转追加其他js
        /// 创建人：Amos Wnn
        /// 创建时间：2011-10-14
        /// </summary>
        /// <param name="page"></param>
        /// <param name="context"></param>
        /// <param name="url"></param>
        private void RunScript(string alertContext, string url, string otherScripts)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            if (!string.IsNullOrEmpty(alertContext))
            {
                sb.AppendFormat("alert(\"{0}\");", alertContext);
            }

            if (!string.IsNullOrEmpty(url))
            {
                sb.AppendFormat("location.href=\"{0}\";", url);
            }

            if (!string.IsNullOrEmpty(otherScripts))
            {
                sb.AppendFormat("{0};", otherScripts);
            }

            Page.ClientScript.RegisterStartupScript(this.GetType(), "", sb.ToString(), true);
        }

        #endregion
    }
}