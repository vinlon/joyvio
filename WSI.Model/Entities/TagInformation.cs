using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WSI.Model.Entities
{
    public class TagInformation
    {
        /// <summary>
        /// 编号
        /// </summary>
        public Guid RelaId { get; set; }

        /// <summary>
        /// 标签编号
        /// </summary>
        public Guid TagId { get; set; }

        /// <summary>
        /// 信息编号
        /// </summary>
        public Guid InfoId { get; set; }

        /// <summary>
        /// 关联信息
        /// </summary>
        public Information Information { get; set; }


        /// <summary>
        /// 排序字段
        /// </summary>
        public int SortIndex { get; set; }


    }
}
