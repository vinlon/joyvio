using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;
using Utility;
using WSI.DataAccess.FluentAPI;
using WSI.Model.Entities;
namespace WSI.DataAccess
{
    public class WSICmsContext : DbContext
    {
        public WSICmsContext()
            : base("name=WSICms")
        {

        }

        //public WSICmsContext(string nameOrConnectionString)
        //    : base(EntityConnectionWrapperUtils.CreateEntityConnectionWithWrappers(nameOrConnectionString), true)
        //{
        //    var ctx = ((IObjectContextAdapter)this).ObjectContext;
        //    ctx.GetTracingConnection().CommandExecuting += (sender, e) =>
        //    {

        //    };
        //}

        /// <summary>
        /// 信息附件
        /// </summary>
        public DbSet<Attachment> Attachments { get; set; }

        /// <summary>
        /// 食谱
        /// </summary>
        public DbSet<CookBook> CookBooks { get; set; }

        /// <summary>
        /// 信息类别
        /// </summary>
        public DbSet<FrontendNavigation> FrontendNavigations { get; set; }

        /// <summary>
        /// 图片尺寸
        /// </summary>
        public DbSet<ImageSize> ImageSizes { get; set; }

        /// <summary>
        /// 信息
        /// </summary>
        public DbSet<Information> Informations { get; set; }

        /// <summary>
        /// 加盟申请
        /// </summary>
        public DbSet<JoinApply> JoinApplys { get; set; }

        /// <summary>
        /// 关键字
        /// </summary>
        public DbSet<KeyWord> KeyWords { get; set; }

        /// <summary>
        /// 系统日志
        /// </summary>
        public DbSet<Log> Logs { get; set; }

        /// <summary>
        /// 导航/菜单/权限
        /// </summary>
        public DbSet<Navigation> Navigations { get; set; }

        /// <summary>
        /// 人才招聘
        /// </summary>
        public DbSet<Recruitment> Recruitments { get; set; }

        /// <summary>
        /// 角色信息
        /// </summary>
        public DbSet<RoleInfo> RoleInfoes { get; set; }

        /// <summary>
        /// 标签
        /// </summary>
        public DbSet<Tag> Tags { get; set; }

        /// <summary>
        /// 标签与信息的关联（由于需要排序所以使用复杂的多对多关系）
        /// </summary>
        public DbSet<TagInformation> TagInformations { get; set; }

        /// <summary>
        /// 用户信息
        /// </summary>
        public DbSet<UserInfo> UserInfoes { get; set; }

        /// <summary>
        /// 用户个人档案
        /// </summary>
        public DbSet<UserProfile> UserProfiles { get; set; }

        /// <summary>
        /// 日志开关
        /// </summary>
        public bool LogChangesDuringSave = false;

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            Database.SetInitializer(new CreateDatabaseWithSeedData());

            //Fluent API配置
            modelBuilder.Configurations.Add(new AttachmentConfiguration());
            modelBuilder.Configurations.Add(new CookBookConfiguration());
            modelBuilder.Configurations.Add(new FrontendNavigationConfiguration());
            modelBuilder.Configurations.Add(new ImageSizeConfigration());
            modelBuilder.Configurations.Add(new InformationConfiguration());
            modelBuilder.Configurations.Add(new JoinApplyConfiguration());
            modelBuilder.Configurations.Add(new KeyWordConfiguration());
            modelBuilder.Configurations.Add(new LogConfiguration());
            modelBuilder.Configurations.Add(new NavigationConfiguration());
            modelBuilder.Configurations.Add(new RecruitmentConfiguration());
            modelBuilder.Configurations.Add(new RoleInfoConfiguration());
            modelBuilder.Configurations.Add(new TagConfiguration());
            modelBuilder.Configurations.Add(new TagInformationConfiguration());
            modelBuilder.Configurations.Add(new UserInfoConfiguration());
            modelBuilder.Configurations.Add(new UserProfileConfiguration());
        }


        //保存日志
        public override int SaveChanges()
        {
            if (this.LogChangesDuringSave)
            {
                //排除Unchanged的实体
                var entries = from e in this.ChangeTracker.Entries()
                              where e.State != EntityState.Unchanged
                              select e;
                string userName = "未登录";
                if (HttpContext.Current.Session[CommonHelper.SESSION_KEY_USERINFO] != null)
                {
                    userName = ((UserInfo)HttpContext.Current.Session[CommonHelper.SESSION_KEY_USERINFO]).UserName;
                }

                foreach (var entry in entries)
                {
                    var log = new Log()
                        {
                            User = userName,
                            IpAddress = CommonHelper.GetClientIP(),
                            Target = entry.Entity.GetType().Name,
                            CreateTime = DateTime.Now
                        };
                    switch (entry.State)
                    {
                        case EntityState.Added:
                            log.Type = (int)LogType.Added;
                            //记录所有字段
                            log.Content = GetLogContent(
                                entry.CurrentValues,
                                entry.CurrentValues.PropertyNames);
                            this.Logs.Add(log);
                            break;
                        case EntityState.Deleted:
                            log.Type = (int)LogType.Deleted;
                            //只记录主键
                            log.Content = GetLogContent(
                                entry.OriginalValues,
                                GetKeyPropertyNames(entry.Entity));
                            this.Logs.Add(log);
                            break;

                        case EntityState.Modified:
                            log.Type = (int)LogType.Modified;
                            //只记录修改的字段
                            var modifiedProperties = from n in entry.CurrentValues.PropertyNames
                                                     where entry.Property(n).IsModified
                                                     select n;
                            modifiedProperties = modifiedProperties.Union(GetKeyPropertyNames(entry.Entity));
                            log.Content = GetLogContent(
                                entry.CurrentValues,
                                modifiedProperties);
                            this.Logs.Add(log);
                            break;
                        default:
                            break;
                    }
                }
            }

            return base.SaveChanges();
        }

        //获取一个实体的主键
        private IEnumerable<string> GetKeyPropertyNames(object entity)
        {
            var objectContext = ((IObjectContextAdapter)this).ObjectContext;
            return objectContext
            .ObjectStateManager
            .GetObjectStateEntry(entity)
            .EntityKey
            .EntityKeyValues
            .Select(k => k.Key);
        }

        //获取要记录的日志内容
        private string GetLogContent(DbPropertyValues values, IEnumerable<string> properties)
        {
            Dictionary<string, string> result = new Dictionary<string, string>();
            foreach (var propertyName in properties)
            {
                var value = values[propertyName];
                if (value is DbPropertyValues)
                {
                    var complexPropertyValues = (DbPropertyValues)value;
                    result.Add(propertyName, GetLogContent(complexPropertyValues, complexPropertyValues.PropertyNames));
                }
                else
                {
                    result.Add(propertyName, (value ?? "").ToString());
                }
            }
            return result.ToJson();
        }
    }
}
