using System;
using System.Collections.Generic;

namespace WSI.Model.Entities
{
    public class Tag
    {
        /// <summary>
        /// 编号
        /// </summary>
        public Guid TagId { get; set; }

        /// <summary>
        /// 名称
        /// </summary>
        public String TagName { get; set; }

        /// <summary>
        /// 编码
        /// </summary>
        public String TagCode { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        public String Description { get; set; }

        /// <summary>
        /// 排序字段
        /// </summary>
        public int SortIndex { get; set; }

        /// <summary>
        /// 父ID
        /// </summary>
        public Guid? ParentId { get; set; }

        /// <summary>
        /// 状态
        /// </summary>
        public int State { get; set; }

        /// <summary>
        /// 添加时间
        /// </summary>
        public DateTime CreateTime { get; set; }







        /// <summary>
        /// 父标签
        /// </summary>
        public virtual Tag Parent { get; set; }

        /// <summary>
        /// 信息列表
        /// </summary>
        public virtual IList<TagInformation> TagInformations { get; set; }
    }
}
