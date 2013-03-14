using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WSI.Model.Entities;

namespace WSI.IService
{
    public interface IRecruitmentService
    {
        #region 查询

        /// <summary>
        /// 根据编号查询明细
        /// </summary>
        /// <param name="rid"></param>
        /// <returns></returns>
        Recruitment GetDetail(string rid);

        /// <summary>
        /// 查询全部数据
        /// </summary>
        /// <returns></returns>
        IList<Recruitment> GetList();

        /// <summary>
        /// 查询可用的分页数据
        /// </summary>
        /// <param name="pageindex"></param>
        /// <param name="pagesize"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        IList<Recruitment> GetActivePagedList(int pageindex, int pagesize, out int count);

        /// <summary>
        /// 分布获取全部数据
        /// </summary>
        /// <param name="pageindex"></param>
        /// <param name="pagesize"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        IList<Recruitment> GetPagedRecruit(int pageindex, int pagesize, out int count);

        #endregion

        #region 添加

        /// <summary>
        /// 添加招聘信息
        /// </summary>
        /// <param name="position"></param>
        /// <param name="department"></param>
        /// <param name="workplace"></param>
        /// <param name="duty"></param>
        /// <param name="requirement"></param>
        /// <param name="dateTime"></param>
        void AddRecruitment(string position, string department, string workplace, string duty, string requirement, DateTime publishTime);

        #endregion

        #region 更新

        /// <summary>
        /// 修改招聘信息
        /// </summary>
        /// <param name="rid"></param>
        /// <param name="position"></param>
        /// <param name="department"></param>
        /// <param name="workplace"></param>
        /// <param name="duty"></param>
        /// <param name="requirement"></param>
        /// <param name="publishTime"></param>
        void UpdateRecruitment(string rid, string position, string department, string workplace, string duty, string requirement, DateTime publishTime);

        /// <summary>
        /// 修改状态
        /// </summary>
        /// <param name="item"></param>
        /// <param name="state"></param>
        /// <returns></returns>
        int ChangeState(Recruitment item, int state);

        #endregion

        #region 删除

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        int Delete(string id);

        #endregion


    }
}
