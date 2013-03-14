using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;
using System.Diagnostics;
using WSI.IService;
using WSI.Service;

namespace WSI.ServiceLocator
{
    public class ServiceLocator
    {
        #region 单例模式

        private static readonly object syncObj = new object();
        private static ServiceLocator _instance;
        public static ServiceLocator Instance
        {
            get
            {
                if (_instance == null)
                {
                    lock (syncObj)
                    {
                        if (_instance == null)
                        {
                            _instance = new ServiceLocator();
                        }
                    }
                }
                return _instance;
            }
        }

        #endregion

        #region Service Locator

        private IDictionary<Type, object> instantiatedServices;
        private IDictionary<Type, Type> serviceTypes;

        private ServiceLocator()
        {
            //已实例化的服务字典为空
            instantiatedServices = new Dictionary<Type, object>();


            //服务类型字典
            serviceTypes = new Dictionary<Type, Type>();

            //注册服务
            BuildServiceTypesMap();
        }

        public T GetService<T>()
        {
            if (this.instantiatedServices.ContainsKey(typeof(T)))
            {
                return (T)instantiatedServices[typeof(T)];
            }
            else
            {
                // lazy initialization
                try
                {
                    //服务类型必须通过公共无参构造函数进行实例化
                    Type serviceType = this.serviceTypes[typeof(T)];
                    ConstructorInfo ctor = serviceType.GetConstructor(new Type[0]);
                    Debug.Assert(ctor != null, serviceType.Name + "类中未找到公共无参构造函数");

                    T service = (T)ctor.Invoke(null);

                    //将实例添加到instantiatedServices中
                    instantiatedServices.Add(typeof(T), service);

                    return service;
                }
                catch (KeyNotFoundException)
                {
                    new ApplicationException("请求的服务没有注册");
                    return default(T);
                }

            }
        }

        #endregion

        private void BuildServiceTypesMap()
        {
            //...服务注册
            this.serviceTypes.Add(typeof(IAttachmentService), typeof(AttachmentService));
            this.serviceTypes.Add(typeof(ICookBookService), typeof(CookBookService));
            this.serviceTypes.Add(typeof(IFrontendNavigationService), typeof(FrontendNavigationService));
            this.serviceTypes.Add(typeof(IImageSizeService), typeof(ImageSizeService));
            this.serviceTypes.Add(typeof(IInformationService), typeof(InformationService));
            this.serviceTypes.Add(typeof(IJoinApplyService), typeof(JoinApplyService));
            this.serviceTypes.Add(typeof(ILogService), typeof(LogService));
            this.serviceTypes.Add(typeof(INavigationService), typeof(NavigationService));
            this.serviceTypes.Add(typeof(IRecruitmentService), typeof(RecruitmentService));
            this.serviceTypes.Add(typeof(IRoleInfoService), typeof(RoleInfoService));
            this.serviceTypes.Add(typeof(IUserInfoService), typeof(UserInfoService));
            this.serviceTypes.Add(typeof(ITagService), typeof(TagServcie));
        }

    }
}
