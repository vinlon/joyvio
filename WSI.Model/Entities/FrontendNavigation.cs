using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace WSI.Model.Entities
{
    public class FrontendNavigation
    {
        /// <summary>
        /// 编号
        /// </summary>
        public Guid NavId { get; set; }

        /// <summary>
        /// 栏目名称
        /// </summary>
        public String NavName { get; set; }

        /// <summary>
        /// 栏目路径
        /// </summary>
        public String Url { get; set; }

        /// <summary>
        /// 栏目描述
        /// </summary>
        public String Description { get; set; }

        /// <summary>
        /// 栏目类别（静态页，单条信息，多条信息）
        /// </summary>
        public int Type { get; set; }

        /// <summary>
        /// 排序字段
        /// </summary>
        public int SortIndex { get; set; }

        /// <summary>
        /// 状态
        /// </summary>
        public int State { get; set; }

        /// <summary>
        /// 添加时间
        /// </summary>
        public DateTime CreateTime { get; set; }

        /// <summary>
        /// 父ID
        /// </summary>
        public Guid? ParentId { get; set; }

        /// <summary>
        /// 父导航
        /// </summary>
        public FrontendNavigation Parent { get; set; }

        /// <summary>
        /// 子导航列表
        /// </summary>
        public virtual IList<FrontendNavigation> Childrens { get; set; }

        /// <summary>
        /// 信息列表
        /// </summary>
        public virtual IList<Information> InformationList { get; set; }
    }
    /// <summary>
    /// 导航类型
    /// </summary>
    public enum NavigationType
    {
        /// <summary>
        /// 静态页
        /// </summary>
        [Description("静态页")]
        Static = 1,
        /// <summary>
        /// 简介
        /// </summary>
        [Description("简介")]
        Introduction = 2,
        /// <summary>
        /// 列表
        /// </summary>
        [Description("列表")]
        List = 3
    }

}
