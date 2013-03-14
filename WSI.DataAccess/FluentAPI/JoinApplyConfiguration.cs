using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WSI.Model.Entities;
using System.Data.Entity.ModelConfiguration;
using System.ComponentModel.DataAnnotations.Schema;

namespace WSI.DataAccess.FluentAPI
{
    public class JoinApplyConfiguration : EntityTypeConfiguration<JoinApply>
    {
        public JoinApplyConfiguration()
        {
            //主键 自增
            HasKey(j => j.ApplyId);
            Property(j => j.ApplyId).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

        }
    }
}
