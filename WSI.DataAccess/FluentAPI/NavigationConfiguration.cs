using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
using WSI.Model.Entities;
using System.ComponentModel.DataAnnotations.Schema;


namespace WSI.DataAccess.FluentAPI
{
    public class NavigationConfiguration : EntityTypeConfiguration<Navigation>
    {
        public NavigationConfiguration()
        {
            //主键,GUID自增
            Property(n => n.NavigationId).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            //导航名称最大长度
            Property(n => n.NavigationName).HasMaxLength(100);

            //URL最大长度
            Property(n => n.Url).HasMaxLength(100);

            //权限描述
            Property(n => n.Description).HasMaxLength(500);

            //父导航
            HasOptional(n => n.Parent)
                .WithMany(n => n.Children)
                .HasForeignKey(n => n.ParentId);

        }
    }
}
