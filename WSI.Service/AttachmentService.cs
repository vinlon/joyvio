using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WSI.IService;
using WSI.Model.Entities;
namespace WSI.Service
{
    public class AttachmentService : IAttachmentService
    {
        public AttachmentService()
        {

        }

        #region 查询附件明细

        public Attachment GetDetail(string attachId)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Guid id;
                if (Guid.TryParse(attachId, out id))
                {
                    return context.Attachments.Find(id);
                }
                return null;
            }
        }

        #endregion

        #region 更新附件信息

        public void UpdateAttach(string attachId, string description, int sortIndex)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var attach = GetDetail(attachId);
                if (attach != null)
                {
                    context.Attachments.Attach(attach);
                    attach.Description = description;
                    attach.SortIndex = sortIndex;

                    context.LogChangesDuringSave = true;
                    context.SaveChanges();
                }
            }
        }

        #endregion

        #region 修改附件状态

        public int ChangeState(Attachment attach, int state)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                context.Attachments.Attach(attach);
                attach.State = state;

                context.LogChangesDuringSave = true;
                return context.SaveChanges();
            }
        }

        #endregion

        #region 删除附件

        public int Delete(string id)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var item = GetDetail(id);
                if (item != null)
                {
                    context.Attachments.Attach(item);

                    var info = context.Informations.Find(item.InformationId);
                    //先将该附件从信息中移除
                    info.Attachments.Remove(item);
                    context.Attachments.Remove(item);
                }

                context.LogChangesDuringSave = true;
                return context.SaveChanges();
            }
        }

        #endregion


    }
}
