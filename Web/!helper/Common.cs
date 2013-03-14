using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WSI.Model.Entities;

public static class Common
{
    #region 常量
    /// <summary>
    /// 后台地址
    /// </summary>
    public static string CMS_URL = System.Configuration.ConfigurationManager.AppSettings["cms_url"];

    /// <summary>
    /// 新闻中心左侧精彩推荐的标签Code
    /// </summary>
    public static readonly string NEWS_RECOMMEND_TAG_CODE = "news_recommended";

    /// <summary>
    /// 新闻中心首页左侧置顶新闻
    /// </summary>
    public static string NEWS_JOYVIO_TAG_CODE = "news_joyvio";

    /// <summary>
    /// 食尚潮流推荐标签Code
    /// </summary>
    public static string FOOD_SHCL_TAG_CODE = "shcl_recommend";

    /// <summary>
    /// 健康安全推荐标签Code
    /// </summary>
    public static string FOOD_JKAQ_TAG_CODE = "jkaq_recommend";

    /// <summary>
    /// 食尚潮流和健康安全的更多推荐标签Code
    /// </summary>
    public static string FOOD_NEWS_RECOMMEND_TAG_CODE = "food_news_recommend";


    /// <summary>
    /// 现代农业理念栏目ID
    /// </summary>
    public static string AGRICLUTURE_IDEA_ID = "26f89cc1-d2f5-421d-b097-a14c1133a34b";

    /// <summary>
    /// 产业链动态栏目ID
    /// </summary>
    public static string AGRICLUTURE_NEWS_ID = "b5164f27-2d6e-4e9f-959c-d890d79dcabd";


    #endregion

    #region 根据导航实例获取导航链接

    public static string GetNavigationUrl(FrontendNavigation nav)
    {
        string url = nav.Url;
        if (nav.Type == (int)NavigationType.List)
        {
            url = string.Format("{0}?navid={1}", url, nav.NavId);
        }
        return url;
    }

    #endregion




}
