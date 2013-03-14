using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Script.Serialization;
using System.Text.RegularExpressions;

namespace Utility
{
    public static class ExtentionMethod
    {
        #region 枚举

        public static string GetDescription(this Enum myEnum, int value)
        {
            Type enumType = myEnum.GetType();
            string enumName = Enum.GetName(enumType, value);
            if (string.IsNullOrEmpty(enumName))
            {
                return "";
            }
            System.Reflection.FieldInfo finfo = enumType.GetField(enumName);
            object[] enumAttr = finfo.GetCustomAttributes(typeof(System.ComponentModel.DescriptionAttribute), true);
            if (enumAttr.Length > 0)
            {
                System.ComponentModel.DescriptionAttribute desc = enumAttr[0] as System.ComponentModel.DescriptionAttribute;
                if (desc != null)
                {
                    return desc.Description;
                }
            }
            return enumName;
        }


        #endregion


        #region String

        /// <summary>
        /// MD5加密
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static string EncryptMD5(this string str)
        {
            return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(str, "MD5").ToLower();
        }

        /// <summary>
        /// 截取固定长度的字符
        /// </summary>
        /// <param name="str"></param>
        /// <param name="length"></param>
        /// <param name="ext"></param>
        /// <returns></returns>
        public static string SubStr(this string str, int length, string ext)
        {
            if (str.Length <= length)
            {
                return str;
            }
            else
            {
                return str.Substring(0, length) + ext;
            }
        }


        #endregion



        #region 泛型方法

        /// <summary>
        /// 转换成Json格式
        /// 并将时间改为字符串形式(yyyy-MM-dd HH:mm:ss)
        /// </summary>
        /// <param name="m"></param>
        /// <returns></returns>
        public static string ToJson<T>(this T m) where T : class,new()
        {
            JavaScriptSerializer js = new JavaScriptSerializer();
            string str = js.Serialize(m);
            str = Regex.Replace(str, @"\\/Date\((\d+)\)\\/", match =>
            {
                DateTime dt = new DateTime(1970, 1, 1);
                dt = dt.AddMilliseconds(long.Parse(match.Groups[1].Value));
                dt = dt.ToLocalTime();
                return dt.ToString("yyyy-MM-dd HH:mm:ss");
            });
            return str;
        }

        /// <summary>
        /// 将Json字符串转化为对象
        /// </summary>
        /// <typeparam name="TObject"></typeparam>
        /// <param name="json"></param>
        /// <returns></returns>
        public static TObject ToObject<TObject>(this string json)
        {
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                TObject obj = js.Deserialize<TObject>(json);

                return obj;
            }
            catch (Exception)
            {
                return default(TObject);
            }
        }


        /// <summary>
        /// 获取有可能为空的对象的字段的值
        /// </summary>
        /// <typeparam name="TClass"></typeparam>
        /// <typeparam name="TResult"></typeparam>
        /// <param name="obj"></param>
        /// <param name="func"></param>
        /// <param name="defaultvalue"></param>
        /// <returns></returns>
        public static TResult GetPropertyOrDefault<TClass, TResult>(this TClass obj, Func<TClass, TResult> func, TResult defaultvalue = default(TResult)) where TClass : class
        {
            if (obj == null)
            {
                return defaultvalue;
            }
            else
            {
                return func(obj);
            }
        }


        #endregion
    }
}
