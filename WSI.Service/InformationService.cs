using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using Utility;
using WSI.Model.Entities;
using WSI.IService;
using System.Data;
using System.IO;

namespace WSI.Service
{
    public class InformationService : IInformationService
    {
        public InformationService() { }

        #region 添加/修改信息
        public int AddInformation(
            string title,
            string subtitle,
            string source,
            string author,
            string adder,
            string summary,
            string content,
            string referenceUrl,
            bool isTop,
            IList<string> keywords,
            IList<string> navidlist,
            DateTime publishTime,
            string resourcePath
            )
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Information info = new Information();

                info.Title = title;
                info.SubTitle = subtitle;
                info.Source = source;
                info.Author = author;
                info.Adder = adder;
                info.Summary = summary;
                info.Content = content;
                info.ReferenceUrl = referenceUrl;
                info.IsTop = isTop;
                info.PublishTime = publishTime;
                info.ResourcePath = resourcePath;

                //默认字段
                info.CreateTime = DateTime.Now;
                info.UpdateTime = DateTime.Now;
                info.State = (int)EnumHelper.State.Disable;//默认禁用，因为还要在列表页添加附件和预览

                //关键字
                setKeyWords(context, info, keywords);

                //所属栏目
                setNavigation(context, info, navidlist);

                context.Informations.Add(info);

