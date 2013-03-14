using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WSI.IService;
using WSI.Model.Entities;

namespace WSI.Service
{
    public class LogService : ILogService
    {
        public LogService()
        {

        }

        #region 分页查询全部数据

        public IList<Log> GetPagedList(int pageindex, int pagesize, out int count)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var query = context.Logs
                    .OrderByDescending(l => l.CreateTime);
                count = query.Count();

                return query.Skip(pagesize * (pageindex - 1)).Take(pagesize).ToList();
            }
        }

        #endregion

        #region 查询明细

        public Log GetDetail(string logid)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Guid id;
                if (Guid.TryParse(logid, out id))
                {
                    return context.Logs.Find(id);
                }
                return null;
            }
        }

        #endregion

    }
}
