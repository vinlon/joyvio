using System;
using System.Collections.Generic;
using WSI.Model.Entities;
namespace WSI.IService
{
    public interface IUserInfoService
    {

        #region 添加

        /// <summary>
        /// 添加新用户
        /// </summary>
        /// <param name="name"></param>
        /// <param name="password"></param>
        /// <param name="roleidlist"></param>
        void Add(string name, string password, IList<string> roleidlist);

        #endregion

        #region 修改

        /// <summary>
        /// 修改用户信息
        /// </summary>
        /// <param name="uid"></param>
        /// <param name="username"></param>
        /// <param name="roleidlist"></param>
        void UpdateUser(string uid, string username, IList<string> roleidlist);

        /// <summary>
        /// 修改用户实体
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        int Update(UserInfo user);

        /// <summary>
        /// 更改用户状态
        /// </summary>
        /// <param name="user"></param>
        /// <param name="state"></param>
        /// <returns></returns>
        int ChangeState(UserInfo user, int state);
        #endregion

        #region 查询

        /// <summary>
        /// 根据用户名查询
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        UserInfo GetUserByName(string userName);

        /// <summary>
        /// 根据编号查询基本信息
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        UserInfo GetDetail(string userid);

        /// <summary>
        /// 根据编号查询详细信息（用户及个人信息、角色信息）
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        UserInfo GetDetailIncludeAll(string userid);

        /// <summary>
        /// 查询用户列表（包括用户及个人信息、角色信息）
        /// </summary>
        /// <returns></returns>
        IList<UserInfo> GetUserListIncludeAll();

        #endregion

        #region 删除

        /// <summary>
        /// 删除用户
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        int Delete(string userid);

        #endregion

        #region 获取加密后的密码

        /// <summary>
        /// 密码加密（不要随便修改，修改加密机制后将导致所有之前帐户密码错误）
        /// </summary>
        /// <param name="password"></param>
        /// <returns></returns>
        string GetEncryptPassword(string password);

        #endregion

    }
}
