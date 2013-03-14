using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WSI.Model.Entities;
using System.Data.Entity.ModelConfiguration;
using System.ComponentModel.DataAnnotations.Schema;

namespace WSI.DataAccess.FluentAPI
{
    public class LogConfiguration : EntityTypeConfiguration<Log>
    {
        public LogConfiguration()
        {
            //主键，自增
            HasKey(l => l.LogId);
            Property(l => l.LogId).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);
        }
    }
}
