using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Utility
{
    public class EnumHelper
    {
        public enum State
        {
            Disable = 0,
            Enable = 1
        }


        #region #Method#获取枚举类型的键值对

        /// <summary>
        /// 获取枚举类型的键值对
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static IList<ReadEnum> GetEnumList<T>()
        {
            Type type = typeof(T);
            IList<ReadEnum> list = new List<ReadEnum>();
            foreach (int value in Enum.GetValues(type))
            {
                string name = Enum.GetName(type, value);
                string description = GetEnumDesc(type, value);
                list.Add(new ReadEnum(name, value, description));
            }
            return list;
        }
        #endregion

        #region #Method#获得Enum类型description
        /// <summary>
        /// 获得Enum类型description
        /// 创建人：Porschev
        /// 创建时间：2011-7-19
        /// </summary>
        /// <param name="enumType">枚举的类型</param>
        /// <param name="val">枚举值</param>
        /// <returns>string</returns>
        public static string GetEnumDesc(Type enumType, object val)
        {
            string enumvalue = System.Enum.GetName(enumType, val);
            if (string.IsNullOrEmpty(enumvalue))
            {
                return "";
            }
            System.Reflection.FieldInfo finfo = enumType.GetField(enumvalue);
            object[] enumAttr = finfo.GetCustomAttributes(typeof(System.ComponentModel.DescriptionAttribute), true);
            if (enumAttr.Length > 0)
            {
                System.ComponentModel.DescriptionAttribute desc = enumAttr[0] as System.ComponentModel.DescriptionAttribute;
                if (desc != null)
                {
                    return desc.Description;
                }
            }
            return enumvalue;
        }
        #endregion
    }






    public class ReadEnum
    {
        public ReadEnum(string name, int value, string description)
        {
            this.name = name;
            this.value = value;
            this.description = description;
        }

        private string name;

        public string Name
        {
            get { return name; }
        }
        private int value;

        public int Value
        {
            get { return this.value; }
        }
        private string description;

        public string Description
        {
            get { return description; }
        }
    }

}
