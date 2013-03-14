using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
using WSI.Model.Entities;
using System.ComponentModel.DataAnnotations.Schema;


namespace WSI.DataAccess.FluentAPI
{
    public class UserProfileConfiguration : EntityTypeConfiguration<UserProfile>
    {
        public UserProfileConfiguration()
        {
            //主键,GUID自增
            Property(u => u.UserProfileId).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);
        }
    }
}
