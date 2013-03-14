using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WSI.IService;
using WSI.ServiceLocator;
using Utility;
using System.Web.SessionState;

namespace CMS.handler.command
{
    /// <summary>
    /// Summary description for NavigationCommand
    /// </summary>
    public class NavigationCommand : IHttpHandler, IRequiresSessionState
    {
        private INavigationService service = ServiceLocator.Instance.GetService<INavigationService>();
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

                var nav = service.GetDetailIncludeAll(id);

                if (nav == null)
                {
                    return "导航未找到";
                }

                string ret = "操作失败";
                switch (command)
                {
                    case "enable":
                        if (service.ChangeState(nav, (int)EnumHelper.State.Enable) > 0)
                        {
                            ret = "1";
                        }
                        break;
                    case "disable":
                        if (service.ChangeState(nav, (int)EnumHelper.State.Disable) > 0)
                        {
                            ret = "1";
                        }
                        break;
                    case "delete":
                        //先判断是否有子导航，如果有，则返回错误信息
                        if (nav.Children != null && nav.Children.Count != 0)
                        {
                            ret = "有未删除的子菜单，请删除所有子菜单后重试";
                        }
                        else if (service.Delete(id) > 0)
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
                return "服务异常:" + ex.Message;
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