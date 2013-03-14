using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSI.Model.Entities;
using WSI.IService;
using Utility;

namespace CMS.Information
{
    public partial class UCTreeView : System.Web.UI.UserControl
    {

        public IFrontendNavigationService service = WSI.ServiceLocator.ServiceLocator.Instance.GetService<IFrontendNavigationService>();

        /// <summary>
        /// 宽度
        /// </summary>
        public int Width { get; set; }

        /// <summary>
        /// 数据源
        /// </summary>
        public ICollection<FrontendNavigation> DataSource { get; set; }

        /// <summary>
        /// 已选择的项
        /// </summary>
        public IList<String> CheckedValues
        {
            get
            {
                return tvMain.CheckedNodes.Cast<TreeNode>().Select(t => t.Value).ToList();
            }
            set
            {
                //根据选择的项决定展开的深度
                int depth = 0;
                CheckNode(tvMain.Nodes, value, ref depth);
                tvMain.ExpandDepth = depth;
            }
        }



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        public override void DataBind()
        {
            tvMain.ShowCheckBoxes = TreeNodeTypes.Leaf;
            tvMain.ExpandDepth = 0;
            BindTreeView(null, DataSource);
        }

        //递归绑定TreeView的Node
        private void BindTreeView(TreeNode node, ICollection<FrontendNavigation> list)
        {
            foreach (var item in list)
            {
                if (node == null)
                {
                    TreeNode root = new TreeNode();
                    root.Text = item.NavName;
                    root.Value = item.NavId.ToString();
                    root.NavigateUrl = "javascript:void(0)";

                    tvMain.Nodes.Add(root);
                    BindTreeView(root, service.GetSortedListByParentId(item.NavId.ToString())
                        .Where(n => n.State == (int)EnumHelper.State.Enable)
                        .Where(n => n.Type == (int)NavigationType.List)
                        .ToList());
                }
                else
                {
                    TreeNode child = new TreeNode();
                    child.Text = item.NavName;
                    child.Value = item.NavId.ToString();
                    child.NavigateUrl = "javascript:void(0)";

                    node.ChildNodes.Add(child);
                    BindTreeView(child, service.GetSortedListByParentId(item.NavId.ToString())
                        .Where(n => n.State == (int)EnumHelper.State.Enable)
                        .Where(n => n.Type == (int)NavigationType.List)
                        .ToList());

                }
            }
        }

        //初始化要选中的项
        private void CheckNode(TreeNodeCollection nodes, IList<string> valuelist, ref int depth)
        {
            foreach (var node in nodes.Cast<TreeNode>())
            {
                if (valuelist.Contains(node.Value))
                {
                    node.Checked = true;
                    depth = Math.Max(depth, node.Depth);
                }
                if (node.ChildNodes.Count > 0)
                {
                    CheckNode(node.ChildNodes, valuelist, ref depth);
                }
            }
        }
    }
}