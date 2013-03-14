using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;
using WSI.IService;
using WSI.Model.Entities;
using System.Data;
using Utility;

namespace WSI.Service
{
    public class TagServcie : ITagService
    {
        public TagServcie()
        {

        }

        #region 添加标签

        public int AddTag(string parentId, string tagName, string code, string description)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Tag tag = new Tag();
                tag.TagName = tagName;
                tag.TagCode = code;
                tag.Description = description;

                //父标签
                Guid pid;
                if (Guid.TryParse(parentId, out pid))
                {
                    tag.Parent = context.Tags.Find(pid);
                }

                tag.CreateTime = DateTime.Now;
                tag.State = (int)EnumHelper.State.Enable;//默认启用

                context.Tags.Add(tag);

                context.LogChangesDuringSave = true;
                return context.SaveChanges();
            }
        }

        #endregion

        #region 修改标签

        //更新信息
        public int UpdateTag(string tagId, string parentId, string tagName, string code, string description)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Tag tag = GetDetail(tagId);
                context.Tags.Attach(tag);
                if (tag != null)
                {
                    tag.TagName = tagName;
                    tag.TagCode = code;
                    tag.Description = description;

                    //父标签
                    Guid pid;
                    if (Guid.TryParse(parentId, out pid))
                    {
                        tag.Parent = context.Tags.Find(pid);
                    }
                }
                context.LogChangesDuringSave = true;
                return context.SaveChanges();
            }
        }

        //修改状态
        public int ChangeState(Tag item, int state)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                context.Tags.Attach(item);

                item.State = state;

                context.LogChangesDuringSave = true;
                return context.SaveChanges();
            }
        }

        #endregion

        #region 根据Code得到标签
        public Tag GetDetailByCode(string code)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                return context.Tags.SingleOrDefault(t => t.TagCode == code);
            }
        }
        #endregion

        #region 标签Code是否存在

        public bool CodeExists(string code, string tagId)
        {
            Tag tag = GetDetailByCode(code);
            if (tag != null)
            {
                if (tagId == "" || tag.TagId.ToString() != tagId)
                {
                    return true;
                }
            }
            return false;
        }

        #endregion

        #region 查询明细

        public Tag GetDetail(string tagId)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Guid id;
                if (Guid.TryParse(tagId, out id))
                {
                    return context.Tags.Find(id);
                }
                return null;
            }
        }
        #endregion

        #region 查询列表

        public IList<Tag> GetList()
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                return context.Tags.ToList();
            }
        }
        public IList<Tag> GetTagsByParentId(string pid)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Guid id;
                if (Guid.TryParse(pid, out id))
                {
                    return context.Tags.Where(t => t.ParentId == id).ToList();
                }
                return null;
            }
        }

        public IList<Tag> GetTopList()
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                return context.Tags.Where(t => t.ParentId == null).ToList();
            }
        }


        #endregion

        #region 删除

        public int Delete(string id)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var tag = GetDetail(id);

                context.Entry<Tag>(tag).State = EntityState.Deleted;

                context.LogChangesDuringSave = true;
                return context.SaveChanges();
            }
        }
        #endregion

        #region 重新排序

        public void ReSort(IList<string> sortedlist)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                foreach (var id in sortedlist)
                {
                    var tag = GetDetail(id);
                    if (tag != null)
                    {
                        context.Tags.Attach(tag);
                        tag.SortIndex = sortedlist.IndexOf(id);
                    }
                }
                context.SaveChanges();
            }
        }

        #endregion

        #region ##TagInformationRelaService

        #region 根据标签Code查询信息

        //查询条数
        public int GetInformationCountByTagCode(string code)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                return context.Tags
                    .SingleOrDefault(t => t.TagCode == code)
                    .TagInformations
                    .Count();
            };
        }
        #endregion

        #region 根据Code查询信息列表
        public IList<Information> GetInformationsByTagCode(string code)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                //得到 tag
                var tag = context.Tags
                     .SingleOrDefault(t => t.TagCode == code);

                if (tag != null)
                {
                    return context.TagInformations
                        .Where(r => r.TagId == tag.TagId)
                        .OrderBy(r => r.SortIndex)
                        .Select(r => r.Information)
                        .Include(i => i.NavigationList)
                        .ToList();
                }
                else { return null; }
            }

        }
        #endregion

        #region 为标签附加信息

        public int UpdateTagInformation(string tagId, string infoId)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                //从关联表中取出tagId对应的所有信息
                Guid tag;
                Guid info;
                var exists = new List<Guid>();

                if (Guid.TryParse(tagId, out tag))
                {
                    exists = (from r in context.TagInformations
                              where r.TagId == tag
                              select r.Information.InfoId).ToList();
                }

                if (Guid.TryParse(infoId, out info))
                {
                    //添加
                    if (!exists.Contains(info))
                    {
                        context.TagInformations.Add(new TagInformation()
                        {
                            TagId = tag,
                            InfoId = info,
                            SortIndex = exists.Count()
                        });
                    }
                }
                context.LogChangesDuringSave = true;
                return context.SaveChanges();
            }
        }

        #endregion

        #region 移除标签附加的信息

        public void RemoveInformation(string tagId, string infoId)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Guid tag;
                Guid info;
                if (Guid.TryParse(tagId, out tag) && Guid.TryParse(infoId, out info))
                {
                    var entry = context.TagInformations
                        .Where(r => r.TagId == tag)
                        .Where(r => r.InfoId == info)
                        .SingleOrDefault();
                    context.TagInformations.Remove(entry);

                    context.LogChangesDuringSave = true;
                    context.SaveChanges();
                }
            }
        }

        #endregion

        #region 标签关联的信息排序

        public void ResortTagInformation(string tagId, IList<string> sortedlist)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Guid tag;
                if (Guid.TryParse(tagId, out tag))
                {
                    foreach (var infoid in sortedlist)
                    {
                        Guid info;
                        if (Guid.TryParse(infoid, out info))
                        {
                            var item = context.TagInformations
                                   .Where(r => r.TagId == tag)
                                   .Where(r => r.InfoId == info)
                                   .SingleOrDefault();

                            item.SortIndex = sortedlist.IndexOf(infoid);
                        }
                    }
                    context.SaveChanges();
                }
            }
        }

        #endregion
        #endregion

    }
}
