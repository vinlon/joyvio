using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WSI.Model.Entities;

namespace WSI.IService
{
    public interface ILogService
    {
        #region 查询

        /// <summary>
        /// 查询明细
        /// </summary>
        /// <param name="logid"></param>
        /// <returns></returns>
        Log GetDetail(string logid);

        /// <summary>
        /// 分布查询全部数据
        /// </summary>
        /// <param name="pageindex"></param>
        /// <param name="pagesize"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        IList<Log> GetPagedList(int pageindex, int pagesize, out int count);

        #endregion



    }
}
