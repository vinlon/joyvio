using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.Model.Entities;
using WSI.IService;
using WSI.ServiceLocator;
using System.IO;

namespace CMS.Information
{
    public partial class InformationAdd : BackendPageBase
    {
        private readonly string LIST_URL = "InformationList.aspx";
        private readonly IInformationService service = ServiceLocator.Instance.GetService<IInformationService>();
        private readonly IFrontendNavigationService navService = ServiceLocator.Instance.GetService<IFrontendNavigationService>();

        private readonly string infoid = HttpContext.Current.Request["infoid"] ?? "";
        private readonly string navid = HttpContext.Current.Request["navid"] ?? "";

        private readonly string PDF_DIR = "/Information/PDF/";
        private readonly string PDF_EXT = ".pdf";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindTreeNav();
                if (infoid != "")
                {
                    initInformation();
                }
            }
        }

        private void initInformation()
        {
            var info = service.GetDetailIncludeAll(infoid);
            if (info != null)
            {
                txtTitle.Text = info.Title;
                txtSubTitle.Text = info.SubTitle;
                txtSource.Text = info.Source;
                txtPublishTime.Text = info.PublishTime.ToString(Common.DATETIME_FORMAT_FULL);
                txtAuthor.Text = info.Author;
                ckbTop.Checked = info.IsTop;
                txtSummary.Text = info.Summary;
                txtContent.Text = info.Content;
                txtKeyword.Text = string.Join(",", info.KeyWords.Select(k => k.Content).ToList());
                txtReference.Text = info.ReferenceUrl;
                treeNav.CheckedValues = info.NavigationList.Select(n => n.NavId.ToString()).ToList();
                if (!string.IsNullOrEmpty(info.ResourcePath))
                {
                    FileUpload1.Visible = false;
                    fileManage.Visible = true;
                    filePath.Text = info.ResourcePath;
                }
            }
        }

        private void bindTreeNav()
        {
            treeNav.DataSource = navService.GetActiveTopList()
                    .Where(n => n.Type == (int)NavigationType.List)//只显示栏目类型为列表的项
                    .OrderBy(n => n.SortIndex)
                    .ToList();
            treeNav.DataBind();
            treeNav.CheckedValues = new List<string>() { navid };
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (isValidInput())
            {
                //下载资源
                string resourcePath = "";
                if (FileUpload1.HasFile)
                {
                    string ext = Path.GetExtension(FileUpload1.FileName).ToLower();
                    if (ext == PDF_EXT)
                    {
                        if (!Directory.Exists(Server.MapPath(PDF_DIR)))
                        {
                            Directory.CreateDirectory(Server.MapPath(PDF_DIR));
                        }
                        string path = PDF_DIR + FileUpload1.FileName;

                        //判断文件是否已经存在
                        if (File.Exists(Server.MapPath(path)))
                        {
                            base.Alert("文件已存在，请修改文件名后重新上传");
                            return;
                        }

                        FileUpload1.SaveAs(Server.MapPath(path));
                        resourcePath = path;
                    }
                    else
                    {
                        base.Alert("资源只支持PDF文件");
                        return;
                    }
                }
                else
                {
                    resourcePath = filePath.Text;
                }

                IList<string> keywords = txtKeyword.Text.Trim()
                    .Replace('，', ',')  //替换中文逗号
                    .Split(',')
                    .ToList();
                if (infoid == "")
                {
                    //添加信息
                    service.AddInformation(
                        txtTitle.Text.Trim(),
                        txtSubTitle.Text.Trim(),
                        txtSource.Text.Trim(),
                        txtAuthor.Text.Trim(),
                        Common.VerifiedUser.UserName,
                        txtSummary.Text.Trim(),
                        txtContent.Text,//正文不去空格 
                        txtReference.Text.Trim(),
                        ckbTop.Checked,
                        keywords,
                        treeNav.CheckedValues,
                        DateTime.Parse(txtPublishTime.Text.Trim()),
                        resourcePath
                        );
                    Response.Redirect(LIST_URL);
                }
                else
                {
                    service.UpdateInformation(
                        infoid,
                        txtTitle.Text.Trim(),
                        txtSubTitle.Text.Trim(),
                        txtSource.Text.Trim(),
                        txtAuthor.Text.Trim(),
                        Common.VerifiedUser.UserName,
                        txtSummary.Text.Trim(),
                        txtContent.Text,
                        txtReference.Text.Trim(),
                        ckbTop.Checked,
                        keywords,
                        treeNav.CheckedValues,
                        DateTime.Parse(txtPublishTime.Text.Trim()),
                        resourcePath
                        );
                    //返回（保留翻页和搜索结果）
                    Response.Redirect(Common.BackUrl == "" ? LIST_URL : Common.BackUrl);
                }


            }
        }

        //删除PDF附件
        protected void DeleteResource(object sender, EventArgs e)
        {
            string path = Server.MapPath(filePath.Text);
            if (File.Exists(path))
            {
                File.Delete(path);
            }
            filePath.Text = "";
            FileUpload1.Visible = true;
            fileManage.Visible = false;
        }

        #region 输入验证

        private bool isValidInput()
        {
            //标题不能为空
            if (txtTitle.Text.Trim() == "")
            {
                showMessage("新闻标题不能为空");
                txtTitle.Focus();
                return false;
            }
            //时间必须有效
            DateTime publishTime;
            if (!DateTime.TryParse(txtPublishTime.Text.Trim(), out publishTime))
            {
                showMessage("请填写有效的发布日期");
                txtPublishTime.Focus();
                return false;
            }
            if (txtSummary.Text.Trim() == "")
            {
                showMessage("新闻概述不能为空");
                txtSummary.Focus();
                return false;
            }
            //正文不能为空
            if (txtContent.Text.Trim() == "")
            {
                showMessage("正文不能为空");
                txtContent.Focus();
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