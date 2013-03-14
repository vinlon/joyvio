using System;
using System.Collections.Generic;

namespace WSI.Model.Entities
{
    /// <summary>
    /// 栏目、菜单、导航、页面访问权限
    /// </summary>
    public class Navigation
    {
        /// <summary>
        /// 编号
        /// </summary>
        public Guid NavigationId { get; set; }


        public Guid? ParentId { get; set; }


        /// <summary>
        /// 名称
        /// </summary>
        public String NavigationName { get; set; }

        /// <summary>
        /// 路径
        /// </summary>
        public String Url { get; set; }

        //权限说明
        public String Description { get; set; }

        /// <summary>
        /// 是否做作菜单项
        /// </summary>
        public bool AsMenu { get; set; }

        /// <summary>
        /// 排序字段
        /// </summary>
        public int SortIndex { get; set; }

        /// <summary>
        /// 状态
        /// </summary>
        public int State { get; set; }

        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime CreateTime { get; set; }



        /// <summary>
        /// 父导航
        /// </summary>
        public virtual Navigation Parent { get; set; }

        /// <summary>
        /// 子导航
        /// </summary>
        public virtual ICollection<Navigation> Children { get; set; }
    }
}
