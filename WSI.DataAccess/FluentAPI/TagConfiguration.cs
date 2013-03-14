using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
using WSI.Model.Entities;
using System.ComponentModel.DataAnnotations.Schema;


namespace WSI.DataAccess.FluentAPI
{
    public class TagConfiguration : EntityTypeConfiguration<Tag>
    {
        public TagConfiguration()
        {
            //主键,GUID自增
            HasKey(t => t.TagId);
            Property(t => t.TagId).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            //名称
            Property(t => t.TagName).HasMaxLength(100);

            //编码Code
            Property(t => t.TagCode).HasMaxLength(20);

            //描述
            Property(t => t.Description).HasMaxLength(500);

            //父标签
            HasOptional(t => t.Parent)
                .WithMany()
                .HasForeignKey(t => t.ParentId);

            //信息关联列表
            HasMany(t => t.TagInformations)
                .WithRequired()
                .HasForeignKey(t => t.TagId);
        }
    }
}
