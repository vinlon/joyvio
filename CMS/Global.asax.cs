using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Data.Entity;
using WSI.IService;
using WSI.ServiceLocator;

namespace CMS
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            //在此方法中无法访问Session
            //所以将权限验证放在了Application_PreRequestHandlerExecute中

            //解决flash中传递请求Session丢失的问题
            //重置session
            ResetSession();
        }
        #region ResetSession() 解决flash中传递请求Session丢失的问题
        //重新设置Session
        private void ResetSession()
        {
            if (HttpContext.Current.Request.Params[Common.SESSION_PARAM_NAME] != null)
            {
                UpdateCookie(Common.SESSION_COOKIE_NAME, HttpContext.Current.Request.Params[Common.SESSION_PARAM_NAME]);
            }
        }
        private void UpdateCookie(string cookie_name, string cookie_value)
        {
            HttpCookie cookie = HttpContext.Current.Request.Cookies.Get(cookie_name);
            if (null == cookie)
            {
                cookie = new HttpCookie(cookie_name);
            }
            cookie.Value = cookie_value;
            HttpContext.Current.Request.Cookies.Set(cookie);//重新设定请求中的cookie值，将服务器端的session值赋值给它
        }

        #endregion

        //请求开始时执行权限判断
        protected void Application_PreRequestHandlerExecute(object sender, EventArgs e)
        {

#if true
            string url = Request.Path.ToLower();
            if (Common.IsSystemManager)
            {
                return;
            }
            string url_ext = Request.CurrentExecutionFilePathExtension.ToLower();

            //绕过error文件夹
            if (url.StartsWith("/error/"))
            {
                return;
            }

            string[] exts = { ".aspx", ".ashx" };//要执行判断的地址类型
            //检查地址类型
            if (!exts.Contains(url_ext))
            {
                return;
            }

            //需要绕过判断的页面 
            string[] bypass = { "/head.aspx", "/default.aspx", "/index.html", "/login.aspx", "/logout.aspx", "/menu.aspx", "/handler/validateimage.ashx" };

            if (bypass.Contains(url))
            {
                return;
            }

            //添加到权限列表的页面才需要接受访问和权限判断
            INavigationService navService = ServiceLocator.Instance.GetService<INavigationService>();

            //已添加到权限中的页面
            IList<string> add_in_pages = navService.GetActiveList().Select(n => n.Url).ToList();

            //添加到权限控制但没有分配给当前用户的权限
            IList<string> not_allowed = add_in_pages.Except(Common.VerifiedNavigationList.Select(n => n.Url)).ToList();

            if (not_allowed.Where(p => p.ToLower() == url).Count() != 0)
            {
                string message = "权限不足!";
                if (url_ext == ".aspx")
                {
                    Response.Write(string.Format("<script>alert('{0}');window.location.href='{1}';</script>", message, Common.URL_DEFAULT));
                }
                else if (url_ext == ".ashx")
                {
                    Response.Redirect(string.Format("{0}?error={1}", Common.URL_ASHX_ERROR, message));
                }
                return;
            }

#endif
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}