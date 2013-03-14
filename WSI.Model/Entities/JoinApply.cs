using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WSI.Model.Entities
{
    public class JoinApply
    {
        /// <summary>
        /// 编号
        /// </summary>
        public Guid ApplyId { get; set; }

        /// <summary>
        /// 公司名称
        /// </summary>
        public string CompanyName { get; set; }

        /// <summary>
        /// 公司地址
        /// </summary>
        public string Address { get; set; }

        /// <summary>
        /// 联系电话
        /// </summary>
        public string PhoneNo { get; set; }

        /// <summary>
        /// 联系人
        /// </summary>
        public string LinkMan { get; set; }

        /// <summary>
        /// 电子邮件
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// 公司类型
        /// </summary>
        public string CompanyType { get; set; }

        /// <summary>
        /// 种植品种
        /// </summary>
        public string PlantingSpecies { get; set; }

        /// <summary>
        /// 种植区域
        /// </summary>
        public string PlantingRegion { get; set; }

        /// <summary>
        /// 供应季节
        /// </summary>
        public string SupplySeason { get; set; }

        /// <summary>
        /// 注册资金
        /// </summary>
        public string RegisteredFund { get; set; }

        /// <summary>
        /// 合作意向
        /// </summary>
        public string Intention { get; set; }

        /// <summary>
        /// 种植时间
        /// </summary>
        public string Duration { get; set; }

        /// <summary>
        /// 现有年产量
        /// </summary>
        public string CurrentAnnualOutput { get; set; }

        /// <summary>
        /// 丰产年产量
        /// </summary>
        public string BestAnnualOutput { get; set; }

        /// <summary>
        /// 年收入
        /// </summary>
        public string AnnualIncome { get; set; }

        /// <summary>
        /// 种植面积
        /// </summary>
        public string PlantingArea { get; set; }

        /// <summary>
        /// 仓储能力
        /// </summary>
        public string StorageCapicity { get; set; }

        /// <summary>
        /// 状态
        /// </summary>
        public int ApplyState { get; set; }

        /// <summary>
        /// 申请时间
        /// </summary>
        public DateTime ApplyTime { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        public string Remark { get; set; }
    }
}
