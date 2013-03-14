using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WSI.Model.Entities;

namespace WSI.IService
{
    public interface IAttachmentService
    {
        #region 查询

        /// <summary>
        /// 根据编号查询明细
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        Attachment GetDetail(string attachId);

        #endregion

        #region 更新

        /// <summary>
        /// 更新附件信息，更新图片需要删除后重新上传
        /// </summary>
        /// <param name="attachId"></param>
        /// <param name="description"></param>
        /// <param name="sortIndex"></param>
        void UpdateAttach(string attachId, string description, int sortIndex);

        /// <summary>
        /// 修改状态
        /// </summary>
        /// <param name="item"></param>
        /// <param name="state"></param>
        /// <returns></returns>
        int ChangeState(Attachment item, int state);

        #endregion

        #region 删除
        int Delete(string id);
        #endregion


    }
}
