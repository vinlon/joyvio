using System;
using System.Collections.Generic;

namespace WSI.Model.Entities
{
    /// <summary>
    /// 角色信息
    /// </summary>
    public class RoleInfo
    {
        public Guid RoleInfoId { get; set; }

        /// <summary>
        /// 角色名称
        /// </summary>
        public String RoleName { get; set; }

        /// <summary>
        /// 角色描述
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// 状态
        /// </summary>
        public int State { get; set; }

        /// <summary>
        /// 角色类型
        /// </summary>
        public int RoleType { get; set; }

        /// <summary>
        /// 添加时间
        /// </summary>
        public DateTime CreateTime { get; set; }

        /// <summary>
        /// 用户信息
        /// </summary>
        public virtual ICollection<UserInfo> UserList { get; set; }

        /// <summary>
        /// 权限列表
        /// </summary>
        public virtual ICollection<Navigation> Navigations { get; set; }


    }

    public enum RoleType
    {
        /// <summary>
        /// 系统管理员，拥有全部权限，
        /// </summary>
        SystemManager = 9999,

        /// <summary>
        /// 站点管理员，网站的最高管理员，其下的所有管理员权限都以网站管理员的权限为基础
        /// </summary>
        SiteManager = 1,

        /// <summary>
        /// 一般管理员
        /// </summary>
        Common = 0
    }
}
