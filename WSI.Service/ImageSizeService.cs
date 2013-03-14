using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WSI.IService;
using Utility;
using WSI.Model.Entities;
using System.Data.Entity;
using System.Data;
namespace WSI.Service
{
    public class ImageSizeService : IImageSizeService
    {
        public ImageSizeService()
        {

        }

        #region 添加尺寸信息

        public bool AddSize(string sizeName, int width, int height, int thumb_width, int thumb_height, int cover_width, int cover_height, out IList<string> errors)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var entity = new ImageSize()
                {
                    SizeName = sizeName,
                    Width = width,
                    Height = height,
                    ThumbWidth = thumb_width,
                    ThumbHeight = thumb_height,
                    CoverWidth = cover_width,
                    CoverHeight = cover_height,
                    State = (int)EnumHelper.State.Enable,
                    CreateTime = DateTime.Now
                };

                var validate = context.Entry(entity).GetValidationResult();
                if (!validate.IsValid)
                {
                    errors = validate.ValidationErrors.Select(e => e.ErrorMessage).ToList();
                    return false;
                }
                context.ImageSizes.Add(entity);

                context.LogChangesDuringSave = true;
                context.SaveChanges();

                errors = null;
                return true;
            }
        }

        #endregion

        #region 查询列表

        public IList<ImageSize> GetList()
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                return context.ImageSizes.ToList();
            }
        }

        #endregion

        #region 查询可用列表

        public IList<ImageSize> GetActiveList()
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                return context.ImageSizes
                    .Where(i => i.State == (int)EnumHelper.State.Enable)
                    .ToList();
            }
        }

        #endregion

        #region 查询明细

        public ImageSize GetDetail(string sid)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                Guid id;
                if (Guid.TryParse(sid, out id))
                {
                    return context.ImageSizes.Find(id);
                }
                return null;
            }
        }

        #endregion

        #region 更新尺寸信息

        public bool UpdateSize(string sizeid, string sizeName, int width, int height, int thumb_width, int thumb_height, int cover_width, int cover_height, out IList<string> errors)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var entity = GetDetail(sizeid);
                context.ImageSizes.Attach(entity);

                entity.SizeName = sizeName;
                entity.Width = width;
                entity.Height = height;
                entity.ThumbWidth = thumb_width;
                entity.ThumbHeight = thumb_height;
                entity.CoverWidth = cover_width;
                entity.CoverHeight = cover_height;

                var validate = context.Entry(entity).GetValidationResult();
                if (validate.IsValid)
                {
                    context.LogChangesDuringSave = true;
                    context.SaveChanges();
                    errors = null;
                    return true;
                }
                else
                {
                    errors = validate.ValidationErrors.Select(e => e.ErrorMessage).ToList();
                    return false;
                }
            }
        }

        #endregion

        #region 修改状态

        public int ChangeState(ImageSize item, int state)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                context.ImageSizes.Attach(item);
                item.State = state;

                context.LogChangesDuringSave = true;
                return context.SaveChanges();
            }
        }

        #endregion

        #region 删除

        public int Delete(string id)
        {
            using (var context = new WSI.DataAccess.WSICmsContext())
            {
                var item = GetDetail(id);
                if (item != null)
                {
                    context.Entry(item).State = EntityState.Deleted;
                }

                context.LogChangesDuringSave = true;
                return context.SaveChanges();
            }
        }

        #endregion



    }
}
