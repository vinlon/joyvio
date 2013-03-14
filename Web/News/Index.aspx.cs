using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.Model.Entities;
using WSI.IService;
using WSI.ServiceLocator;

namespace Web.News
{
    public partial class Index : System.Web.UI.Page
    {
        private readonly string navid = HttpContext.Current.Request["navid"] ?? "";
        private readonly IFrontendNavigationService service = ServiceLocator.Instance.GetService<IFrontendNavigationService>();
        protected readonly IInformationService infoService = ServiceLocator.Instance.GetService<IInformationService>();
        protected readonly ITagService tagService = ServiceLocator.Instance.GetService<ITagService>();

        //边栏置顶新闻的标签Code
        private readonly string news_joyvio = Common.NEWS_JOYVIO_TAG_CODE;
        private readonly int LEFT_COUNT = 16;
        private readonly int RIGHT_COUNT = 8;

        //栏目
        protected FrontendNavigation nav;

        //第一个子栏目，显示在左侧--媒体报道
        protected FrontendNavigation firstChild;

        //第二个子栏目，显示在右边栏--公司动态
        protected FrontendNavigation secondChild;

        //边栏置顶新闻
        protected Information joyVio;

        protected void Page_Load(object sender, EventArgs e)
        {
            //每次页面回发触发
            if (navid != "")
            {
                nav = service.GetDetail(navid);
                if (nav != null)
                {
                    var children = service.GetSortedListByParentId(nav.NavId.ToString());
                    if (children.Count > 0)
                    {
                        //第一个子栏目--媒体报道
                        firstChild = children[0];
                    }
                    if (children.Count > 1)
                    {
                        //第二个子栏目--公司动态
                        secondChild = children[1];
                    }
                }

                var list = tagService.GetInformationsByTagCode(news_joyvio);
                joyVio = list.ElementAtOrDefault(0);
            }

            if (!IsPostBack)
            {
                bindInformation();
            }
        }

        private void bindInformation()
        {
            //左侧第一个子栏目
            if (firstChild != null)
            {
                int count;
                repLeft.DataSource = infoService.GetActivePagedInfosByNavId(firstChild.NavId.ToString(), 1, LEFT_COUNT, out count);
                repLeft.DataBind();
            }

            //右侧第二个子栏目
            if (secondChild != null)
            {
                int count;
                repRight.DataSource = infoService.GetActivePagedInfosByNavId(secondChild.NavId.ToString(), 1, RIGHT_COUNT, out count);
                repRight.DataBind();
            }
        }
    }
}