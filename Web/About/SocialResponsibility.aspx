<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="SocialResponsibility.aspx.cs" Inherits="Web.About.SocialResponsibility" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>社会责任-佳沃官方网站</title>
    <link href="/!css/style.css" rel="Stylesheet" type="text/css" />
    <link href="/!css/about.css" rel="Stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <div class="pagenavi">
            <p class="home">
                <a href="/Index.aspx">
                    <img src="/!images/icon_home.jpg" alt="首页" /></a>
            </p>
            <p class="fl">
                > <a href="/About/Introduction.aspx">关于佳沃</a> > <span>社会责任</span></p>
            <p class="clear">
            </p>
        </div>
        <p class="clear">
        </p>
        <div class="companybar">
            <div class="about_left">
                <p>
                    <img src="/!images/socialresponsibility_pic1.jpg" alt="社会责任" /></p>
                <div class="companyp_infobar">
                    <p class="about_title">
                        社会责任</p>
                    <div class="subcompany_info">
                        <p class="small_titlesc">
                            可持续发展</p>
                        <p class="sc_info sc_infomar">
                            佳沃以“环境友好”为根本的农业生产经营理念，按照“整体、协调、循环、再生”的要求组织农业生产，充分利用生产资源，打造能量多级利用和物质循环再生的健康全产业链，在提供安全高品质农产品和食品的同时，致力于生态环境的保护；同时，佳沃将努力在各生产区域发挥龙头企业的效应，利用佳沃全球化经营规模、产业整合理念、企业管理方法、品牌营销战略等方面的独特优势，建设规模经营，推动当地农村经济可持续发展。</p>
                        <%--<p class="small_titlesc">
                            环境保护</p>
                        <p class="sc_info sc_infomar">
                            为响应国家“十二五”节能减排工作目标，佳沃有限公司以“环境友好”为根本的农业生产经营理念，坚持节约灌溉用水，充分利用生产资源。致力于在提供安全、高品质农产品和食品的同时，加大食品生产节能减排力度，提升环境保护绩效。</p>--%>
                        <p class="small_titlesc">
                            服务三农
                        </p>
                        <p class="sc_info">
                            佳沃把产业报国、惠及三农视为己任。通过在理念、科技、管理等方面的积累和优势，带动农民一起发展优势产业，打通产业链，引导原来分散、无序的传统农业生产向规模化、标准化、集约化、品牌化方向发展，提升农民生产积极性和农业产业水平；与地方农民深入合作，积极发展农产品深加工以及相关服务业，提高农业的附加值，帮助县市区域打造一张地方经济名片；协助县市区域打造以特色农业产业或产品为基础的地域支柱产业，吸引投资，以现代农业带动新型工业化、信息化、城镇化的新一轮绿色增长，促进全面建设小康社会。</p>
                    </div>
                </div>
            </div>
            <div class="about_right">
                <p class="sc_rtitle">
                    关于佳沃</p>
                <%--<div class="sc_list">
                    <ul>
                        <li>
                            <p class="subcom_listtitle">
                                公司介绍</p>
                            <p>
                                随着中国经济和社会的进一步发展，消费者对于安全高品质农产品及食品的需求不断增加，而.....</p>
                            <p class="infomore">
                                <a href="/About/Introduction.aspx">更多>></a></p>
                        </li>
                        <li class="even">
                            <p class="subcom_listtitle">
                                公司理念</p>
                            <p>
                                · 公司使命 · 公司愿景 · 公司文化 · 品牌核心价值</p>
                            <p class="infomore">
                                <a href="/About/CompanyPhilosophy.aspx">更多>></a></p>
                        </li>
                        <li class="icon_cp">
                            <p class="subcom_listtitle">
                                社会责任</p>
                            <p>
                                · 可持续发展 · 环境保护 · 服务三农</p>
                        </li>
                    </ul>
                </div>
                <p class="clear">
                </p>
                <p class="sc_title">
                    旗下公司</p>
                <div class="subcom_list">
                    <ul>
                        <li>
                            <p class="subcom_listtitle">
                                <a href="/About/SubCompany.aspx">青岛沃林蓝莓果业有限公司</a></p>
                            <p>
                                青岛沃林蓝莓果业有限公司是一家以蓝莓为主，涉及种苗繁育、基地种植、果品加工、销售及进出口业务的.....</p>
                            <p class="infomore">
                                <a href="/About/SubCompany.aspx">更多>></a></p>
                        </li>
                        <li class="even">
                            <p class="subcom_listtitle">
                                <a href="/About/SubCompany.aspx">四川中新农业科技有限公司</a></p>
                            <p>
                                四川中新农业科技有限公司成立于2006年，是专业从事猕猴桃产业的四川省农业产业化经营省级重点.....</p>
                            <p class="infomore">
                                <a href="/About/SubCompany.aspx">更多>></a></p>
                        </li>
                        <li>
                            <p class="subcom_listtitle">
                                <a href="/About/SubCompany.aspx">北京华夏联诚果业商贸有限公司</a></p>
                            <p>
                                北京华夏联诚果业商贸有限公司成立于2011年5月份，是一家致力于生产安全、高品质果品的公司.....</p>
                            <p class="infomore">
                                <a href="/About/SubCompany.aspx">更多>></a></p>
                        </li>
                        <li class="even">
                            <p class="subcom_listtitle">
                                <a href="/About/SubCompany.aspx">智利农场</a></p>
                            <p>
                                佳沃在全球最优质水果产区之一的智利，与Arandanos、Porvenir、Tres Vias、El Retorno.....</p>
                            <p class="infomore">
                                <a href="/About/SubCompany.aspx">更多>></a></p>
                        </li>
                    </ul>
                </div>--%>
                <div class="about_list">
                    <ul>
                        <li class="oneli">
                            <p class="fr">
                                <a href="/About/Introduction.aspx">
                                    <img src="/!images/about_intro.jpg" alt="公司介绍" /></a></p>
                            <p class="about_lititle">
                                <a href="/About/Introduction.aspx">公司介绍</a></p>
                            <p class="about_limore">
                                <a href="/About/Introduction.aspx">更多>></a></p>
                        </li>
                        <li class="threeli">
                            <p class="fr">
                                <a href="/About/SubCompany.aspx">
                                    <img src="/!images/about_company.jpg" alt="旗下公司" /></a></p>
                            <p class="about_lititle">
                                <a href="/About/SubCompany.aspx">旗下公司</a></p>
                            <p class="about_limore">
                                <a href="/About/SubCompany.aspx">更多>></a></p>
                        </li>
                        <li class="threeli">
                            <p class="fr">
                                <a href="/About/CompanyPhilosophy.aspx">
                                    <img src="/!images/about_philosophy.jpg" alt="公司理念" /></a></p>
                            <p class="about_lititle">
                                <a href="/About/CompanyPhilosophy.aspx">公司理念</a></p>
                            <p class="about_limore">
                                <a href="/About/CompanyPhilosophy.aspx">更多>></a></p>
                        </li>
                    </ul>
                </div>
            </div>
            <p class="clear">
            </p>
        </div>
    </div>
</asp:Content>
