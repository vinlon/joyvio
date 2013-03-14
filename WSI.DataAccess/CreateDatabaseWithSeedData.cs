using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;
using WSI.Model.Entities;
using Utility;
namespace WSI.DataAccess
{
    class CreateDatabaseWithSeedData : CreateDatabaseIfNotExists<WSICmsContext>
    {
        protected override void Seed(WSICmsContext context)
        {
            //添加默认用户和角色
            context.UserInfoes.Add(
                new UserInfo()
                {
                    UserName = "admin",
                    UserPassword = "admin!@#$%^".EncryptMD5(),//简单加密，如果UserInfoService中密码加密方式改变则有可能导致默认帐户登录失败

                    RoleList = new List<RoleInfo>() 
                    { 
                        new RoleInfo()
                        {
                            RoleName="系统管理员",
                            Description="程序初始化时默认添加的角色,拥有所有的权限",
                            RoleType=(int)RoleType.SystemManager,
                            CreateTime=DateTime.Now,
                            State=(int)EnumHelper.State.Enable
                        }
                    },
                    State = (int)EnumHelper.State.Enable,
                    CreateTime = DateTime.Now,
                    LastVisitTime = DateTime.Now
                }
                );

            //测试栏目
            context.FrontendNavigations.Add(
                new FrontendNavigation()
                {
                    NavName = "测试栏目",
                    Parent = null,
                    State = (int)EnumHelper.State.Enable,
                    Type = (int)NavigationType.List,
                    Description = "用于测试的栏目",
                    CreateTime = DateTime.Now
                }
                );

            //测试标签
            context.Tags.Add(
                new Tag()
                {
                    TagName = "测试标签",
                    TagCode = "test",
                    Description = "用于测试的标签",
                    Parent = null,
                    State = (int)EnumHelper.State.Enable,
                    CreateTime = DateTime.Now
                }
                );
        }
    }
}
