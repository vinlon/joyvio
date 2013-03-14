using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WSI.Model.Entities;

namespace WSI.IService
{
    public interface IJoinApplyService
    {
        #region 添加

        /// <summary>
        /// 添加JoinApply对象
        /// </summary>
        /// <param name="apply"></param>
        void Add(JoinApply apply);

        #endregion

        #region 查询

        /// <summary>
        /// 查询明细
        /// </summary>
        /// <param name="applyid"></param>
        /// <returns></returns>
        JoinApply GetDetail(string applyid);

        /// <summary>
        /// 分页查询
        /// </summary>
        /// <param name="pageindex"></param>
        /// <param name="pagesize"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        IList<JoinApply> GetPagedList(int pageindex, int pagesize, out int count);

        #endregion



    }
}
