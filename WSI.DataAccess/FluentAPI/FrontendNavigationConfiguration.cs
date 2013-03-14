using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
using WSI.Model.Entities;
using System.ComponentModel.DataAnnotations.Schema;


namespace WSI.DataAccess.FluentAPI
{
    public class FrontendNavigationConfiguration : EntityTypeConfiguration<FrontendNavigation>
    {
        public FrontendNavigationConfiguration()
        {
            //主键,GUID自增
            HasKey(n => n.NavId);
            Property(n => n.NavId).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            //名称
            Property(n => n.NavName).HasMaxLength(100);

            //URL
            Property(n => n.Url).HasMaxLength(100);

            //描述
            Property(n => n.Description).HasMaxLength(500);

            //父导航
            HasOptional(n => n.Parent)
                .WithMany(n=>n.Childrens)
                .HasForeignKey(n => n.ParentId);

        }
    }
}
