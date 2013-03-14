using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using WSI.ServiceLocator;
using WSI.Model.Entities;
using Utility;
namespace Web.Food
{
    public partial class Recipe : System.Web.UI.Page
    {
        private readonly string navid = Utility.CommonHelper.NAVIGATION_COOKBOOK_ID;

        private readonly int PAGE_SIZE = 4;

        private readonly IFrontendNavigationService navService = ServiceLocator.Instance.GetService<IFrontendNavigationService>();
        private readonly ICookBookService service = ServiceLocator.Instance.GetService<ICookBookService>();
        private readonly IInformationService infoService = ServiceLocator.Instance.GetService<IInformationService>();
        private readonly ITagService tagService = ServiceLocator.Instance.GetService<ITagService>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindData();
            }
        }

        private void bindInformation()
        {
            throw new NotImplementedException();
        }

        private void bindData()
        {
            //绑定子栏目
            repMain.DataSource = navService.GetSortedListByParentId(navid);
            repMain.DataBind();

            //绑定食尚潮流推荐
            repSHCL.DataSource = tagService.GetInformationsByTagCode(Common.FOOD_SHCL_TAG_CODE).Where(i => i.State == (int)EnumHelper.State.Enable);
            repSHCL.DataBind();

            //绑定健康安全推荐
            repJKAQ.DataSource = tagService.GetInformationsByTagCode(Common.FOOD_JKAQ_TAG_CODE).Where(i => i.State == (int)EnumHelper.State.Enable);
            repJKAQ.DataBind();
        }

        protected FrontendNavigation GetLeftSubNav(FrontendNavigation nav)
        {
            return navService.GetSortedListByParentId(nav.NavId.ToString())
                .ElementAtOrDefault(0);
        }

        protected FrontendNavigation GetRightSubNav(FrontendNavigation nav)
        {
            return navService.GetSortedListByParentId(nav.NavId.ToString())
                .ElementAtOrDefault(1);
        }
        protected IList<CookBook> GetLeftDataSource(FrontendNavigation nav)
        {
            var leftNav = GetLeftSubNav(nav);
            int count;
            return service.GetActiveSortedPagedListByNavId(leftNav.NavId.ToString(), 1, PAGE_SIZE, out count);
        }
        protected IList<CookBook> GetRightDataSource(FrontendNavigation nav)
        {
            var rightNav = GetRightSubNav(nav);
            int count;
            return service.GetActiveSortedPagedListByNavId(rightNav.NavId.ToString(), 1, PAGE_SIZE, out count);
        }

        protected string GetCoverImage(Information info)
        {
            var attach = infoService.GetDetailIncludeAll(info.InfoId.ToString()).Attachments.ElementAtOrDefault(0);
            if (attach != null)
            {
                return infoService.GetCoverPath(attach.SourceUrl);
            }
            return "";
        }

    }
}