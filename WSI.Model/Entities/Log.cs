using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace WSI.Model.Entities
{
    public class Log
    {
        /// <summary>
        /// 编号
        /// </summary>
        public Guid LogId { get; set; }

        /// <summary>
        /// 执行操作的用户名
        /// </summary>
        public string User { get; set; }

        /// <summary>
        /// IP地址
        /// </summary>
        public string IpAddress { get; set; }

        /// <summary>
        /// 操作的目标
        /// </summary>
        public string Target { get; set; }

        /// <summary>
        /// 日志类型
        /// </summary>
        public int Type { get; set; }

        /// <summary>
        /// 日志内容，Json格式的键值对
        /// </summary>
        public string Content { get; set; }

        /// <summary>
        /// 日志记录的时间
        /// </summary>
        public DateTime CreateTime { get; set; }
    }
    public enum LogType
    {
        /// <summary>
        /// 添加
        /// </summary>
        [Description("添加")]
        Added,

        /// <summary>
        /// 修改
        /// </summary>
        [Description("修改")]
        Modified,

        /// <summary>
        /// 删除
        /// </summary>
        [Description("删除")]
        Deleted
    }
}
