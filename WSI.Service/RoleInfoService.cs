using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WSI.Model.Entities;
using WSI.IService;
using System.Data.Entity;
using Utility;
namespace WSI.Service
{
    public class RoleInfoService : IRoleInfoService
    {
        public RoleInfoService() { }

        #region 属性

        public RoleInfo SiteManager
        {
            get
            {
                using (var context = new WSI.DataAccess.WSICmsContext())
                {
                    return context.RoleInfoes
                        .Include(r => r.Navigations)
                        .Where(r => r.RoleType == (int)RoleType.SiteManager)
                        .SingleOrDefault();
                }
            }

        }

        #endregion

        #region 添加/修改角色信息

        public void Add(string rolename, string description, IList<string> navlist)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                RoleInfo role = new RoleInfo();
                role.RoleInfoId = Guid.NewGuid();
                role.RoleName = rolename;
                role.Description = description;
                role.CreateTime = DateTime.Now;

                //设置权限
                setNavigation(context, role, navlist);

                //角色类型
                if (SiteManager == null)
                {
                    //如果没有站点管理角色
                    role.RoleType = (int)RoleType.SiteManager;
                }
                else
                {
                    role.RoleType = (int)RoleType.Common;
                }

                context.RoleInfoes.Add(role);

                context.LogChangesDuringSave = true;
                context.SaveChanges();
            }
        }



        public void UpdateRoleInfo(string roleid, string roleName, string description, IList<string> navlist)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var role = GetDetail(roleid);
                context.RoleInfoes.Attach(role);

                role.RoleName = roleName;
                role.Description = description;

                //设置权限
                setNavigation(context, role, navlist);

                context.LogChangesDuringSave = true;
                context.SaveChanges();
            }
        }

        //设置角色的权限
        private void setNavigation(DataAccess.WSICmsContext context, RoleInfo role, IList<string> navlist)
        {
            //重置为空列表
            if (role.Navigations == null)
            {
                role.Navigations = new List<Navigation>();
            }
            else
            {
                role.Navigations.Clear();
            }
            foreach (var navid in navlist)
            {
                Guid id;
                if (Guid.TryParse(navid, out id))
                {
                    var nav = context.Navigations.Find(id);
                    if (nav != null)
                    {
                        role.Navigations.Add(nav);
                    }
                }
            }
        }
        public int ChangeState(RoleInfo role, int state)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                context.RoleInfoes.Attach(role);
                role.State = state;

                context.LogChangesDuringSave = true;
                return context.SaveChanges();
            }
        }

        #endregion

        #region 获取列表

        public IList<RoleInfo> GetList()
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                return context.RoleInfoes.ToList();
            }
        }

        public IList<RoleInfo> GetActiveList()
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                return context.RoleInfoes
                    .Where(r => r.State == (int)EnumHelper.State.Enable)
                    .ToList();
            }
        }

        #endregion

        #region 根据编号查询详细

        public RoleInfo GetDetail(string roleid)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Guid id;
                if (Guid.TryParse(roleid, out id))
                {
                    return context.RoleInfoes.Find(id);
                }
                return null;
            }
        }
        public RoleInfo GetDetailIncludeAll(string roleid)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Guid id;
                if (Guid.TryParse(roleid, out id))
                {
                    return context.RoleInfoes
                        .Include(r => r.UserList)
                        .Include(r => r.Navigations)
                        .SingleOrDefault(r => r.RoleInfoId == id);
                }
                return null;
            }
        }
        #endregion

        #region 删除角色

        public int Delete(string roleid)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                //删除角色以及所有相关数据
                var role = GetDetailIncludeAll(roleid);
                if (role != null)
                {
                    context.RoleInfoes.Attach(role);
                    context.RoleInfoes.Remove(role);

                    context.LogChangesDuringSave = true;
                    return context.SaveChanges();
                }
                return 0;
            }
        }

        #endregion
    }
}
