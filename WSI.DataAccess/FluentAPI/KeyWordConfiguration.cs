using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
using WSI.Model.Entities;
using System.ComponentModel.DataAnnotations.Schema;


namespace WSI.DataAccess.FluentAPI
{
    public class KeyWordConfiguration : EntityTypeConfiguration<KeyWord>
    {
        public KeyWordConfiguration()
        {
            //主键,GUID自增
            HasKey(k=>k.KeyWordId);
            Property(k=>k.KeyWordId).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            //名称
            Property(k=>k.Content).HasMaxLength(50);
        }
    }
}
