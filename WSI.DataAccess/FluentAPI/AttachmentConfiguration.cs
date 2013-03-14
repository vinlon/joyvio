using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
using WSI.Model.Entities;
using System.ComponentModel.DataAnnotations.Schema;


namespace WSI.DataAccess.FluentAPI
{
    public class AttachmentConfiguration : EntityTypeConfiguration<Attachment>
    {
        public AttachmentConfiguration()
        {
            //主键,GUID自增
            HasKey(a => a.AttachmentId);
            Property(a => a.AttachmentId).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            //路径
            Property(a => a.SourceUrl).HasMaxLength(100);
            //描述
            Property(t => t.Description).HasMaxLength(500);

            Map(m =>
            {
                m.ToTable("Attachment");
                m.Requires("AttachmentType").HasValue("Image");
            })
            .Map<Attachment_Media>(m =>
            {
                m.Requires("AttachmentType").HasValue("Media");
            });
        }
    }
}
