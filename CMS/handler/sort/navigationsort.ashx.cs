using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using WSI.IService;
using WSI.ServiceLocator;

namespace CMS.handler.sort
{
    /// <summary>
    /// Summary description for navigationsort
    /// </summary>
    public class navigationsort : IHttpHandler, IRequiresSessionState
    {
        private INavigationService service = ServiceLocator.Instance.GetService<INavigationService>();
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Write(ExecuteSort(context));
        }

        private string ExecuteSort(HttpContext context)
        {
            if (context.Request.Params["new_order"] == null || context.Request.Params["old_order"] == null)
            {
                return "参数不正确";
            }
            string new_order = context.Request["new_order"];

            string old_order = context.Request["old_order"];

            if (new_order != old_order)
            {
                //引处可通过前后顺序的比较，判断更新从何处开始。以减少数据更新的工作量
                IList<string> sortedlist = new_order.Split(',').ToList();
                service.ReSort(sortedlist);
            }
            return "1";
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}