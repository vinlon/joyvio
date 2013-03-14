using System;
using WSI.Model.Entities;
using System.Collections.Generic;
namespace WSI.IService
{
    public interface IFrontendNavigationService
    {

        #region 添加
        /// <summary>
        /// 添加栏目
        /// </summary>
        /// <param name="parentId"></param>
        /// <param name="navName"></param>
        /// <param name="url"></param>
        /// <param name="type"></param>
        /// <param name="description"></param>
        /// <returns></returns>
        int AddNavigation(string parentId, string navName, string url, int type, string description);
        #endregion

        #region 更新
        /// <summary>
        /// 修改栏目信息
        /// </summary>
        /// <param name="nid"></param>
        /// <param name="parentId"></param>
        /// <param name="navName"></param>
        /// <param name="url"></param>
        /// <param name="type"></param>
        /// <param name="description"></param>
        /// <returns></returns>
        int UpdateNavigation(string nid, string parentId, string navName, string url, int type, string description);

        /// <summary>
        /// 修改状态
        /// </summary>
        /// <param name="item"></param>
        /// <param name="state"></param>
        /// <returns></returns>
        int ChangeState(FrontendNavigation item, int state);
        #endregion

        #region 查询
        /// <summary>
        /// 查询明细
        /// </summary>
        /// <param name="navid"></param>
        /// <returns></returns>
        FrontendNavigation GetDetail(string navid);

        /// <summary>
        /// 查询全部数据
        /// </summary>
        /// <returns></returns>
        IList<FrontendNavigation> GetList();

        /// <summary>
        /// 查询父栏目
        /// </summary>
        /// <returns></returns>
        IList<FrontendNavigation> GetTopList();

        /// <summary>
        /// 查询Active父列表
        /// </summary>
        /// <returns></returns>
        IList<FrontendNavigation> GetActiveTopList();

        /// <summary>
        /// 根据父ID查询子栏目,按SortIndex升序排列
        /// </summary>
        /// <param name="parentId"></param>
        /// <returns></returns>
        IList<FrontendNavigation> GetSortedListByParentId(string parentId);

        /// <summary>
        /// 根据root级父栏目查询所有可用的leaf级栏目
        /// </summary>
        /// <param name="topId"></param>
        /// <returns></returns>
        IList<FrontendNavigation> GetLeafNavigationsByRootId(string rootId);

        #endregion

        #region 添加

        #endregion

        #region 删除
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        int Delete(string id);

        #endregion

        #region 重新排序

        void ReSort(IList<string> sortedlist);

        #endregion




    }
}
