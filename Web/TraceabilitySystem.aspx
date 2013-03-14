<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="TraceabilitySystem.aspx.cs" Inherits="Web.TraceabilitySystem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>可追溯系统-佳沃官方网站</title>
    <link href="/!css/style.css" rel="Stylesheet" type="text/css" />
    <link href="/!css/system.css" rel="Stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <div class="pagenavi">
            <p class="home">
                <a href="/Index.aspx">
                    <img src="/!images/icon_home.jpg" alt="首页" /></a>
            </p>
            <p class="fl">
                > <span>可追溯系统</span>
            </p>
            <p class="clear">
            </p>
        </div>
        <p class="clear">
        </p>
        <div class="system_left">
            <p>
                <img src="/!images/system_pic1.jpg" alt="可追溯系统" /></p>
            <div class="systerm_way">
                <div class="way_txt">
                    <p class="way_title">
                        可追溯系统使用方法</p>
                    <p>
                        佳沃追溯标签包含二维扫描码和17位追溯码两方面信息，为您提供两种便捷的产品信息查询方法。</p>
                </div>
                <p class="fl">
                    <img src="/!images/system_pic2.jpg" alt="可追溯系统使用方法" /></p>
            </div>
            <div class="way_left">
                <p class="inquiry_title">
                    网页追溯信息查询</p>
                <div class="inquiry_info">
                    <p>
                        <img src="/!images/system_pic3.jpg" alt="STEP 1" /></p>
                    <p>
                        STEP 1. 点击进入佳沃官方网站首页WWW.JOYVIO.COM；</p>
                    <p>
                        <img src="/!images/system_pic4.jpg" alt="STEP 2" /></p>
                    <p>
                        STEP 2. 在佳沃产品包装上找到17位追溯码；</p>
                    <p>
                        <img src="/!images/system_pic5.jpg" alt="STEP 3" /></p>
                    <p>
                        STEP 3. 在在佳沃官网首页产品追溯码输入框中输入17位追溯<br />
                        <span class="inquiry_infopad">码，点击查询；</span></p>
                    <p>
                        <img src="/!images/system_pic6.jpg" alt="STEP 4" /></p>
                    <p>
                        STEP 4. 查看产品的基本信息、生产企业信息、种植信息、检<br />
                        <span class="inquiry_infopad">测信息等相关质量安全信息。</span></p>
                </div>
            </div>
            <div class="way_right">
                <p class="inquiry_title">
                    手机追溯信息查询</p>
                <p>
                    <img src="/!images/system_pic7.jpg" alt="手机追溯信息查询" /></p>
                <div class="phone_way">
                    <ul class="phone_list">
                        <li>
                            <p>
                                <img src="/!images/system_pic8.jpg" alt="STEP 1" /></p>
                            <p>
                                STEP 1. 准备一部智能手机，并安装二维码扫描软件（推荐使用“我查查”）；</p>
                        </li>
                        <li>
                            <p>
                                <img src="/!images/system_pic9.jpg" alt="STEP 2" /></p>
                            <p>
                                STEP 2. 在佳沃产品包装上找到二维码追溯标签；</p>
                        </li>
                        <li>
                            <p>
                                <img src="/!images/system_pic10.jpg" alt="STEP 3" /></p>
                            <p>
                                STEP 3. 启动手机中的二维码扫描软件，将手机摄像头对准产品包装上的追溯标签区域进行扫描；</p>
                        </li>
                        <li>
                            <p>
                                <img src="/!images/system_pic11.jpg" alt="STEP 4" /></p>
                            <p>
                                STEP 4. 扫描完成后，手机屏幕上会自动显示出追溯码、品牌、产品、生产企业、生产日期、种植基地等信息；</p>
                        </li>
                        <li>
                            <p>
                                <img src="/!images/system_pic12.jpg" alt="STEP 5" /></p>
                            <p>
                                STEP 5. 点击详细信息地址（URL）后可以看到产品的基本信息、生产企业信息、种植信息、检测信息等有关质量安全信息。</p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="system_right">
            <div class="code_bar">
                <p>
                    请在下框中输入包装上17位数字追溯码</p>
                <p class="codemar">
                    <input type="text" class="code_input" />
                    <a href="javascript:alert('您输入的追溯码不正确')">
                        <img src="/!images/submit_code.jpg" alt="提交" /></a>
                </p>
            </div>
            <p class="right_title">
                概述</p>
            <p>
                <img src="/!images/system_pic13.jpg" alt="简要概述" /></p>
            <p class="right_txt">
                从农田到餐桌，佳沃建立了无缝透明的全程可追溯体系，严格控制、细心记录从种植、加工、包装、储运、直至营销的每一个细节。只需要通过几个简单的查询步骤，您即可深入了解所购买的佳沃产品源头和质量安全信息。</p>
            <p class="right_title">
                可追溯系统简介</p>
            <p>
                <img src="/!images/system_pic14.jpg" alt="可追溯系统简介" /></p>
            <p class="right_txt">
                可追溯的国际性定义为 “通过登记的识别码，对商品或行为的历史和使用或位置予以追踪的能力”。佳沃有限公司以产品可追溯作为核心战略，建立了严格的品控和可追溯体系，并通过可追溯系统对种植、加工、包装、贮运、营销各环节的质量安全数据进行采集和分析，监测和控制产品生命周期内的质量安全。佳沃可追溯系统是食品安全保障的前提，消费者和管理机构可以快速有效地追溯产品质量安全信息和源头信息，问题产品能够及时得到反馈并召回。佳沃有限公司有实力、有信念将可追溯理念贯彻始终，构建品牌信任桥梁。</p>
        </div>
        <p class="clear">
        </p>
    </div>
</asp:Content>
