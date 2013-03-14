using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using WSI.Model.Entities;
using Utility;
namespace CMS.Information
{
    public partial class InformationList : BackendPageBase
    {
        protected readonly IInformationService service = WSI.ServiceLocator.ServiceLocator.Instance.GetService<IInformationService>();
        private readonly IFrontendNavigationService navService = WSI.ServiceLocator.ServiceLocator.Instance.GetService<IFrontendNavigationService>();

        //前台预览页面
        private readonly string[] food_navigations = { CommonHelper.NAVIGATION_FOODTREND_ID, CommonHelper.NAVIGATION_FOODHEALTHY_ID };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //用于从它的下一页跳回本页
                Common.BackUrl = Request.Url.ToString();
                bindNav();
                bindInfomation();
            }
        }

        private void bindNav()
        {
            //绑定ddlNav
            var datasource = new List<FrontendNavigation>();
            var list = navService.GetActiveTopList().Where(n => n.Type == (int)NavigationType.List);

            foreach (var item in list)
            {
                if (item.Type == (int)NavigationType.List)
                {
                    var parent = new ListItem(item.NavName, item.NavId.ToString());
                    parent.Attributes.Add("disabled", "disabled");
                    ddlNav.Items.Add(parent);

                    var leaves = navService.GetLeafNavigationsByRootId(item.NavId.ToString());

                    foreach (var leaf in leaves)
                    {
                        string text = string.Format("{0}{1}", "--", leaf.NavName);

                        ddlNav.Items.Add(new ListItem(text, leaf.NavId.ToString()));
                    }
                }
            }

            ddlNav.Items.Insert(0, new ListItem("==请选择==", ""));
        }

        private void bindInfomation()
        {
            string title = "";
            DateTime from = DateTime.MaxValue;
            DateTime to = DateTime.Now;
            if (Request.Params["title"] != null)
            {
                title = Request.Params["title"];
                txtTitle.Text = title;
            }

            if (Request.Params["navid"] != null)
            {
                ddlNav.SelectedValue = Request.Params["navid"];
            }

            if (Request.Params["from"] != null)
            {
                DateTime.TryParse(Request.Params["from"], out from);
                txtFrom.Text = Request.Params["from"];
            }
            if (Request.Params["to"] != null)
            {
                DateTime.TryParse(Request.Params["to"], out to);
                txtTo.Text = Request.Params["to"];
            }

            int count;
            repMain.DataSource = service.GetPagedInfo(title, ddlNav.SelectedValue, from, to, AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize, out count);
            repMain.DataBind();
            AspNetPager1.RecordCount = count;
        }

        protected void Search(object sender, EventArgs e)
        {
            string query = Request.Path + "?page=" + (Request.Params["page"] ?? "1");

            DateTime from = DateTime.MaxValue;
            DateTime to = DateTime.MaxValue;
            if (txtFrom.Text.Trim() != "")
            {
                DateTime.TryParse(txtFrom.Text.Trim(), out from);
            }
            if (txtTo.Text.Trim() != "")
            {
                DateTime.TryParse(txtTo.Text.Trim(), out to);
            }

            if (txtTitle.Text.Trim() != "")
            {
                query += "&title=" + txtTitle.Text.Trim();
            }
            if (ddlNav.SelectedIndex != 0)
            {
                query += "&navid=" + ddlNav.SelectedValue;
            }
            if (from != DateTime.MaxValue)
            {
                query += "&from=" + txtFrom.Text.Trim();
            }
            if (to != DateTime.MaxValue)
            {
                query += "&to=" + txtTo.Text.Trim();
            }

            Response.Redirect(query);
        }

        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            bindInfomation();
        }

        protected string GetPreviewUrl(WSI.Model.Entities.Information info)
        {
            var nav = info.NavigationList.ElementAtOrDefault(0);
            if (food_navigations.Contains(nav.NavId.ToString()))
            {
                return string.Format("{0}?infoid={1}&navid={2}", Common.SITE_URL + "/Food/FoodDetail.aspx", info.InfoId, nav.NavId);
            }
            else
            {
                return string.Format("{0}?infoid={1}&navid={2}", Common.SITE_URL + Common.NEWS_PREVIEW_PAGE, info.InfoId, nav.NavId);
            }
        }
    }
}