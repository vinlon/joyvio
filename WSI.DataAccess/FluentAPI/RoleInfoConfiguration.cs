using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
using WSI.Model.Entities;
using System.ComponentModel.DataAnnotations.Schema;

namespace WSI.DataAccess.FluentAPI
{
    public class RoleInfoConfiguration : EntityTypeConfiguration<RoleInfo>
    {
        public RoleInfoConfiguration()
        {
            //GUID主键 自增
            Property(r => r.RoleInfoId).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            //角色名称
            Property(r => r.RoleName).HasMaxLength(100);

            //描述
            Property(r => r.Description).HasMaxLength(500);

            //权限
            HasMany(r => r.Navigations)
                .WithMany()
                .Map(m =>
                {
                    m.ToTable("RoleInfoNavigationRela");
                    m.MapLeftKey("RoleId");
                    m.MapRightKey("NavId");
                });
        }
    }
}
