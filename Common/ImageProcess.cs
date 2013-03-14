using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Drawing;
namespace Utility
{
    public static class ImageProcess
    {
        /// <summary>
        /// 删除图片
        /// </summary>
        /// <param name="imgpath"></param>
        public static void DeleteImage(string imgpath)
        {
            if (File.Exists(imgpath))
            {
                File.Delete(imgpath);
            }
        }

        /// <summary>
        /// 将图片转为合适的尺寸
        /// </summary>
        /// <param name="imgpath">图片路径</param>
        /// <param name="properwidth">目标宽度</param>
        /// <param name="properheight">目标高度</param>
        /// <param name="destpath">目标图片的存储路径</param>
        /// <returns></returns>
        public static void ImageToProperSize(string imgpath, int properwidth, int properheight, string destpath)
        {
            System.Drawing.Image img = null;

            if (!File.Exists(imgpath))
            {
                throw new FileNotFoundException("未找到源图片");
            }
            else
            {
                img = System.Drawing.Image.FromFile(imgpath);
                ImageToProperSize(img, properwidth, properheight, destpath);
            }
        }

        public static void ImageToProperSize(Image img, int properwidth, int properheight, string destpath)
        {
            System.Drawing.Image processed = null;
            try
            {
                if (img != null)
                {
                    //检查目录
                    string dir = Path.GetDirectoryName(destpath);
                    if (!Directory.Exists(dir))
                    {
                        Directory.CreateDirectory(dir);
                    }

                    if (img.Width == properwidth && img.Height == properheight)
                    {
                        img.Save(destpath);
                    }
                    else
                    {
                        Process(img, properwidth, properheight, ref processed);
                        //保存图片
                        processed.Save(destpath);
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (img != null)
                {
                    img.Dispose();
                }
                if (processed != null)
                {
                    processed.Dispose();
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="cutImage">源文件路径</param>
        /// <param name="x">目标图片相对于原图片的x坐标</param>
        /// <param name="y">目标图片相对于原图片的y坐标</param>
        /// <param name="width">宽度</param>
        /// <param name="height">高度</param>
        /// <param name="destPath">目标图片保存路径</param>
        public static void CutImage(string imgpath, int x, int y, int width, int height, string destPath)
        {
            Image img = null;
            try
            {
                //检查源文件
                if (!File.Exists(imgpath))
                {
                    throw new FileNotFoundException("源图片不存在");
                }

                //检查目标路径
                string dir = Path.GetDirectoryName(destPath);
                if (!Directory.Exists(dir))
                {
                    Directory.CreateDirectory(dir);
                }

                img = Image.FromFile(imgpath);

                Rectangle srcRec = new Rectangle(x, y, width, height);
                Rectangle destRec = new Rectangle(0, 0, width, height);

                DrawImage(img, width, height, srcRec, destRec).Save(destPath);
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (img != null)
                {
                    img.Dispose();
                }
            }


        }





        //处理图片(按长宽比例)
        private static void Process(System.Drawing.Image img, int width, int height, ref System.Drawing.Image dest)
        {
            try
            {
                //返回要在画布中画出的图的矩形位置(占满整个画布)
                Rectangle destRec = new Rectangle(0, 0, width, height);
                //要画到画布中的原图的矩形位置（默认整个图片）



                int destx = 0;
                int desty = 0;
                int destwidth = width;
                int destheight = height;
                //整体小于目标图,将图放在中央，实际返回的尺寸为目标图的尺寸
                if (img.Width < width && img.Height < height)
                {
                    //标准画布

                    //图形位于画布中央
                    destx = (width - img.Width) / 2;
                    desty = (height - img.Height) / 2;
                    destwidth = img.Width;
                    destheight = img.Height;
                }
                else
                {//宽所占比例较大
                    if ((double)img.Width / (double)img.Height >= (double)width / (double)height)
                    {
                        //同上
                        destheight = img.Height * width / img.Width;
                        desty = (height - destheight) / 2;

                    }
                    //高所占比例较大
                    else
                    {
                        //超出标准的一边缩小到标准
                        //小于标准的一边按比例缩小后再计算位置
                        destwidth = img.Width * height / img.Height;
                        destx = (width - destwidth) / 2;
                    }
                }
                destRec = new Rectangle(destx, desty, destwidth, destheight);//画布左上角坐标为（0，0），矩形位置在画布中间

                //画布符合标准（width,height）
                dest = DrawImage(img, width, height, new Rectangle(0, 0, img.Width, img.Height), destRec);
            }
            catch (Exception)
            {
                throw;
            }

        }

        //绘图
        private static System.Drawing.Image DrawImage(System.Drawing.Image img, int destwidth, int destheight, Rectangle srcRec, Rectangle destRec)
        {
            Bitmap bitmap = new Bitmap(destwidth, destheight);
            using (Graphics gps = Graphics.FromImage(bitmap))//读取画布到绘图对象
            {
                gps.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality;
                gps.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                gps.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
                gps.Clear(System.Drawing.Color.Transparent);
                gps.DrawImage(img, destRec, srcRec, GraphicsUnit.Pixel);
            }
            return bitmap;
            //不能释放bitmap资源，否则得到的结果将消失
        }


        //加水印
        //加文字水印

        public static void AddTextWaterMark(string imgPath, int destX, int dextY, string text, string destPath)
        {
            System.Drawing.Image image = System.Drawing.Image.FromFile(HttpContext.Current.Server.MapPath(imgPath));
            Graphics g = Graphics.FromImage(image);
            g.DrawImage(image, 0, 0, image.Width, image.Height);
            Font font = new Font("Verdana", 32);
            Brush brush = new SolidBrush(Color.White);
            g.DrawString(text, font, brush, destX, destX);
            g.Dispose();

            image.Save(HttpContext.Current.Server.MapPath(destPath));
        }


        //加图片水印
        public static void AddImageWaterMark(string imgPath, int destX, int destY, Image imgMark, string destPath)
        {
            System.Drawing.Image image = System.Drawing.Image.FromFile(HttpContext.Current.Server.MapPath(imgPath));
            Graphics g = Graphics.FromImage(image);
            g.DrawImage(imgMark, new Rectangle(image.Width - imgMark.Width, image.Height - imgMark.Height, imgMark.Width, imgMark.Height), 0, 0, imgMark.Width, imgMark.Height, GraphicsUnit.Pixel);
            g.Dispose();
            image.Save(HttpContext.Current.Server.MapPath(destPath));
        }



    }
}
