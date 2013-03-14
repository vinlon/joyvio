using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace WSI.Model.Entities
{
    public class ImageSize : IValidatableObject
    {
        /// <summary>
        /// 编号
        /// </summary>
        public Guid SizeId { get; set; }

        /// <summary>
        /// 尺寸名称
        /// </summary>
        [Required(ErrorMessage = "尺寸名称不能为空")]
        public String SizeName { get; set; }

        /// <summary>
        /// 宽
        /// </summary>
        [Range(16, 2000, ErrorMessage = "显示图的宽必须在16到2000像素之间")]
        public int Width { get; set; }
        /// <summary>
        /// 高
        /// </summary>
        [Range(16, 2000, ErrorMessage = "显示图的高必须在16到2000像素之间")]
        public int Height { get; set; }

        /// <summary>
        /// 缩略图_宽
        /// </summary>
        public int ThumbWidth { get; set; }
        /// <summary>
        /// 缩略图_高
        /// </summary>
        public int ThumbHeight { get; set; }

        /// <summary>
        /// 封面图_宽
        /// </summary>
        public int CoverWidth { get; set; }
        /// <summary>
        /// 封面图_高
        /// </summary>
        public int CoverHeight { get; set; }

        /// <summary>
        /// 状态
        /// </summary>
        public int State { get; set; }

        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime CreateTime { get; set; }


        //验证信息
        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            //同一组数据只能都为0或都不为0
            if ((Width * Height == 0 && Width != Height) ||
                (ThumbWidth * ThumbHeight == 0 && ThumbWidth != ThumbHeight) ||
                (CoverHeight * CoverWidth == 0 && CoverHeight != CoverWidth))
            {
                yield return new ValidationResult("同一组的尺寸要么都为0，要么都不为0");
            }
        }
    }
}
