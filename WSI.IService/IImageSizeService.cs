using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WSI.Model.Entities;

namespace WSI.IService
{
    public interface IImageSizeService
    {

        #region 添加

        /// <summary>
        /// 添加图片尺寸
        /// </summary>
        /// <param name="sizeName"></param>
        /// <param name="width"></param>
        /// <param name="height"></param>
        /// <param name="thumb_width"></param>
        /// <param name="thumb_height"></param>
        /// <param name="cover_width"></param>
        /// <param name="cover_height"></param>
        bool AddSize(string sizeName, int width, int height, int thumb_width, int thumb_height, int cover_width, int cover_height, out IList<String> errors);

        #endregion

        #region 查询

        /// <summary>
        /// 根据编号查询详细数据
        /// </summary>
        /// <param name="sid"></param>
        /// <returns></returns>
        ImageSize GetDetail(string sid);

        /// <summary>
        /// 查询全部列表
        /// </summary>
        /// <returns></returns>
        IList<ImageSize> GetList();

        /// <summary>
        /// 查询可用列表
        /// </summary>
        /// <returns></returns>
        IList<ImageSize> GetActiveList();
        #endregion

        #region 更新

        /// <summary>
        /// 修改尺寸信息
        /// </summary>
        /// <param name="sizeid"></param>
        /// <param name="width"></param>
        /// <param name="height"></param>
        /// <param name="thumb_width"></param>
        /// <param name="thumb_height"></param>
        /// <param name="cover_width"></param>
        /// <param name="cover_height"></param>
        /// <param name="errors"></param>
        /// <returns></returns>
        bool UpdateSize(string sizeid, string sizeName, int width, int height, int thumb_width, int thumb_height, int cover_width, int cover_height, out IList<string> errors);

        /// <summary>
        /// 修改状态
        /// </summary>
        /// <param name="item"></param>
        /// <param name="state"></param>
        /// <returns></returns>
        int ChangeState(ImageSize item, int state);
        #endregion

        #region 删除

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        int Delete(string id);

        #endregion
    }
}
