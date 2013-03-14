using System;
using System.Collections.Generic;
using System.Linq;
using Utility;
using System.Data.Entity;
using WSI.IService;
using WSI.Model.Entities;
namespace WSI.Service
{
    public class NavigationService : INavigationService
    {
        public NavigationService() { }

        #region 添加

        //添加导航时不对排序字段进行设置，默认为0，显示在最前的位置，当第一次执行排序操作时，将会对SortIndex进行更新
        public void AddNavigation(string navName, string url, string description, string parentId, bool asMenu)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Navigation nav = new Navigation();
                nav.NavigationName = navName;
                nav.Url = url;
                nav.Description = description;
                nav.AsMenu = asMenu;

                //父导航
                Guid id;
                if (Guid.TryParse(parentId, out id))
                {
                    nav.Parent = context.Navigations.Find(id);
                }

                nav.State = (int)EnumHelper.State.Enable;
                nav.CreateTime = DateTime.Now;

                context.Navigations.Add(nav);

                context.LogChangesDuringSave = true;
                context.SaveChanges();
            }
        }

        #endregion

        #region 更新

        public int UpdateNavigation(string nid, string navName, string url, string description, string parentId, bool asMenu)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Navigation nav = GetDetailIncludeAll(nid);
                context.Navigations.Attach(nav);
                if (nav != null)
                {
                    nav.NavigationName = navName;
                    nav.Url = url;
                    nav.Description = description;
                    nav.AsMenu = asMenu;
                    Guid id;
                    if (Guid.TryParse(parentId, out id))
                    {
                        nav.Parent = context.Navigations.Find(id);
                    }
                }

                context.LogChangesDuringSave = true;

                return context.SaveChanges();
            }
        }
        //修改状态
        public int ChangeState(Model.Entities.Navigation nav, int state)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                context.Navigations.Attach(nav);

                nav.State = state;

                context.LogChangesDuringSave = true;
                return context.SaveChanges();
            }
        }

        #endregion

        #region 查询父导航列表

        public IList<Navigation> GetTopNavigation()
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                return context.Navigations
                .Where(n => n.ParentId == null)
                .Include(n => n.Children)
                .OrderByDescending(n => n.CreateTime)
                .ToList();
            }
        }


        //列表项包含子导航
        public IList<Navigation> GetActiveTopNavigation()
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                return context.Navigations
                .Where(n => n.ParentId == null)
                .Where(n => n.State == (int)EnumHelper.State.Enable)
                .Include(n => n.Children)
                .OrderByDescending(n => n.CreateTime)
                .ToList();
            }
        }

        #endregion

        #region 查询列表

        public IList<Navigation> GetActiveList()
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                return context.Navigations
                .Where(n => n.State == (int)EnumHelper.State.Enable)
                .OrderByDescending(n => n.CreateTime)
                .ToList();
            }
        }

        #endregion

        #region 查询详细

        public Navigation GetDetail(string nid)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Guid id;
                if (Guid.TryParse(nid, out id))
                {
                    return context.Navigations.Find(id);
                }
                return null;

            }
        }

        public Navigation GetDetailIncludeAll(string nid)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {

                Guid id;
                if (Guid.TryParse(nid, out id))
                {
                    return context.Navigations
                        .Include(n => n.Parent)
                        .Include(n => n.Children)
                        .SingleOrDefault(n => n.NavigationId == id);
                }
            }
            return null;
        }

        #endregion

        #region 判断名称是否存在

        public bool NameExists(string nid, string navName)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var query = context.Navigations.Where(n => n.NavigationName == navName);

                Guid id;
                if (Guid.TryParse(nid, out id))
                {
                    query = query.Where(n => n.NavigationId != id);
                }

                return query.Count() > 0;
            }
        }

        #endregion

        #region 删除 --导航数据只分为两级，如果删除父导航，则默认同时删除所有子导航，如不想自动删除，则应该在调用方法时做判断

        public int Delete(string id)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var nav = GetDetailIncludeAll(id);
                context.Navigations.Attach(nav);

                context.Navigations.Remove(nav);

                context.LogChangesDuringSave = true;
                return context.SaveChanges();
            }
        }

        #endregion

        #region 重新排序

        public void ReSort(IList<string> sortedlist)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                foreach (var id in sortedlist)
                {
                    var nav = GetDetail(id);
                    if (nav != null)
                    {
                        context.Navigations.Attach(nav);
                        nav.SortIndex = sortedlist.IndexOf(id);
                    }
                }
                context.SaveChanges();
            }
        }

        #endregion

    }
}
