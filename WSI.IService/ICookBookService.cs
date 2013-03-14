using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WSI.Model.Entities;

namespace WSI.IService
{
    public interface ICookBookService
    {
        #region 查询

        /// <summary>
        /// 查询明细
        /// </summary>
        /// <param name="cbid"></param>
        /// <returns></returns>
        CookBook GetDetail(string cbid);


        /// <summary>
        /// 分布查询全部数据（添加时间倒序排列）
        /// </summary>
        /// <param name="pageindex"></param>
        /// <param name="pagesize"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        IList<CookBook> GetPagedList(int pageindex, int pagesize, out int count);

        /// <summary>
        /// 分页查询可用的、已排序的食谱
        /// </summary>
        /// <param name="pageindex"></param>
        /// <param name="pagesize"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        IList<CookBook> GetActiveSortedPagedListByNavId(string navid, int pageindex, int pagesize, out int count);

        /// <summary>
        /// 查询推荐列表
        /// </summary>
        /// <param name="size"></param>
        /// <returns></returns>
        IList<CookBook> GetRecommendList(int size);

        /// <summary>
        /// 下一条
        /// </summary>
        /// <param name="cbid"></param>
        /// <returns></returns>
        CookBook GetNextRecord(CookBook current);

        /// <summary>
        /// 上一条
        /// </summary>
        /// <param name="cbid"></param>
        /// <returns></returns>
        CookBook GetPrevRecord(CookBook current);

        #endregion

        #region 添加

        void AddCookBook(string name, string summary, string source, string referenceUrl, string materail, string benifits, string practice, string tips, string navid, bool isRecommend);

        #endregion

        #region 修改

        void UpdateCookBook(string cbid, string name, string summary, string source, string referenceUrl, string materail, string benifits, string practice, string tips, string navid, bool isRecommend);

        /// <summary>
        /// 更新图片信息
        /// </summary>
        /// <param name="cbid"></param>
        /// <param name="path"></param>
        void UpdateImage(string cbid, string path);

        /// <summary>
        /// 修改状态
        /// </summary>
        /// <param name="item"></param>
        /// <param name="state"></param>
        /// <returns></returns>
        int ChangeState(CookBook item, int state);

        /// <summary>
        /// 某食谱喜欢的人数+1
        /// </summary>
        /// <param name="id"></param>
        int Favor(string id);
        #endregion

        #region 删除

        int Delete(string id);

        #endregion


        #region 其它

        /// <summary>
        /// 获取缩略图
        /// </summary>
        /// <param name="savePath"></param>
        /// <returns></returns>
        string GetThumbPath(string savePath);

        #endregion
    }
}
