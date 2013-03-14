using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
using WSI.Model.Entities;
using System.ComponentModel.DataAnnotations.Schema;


namespace WSI.DataAccess.FluentAPI
{
    public class UserInfoConfiguration : EntityTypeConfiguration<UserInfo>
    {
        public UserInfoConfiguration()
        {
            //主键,GUID自增
            Property(u => u.UserInfoId).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            //用户名 必填，最大长度100
            Property(u => u.UserName).HasMaxLength(100).IsRequired();

            //密码 必填， 最大长度64
            Property(u => u.UserPassword).HasMaxLength(64).IsRequired();

            //个人信息 一对一，且UserProfile不一定存在
            HasOptional(u => u.Profile)
                .WithRequired(p => p.User)
                .Map(m => m.MapKey("UserInfoId"));

            //自定义用户与角色的的内联关系表
            HasMany(u => u.RoleList)
                .WithMany(r => r.UserList)
                .Map(c =>
                {
                    c.ToTable("UserRoleRela");
                    c.MapLeftKey("UserInfoID");
                    c.MapRightKey("RoleInfoID");
                });
        }
    }
}
