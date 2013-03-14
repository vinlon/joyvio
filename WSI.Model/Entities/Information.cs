using System;
using System.Collections.Generic;

namespace WSI.Model.Entities
{
    /// <summary>
    /// 信息，文字信息
    /// </summary>
    public class Information
    {
        /// <summary>
        /// 编号
        /// </summary>
        public Guid InfoId { get; set; }

        /// <summary>
        /// 标题
        /// </summary>
        public String Title { get; set; }

        /// <summary>
        /// 副标题
        /// </summary>
        public String SubTitle { get; set; }

        /// <summary>
        /// 文章来源
        /// </summary>
        public String Source { get; set; }

        /// <summary>
        /// 引用路径
        /// </summary>
        public String ReferenceUrl { get; set; }

        /// <summary>
        /// 摘要
        /// </summary>
        public String Summary { get; set; }

        /// <summary>
        /// 作者
        /// </summary>
        public String Author { get; set; }

        /// <summary>
        /// 添加人
        /// </summary>
        public String Adder { get; set; }

        /// <summary>
        /// 是否置顶
        /// </summary>
        public bool IsTop { get; set; }

        /// <summary>
        /// 内容
        /// </summary>
        public String Content { get; set; }

        /// <summary>
        /// 排序字段
        /// </summary>
        public long SortIndex { get; set; }

        /// <summary>
        /// 状态
        /// </summary>
        public int State { get; set; }

        /// <summary>
        /// 浏览次数
        /// </summary>
        public long ViewCount { get; set; }

        /// <summary>
        /// 添加时间
        /// </summary>
        public DateTime CreateTime { get; set; }

        /// <summary>
        /// 修改时间
        /// </summary>
        public DateTime UpdateTime { get; set; }

        /// <summary>
        /// 发布时间
        /// </summary>
        public DateTime PublishTime { get; set; }

        /// <summary>
        /// 资源路径
        /// </summary>
        public string ResourcePath { get; set; }






        /// <summary>
        /// 所属前台栏目
        /// </summary>
        public virtual IList<FrontendNavigation> NavigationList { get; set; }

        /// <summary>
        /// 关键字
        /// </summary>
        public virtual IList<KeyWord> KeyWords { get; set; }

        /// <summary>
        /// 附件
        /// </summary>
        public virtual IList<Attachment> Attachments { get; set; }

    }
}
