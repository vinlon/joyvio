using System;
using WSI.Model.Entities;
using System.Collections.Generic;
namespace WSI.IService
{
    public interface INavigationService
    {
        #region 添加
        /// <summary>
        /// 添加权限/导航
        /// </summary>
        /// <param name="navName"></param>
        /// <param name="url"></param>
        /// <param name="description"></param>
        /// <param name="parentId"></param>
        /// <param name="asMenu"></param>
        void AddNavigation(string navName, string url, string description, string parentId, bool asMenu);
        #endregion

        #region 修改
        /// <summary>
        /// 更新权限/导航
        /// </summary>
        /// <param name="nid"></param>
        /// <param name="navName"></param>
        /// <param name="url"></param>
        /// <param name="description"></param>
        /// <param name="parentId"></param>
        /// <param name="asMenu"></param>
        /// <returns></returns>
        int UpdateNavigation(string nid, string navName, string url, string description, string parentId, bool asMenu);

        /// <summary>
        /// 更改状态
        /// </summary>
        /// <param name="nav"></param>
        /// <param name="state"></param>
        /// <returns></returns>
        int ChangeState(Navigation nav, int state);
        #endregion

        #region 查询
        /// <summary>
        /// 查询明细
        /// </summary>
        /// <param name="nid"></param>
        /// <returns></returns>
        Navigation GetDetail(string nid);

        /// <summary>
        /// 根据编号查询全部信息（包括父引用和子引用）
        /// </summary>
        /// <param name="nid"></param>
        /// <returns></returns>
        Navigation GetDetailIncludeAll(string nid);

        /// <summary>
        /// 查询全部可用导航
        /// </summary>
        /// <returns></returns>
        IList<Navigation> GetActiveList();

        /// <summary>
        /// 查询可用父导航
        /// </summary>
        /// <returns></returns>
        IList<Navigation> GetActiveTopNavigation();


        /// <summary>
        /// 查询父导航
        /// </summary>
        /// <returns></returns>
        IList<Navigation> GetTopNavigation();
        #endregion

        #region 删除

        /// <summary>
        /// 删除 --导航数据只分为两级，如果删除父导航，则默认同时删除所有子导航，如不想自动删除，则应该在调用方法时做判断
        /// </summary>
        /// <param name="nid"></param>
        /// <returns></returns>
        int Delete(string nid);

        #endregion

        #region 判断名称是否存在

        /// <summary>
        /// 判断导航名称是否存在
        /// </summary>
        /// <param name="nid"></param>
        /// <param name="navName"></param>
        /// <returns></returns>
        bool NameExists(string nid, string navName);


        #endregion

        #region 重新排序

        void ReSort(IList<string> sortedlist);

        #endregion

    }
}
