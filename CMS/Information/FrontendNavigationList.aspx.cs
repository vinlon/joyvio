using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.Model.Entities;
using System.Text;
using Utility;
using WSI.IService;
namespace CMS.Information
{
    public partial class FrontendNavigationList : BackendPageBase
    {
        private IFrontendNavigationService service = WSI.ServiceLocator.ServiceLocator.Instance.GetService<IFrontendNavigationService>();

        protected string sort_url = "/handler/sort/frontend_navigationsort.ashx";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                IList<FrontendNavigation> toplist = service.GetTopList();
            }
        }

        private string getTreeItemText(FrontendNavigation nav, int indent)
        {
            //0 栏目名称
            //1 编号
            //2 前台路径
            //3 描述
            //4 栏目类别
            //5 显示栏目名称的span的宽度
            //6 状态
            //7 command url
            string command_url = "/handler/command/Frontend_NavigationCommand.ashx";

            string item_format = @"
                <span title='{3}' class='nav_name' style='width:{5}px' >
                    <span>{0}</span>
                </span>
                <span class='nav_url'>路径：{2}</span>
                <span class='nav_type'>类别：{4}</span>
                <a class='active' href='/Information/FrontendNavigationAdd.aspx?pid={1}' >添加子栏目</a>
                <a class='active' href='/Information/FrontendNavigationAdd.aspx?nid={1}'><img src='/!images/icon_edit.png' title='点击编辑' alt='编辑' /></a>
                <span class='command'>
                    <!--JS调用在default.js中-->
                    <!--参数-->
                    <input name='entity_state' type='hidden' value='{6}' />
                    <input name='command_url' type='hidden' value='{7}' />
                    <input name='command_argument' type='hidden' value='{1}' />
                    <!--修改状态-->
                    <a href='javascript:void()' name='disable'>
                        <img alt='禁用' src='/!images/icon_enable.png' title='点击禁用' /></a> <a href='javascript:void()'
                            name='enable'>
                            <img alt='启用' src='/!images/icon_disable.png' title='点击启用' /></a>
                    <!--删除-->
                    <a href='javascript:void()' name='delete'>
                        <img alt='删除' src='/!images/icon_delete.png' title='点击删除' />
                    </a>
                </span>
                ";
            //手动解决TreeView缩进对样式的影响
            int width = 300;
            int name_width = width - indent;
            string type = Utility.EnumHelper.GetEnumDesc(typeof(NavigationType), nav.Type);

            return string.Format(item_format, nav.NavName, nav.NavId, nav.Url, nav.Description, type, name_width, nav.State, command_url);
        }

        protected string getNavListHtml()
        {
            IList<FrontendNavigation> toplist = service.GetTopList()
                .OrderBy(n => n.SortIndex)
                .ToList();
            StringBuilder html = new StringBuilder();
            htmlGenerate(html, toplist, 0);
            return html.ToString();
        }


        //生成栏目列表
        private void htmlGenerate(StringBuilder html, IList<FrontendNavigation> list, int level)
        {
            int indent = 20;

            //小图标
            string img_item = "<img src='/!images/tree_item.gif' alt=''>";
            string img_parent = @"<img name='expand' src='/!images/tree_expand.gif' alt=''>
                                    <img name='fold' src='/!images/tree_fold.gif' alt='' style='display:none'>";
            html.AppendFormat("<ul style='margin-left:{0}px'>", indent);

            //保存原顺序
            html.AppendFormat("<input type='hidden' name='' value='{0}' />", string.Join(",", list.Select(n => n.NavId)));

            foreach (var nav in list)
            {
                var children = service.GetSortedListByParentId(nav.NavId.ToString());
                string icon = img_item;
                if (children.Count > 0)
                {
                    icon = img_parent;
                }

                //id用户js确定新的元素顺序
                html.AppendFormat(@"<li id='{0}'>{1}{2}", nav.NavId, icon, getTreeItemText(nav, indent * level));

                if (children.Count > 0)
                {
                    htmlGenerate(html, children, level + 1);
                }
                html.Append("</li>");
            }
            html.Append("</ul>");
        }
    }
}