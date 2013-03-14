using System;
using System.Collections.Generic;

namespace WSI.Model.Entities
{
    /// <summary>
    /// 用户基本信息
    /// </summary>
    public class UserInfo
    {
        /// <summary>
        /// 编号
        /// </summary>
        public Guid UserInfoId { get; set; }

        /// <summary>
        /// 用户名
        /// </summary>
        public String UserName { get; set; }

        /// <summary>
        /// 用户密码
        /// </summary>
        public String UserPassword { get; set; }

        /// <summary>
        /// 状态
        /// </summary>
        public int State { get; set; }

        /// <summary>
        /// 上次访问时间
        /// </summary>
        public DateTime LastVisitTime { get; set; }

        /// <summary>
        /// 添加时间
        /// </summary>
        public DateTime CreateTime { get; set; }



        /// <summary>
        /// 个人信息
        /// </summary>
        public virtual UserProfile Profile { get; set; }

        /// <summary>
        /// 角色列表
        /// </summary>
        public virtual ICollection<RoleInfo> RoleList { get; set; }
    }
}
