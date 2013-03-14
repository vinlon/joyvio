using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WSI.IService;
using WSI.Model.Entities;
using System.Data;

namespace WSI.Service
{
    public class JoinApplyService : IJoinApplyService
    {
        #region 添加JoinApply对象

        public void Add(JoinApply apply)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                context.Entry(apply).State = EntityState.Added;

                context.SaveChanges();
            }
        }

        #endregion

        #region 查询明细

        public JoinApply GetDetail(string applyid)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Guid id;
                if (Guid.TryParse(applyid, out id))
                {
                    return context.JoinApplys.Find(id);
                }
                return null;
            }
        }

        #endregion

        #region 分页查询

        public IList<JoinApply> GetPagedList(int pageindex, int pagesize, out int count)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var query = context.JoinApplys
                    .OrderByDescending(j => j.ApplyTime);
                count = query.Count();

                return query.Skip(pagesize * (pageindex - 1)).Take(pagesize).ToList();
            }
        }

        #endregion
    }
}
