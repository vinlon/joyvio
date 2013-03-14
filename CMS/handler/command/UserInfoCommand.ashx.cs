using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WSI.Model.Entities;
using System.Web.SessionState;
using WSI.IService;
using WSI.ServiceLocator;
using Utility;

namespace CMS.handler.command
{
    /// <summary>
    /// Summary description for UserInfoCommand
    /// </summary>
    public class UserInfoCommand : IHttpHandler, IRequiresSessionState
    {
        IUserInfoService service = ServiceLocator.Instance.GetService<IUserInfoService>();
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

                var user = service.GetDetailIncludeAll(id);

                if (user == null)
                {
                    return "用户未找到";
                }

                string ret = "操作失败";
                switch (command)
                {
                    case "enable":
                        if (service.ChangeState(user, (int)EnumHelper.State.Enable) > 0)
                        {
                            ret = "1";
                        }
                        break;
                    case "disable":
                        if (service.ChangeState(user, (int)EnumHelper.State.Disable) > 0)
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