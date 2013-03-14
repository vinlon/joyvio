using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WSI.Model.Entities;

namespace WSI.IService
{
    public interface ITagService
    {
        #region 添加
        /// <summary>
        /// 添加标签
        /// </summary>
        /// <param name="parentId"></param>
        /// <param name="tagName"></param>
        /// <param name="code"></param>
        /// <param name="description"></param>
        /// <returns></returns>
        int AddTag(string parentId, string tagName, string code, string description);
        #endregion

        #region 修改
        /// <summary>
        /// 修改标签信息
        /// </summary>
        /// <param name="tagId"></param>
        /// <param name="parentId"></param>
        /// <param name="tagName"></param>
        /// <param name="code"></param>
        /// <param name="description"></param>
        /// <returns></returns>
        int UpdateTag(string tagId, string parentId, string tagName, string code, string description);



        /// <summary>
        /// 修改状态
        /// </summary>
        /// <param name="item"></param>
        /// <param name="state"></param>
        /// <returns></returns>
        int ChangeState(Tag item, int state);

        /// <summary>
        /// 为标签附加关联信息
        /// </summary>
        /// <param name="tagId"></param>
        /// <param name="list"></param>
        /// <returns></returns>
        int UpdateTagInformation(string tagId, string infoId);

        /// <summary>
        /// 移除标签附加的一条信息
        /// </summary>
        /// <param name="tid"></param>
        /// <param name="infoid"></param>
        void RemoveInformation(string tagId, string infoId);
        #endregion

        #region 查询
        /// <summary>
        /// 根据编号查询基本信息
        /// </summary>
        /// <param name="tagId"></param>
        /// <returns></returns>
        Tag GetDetail(string tagId);

        /// <summary>
        /// 根据Code查询
        /// </summary>
        /// <param name="code"></param>
        /// <returns></returns>
        Tag GetDetailByCode(string code);

        /// <summary>
        /// 根据父标签查询子标签
        /// </summary>
        /// <param name="pid"></param>
        /// <returns></returns>
        IList<Tag> GetTagsByParentId(string pid);

        /// <summary>
        /// 查询所有父标签
        /// </summary>
        /// <returns></returns>
        IList<Tag> GetTopList();

        /// <summary>
        /// 根据标签Code查询信息列表,按SortIndex排序,包括信息的导航栏目信息
        /// </summary>
        /// <param name="code"></param>
        /// <returns></returns>
        IList<Information> GetInformationsByTagCode(string code);

        /// <summary>
        /// 根据标签Code查询信息条数
        /// </summary>
        /// <param name="code"></param>
        /// <returns></returns>
        int GetInformationCountByTagCode(string code);

        #endregion

        #region 删除

        int Delete(string id);

        #endregion

        #region 判断Code是否存在

        /// <summary>
        /// 判断Code是否存在
        /// </summary>
        /// <param name="code"></param>
        /// <param name="tagId"></param>
        /// <returns></returns>
        bool CodeExists(string code, string tagId);

        #endregion

        #region 排序

        /// <summary>
        /// 标签排序
        /// </summary>
        /// <param name="sortedlist"></param>
        void ReSort(IList<string> sortedlist);

        /// <summary>
        /// 标签关联的信息排序
        /// </summary>
        /// <param name="sortedlist"></param>
        void ResortTagInformation(string tagId, IList<string> sortedlist);
        #endregion




    }
}
