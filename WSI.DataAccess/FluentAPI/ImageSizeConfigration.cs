using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;
using WSI.Model.Entities;
using System.Data.Entity.ModelConfiguration;
using System.ComponentModel.DataAnnotations.Schema;
namespace WSI.DataAccess.FluentAPI
{
    public class ImageSizeConfigration : EntityTypeConfiguration<ImageSize>
    {
        public ImageSizeConfigration()
        {
            //主键，自增
            HasKey(i => i.SizeId);
            Property(i => i.SizeId).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

        }
    }
}
