using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace Utility
{
    public static class CommonHelper
    {
        /// <summary>
        /// 存储用户信息的Session的key
        /// </summary>
        public static readonly string SESSION_KEY_USERINFO = "UserInfo";

        public static readonly string NAVIGATION_COOKBOOK_ID = "c5d0c6c3-ae3a-49d4-a232-d553aaa5ca4f";
        public static readonly string NAVIGATION_FOODTREND_ID = "b0630143-a364-4ef2-8327-baee18fbe79b";
        public static readonly string NAVIGATION_FOODHEALTHY_ID = "ad102cc1-4c1f-4a13-acff-3cbd5e23ba11";

        /// <summary>
        /// 获取客户端真实IP(绕过代理)
        /// </summary>
        /// <returns></returns>
        public static string GetClientIP()
        {
            try
            {
                string result = String.Empty;
                result = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                if (result != null && result != String.Empty)
                {
                    //可能有代理
                    if (result.IndexOf(".") == -1)    //没有“.”肯定是非IPv4格式
                        result = null;
                    else
                    {
                        if (result.IndexOf(",") != -1)
                        {
                            //有“,”，估计多个代理。取第一个不是内网的IP。
                            result = result.Replace(" ", "").Replace("'", "");
                            string[] temparyip = result.Split(",;".ToCharArray());
                            for (int i = 0; i < temparyip.Length; i++)
                            {
                                if (temparyip[i].Substring(0, 3) != "10."
                                    && temparyip[i].Substring(0, 7) != "192.168"
                                    && temparyip[i].Substring(0, 7) != "172.16.")
                                {
                                    return temparyip[i];    //找到不是内网的地址
                                }
                            }
                        }
                        else  //代理即是IP格式 ,IsIPAddress判断是否是IP的方法,
                            return result;
                    }

                }

                string IpAddress = (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null && HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != String.Empty) ? HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] : HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];

                if (null == result || result == String.Empty)
                    result = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];

                if (result == null || result == String.Empty)
                    result = HttpContext.Current.Request.UserHostAddress;

                return result;
                /* 
                引用地址：http://www.cnblogs.com/guanjie20/archive/2011/04/21/2023853.html
                */
            }
            catch
            {
                return string.Empty;
            }
        }
    }
}
