using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using WSI.Model.Entities;

namespace CMS.User
{
    public partial class NavigationList : BackendPageBase
    {
        protected readonly INavigationService service = WSI.ServiceLocator.ServiceLocator.Instance.GetService<INavigationService>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindNavigation();
            }
        }

        private void bindNavigation()
        {
            var list = service.GetTopNavigation().OrderBy(n => n.SortIndex);
            hfParentOrder.Value = string.Join(",", list.Select(n => n.NavigationId));
            repMain.DataSource = list;
            repMain.DataBind();

        }




        //是否显示页面预览按钮
        protected bool showPreview(Navigation nav)
        {
            return nav.Url != "" && nav.Url.ToLower().IndexOf(".aspx") != -1;
        }


        protected void repMain_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var deleteParent = (LinkButton)e.Item.FindControl("deleteParent");
                if (deleteParent != null)
                {
                    string id = deleteParent.CommandArgument;

                    //没有子项时显示删除父项的按钮
                    var parent = service.GetDetailIncludeAll(id);
                    if (parent.Children.Count == 0)
                    {
                        deleteParent.Visible = true;
                    }
                    else
                    {
                        deleteParent.Visible = false;
                    }
                }
            }
        }

        protected void repMain_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                string id = e.CommandArgument.ToString();
                var parent = service.GetDetailIncludeAll(id);
                if (parent != null && parent.Children.Count == 0)
                {
                    service.Delete(id);
                }
                Response.Redirect(Request.Url.ToString());
            }
        }
    }
}