using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WSI.Model.Entities
{
    public class CookBook
    {
        /// <summary>
        /// 编号
        /// </summary>
        public Guid CookBookId { get; set; }

        /// <summary>
        /// 食谱名称
        /// </summary>
        public string CookBookName { get; set; }

        /// <summary>
        /// 概述
        /// </summary>
        public string Summary { get; set; }

        /// <summary>
        /// 来源
        /// </summary>
        public string Source { get; set; }

        /// <summary>
        /// 引用地址
        /// </summary>
        public string ReferenceUrl { get; set; }

        /// <summary>
        /// 材料
        /// </summary>
        public string Material { get; set; }

        /// <summary>
        /// 功效
        /// </summary>
        public string Benifits { get; set; }

        /// <summary>
        /// 做法
        /// </summary>
        public string Practice { get; set; }

        /// <summary>
        /// 诀窍
        /// </summary>
        public string Tips { get; set; }

        /// <summary>
        /// 喜欢该食谱的用户人数
        /// </summary>
        public int LikeCount { get; set; }

        /// <summary>
        /// 图片路径
        /// </summary>
        public string ImageUrl { get; set; }

        /// <summary>
        /// 状态
        /// </summary>
        public int State { get; set; }

        /// <summary>
        /// 添加时间
        /// </summary>
        public DateTime CreateTime { get; set; }

        /// <summary>
        /// 是否推荐
        /// </summary>
        public bool IsRecommend { get; set; }

        /// <summary>
        /// 栏目编号
        /// </summary>
        public Guid NavigationId { get; set; }

        /// <summary>
        /// 栏目
        /// </summary>
        public virtual FrontendNavigation Navigation { get; set; }
    }
}
