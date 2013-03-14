using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WSI.Model.Entities;
using System.Data.Entity.ModelConfiguration;
using System.ComponentModel.DataAnnotations.Schema;

namespace WSI.DataAccess.FluentAPI
{
    public class CookBookConfiguration : EntityTypeConfiguration<CookBook>
    {
        public CookBookConfiguration()
        {
            //主键，自增
            HasKey(c => c.CookBookId);
            Property(c => c.CookBookId).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            //栏目
            HasRequired(c => c.Navigation)
                .WithMany()
                .HasForeignKey(c => c.NavigationId);
        }
    }
}
