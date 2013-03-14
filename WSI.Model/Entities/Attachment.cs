using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WSI.Model.Entities
{
    public class Attachment
    {
        /// <summary>
        /// 编号
        /// </summary>
        public Guid AttachmentId { get; set; }
        /// <summary>
        /// 资源路径
        /// </summary>
        public String SourceUrl { get; set; }
        /// <summary>
        /// 描述
        /// </summary>
        public String Description { get; set; }

        /// <summary>
        /// 信息编号
        /// </summary>
        public Guid InformationId { get; set; }

        /// <summary>
        /// 排序字段
        /// </summary>
        public long SortIndex { get; set; }

        /// <summary>
        /// 状态
        /// </summary>
        public int State { get; set; }
        /// <summary>
        /// 添加时间
        /// </summary>
        public DateTime CreateTime { get; set; }
    }
}
