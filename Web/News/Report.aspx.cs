﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using WSI.ServiceLocator;
using WSI.Model.Entities;

namespace Web.News
{
    public partial class Report : System.Web.UI.Page
    {
        private readonly string navid = HttpContext.Current.Request.Params["navid"] ?? "";

        private readonly IFrontendNavigationService service = ServiceLocator.Instance.GetService<IFrontendNavigationService>();
        private readonly IInformationService infoService = ServiceLocator.Instance.GetService<IInformationService>();

        private readonly int PAGE_SIZE = 10;

        //导航栏目
        protected FrontendNavigation nav;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (navid != "")
            {
                nav = service.GetDetail(navid);

                //如果当前栏目含有子栏目，则默认加载第一个子栏目
                var children = service.GetSortedListByParentId(nav.NavId.ToString());
                if (children.Count > 0)
                {
                    nav = children[0];
                }
            }
            if (!IsPostBack)
            {
                bindInformation();
            }
        }

        private void bindInformation()
        {
            int count;
            repMain.DataSource = infoService.GetActivePagedInfosByNavId(nav.NavId.ToString(), AspNetPager1.CurrentPageIndex, PAGE_SIZE, out count);
            repMain.DataBind();
            AspNetPager1.PageSize = PAGE_SIZE;
            AspNetPager1.RecordCount = count;
        }

        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            bindInformation();
        }
    }
}