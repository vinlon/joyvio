using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WSI.IService;
using WSI.ServiceLocator;

namespace Web._helper
{
    /// <summary>
    /// Summary description for cookbookhandler
    /// </summary>
    public class cookbookhandler : IHttpHandler
    {
        private readonly ICookBookService service = ServiceLocator.Instance.GetService<ICookBookService>();
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Write(CookBookFavor(context));
        }

        private int CookBookFavor(HttpContext context)
        {
            string id = context.Request["cbid"] ?? "";

            return service.Favor(id);
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