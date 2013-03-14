using System.Collections.Generic;
using WSI.Model.Entities;
namespace WSI.IService
{
    public interface IRoleInfoService
    {
        #region 属性

        /// <summary>
        /// 站点管理员角色(包括权限信息)
        /// </summary>
        RoleInfo SiteManager { get; }

        #endregion

        #region 添加
        /// <summary>
        /// 添加角色
        /// </summary>
        /// <param name="rolename"></param>
        /// <param name="description"></param>
        /// <param name="navlist"></param>
        void Add(string rolename, string description, IList<string> navlist);
        #endregion

        #region 修改

        /// <summary>
        /// 更新角色信息
        /// </summary>
        /// <param name="roleName"></param>
        /// <param name="desc"></param>
        void UpdateRoleInfo(string roleid, string roleName, string description, IList<string> navlist);

        /// <summary>
        /// 更改状态
        /// </summary>
        /// <param name="user"></param>
        /// <param name="state"></param>
        /// <returns></returns>
        int ChangeState(RoleInfo role, int state);

        #endregion

        #region 查询

        /// <summary>
        /// 根据编号查询明细
        /// </summary>
        /// <param name="roleid"></param>
        /// <returns></returns>
        RoleInfo GetDetail(string roleid);

        /// <summary>
        /// 根据编号获取完整的角色信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        RoleInfo GetDetailIncludeAll(string roleid);

        /// <summary>
        /// 查询整个列表
        /// </summary>
        /// <returns></returns>
        IList<WSI.Model.Entities.RoleInfo> GetList();

        /// <summary>
        /// 查询可用列表
        /// </summary>
        /// <returns></returns>
        IList<RoleInfo> GetActiveList();

        #endregion

        #region 删除
        /// <summary>
        /// 删除角色
        /// </summary>
        /// <param name="role"></param>
        /// <returns></returns>
        int Delete(string roleid);
        #endregion

    }
}
