using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Entity;
using WSI.Model.Entities;
using Utility;
using WSI.IService;
namespace WSI.Service
{
    public class FrontendNavigationService : IFrontendNavigationService
    {
        public FrontendNavigationService() { }

        #region 添加栏目

        public int AddNavigation(string parentId, string navName, string url, int type, string description)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                FrontendNavigation nav = new FrontendNavigation();

                nav.NavName = navName;
                nav.Url = url;
                nav.Type = type;

                //添加父导航
                Guid pid;
                if (Guid.TryParse(parentId, out pid))
                {
                    nav.Parent = context.FrontendNavigations.Find(pid);
                }
                nav.Description = description;
                nav.State = (int)EnumHelper.State.Enable;
                nav.CreateTime = DateTime.Now;


                context.FrontendNavigations.Add(nav);

                context.LogChangesDuringSave = true;
                return context.SaveChanges();

            }
        }

        #endregion

        #region 修改栏目信息，可以修改父栏目

        public int UpdateNavigation(string nid, string parentId, string navName, string url, int type, string description)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {

                FrontendNavigation nav = GetDetail(nid);
                context.FrontendNavigations.Attach(nav);
                if (nav != null)
                {
                    nav.NavName = navName;
                    nav.Url = url;
                    nav.Type = type;
                    nav.Description = description;

                    //添加父导航
                    Guid pid;
                    if (Guid.TryParse(parentId, out pid))
                    {
                        nav.Parent = context.FrontendNavigations.Find(pid);
                    }
                }

                context.LogChangesDuringSave = true;
                return context.SaveChanges();
            }
        }

        public int ChangeState(FrontendNavigation nav, int state)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                context.FrontendNavigations.Attach(nav);
                nav.State = state;

                context.LogChangesDuringSave = true;
                return context.SaveChanges();
            }
        }

        #endregion

        #region 查询列表

        public IList<FrontendNavigation> GetList()
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                return context.FrontendNavigations.ToList();
            }
        }

        //父列表
        public IList<FrontendNavigation> GetTopList()
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                return context.FrontendNavigations
                    .Where(f => f.ParentId == null)
                    .ToList();
            }
        }

        //Active父列表
        public IList<FrontendNavigation> GetActiveTopList()
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                return context.FrontendNavigations
                    //只使用一个Include无法加载Child的Children,需要使用迭代方法,或者使用GetListByParent()方法来加载Children
                    //或者可以一次性的读出所有项，然后在绑定的时候使用LINQ筛选
                    //.Include(f => f.Childrens)   
                  .Where(f => f.ParentId == null)
                  .Where(f => f.State == (int)EnumHelper.State.Enable)
                  .ToList();
            }
        }

        //根据父ID查询列表
        public IList<FrontendNavigation> GetSortedListByParentId(string parentId)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Guid pid;
                if (Guid.TryParse(parentId, out pid))
                {
                    return context.FrontendNavigations
                        .Where(n => n.ParentId == pid)
                        .OrderBy(n => n.SortIndex)
                        .ToList();
                }
                return new List<FrontendNavigation>();
            }
        }


        #endregion

        #region 查询明细

        public FrontendNavigation GetDetail(string navid)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {

                Guid id;
                if (Guid.TryParse(navid, out id))
                {
                    return context.FrontendNavigations.Find(id);
                }
                return null;
            }
        }

        #endregion

        #region 根据root级父栏目查询所有可用的leaf级栏目

        public IList<FrontendNavigation> GetLeafNavigationsByRootId(string rootId)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var result = new List<FrontendNavigation>();
                var root = GetDetail(rootId);
                context.FrontendNavigations.Attach(root);

                foreach (var item in root.Childrens)
                {
                    if (item.Type == (int)NavigationType.List)
                    {
                        if (item.Childrens.Count() != 0)
                        {
                            var chilren = GetLeafNavigationsByRootId(item.NavId.ToString());
                            result = result.Concat(chilren).ToList();
                        }
                        else
                        {
                            result.Add(item);
                        }
                    }
                }
                return result;

            }
        }

        #endregion

        #region 删除

        public int Delete(string id)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                //只能删除没有子项的栏目
                if (GetSortedListByParentId(id).Count == 0)
                {
                    var nav = GetDetail(id);
                    context.FrontendNavigations.Attach(nav);

                    context.FrontendNavigations.Remove(nav);

                    context.LogChangesDuringSave = true;
                    return context.SaveChanges();
                }
                return 0;
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
                        context.FrontendNavigations.Attach(nav);
                        nav.SortIndex = sortedlist.IndexOf(id);
                    }
                }
                context.SaveChanges();
            }
        }

        #endregion
    }
}
