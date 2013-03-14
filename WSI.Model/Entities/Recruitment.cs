using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WSI.Model.Entities
{
    public class Recruitment
    {
        /// <summary>
        /// 编号
        /// </summary>
        public Guid RecruitId { get; set; }

        /// <summary>
        /// 职位
        /// </summary>
        public string Position { get; set; }

        /// <summary>
        /// 部门
        /// </summary>
        public string Department { get; set; }

        /// <summary>
        /// 工作地点
        /// </summary>
        public string WorkPlace { get; set; }

        /// <summary>
        /// 职责
        /// </summary>
        public string Duty { get; set; }

        /// <summary>
        /// 要求
        /// </summary>
        public string Requirement { get; set; }

        /// <summary>
        /// 发布时间
        /// </summary>
        public DateTime PublishTime { get; set; }

        /// <summary>
        /// 状态
        /// </summary>
        public int State { get; set; }
    }
}
