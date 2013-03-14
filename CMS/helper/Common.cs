using System.Collections.Generic;
using System.Linq;
using System.Web;
using WSI.IService;
using WSI.Model.Entities;
using WSI.ServiceLocator;
namespace CMS
{
    public class Common
    {
        #region 用户验证相关

        #region 用户验证信息

        /// <summary>
        /// 已登录的用户信息
        /// </summary>
        public static UserInfo VerifiedUser
        {
            get
            {
                if (HttpContext.Current.Session != null && HttpContext.Current.Session[SESSION_KEY_USERINFO] != null)
                {
                    return HttpContext.Current.Session[SESSION_KEY_USERINFO] as UserInfo;
                }
                else
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// 用户是否已登录
        /// </summary>
        public static bool IsVerified
        {
            get
            {
                return VerifiedUser != null;
            }
        }

        #endregion

        #region 角色权限信息

        public static bool IsSystemManager
        {
            get
            {
                if (VerifiedUser != null)
                {
                    return VerifiedUser.RoleList.Where(r => r.RoleType == (int)RoleType.SystemManager).Count() > 0;
                }
                return false;
            }
        }

        public static IList<Navigation> VerifiedNavigationList
        {
            get
            {
                IList<Navigation> navList = new List<Navigation>();
                if (VerifiedUser != null)
                {
                    //如果用户是系统管理员
                    if (IsSystemManager)
                    {
                        INavigationService service = ServiceLocator.Instance.GetService<INavigationService>();
                        navList = service.GetActiveList();
                    }
                    else
                    {
                        //新建一个自定义比较器
                        var comparer = new Utility.CommonEqualityComparer<Navigation>((x, y) => x.NavigationId == y.NavigationId, x => x.NavigationId.GetHashCode());


                        //站点管理员直接拥有自己的权限
                        foreach (var roleid in VerifiedUser.RoleList.Select(r => r.RoleInfoId))
                        {
                            IRoleInfoService service = ServiceLocator.Instance.GetService<IRoleInfoService>();
                            var role = service.GetDetailIncludeAll(roleid.ToString());

                            if (role != null && role.Navigations != null)
                            {
                                if (role.RoleType < (int)RoleType.SiteManager)
                                {
                                    //如果不是站点管理员，则取当前权限与站点管理角色员权限的交集
                                    navList = navList.Concat(role.Navigations.Intersect(service.SiteManager.Navigations, comparer)).ToList();
                                }
                                else
                                {
                                    navList = navList.Concat(role.Navigations).ToList();
                                }
                            }
                        }
                        //去重复
                        navList = navList.Distinct(comparer).ToList();

                    }

                }
                return navList;
            }
        }

        #endregion

        #endregion

        #region 页面相关

        /// <summary>
        /// 返回地址
        /// </summary>
        public static string BackUrl { get; set; }

        #endregion

        #region 静态字段

        public static string SITE_URL = System.Configuration.ConfigurationManager.AppSettings["joyvio_site"];

        public static string NEWS_PREVIEW_PAGE = System.Configuration.ConfigurationManager.AppSettings["news_detail"];

        /// <summary>
        /// 后台登录页
        /// </summary>
        public static readonly string URL_LOGIN = "/Login.aspx";

        /// <summary>
        /// 后台首页
        /// </summary>
        public static readonly string FRAME_INDEX = "/index.html";

        /// <summary>
        /// 后台默认页
        /// </summary>
        public static readonly string URL_DEFAULT = "/Default.aspx";

        /// <summary>
        /// 后台登出页
        /// </summary>
        public static readonly string URL_LOGOUT = "/Logout.aspx";

        /// <summary>
        /// 显示无权限访问的handler
        /// </summary>
        public static readonly string URL_ASHX_ERROR = "/error/error.ashx";


        /// <summary>
        /// 存储用户信息的Session的key
        /// </summary>
        public static readonly string SESSION_KEY_USERINFO = Utility.CommonHelper.SESSION_KEY_USERINFO;

        /// <summary>
        /// 存储验证码的SessionKey
        /// </summary>
        public static readonly string SESSION_KEY_VERIFYCODE = "IdentifyCode";

        /// <summary>
        /// Request中Session的参数名
        /// </summary>
        public static string SESSION_PARAM_NAME = "ASPSESSID";

        /// <summary>
        /// 存储Session的Cookie名称
        /// </summary>
        public static string SESSION_COOKIE_NAME = "ASP.NET_SessionId";


        /// <summary>
        /// 短时间格式（不包括时分秒）
        /// </summary>
        public static readonly string DATETIME_FORMAT_SHORT = "yyyy-MM-dd";

        /// <summary>
        /// 长时间格式（包括时分秒）
        /// </summary>
        public static readonly string DATETIME_FORMAT_FULL = "yyyy-MM-dd HH:mm:ss";

        /// <summary>
        /// 时间转化为长字符串的格式（带毫秒）
        /// </summary>
        public static readonly string DATETIME_FORMAT_STRING = "yyyyMMddHHmmssffff";

        #endregion

        #region 退出登录

        public static void LogOut()
        {
            HttpContext.Current.Session[SESSION_KEY_USERINFO] = null;
        }

        #endregion


    }
}