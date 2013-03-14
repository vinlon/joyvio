using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using Utility;
using WSI.IService;
using WSI.Model.Entities;

namespace WSI.Service
{
    public class UserInfoService : IUserInfoService
    {
        public UserInfoService() { }

        #region 添加/更新用户信息

        public void Add(string name, string password, IList<string> roleidlist)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                UserInfo user = new UserInfo();
                //user.UserId = Guid.NewGuid();
                user.UserName = name;
                user.UserPassword = password.EncryptMD5();
                user.CreateTime = DateTime.Now;
                user.LastVisitTime = DateTime.Now;
                user.State = (int)EnumHelper.State.Disable;

                //添加角色
                setRoleInfo(context, user, roleidlist);


                context.UserInfoes.Add(user);
                context.LogChangesDuringSave = true;
                context.SaveChanges();
            }
        }

        public void UpdateUser(string uid, string username, IList<string> roleidlist)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                UserInfo user = GetDetail(uid);
                context.UserInfoes.Attach(user);
                user.UserName = username;
                setRoleInfo(context, user, roleidlist);

                context.LogChangesDuringSave = true;
                context.SaveChanges();
            }
        }

        public int Update(UserInfo user)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                context.Entry<UserInfo>(user).State = EntityState.Modified;
                return context.SaveChanges();
            }
        }

        public int ChangeState(UserInfo user, int state)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                context.UserInfoes.Attach(user);
                user.State = state;

                context.LogChangesDuringSave = true;
                return context.SaveChanges();
            }
        }

        private void setRoleInfo(WSI.DataAccess.WSICmsContext context, UserInfo user, IList<string> roleidlist)
        {
            user.RoleList = new List<RoleInfo>();
            if (roleidlist != null)
            {
                foreach (var roleid in roleidlist)
                {
                    Guid id;
                    RoleInfo role;
                    if (Guid.TryParse(roleid, out id))
                    {
                        role = context.RoleInfoes.Find(id);
                        if (role != null)
                        {
                            user.RoleList.Add(role);
                        }
                    }
                }
            }
        }



        #endregion

        #region 根据用户名获取用户信息

        public UserInfo GetUserByName(string userName)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                return context.UserInfoes
                    .Include(u => u.RoleList)
                    .SingleOrDefault(u => u.UserName == userName);
            }
        }

        #endregion

        #region 根据用户编号获取基本信息

        public UserInfo GetDetail(string userid)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Guid id;
                if (Guid.TryParse(userid, out id))
                {
                    return context.UserInfoes.Find(id);
                }
                return null;
            }
        }

        #endregion

        #region 根据用户编号获取用户及个人信息、角色信息

        public UserInfo GetDetailIncludeAll(string userid)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Guid id;
                if (Guid.TryParse(userid, out id))
                {
                    return context.UserInfoes
                        .Include(u => u.Profile)
                        .Include(u => u.RoleList)
                        .SingleOrDefault(u => u.UserInfoId == id);
                }
                return null;
            }
        }


        #endregion

        #region 获取完整的用户列表信息，包括Profile（可能为Null）和RoleList

        public IList<UserInfo> GetUserListIncludeAll()
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var list = context.UserInfoes
                    .Include(u => u.Profile)//个人信息
                    .Include(u => u.RoleList);//角色列表
                return list.ToList();
            }
        }

        #endregion

        #region 删除用户

        public int Delete(string userid)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var user = GetDetail(userid);
                context.UserInfoes.Attach(user);

                //加载个人信息和角色信息到内存中
                context.Entry(user).Reference(u => u.Profile).Load();
                context.Entry(user).Collection(u => u.RoleList).Load();

                context.UserInfoes.Remove(user);

                context.LogChangesDuringSave = true;
                return context.SaveChanges();
            }
        }

        #endregion

        #region 获取加密后的密码

        public string GetEncryptPassword(string password)
        {
            return password.EncryptMD5();
        }

        #endregion

    }
}
