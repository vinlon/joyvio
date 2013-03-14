using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CMS
{
    public class BackendPageBase : System.Web.UI.Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            //登录验证
            if (!Common.IsVerified)
            {
                Response.Redirect(Common.URL_LOGIN);
            }
        }



        #region JavaScript相关

        /// <summary>
        /// JS弹框
        /// 创建人：Amos Wnn
        /// 创建时间：2011-10-14
        /// </summary>
        /// <param name="page"></param>
        /// <param name="context"></param>
        public void Alert(string alertContext)
        {
            this.RunScript(alertContext, null, null);
        }

        /// <summary>
        /// JS弹框并跳转
        /// 创建人：Amos Wnn
        /// 创建时间：2011-10-14
        /// </summary>
        /// <param name="page"></param>
        /// <param name="context"></param>
        public void AlertGo(string alertContext, string url)
        {
            this.RunScript(alertContext, url, null);
        }

        //关闭当前页并刷新父页面
        public void RefreshFrame(string url)
        {
            string js = @"parent.document.location.href='" + url + "'";
            this.RunScript("", "", js);
        }
        /// <summary>
        /// JS弹框并跳转追加其他js
        /// 创建人：Amos Wnn
        /// 创建时间：2011-10-14
        /// </summary>
        /// <param name="page"></param>
        /// <param name="context"></param>
        /// <param name="url"></param>
        private void RunScript(string alertContext, string url, string otherScripts)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            if (!string.IsNullOrEmpty(alertContext))
            {
                sb.AppendFormat("alert(\"{0}\");", alertContext);
            }

            if (!string.IsNullOrEmpty(url))
            {
                sb.AppendFormat("location.href=\"{0}\";", url);
            }

            if (!string.IsNullOrEmpty(otherScripts))
            {
                sb.AppendFormat("{0};", otherScripts);
            }

            Page.ClientScript.RegisterStartupScript(this.GetType(), "", sb.ToString(), true);
        }

        #endregion
    }
}