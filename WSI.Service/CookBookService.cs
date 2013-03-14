using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;
using WSI.IService;
using WSI.Model.Entities;
using Utility;
using System.Data;
using System.IO;

namespace WSI.Service
{
    public class CookBookService : ICookBookService
    {
        public CookBookService()
        {

        }

        #region 查询明细

        public CookBook GetDetail(string cbid)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Guid id;
                if (Guid.TryParse(cbid, out id))
                {
                    return context.CookBooks.Find(id);
                }
                return null;
            }
        }

        #endregion

        #region 获取分页数据

        public IList<CookBook> GetPagedList(int pageindex, int pagesize, out int count)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var query = context.CookBooks
                    .Include(c => c.Navigation)
                    .OrderByDescending(c => c.CreateTime);
                count = query.Count();

                return query.Skip(pagesize * (pageindex - 1)).Take(pagesize).ToList();
            }
        }

        public IList<CookBook> GetActiveSortedPagedListByNavId(string navid, int pageindex, int pagesize, out int count)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Guid id;
                if (Guid.TryParse(navid, out id))
                {
                    var query = context.CookBooks
                        .Where(c => c.NavigationId == id)
                        .Where(c => c.State == (int)EnumHelper.State.Enable)
                        .OrderByDescending(c => c.CreateTime);

                    count = query.Count();

                    return query.Skip(pagesize * (pageindex - 1)).Take(pagesize).ToList();
                }
                count = 0;
                return new List<CookBook>();
            }
        }

        #endregion

        #region 查询推荐列表

        public IList<CookBook> GetRecommendList(int size)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                return context.CookBooks
                    .OrderByDescending(c => c.IsRecommend)  //设置了推荐的优先
                    .ThenByDescending(c => c.LikeCount)    //其次根据喜欢的人数
                    .Where(c => c.State == (int)EnumHelper.State.Enable)
                    .Take(size)
                    .ToList();
            }
        }

        #endregion

        #region 上一条和下一条

        public CookBook GetNextRecord(CookBook current)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                return context.CookBooks
                    .Where(c => c.NavigationId == current.NavigationId)
                    .Where(c => c.CreateTime < current.CreateTime)
                    .OrderByDescending(c => c.CreateTime)
                    .FirstOrDefault();
            }
        }


        public CookBook GetPrevRecord(CookBook current)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                return context.CookBooks
                    .Where(c => c.NavigationId == current.NavigationId)
                    .Where(c => c.CreateTime > current.CreateTime)
                    .OrderByDescending(c => c.CreateTime)
                    .FirstOrDefault();
            }
        }

        #endregion

        #region 添加和修改

        public void AddCookBook(
                    string name,
                    string summary,
                    string source,
                    string referenceUrl,
                    string materail,
                    string benifits,
                    string practice,
                    string tips,
                    string navid,
                    bool isRecommend)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                context.CookBooks.Add(new CookBook()
                {
                    CookBookName = name,
                    Summary = summary,
                    Source = source,
                    ReferenceUrl = referenceUrl,
                    Material = materail,
                    Benifits = benifits,
                    Practice = practice,
                    Tips = tips,
                    NavigationId = Guid.Parse(navid),
                    IsRecommend = isRecommend,

                    ImageUrl = "",
                    LikeCount = 0,
                    State = (int)EnumHelper.State.Disable,
                    CreateTime = DateTime.Now
                });

                context.LogChangesDuringSave = true;
                context.SaveChanges();
            }
        }

        public void UpdateCookBook(
            string cbid,
            string name,
            string summary,
            string source,
            string referenceUrl,
            string materail,
            string benifits,
            string practice,
            string tips,
            string navid,
            bool isRecommend)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var item = GetDetail(cbid);
                context.CookBooks.Attach(item);

                item.CookBookName = name;
                item.Summary = summary;
                item.Source = source;
                item.ReferenceUrl = referenceUrl;
                item.Material = materail;
                item.Benifits = benifits;
                item.Practice = practice;
                item.Tips = tips;
                item.NavigationId = Guid.Parse(navid);
                item.IsRecommend = isRecommend;

                context.LogChangesDuringSave = true;
                context.SaveChanges();
            }
        }

        #endregion

        #region 更新图片信息

        public void UpdateImage(string cbid, string path)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var item = GetDetail(cbid);
                context.CookBooks.Attach(item);

                item.ImageUrl = path;

                context.LogChangesDuringSave = true;
                context.SaveChanges();
            }
        }

        #endregion

        #region 修改状态

        public int ChangeState(CookBook item, int state)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                context.CookBooks.Attach(item);

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

        #region 食谱喜欢人数+1

        public int Favor(string id)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var item = GetDetail(id);
                context.CookBooks.Attach(item);

                item.LikeCount = item.LikeCount + 1;

                context.SaveChanges();

                return item.LikeCount;
            }
        }

        #endregion

        #region 获取食谱的缩略图

        public string GetThumbPath(string savePath)
        {
            string ext = Path.GetExtension(savePath);
            return savePath.Replace(ext, "_thumb" + ext);
        }

        #endregion
    }
}
