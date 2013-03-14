using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
using WSI.Model.Entities;
using System.ComponentModel.DataAnnotations.Schema;


namespace WSI.DataAccess.FluentAPI
{
    public class InformationConfiguration : EntityTypeConfiguration<Information>
    {
        public InformationConfiguration()
        {
            //主键,GUID自增
            HasKey(i => i.InfoId);
            Property(i => i.InfoId).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            //标题
            Property(i => i.Title).HasMaxLength(500);

            //副标题
            Property(i => i.SubTitle).HasMaxLength(500);

            //来源
            Property(i => i.Source).HasMaxLength(100);

            //引用路径
            Property(i => i.ReferenceUrl).HasMaxLength(100);

            //摘要
            Property(i => i.Summary).HasMaxLength(1000);

            //作者
            Property(i => i.Author).HasMaxLength(100);

            //添加人
            Property(i => i.Adder).HasMaxLength(100);


            //信息类别  多对多关系 
            HasMany(i => i.NavigationList)
                .WithMany(n => n.InformationList)
                .Map(m =>
                {
                    m.ToTable("InformationFrontNavigationRela");
                    m.MapLeftKey("InfoId");
                    m.MapRightKey("NavId");
                });

            //关键字
            HasMany(i => i.KeyWords)
                .WithMany()
                .Map(m =>
                {
                    m.ToTable("InformationKeyWordRela");
                    m.MapLeftKey("InfoId");
                    m.MapRightKey("KeyWordId");
                }
                );

            //附件
            HasMany(i => i.Attachments)
                .WithRequired()
                .HasForeignKey(a => a.InformationId);
        }
    }
}
