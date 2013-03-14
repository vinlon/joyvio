using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.IService;
using WSI.Model.Entities;
using System.Text;

namespace CMS.Information
{
    public partial class TagList : BackendPageBase
    {
        private readonly ITagService service = WSI.ServiceLocator.ServiceLocator.Instance.GetService<ITagService>();
        private readonly IInformationService infoService = WSI.ServiceLocator.ServiceLocator.Instance.GetService<IInformationService>();
        protected string sort_url = "/handler/sort/tagsort.ashx";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                IList<Tag> toplist = service.GetTopList();
            }
        }


        private string getTreeItemText(Tag tag, int indent)
        {
            //0 标签名称
            //1 编号
            //2 编码
            //3 描述
            //4 显示标签名称的span的宽度
            //5 编辑和添加页的路径
            //6 关联管理的路径
            //7 当前的关联个数
            //8 状态
            //9 command url

            string command_url = "/handler/command/TagCommand.ashx";
            string item_format = @"
<span title='{3}' class='nav_name' style='width:{4}px' >
    <span>{0}</span>
</span>
<span class='nav_url'>编码：{2}</span>
<a class='active' href='{5}?pid={1}'>添加子标签</a>
<a class='active' href='{6}?tid={1}'>关联管理【{7}】</a>
<a class='active' href='{5}?tid={1}'><img src='/!images/icon_edit.png' title='点击编辑' alt='编辑' /></a>
<span class='command'>
    <!--JS调用在default.js中-->
    <!--参数-->
    <input name='entity_state' type='hidden' value='{8}' />
    <input name='command_url' type='hidden' value='{9}' />
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

            return string.Format(item_format, tag.TagName, tag.TagId, tag.TagCode, tag.Description, name_width,
                "TagAdd.aspx", "TagInformationRela.aspx", service.GetInformationCountByTagCode(tag.TagCode), tag.State, command_url);
        }


        //生成标签列表
        protected string getTagListHtml()
        {
            StringBuilder html = new StringBuilder();
            IList<Tag> list = service.GetTopList()
                .OrderBy(t => t.SortIndex)
                .ToList();

            htmlGenerate(html, list, 0);

            return html.ToString();
        }


        private void htmlGenerate(StringBuilder html, IList<Tag> list, int level)
        {
            int indent = 20;

            //小图标
            string img_item = "<img src='/!images/tree_item.gif' alt=''>";
            string img_parent = @"<img name='expand' src='/!images/tree_expand.gif' alt=''>
                                    <img name='fold' src='/!images/tree_fold.gif' alt='' style='display:none'>";
            html.AppendFormat("<ul style='margin-left:{0}px'>", indent);

            //保存原顺序
            html.AppendFormat("<input type='hidden' name='' value='{0}' />", string.Join(",", list.Select(t => t.TagId)));

            foreach (var tag in list)
            {
                var children = service.GetTagsByParentId(tag.TagId.ToString())
                    .OrderBy(t => t.SortIndex)
                    .ToList();
                string icon = img_item;
                if (children.Count > 0)
                {
                    icon = img_parent;
                }

                //id用户js确定新的元素顺序
                html.AppendFormat(@"<li id='{0}'>{1}{2}", tag.TagId, icon, getTreeItemText(tag, indent * level));

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