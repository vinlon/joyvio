using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WSI.IService;
using WSI.Model.Entities;
using System.Data;
using Utility;

namespace WSI.Service
{
    public class RecruitmentService : IRecruitmentService
    {
        public RecruitmentService()
        {

        }

        #region 查询明细

        public Recruitment GetDetail(string rid)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Guid id;
                if (Guid.TryParse(rid, out id))
                {
                    return context.Recruitments.Find(id);
                }
                return null;
            }
        }

        #endregion

        #region 查询列表

        public IList<Recruitment> GetList()
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                return context.Recruitments.ToList();
            }
        }

        #endregion

        #region 查询分页数据

        public IList<Recruitment> GetActivePagedList(int pageindex, int pagesize, out int count)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var query = context.Recruitments
                    .Where(r => r.State == (int)EnumHelper.State.Enable)
                    .OrderByDescending(r => r.PublishTime);
                count = query.Count();

                return query.Skip(pagesize * (pageindex - 1)).Take(pagesize).ToList();
            }
        }

        public IList<Recruitment> GetPagedRecruit(int pageindex, int pagesize, out int count)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var query = context.Recruitments
                    .OrderBy(r => r.PublishTime);

                count = query.Count();
                return query.Skip(pagesize * (pageindex - 1)).Take(pagesize).ToList();
            }
        }

        #endregion

        #region 添加招聘信息

        public void AddRecruitment(string position, string department, string workplace, string duty, string requirement, DateTime publishTime)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var recruit = new Recruitment()
                {
                    Position = position,
                    Department = department,
                    WorkPlace = workplace,
                    Duty = duty,
                    Requirement = requirement,
                    PublishTime = publishTime
                };

                context.Recruitments.Add(recruit);

                context.LogChangesDuringSave = true;
                context.SaveChanges();
            }
        }

        #endregion

        #region 更新招聘信息

        public void UpdateRecruitment(string rid, string position, string department, string workplace, string duty, string requirement, DateTime publishTime)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var recruit = GetDetail(rid);
                if (recruit != null)
                {
                    context.Recruitments.Attach(recruit);

                    recruit.Position = position;
                    recruit.Department = department;
                    recruit.WorkPlace = workplace;
                    recruit.Duty = duty;
                    recruit.Requirement = requirement;
                    recruit.PublishTime = publishTime;

                    context.LogChangesDuringSave = true;
                    context.SaveChanges();
                }
            }
        }

        #endregion

        #region 修改状态

        public int ChangeState(Recruitment item, int state)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                context.Recruitments.Attach(item);
                item.State = state;

                context.LogChangesDuringSave = true;
                return context.SaveChanges();
            }
        }

        #endregion

        #region 删除

        public int Delete(string id)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var item = GetDetail(id);

                context.Entry(item).State = EntityState.Deleted;

                context.LogChangesDuringSave = true;
                return context.SaveChanges();
            }
        }

        #endregion
    }
}
