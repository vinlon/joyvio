<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="GreenTea.aspx.cs" Inherits="Web.Product.GreenTea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>佳沃绿茶-佳沃官方网站</title>
    <link href="/!css/style.css" rel="Stylesheet" type="text/css" />
    <link href="/!css/product.css" rel="Stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <div class="pagenavi">
            <p class="home">
                <a href="/Index.aspx">
                    <img src="/!images/icon_home.jpg" alt="首页" /></a>
            </p>
            <p class="fl">
                > <a href="/Product/Index.aspx">佳沃产品</a> > <a href="/Product/Index.aspx?skip=3">茶叶</a>
                > <span>佳沃绿茶</span></p>
            <p class="clear">
            </p>
        </div>
        <p>
            <img src="/!images/greentea_pic1.jpg" alt="佳沃绿茶" /></p>
        <div class="blueberriesbar">
            <div class="blueberries_left">
                <div class="bb_block">
                    <p class="fl">
                        <img src="/!images/greentea_pic2.jpg" alt="绿茶历史文化" /></p>
                    <div class="gt_story">
                        <p class="gt_title">
                            绿茶历史文化</p>
                        <p class="story_txt">
                            <span class="bold">龙井：</span>得名于西湖西翁家山西北麓的龙井茶村，始于宋，闻于元，扬于明，盛于清。相传狮峰上的18颗龙井茶树为当年乾隆皇帝下江南时亲手所植，所以又为御茶。</p>
                        <p class="story_txt">
                            <span class="bold">碧螺春：</span>据记载，碧螺春茶叶早在隋唐时期即负盛名，其味甚甘香，以苏州方言命名为“吓煞人香”，有千余年历史。传说清康熙帝南巡至太湖，认为“吓煞人香”名称不雅，便取其色泽碧绿，卷曲似螺，春时采制，又得自洞庭碧螺峰等特点，钦赐其美名 “碧螺春”。</p>
                        <p class="story_txt">
                            <span class="bold">雀舌：</span>蒲江雀舌产自四川蒲江县境内，早在唐代就已名扬四海；金坛雀舌产于江苏省金坛市方麓茶场，1982年，由金坛县科研人员研制而成，故命名为金坛雀舌；浙江雀舌产于浙江省杭州西湖龙井茶区境内的中国农科院茶叶研究所茶叶试验场，1980年开始研制,1984年正式投产。</p>
                    </div>
                    <p class="clear"></p>
                </div>
                <p class="clear">
                </p>
                <div class="bb_block">
                    <p class="bt_cqtitle">
                        优质产区</p>
                    <div class="cq_bar">
                        <p>
                            <img src="/!images/greentea_pic4.jpg" alt="龙井" /></p>
                        <div class="cq_info cq_infoh2 cq_infobg1">
                            <p class="pc_infotitle">
                                龙井</p>
                            <p>
                                龙井产于钱塘江、曹娥江环抱的山地、丘陵间。西湖、钱塘和越州三大产区气候温和、湿润多雨、土壤肥沃，非常适合培育天然好绿茶。</p>
                        </div>
                    </div>
                    <div class="cq_bar">
                        <p>
                            <img src="/!images/greentea_pic5.jpg" alt="碧螺春" /></p>
                        <div class="cq_info cq_infoh2 cq_infobg2">
                            <p class="pc_infotitle">
                                碧螺春</p>
                            <p>
                                碧螺春源自洞庭，濒临太湖，半山半水的奇特地貌造就独特地理优势。云雾缭绕、降水适宜、高有机质土壤，极宜于茶树生长。</p>
                        </div>
                    </div>
                    <div class="cq_bar">
                        <p>
                            <img src="/!images/greentea_pic6.jpg" alt="雀舌" /></p>
                        <div class="cq_info cq_infoh2 cq_infobg3">
                            <p class="pc_infotitle">
                                雀舌</p>
                            <p>
                                浙江雀舌，产于浙江杭州；蒲江雀舌，产于成都蒲江；金坛雀舌，产于江苏金坛。采摘标准为单芽，大小均匀一致，成品形似雀舌。</p>
                        </div>
                    </div>
                    <p class="clear">
                    </p>
                </div>
                <p class="clear">
                </p>
                <div class="bb_block">
                    <div class="bt_jpbar">
                        <p>
                            鉴茶、品茶</p>
                        <p class="bt_jptxt">
                            绿茶品鉴注重“新、干、匀、香、净”五个字。通过“色、香、味、形、泡”五个标准可以鉴别优质绿茶：优质绿茶色泽嫩绿鲜活;茶香清幽持久;入口滋味醇和鲜爽;外形匀整挺秀;冲泡后快速沉底。</p>
                    </div>
                    <div class="cq_bar">
                        <p>
                            <img src="/!images/greentea_pic7.jpg" alt="龙井" /></p>
                        <div class="cq_info cq_infoh1 cq_infobg1">
                            <p class="pc_infotitle">
                                龙井</p>
                            <p>
                                在原产地域范围内采摘的茶叶鲜叶，按照传统工艺技术在原产地域范围内加工而成，具有“色绿、香郁、味醇、形美”等特点扁形绿茶。</p>
                        </div>
                    </div>
                    <div class="cq_bar">
                        <p>
                            <img src="/!images/greentea_pic8.jpg" alt="碧螺春" /></p>
                        <div class="cq_info cq_infoh1 cq_infobg2">
                            <p class="pc_infotitle">
                                碧螺春</p>
                            <p>
                                采自传统茶树品种或选用适宜的良种进行繁育、栽培的茶树的幼嫩芽叶，经独特的工艺加工而成，具有“纤细多毫，卷曲呈螺，嫩香持久，滋味鲜醇，回味甘甜”的特点。  
                            </p>
                        </div>
                    </div>
                    <div class="cq_bar">
                        <p>
                            <img src="/!images/greentea_pic9.jpg" alt="雀舌" /></p>
                        <div class="cq_info cq_infoh1 cq_infobg3">
                            <p class="pc_infotitle">
                                雀舌</p>
                            <p>
                                色泽嫩绿，芽形秀美，冲泡后，嫩芽颗颗直立，如雀舌纤巧可爱，清香四溢。</p>
                        </div>
                    </div>
                    <p class="clear">
                    </p>
                </div>
                <p class="clear">
                </p>
            </div>
            <div class="blueberries_right">
                <p>
                    <img src="/!images/greentea_pic3.jpg" alt="品种" /></p>
                <div class="bt_gxbar">
                    <p>
                        <img src="/!images/greentea_pic10.jpg" alt="红茶的功效" /></p>
                    <div class="gt_gxinfo">
                        <p class="gt_gxtitle">
                            绿茶的功效</p>
                        <p>
                            <span class="bold">绿茶是“不发酵茶”，性寒味略苦，在绿茶加工过程中，较多的保留了茶鲜叶中原有的各种有益成分。</span><br />
                            <br />
                            绿茶富含茶多酚，有助于阻断体内氧化反应，延缓衰老。对人体脂肪代谢也有重要作用，常饮绿茶有利于抑制心血管疾病。同时绿茶也被健康及医学界誉为“辐射克星”，可以有效抑制癌细胞生长，辅助治疗。<br />
                            <br />
                            每一片绿茶叶片中都含有丰富微量元素及维生素族群，每日饮茶，轻松补充人体日常所需微量元素及维生素。<br />
                            <br />
                            绿茶中的咖啡碱能促使人体中枢神经兴奋，起到提神益思、清心醒脑的效果。</p>
                    </div>
                </div>
            </div>
            <p class="clear">
            </p>
        </div>
        <p class="clear">
        </p>
    </div>
</asp:Content>