                context.LogChangesDuringSave = true;
                return context.SaveChanges();
            }

        }

        public int UpdateInformation(
            string infoid,
            string title,
            string subtitle,
            string source,
            string author,
            string adder,
            string summary,
            string content,
            string referenceUrl,
            bool isTop,
            IList<string> keywords,
            IList<string> navidlist,
            DateTime publishTime,
            string resourcePath
            )
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var info = GetDetailIncludeAll(infoid);
                context.Informations.Attach(info);
                if (info != null)
                {
                    info.Title = title;
                    info.SubTitle = subtitle;
                    info.Source = source;
                    info.Author = author;
                    info.Adder = adder;
                    info.Summary = summary;
                    info.Content = content;
                    info.ReferenceUrl = referenceUrl;
                    info.IsTop = isTop;
                    info.PublishTime = publishTime;
                    info.ResourcePath = resourcePath;
                    //关键字
                    setKeyWords(context, info, keywords);

                    //所属栏目
                    setNavigation(context, info, navidlist);
                }

                context.LogChangesDuringSave = true;

                return context.SaveChanges();
            }

        }

        public int ChageState(Information info, int state)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                context.Informations.Attach(info);
                info.State = state;

                context.LogChangesDuringSave = true;
                return context.SaveChanges();
            }
        }


        //设置新闻的关键字
        private void setKeyWords(WSI.DataAccess.WSICmsContext context, Information info, IList<string> keywords)
        {
            //添加时初始化列表，修改时删除所有关键字关联重新添加
            info.KeyWords = new List<KeyWord>();
            foreach (var key in keywords)
            {
                if (key != "")
                {
                    KeyWord keyword = context.KeyWords.SingleOrDefault(k => k.Content == key);
                    //如果关键字已存在
                    if (keyword != null)
                    {
                        info.KeyWords.Add(keyword);
                    }
                    else
                    {
                        //只需要直接将关键字添加到新闻的关键字字段中
                        info.KeyWords.Add(new KeyWord()
                        {
                            Content = key,
                            CreateTime = DateTime.Now
                        });
                    }
                }
            }
        }
        //设置新闻的所属栏目
        private void setNavigation(WSI.DataAccess.WSICmsContext context, Information info, IList<string> idlist)
        {
            //初始化
            info.NavigationList = new List<FrontendNavigation>();
            foreach (var navid in idlist)
            {
                Guid id;
                if (Guid.TryParse(navid, out id))
                {
                    FrontendNavigation nav = context.FrontendNavigations.Find(id);
                    if (nav != null)
                    {
                        info.NavigationList.Add(nav);
                    }
                }
            }
        }



        #endregion

        #region 附件相关

        public void AddAttachImage(string infoid, string path, string description)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var info = GetDetailIncludeAll(infoid);
                context.Informations.Attach(info);
                //var info = GetDetailIncludeAll(infoid, context);
                if (info.Attachments == null)
                {
                    info.Attachments = new List<Attachment>();
                }
                long sortindex = info.Attachments.Count == 0 ? 0 : (info.Attachments.Select(a => a.SortIndex).Max() + 10);
                info.Attachments.Add(new Attachment()
                {
                    SourceUrl = path,
                    Description = description,
                    CreateTime = DateTime.Now,
                    State = (int)EnumHelper.State.Disable,
                    SortIndex = sortindex
                });

                context.LogChangesDuringSave = true;
                context.SaveChanges();
            }
        }

        #endregion

        #region 查询列表

        public IList<Information> GetList()
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                return context.Informations
                    .Include(i => i.NavigationList)
                    .Include(i => i.KeyWords)
                    .Include(i => i.Attachments)
                    .ToList();
            }
        }

        #endregion

        #region 根据栏目ID查询信息列表（分页）

        public IList<Information> GetActivePagedInfosByNavId(string navid, int pageindex, int pagesize, out int count)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Guid id;
                if (Guid.TryParse(navid, out id))
                {
                    var nav = context.FrontendNavigations
                        .Include(n => n.InformationList)
                        .SingleOrDefault(n => n.NavId == id);
                    if (nav != null)
                    {
                        var query = nav.InformationList
                            .Where(i => i.State == (int)EnumHelper.State.Enable)
                            .OrderByDescending(i => i.IsTop)
                            .ThenByDescending(i => i.PublishTime);
                        count = query.Count();
                        return query.Skip(pagesize * (pageindex - 1))
                            .Take(pagesize).ToList();
                    }
                }
                count = 0;
                return new List<Information>();
            }
        }

        #endregion

        #region 分页查询全部信息

        public IList<Information> GetPagedInfo(string title, string navid, DateTime from, DateTime to, int pageindex, int pagesize, out int count)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var query = context.Informations
                    .Where(i => i.CreateTime < to)
                    .Include(i => i.NavigationList)
                    .Include(i => i.KeyWords)
                    .Include(i => i.Attachments);

                if (navid != "")
                {
                    Guid id;
                    if (Guid.TryParse(navid, out id))
                    {
                        query = query.Where(i => i.NavigationList.Any(n => n.NavId == id));
                    }
                }

                if (from != DateTime.MaxValue)
                {
                    query = query.Where(i => i.CreateTime > from);
                }

                if (title != "")
                {
                    query = query.Where(i => i.Title.Contains(title));
                }
                query = query.OrderByDescending(i => i.IsTop)
                    .ThenByDescending(i => i.CreateTime);


                count = query.Count();

                return query.Skip(pagesize * (pageindex - 1)).Take(pagesize).ToList();
            }
        }

        #endregion

        #region 上一条和下一条记录

        public Information GetPrevRecord(string infoid, string navid)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Guid id;
                if (Guid.TryParse(navid, out id))
                {
                    var info = GetDetail(infoid);
                    var prev = context.FrontendNavigations
                        .Find(id)
                        .InformationList
                        .Where(i => i.PublishTime > info.PublishTime) //根据发布时间找上一条
                        .Where(i => i.State == (int)EnumHelper.State.Enable)
                        .OrderByDescending(i => i.PublishTime)
                        .FirstOrDefault();
                    return prev;

                }
                return null;
            }
        }
        public Information GetNextRecord(string infoid, string navid)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Guid id;
                if (Guid.TryParse(navid, out id))
                {
                    var info = GetDetail(infoid);
                    var next = context.FrontendNavigations
                        .Find(id)
                        .InformationList
                        .Where(i => i.PublishTime < info.PublishTime)//根据发布时间找下一条
                        .Where(i => i.State == (int)EnumHelper.State.Enable)
                        .OrderByDescending(i => i.PublishTime)
                        .FirstOrDefault();
                    return next;

                }
                return null;
            }
        }

        #endregion

        #region 获取信息
        public Information GetDetail(string infoid)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Guid id;
                if (Guid.TryParse(infoid, out id))
                {
                    return context.Informations.Find(id);
                }
                return null;
            }
        }

        public Information GetDetailIncludeAll(string infoid)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Guid id;
                if (Guid.TryParse(infoid, out id))
                {
                    return context.Informations
                        .Include(i => i.NavigationList)
                        .Include(i => i.KeyWords)
                        .Include(i => i.Attachments)
                        .SingleOrDefault(i => i.InfoId == id);
                }
                return null;
            }
        }

        public Information GetInformationByTitle(string title)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                return context.Informations.FirstOrDefault(i => i.Title == title);
            }
        }
        #endregion

        #region 删除信息

        //info中包含所有级联数据，删除时也同时删除级联数据

        public int Delete(string infoid)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var info = GetDetail(infoid);

                context.Informations.Attach(info);

                //栏目关联信息，关键字关联信息，附件信息（不包括图片）都将被自动删除
                var entry = context.Entry(info);
                entry.Collection(i => i.NavigationList).Load();
                entry.Collection(i => i.KeyWords).Load();
                entry.Collection(i => i.Attachments).Load();

                context.Informations.Remove(info);

                //删除所有附件的文件


                context.LogChangesDuringSave = true;
                return context.SaveChanges();
            }
        }

        #endregion

        #region 图片路径

        public string GetCoverPath(string basePath)
        {
            return string.Format("{0}/{1}{2}", Path.GetDirectoryName(basePath), Path.GetFileNameWithoutExtension(basePath) + "_cover", Path.GetExtension(basePath));
        }

        public string GetThumbPath(string basePath)
        {
            return string.Format("{0}/{1}{2}", Path.GetDirectoryName(basePath), Path.GetFileNameWithoutExtension(basePath) + "_thumb", Path.GetExtension(basePath));
        }

        #endregion


    }
}
