using System;

namespace WSI.Model.Entities
{
    public class KeyWord
    {
        /// <summary>
        /// 编号
        /// </summary>
        public Guid KeyWordId { get; set; }

        /// <summary>
        /// 内容
        /// </summary>
        public String Content { get; set; }

        /// <summary>
        /// 添加时间
        /// </summary>
        public DateTime CreateTime { get; set; }
    }
}
