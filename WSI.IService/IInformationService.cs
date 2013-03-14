using System;
using System.Collections;
using System.Collections.Generic;
using WSI.Model.Entities;
namespace WSI.IService
{
    public interface IInformationService
    {

        #region 添加
        /// <summary>
        /// 添加信息
        /// </summary>
        /// <param name="title"></param>
        /// <param name="subtitle"></param>
        /// <param name="source"></param>
        /// <param name="author"></param>
        /// <param name="adder"></param>
        /// <param name="summary"></param>
        /// <param name="content"></param>
        /// <param name="referenceUrl"></param>
        /// <param name="isTop"></param>
        /// <param name="keywords"></param>
        /// <param name="navidlist"></param>
        /// <param name="publishTime"></param>
        /// <returns></returns>
        int AddInformation(
            string title,
            string subtitle,
            string source,
            string author,
            string adder,
            string summary,
            string content,
            string referenceUrl,
            bool isTop,
            IList<string> keywords,
            IList<string> navidlist,
            DateTime publishTime,
            string resourcePath
            );
        #endregion

        #region 修改
        /// <summary>
        /// 更新信息
        /// </summary>
        /// <param name="infoid"></param>
        /// <param name="title"></param>
        /// <param name="subtitle"></param>
        /// <param name="source"></param>
        /// <param name="author"></param>
        /// <param name="adder"></param>
        /// <param name="summary"></param>
        /// <param name="content"></param>
        /// <param name="referenceUrl"></param>
        /// <param name="isTop"></param>
        /// <param name="keywords"></param>
        /// <param name="navidlist"></param>
        /// <param name="publishTime"></param>
        /// <returns></returns>
        int UpdateInformation(
            string infoid,
            string title,
            string subtitle,
            string source,
            string author,
            string adder,
            string summary,
            string content,
            string referenceUrl,
            bool isTop,
            IList<string> keywords,
            IList<string> navidlist,
            DateTime publishTime,
            string resourcePath);

        /// <summary>
        /// 更新实体
        /// </summary>
        /// <param name="info"></param>


        int ChageState(Information info, int state);

        /// <summary>
        /// 添加图片附件
        /// </summary>
        /// <param name="infoid"></param>
        /// <param name="path"></param>
        void AddAttachImage(string infoid, string path, string description);
        #endregion

        #region 查询

        /// <summary>
        /// 根据ID获取基本的文本信息
        /// </summary>
        /// <param name="infoid"></param>
        /// <returns></returns>
        Information GetDetail(string infoid);
        /// <summary>
        /// 获取详细的信息（包括栏目、关键字、附件）
        /// </summary>
        /// <param name="infoid"></param>
        /// <returns></returns>
        Information GetDetailIncludeAll(string infoid);

        /// <summary>
        /// 获取全部数据
        /// </summary>
        /// <returns></returns>
        IList<Information> GetList();

        /// <summary>
        /// 根据标题查询信息
        /// </summary>
        /// <param name="title"></param>
        Information GetInformationByTitle(string title);

        /// <summary>
        /// 根据栏目ID查询信息数据分页显示
        /// 按发布时间倒序显示
        /// </summary>
        /// <param name="navid"></param>
        /// <param name="pageindex"></param>
        /// <param name="pagesize"></param>
        IList<Information> GetActivePagedInfosByNavId(string navid, int pageindex, int pagesize, out int count);

        /// <summary>
        /// 获取分布数据（后台显示），按置顶及添加时间倒序排列
        /// </summary>
        /// <param name="title"></param>
        /// <param name="from"></param>
        /// <param name="to"></param>
        /// <param name="pageindex"></param>
        /// <param name="pagesize"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        IList<Information> GetPagedInfo(string title, string navid, DateTime from, DateTime to, int pageindex, int pagesize, out int count);

        /// <summary>
        /// 获取上一条记录
        /// </summary>
        /// <param name="infoid"></param>
        /// <returns></returns>
        Information GetPrevRecord(string infoid, string navid);

        /// <summary>
        /// 获取上一条记录
        /// </summary>
        /// <param name="infoid"></param>
        /// <returns></returns>
        Information GetNextRecord(string infoid, string navid);
        #endregion

        #region 删除
        /// <summary>
        /// 删除信息
        /// info中包含所有级联数据，删除时也同时删除级联数据
        /// </summary>
        /// <param name="info"></param>
        int Delete(string infoid);
        #endregion

        #region 图片路径

        /// <summary>
        /// 根据原图路径获取封面图片路径 
        /// </summary>
        /// <param name="savePath"></param>
        /// <returns></returns>
        string GetCoverPath(string basePath);

        /// <summary>
        /// 根据原图路径获取缩略图路径
        /// </summary>
        /// <param name="savePath"></param>
        /// <returns></returns>
        string GetThumbPath(string basePath);


        #endregion



    }
}
