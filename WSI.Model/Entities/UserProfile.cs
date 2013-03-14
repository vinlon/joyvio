using System;

namespace WSI.Model.Entities
{
    /// <summary>
    /// 用户详细个人信息
    /// </summary>
    public class UserProfile
    {
        /// <summary>
        /// 编号
        /// </summary>
        public Guid UserProfileId { get; set; }

        /// <summary>
        /// 所属用户
        /// </summary>
        public UserInfo User { get; set; }

        /// <summary>
        /// 真实姓名
        /// </summary>
        public String RealName { get; set; }

        /// <summary>
        /// 电子邮件
        /// </summary>
        public String Email { get; set; }

        /// <summary>
        /// 修改时间
        /// </summary>
        public DateTime UpdateTime { get; set; }
    }
}
