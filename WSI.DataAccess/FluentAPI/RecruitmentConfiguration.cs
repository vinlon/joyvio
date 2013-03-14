using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WSI.Model.Entities;
using System.Data.Entity.ModelConfiguration;
using System.ComponentModel.DataAnnotations.Schema;

namespace WSI.DataAccess.FluentAPI
{
    public class RecruitmentConfiguration : EntityTypeConfiguration<Recruitment>
    {
        public RecruitmentConfiguration()
        {
            //主键 Guid自增
            HasKey(r => r.RecruitId);
            Property(r => r.RecruitId).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);
        }
    }
}
