using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using WSI.IService;
using WSI.ServiceLocator;
using Utility;

namespace CMS.handler.command
{
    /// <summary>
    /// Summary description for CookBookCommand
    /// </summary>
    public class CookBookCommand : IHttpHandler, IRequiresSessionState
    {
        private readonly ICookBookService service = ServiceLocator.Instance.GetService<ICookBookService>();

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Write(ExecuteCommand(context));
        }

        private string ExecuteCommand(HttpContext context)
        {
            try
            {
                if (!Common.IsVerified)
                {
                    return "身份验证失败";
                }
                string command = context.Request["command"] ?? "";
                string id = context.Request["id"] ?? "";

                var item = service.GetDetail(id);

                if (item == null)
                {
                    return "食谱未找到";
                }

                string ret = "操作失败";
                switch (command)
                {
                    case "enable":
                        if (service.ChangeState(item, (int)EnumHelper.State.Enable) > 0)
                        {
                            ret = "1";
                        }
                        break;
                    case "disable":
                        if (service.ChangeState(item, (int)EnumHelper.State.Disable) > 0)
                        {
                            ret = "1";
                        }
                        break;
                    case "delete":
                        if (service.Delete(id) > 0)
                        {
                            ret = "1";
                        }
                        break;
                    default:
                        ret = "未定义该操作的处理：" + command;
                        break;
                }
                return ret;
            }
            catch (Exception ex)
            {
                return "服务异常：" + ex.Message;
            }

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