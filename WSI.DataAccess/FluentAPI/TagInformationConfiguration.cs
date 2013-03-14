using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
using WSI.Model.Entities;
using System.ComponentModel.DataAnnotations.Schema;


namespace WSI.DataAccess.FluentAPI
{
    public class TagInformationConfiguration : EntityTypeConfiguration<TagInformation>
    {
        public TagInformationConfiguration()
        {
            //主键,GUID自增
            HasKey(r => r.RelaId);
            Property(r => r.RelaId).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            //Information(一对多的关系，每条信息可能对应多个关联)
            HasRequired(r => r.Information)
                .WithMany()
                .HasForeignKey(r => r.InfoId)
                .WillCascadeOnDelete();

        }
    }
}
