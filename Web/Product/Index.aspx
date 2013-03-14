<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="Index.aspx.cs" Inherits="Web.Product.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>佳沃产品-佳沃官方网站</title>
    <link href="/!css/ie6fixed.css" rel="Stylesheet" type="text/css" />
    <link href="/!css/style.css" rel="Stylesheet" type="text/css" />
    <link href="/!css/product.css" rel="Stylesheet" type="text/css" />
    <script src="/!js/ieVersion.js" type="text/javascript"></script>
    <script src="/!js/JsLibString.js" type="text/javascript"></script>
    <script src="/!js/JsLibArray.js" type="text/javascript"></script>
    <script src="/!js/jchlib.js" type="text/javascript"></script>
    <script src="/!js/jquery.parallax-1.1.3.js" type="text/javascript"></script>
    <script src="/!js/jquery.scrollTo.js" type="text/javascript"></script>
    <script src="/!js/product.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="slider fixed-right">
        <div>
            <img src="/!images/menu0_0.gif" alt="佳沃产品" /></div>
        <div class="">
            <img src="/!images/menu1_1.gif" alt="蓝莓" /><img class="hidden" src="/!images/menu1_2.gif"
                alt="蓝莓" /></div>
        <div class="">
            <img src="/!images/menu2_1.gif" alt="猕猴桃" /><img class="hidden" src="/!images/menu2_2.gif"
                alt="猕猴桃" /></div>
        <div class="">
            <img src="/!images/menu3_1.gif" alt="其他" /><img class="hidden" src="/!images/menu3_2.gif"
                alt="其他" /></div>
        <div class="">
            <img src="/!images/menu4_1.gif" alt="茶叶" /><img class="hidden" src="/!images/menu4_2.gif"
                alt="茶叶" /></div>
        <div>
            <a target="_blank" href="/TraceabilitySystem.aspx">
                <img src="/!images/menu5_0.gif" alt="追溯系统" /></a></div>
    </div>
    <div class="ground">
        <div id="group1" class="group group1">
            <div id="group1_layer1" class="Parallax">
            </div>
            <div id="group1_layer2" class="Parallax">
            </div>
            <div id="group1_layer3" class="Parallax">
            </div>
            <div id="group1_layer4" class="Parallax">
            </div>
            <div id="group1_layer5" class="Parallax">
            </div>
            <div id="group1_bg" class="Parallax">
                <div class="group1_text">
                    <p class="group1_txt">
                        <a target="_blank" href="/Product/BlueberryStory.aspx">
                            <img src="/!images/group1_text.gif" alt="莓语甜言" /></a></p>
                    <p>
                        <a target="_blank" href="http://detail.tmall.com/item.htm?spm=a1z10.3.w1051275186.15.15jap7&id=18770163345&">
                            <img src="/!images/btn_buy.jpg" alt="我要购买" /></a></p>
                </div>
            </div>
            <div class="groupScreen group1_layer2 hidden">
                <div class="group1_2bar">
                    <p class="group1_2pic">
                        <a target="_blank" href="/Product/BlueberryFlawless.aspx">
                            <img src="/!images/group1_2pic.jpg" alt="完莓无暇" /></a></p>
                    <p class="product_pic">
                        <img src="/!images/product_pic.gif" usemap="#Map" alt="蓝莓产品" />
                        <map name="Map" id="Map">
                            <area shape="poly" coords="180,93,337,92,338,195,228,194,227,127,179,125" href="#"
                                alt="蓝莓食品" />
                            <area shape="poly" coords="4,227,27,221,86,177,171,172,191,222,103,301,52,263,2,259"
                                href="#" alt="蓝莓原料" />
                            <area shape="poly" coords="538,83,482,82,486,32,372,35,393,192,445,190,463,116,538,121"
                                href="#" alt="蓝莓苗木" />
                            <area shape="poly" coords="134,296,130,438,309,437,367,318,231,253" href="#" alt="蓝莓鲜果" />
                        </map>
                    </p>
                    <div class="product_pop product_pop1">
                        <p class="product_txt1">
                            <a href="/Product/BlueberryFlawless.aspx#Blueberry1">蓝莓食品</a></p>
                        <p>
                            <a target="_blank" href="http://joyvio.tmall.com/">
                                <img src="/!images/btn_buy.gif" alt="我要购买" /></a></p>
                    </div>
                    <div class="product_pop product_pop2">
                        <p class="product_txt1">
                            <a href="/Product/BlueberryFlawless.aspx#Blueberry2">蓝莓原料</a></p>
                        <p>
                            <a target="_blank" href="http://detail.tmall.com/item.htm?spm=a1z10.3.w1051275186.14.hXP6Ng&id=22281204762&">
                                <img src="/!images/btn_buy.gif" alt="我要购买" /></a></p>
                    </div>
                    <div class="product_pop product_pop3">
                        <p class="product_txt1">
                            <a href="/Product/BlueberryFlawless.aspx#Blueberry3">蓝莓苗木</a></p>
                        <p>
                            <a target="_blank" href="http://joyvio.tmall.com/">
                                <img src="/!images/btn_buy.gif" alt="我要购买" /></a></p>
                    </div>
                    <div class="product_pop product_pop4">
                        <p class="product_txt1">
                            <a href="/Product/BlueberryFlawless.aspx#Blueberry4">蓝莓鲜果</a></p>
                        <p>
                            <a target="_blank" href="http://detail.tmall.com/item.htm?spm=a1z10.3.w1051275186.15.15jap7&id=18770163345&">
                                <img src="/!images/btn_buy.gif" alt="我要购买" /></a></p>
                    </div>
                    <p class="icon_place icon_place1">
                        <img src="/!images/icon_place.gif" alt="智利种植基地" /></p>
                    <p class="icon_place icon_place2">
                        <img src="/!images/icon_place.gif" alt="辽宁种植基地" /></p>
                    <p class="icon_place icon_place3">
                        <img src="/!images/icon_place.gif" alt="山东种植基地" /></p>
                    <p class="icon_place icon_place4">
                        <img src="/!images/icon_place.gif" alt="湖北种植基地" /></p>
                    <div class="place_pop place_pop1">
                        <p class="fl">
                            <a href="/Product/BlueberryFlawless.aspx#Blueberry5">
                                <img src="/!images/place_pic1.jpg" alt="智利种植基地" /></a></p>
                        <div class="place_txt1">
                            <p class="place_title">
                                <a href="/Product/BlueberryFlawless.aspx#Blueberry5">智利种植基地</a></p>
                            <p class="txt_info">
                                独特地中海气候，夏季炎热干燥且水源充足，蓝莓生长过程中易积累糖分；良好天然屏障，北有沙漠，东靠山脉，南接南极，西临太平洋，少虫害，绿色安全。</p>
                            <p class="place_icon">
                                <a href="/Product/BlueberryFlawless.aspx#Blueberry5">
                                    <img src="/!images/icon2.gif" alt="智利种植基地" /></a></p>
                        </div>
                        <p class="clear">
                        </p>
                        <p class="pop_icon">
                            <img src="/!images/icon.gif" /></p>
                    </div>
                    <div class="place_pop place_pop2">
                        <div class="place_txt1 t_right">
                            <p class="place_title">
                                <a href="/Product/BlueberryFlawless.aspx#Blueberry6">辽宁种植基地</a></p>
                            <p class="txt_info">
                                温带大陆性季风气候区，日照丰富，冬无严寒，夏无酷暑。肥沃微酸土壤促进早熟蓝莓健康成长。</p>
                            <p class="place_icon1">
                                <a href="/Product/BlueberryFlawless.aspx#Blueberry6">
                                    <img src="/!images/icon1.gif" alt="辽宁种植基地" /></a></p>
                        </div>
                        <p class="fl">
                            <a href="/Product/BlueberryFlawless.aspx#Blueberry6">
                                <img src="/!images/place_pic2.jpg" alt="辽宁种植基地" /></a></p>
                        <p class="clear">
                        </p>
                        <p class="pop_icon1">
                            <img src="/!images/icon.gif" /></p>
                    </div>
                    <div class="place_pop place_pop3">
                        <div class="place_txt1">
                            <p class="place_title t_right">
                                <a href="/Product/BlueberryFlawless.aspx#Blueberry7">山东种植基地</a></p>
                            <p class="txt_info">
                                位于世界最优质蓝莓种植地域。北纬35度环渤海、黄海黄金海岸带来充足光照和、降水。微酸土质为蓝莓生长提供最佳土壤，培育特色中熟蓝莓。</p>
                            <p class="place_icon1">
                                <a href="/Product/BlueberryFlawless.aspx#Blueberry7">
                                    <img src="/!images/icon1.gif" alt="山东种植基地" /></a></p>
                        </div>
                        <p class="fl">
                            <a href="/Product/BlueberryFlawless.aspx#Blueberry7">
                                <img src="/!images/place_pic3.jpg" alt="山东种植基地" /></a></p>
                        <p class="clear">
                        </p>
                        <p class="pop_icon2">
                            <img src="/!images/icon.gif" /></p>
                    </div>
                    <div class="place_pop place_pop4">
                        <div class="place_txt1">
                            <p class="place_title t_right">
                                <a href="/Product/BlueberryFlawless.aspx#Blueberry8">湖北荆门种植基地（正在筹建)</a></p>
                            <p class="txt_info">
                                作为中国农耕文化的发祥地，东接大洪山之毓秀，北枕荆山之灵脉，南拥江汉平原之富庶，为“七山二水一分田”，山川秀美，物产丰富。</p>
                            <p class="place_icon1">
                                <a href="/Product/BlueberryFlawless.aspx#Blueberry8">
                                    <img src="/!images/icon1.gif" alt="湖北荆门种植基地" /></a></p>
                        </div>
                        <p class="fl">
                            <a href="/Product/BlueberryFlawless.aspx#Blueberry8">
                                <img src="/!images/place_pic4.jpg" alt="湖北荆门种植基地" /></a></p>
                        <p class="clear">
                        </p>
                        <p class="pop_icon3">
                            <img src="/!images/icon.gif" /></p>
                    </div>
                    <p class="clear">
                    </p>
                </div>
            </div>
            <div class="groupScreen group1_layer3 hidden">
                <div class="group1_3">
                    <p>
                        <img src="/!images/group3_title.jpg" alt="莓丽人生" /></p>
                    <div class="group1_3list">
                        <ul>
                            <li>
                                <div class="group1_3pic">
                                    <p>
                                        <img src="/!images/order_pic1.jpg" alt="选育" /></p>
                                    <p class="line">
                                        <img src="/!images/order_bg.jpg" /></p>
                                </div>
                                <div class="group1_3pop">
                                    <p class="pop_title order_bg1">
                                        选育</p>
                                    <div class="pop_txt">
                                        <p class="pop_stitle">
                                            全球引种，优质选育</p>
                                        <p>
                                            优良种苗的选育是培育“安全、高品质”蓝莓关键的第一步。</p>
                                        <p class="group2_info">
                                            佳沃精选全球3个品系、60余种优质栽培品种，从源头保证蓝莓的健康与美味。</p>
                                        <p class="group2_info">
                                            佳沃汇聚国内外顶尖的技术力量。来自中国的权威蓝莓种植专家姜惠铁，窦连登，李春雷，以及来自全球优质水果产区智利的Julio Domínguez, Jose Igancio
                                            Lira及智利农场负责人 Claudio Marchant，组成了一支国际化的蓝莓专家团队。建立国际一流水平的蓝莓育苗育种研发实验室，确保育苗育种标准化。</p>
                                        <p class="group2_info">
                                            通过自有基地繁育，高度保证蓝莓品种的纯度及一致性。生态化、标准化的种苗繁育方式为蓝莓的成长提供 保障。</p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="group1_3pic">
                                    <p>
                                        <img src="/!images/order_pic2.jpg" alt="种植" /></p>
                                    <p class="line">
                                        <img src="/!images/order_bg.jpg" /></p>
                                </div>
                                <div class="group1_3pop">
                                    <p class="pop_title order_bg2">
                                        种植</p>
                                    <div class="pop_txt">
                                        <p class="pop_stitle">
                                            最佳选址，生态种植</p>
                                        <p>
                                            佳沃精选全球蓝莓栽种核心区域，走“设施农业”、“科技农业”之路。</p>
                                        <p class="group2_info">
                                            在国内，以北纬35度环渤海黄金海岸为核心，在辽宁、山东、湖北等省发展自有种植基地。在海外，选择全球五大地中海气候优质水果产区之一的智利种植园区，利用反季节优势，全年供应新鲜蓝莓。佳沃在全球范围内建设高标准范园区，繁育过程规模化、设施化。</p>
                                        <p class="group2_info">
                                            全程贯彻产品安全质量检测，实时监控土壤、灌溉用水，进行地块编号，农事活动全程记录。</p>
                                        <p class="group2_info">
                                            秉承生态友好理念，采用现代化生态种植技术，实现无公害可持续的生产方式，保持生态平衡，提高种植效率。</p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="group1_3pic">
                                    <p>
                                        <img src="/!images/order_pic3.jpg" alt="采摘" /></p>
                                    <p class="line">
                                        <img src="/!images/order_bg.jpg" /></p>
                                </div>
                                <div class="group1_3pop">
                                    <p class="pop_title order_bg3">
                                        采摘</p>
                                    <div class="pop_txt">
                                        <p class="pop_stitle">
                                            自然成熟，精挑细选</p>
                                        <p>
                                            天然栽培，人工采摘，自然成长，佳沃精心呵护每一颗蓝莓。</p>
                                        <p class="group2_info">
                                            佳沃运用绿色种植技术及规模化、合理化的自有种植方式，最大程度限制农药及化学制剂的使用。</p>
                                        <p class="group2_info">
                                            通过暖棚、冷棚、陆地等不同的栽培方式，布局早熟、中、晚熟不同时期品种；在全球不同纬度布局生产基地，最大程度延长自然成熟蓝莓的供应时间。</p>
                                        <p class="group2_info">
                                            坚持成熟期人工采摘、人工挑选流程，确保每颗佳沃蓝莓的最佳品质。</p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="group1_3pic">
                                    <p>
                                        <img src="/!images/order_pic4.jpg" alt="生产" /></p>
                                    <p class="line">
                                        <img src="/!images/order_bg.jpg" /></p>
                                </div>
                                <div class="group1_3pop">
                                    <p class="pop_title order_bg4">
                                        生产</p>
                                    <div class="pop_txt">
                                        <p class="pop_stitle">
                                            标准流程，先进工艺</p>
                                        <p>
                                            先进的加工、分选技术最大程度保留蓝莓原味，佳沃严格依据标准化生产流程，带给您最佳产品体验。</p>
                                        <p class="group2_info">
                                            佳沃坚持产品技术创新，采用国际领先分选设备，按照蓝莓果品的大小与硬度严格划分产品，有效保证每一颗蓝莓的优良品质。</p>
                                        <p class="group2_info">
                                            标准化的加工、分选流程，专业化的预冷控制程序，高品质的低温冷库，保证产品新鲜度及口感。</p>
                                        <p class="group2_info">
                                            依托世界领先加工技术保持食品原汁原味。蓝莓鲜果及相关产品中的营养物质在佳沃食品中得到最大限度的保护。</p>
                                    </div>
                                </div>
                            </li>
                            <li class="lastli">
                                <div class="group1_3pic">
                                    <p>
                                        <img src="/!images/order_pic5.jpg" alt="品控" /></p>
                                    <p class="line">
                                        <img src="/!images/order_bg.jpg" /></p>
                                </div>
                                <div class="group1_3pop">
                                    <p class="pop_title order_bg5">
                                        品控</p>
                                    <div class="pop_txt">
                                        <p class="pop_stitle">
                                            全程追溯，品质保证</p>
                                        <p>
                                            佳沃以完整严密的全程冷链、全程监控、全程可追溯系统保证每一颗蓝莓的新鲜美味。</p>
                                        <p class="group2_info">
                                            通过保鲜库与气调库实现全程冷链，以保持果品糖度和成熟度。</p>
                                        <p class="group2_info">
                                            全程监控果品运输的每一环节，从冷库到冷藏库直至超市冷柜均得到品质保证。</p>
                                        <p class="group2_info">
                                            佳沃全程可追溯系统提供便捷有效的消费者保障信息。产品上架后，消费者所购买的每一颗蓝莓均可追溯其从农田到餐桌的每一环节，严保品质安全。</p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <p class="clear">
            </p>
            <div class="group_btn">
                <div class="groupLeft">
                    <img alt="向左" src="/!images/groupLeft.gif" /><img class="hidden" alt="向左" src="/!images/groupLeft2.gif" /></div>
                <div class="groupRight">
                    <img alt="向右" src="/!images/groupRight.gif" /><img class="hidden" alt="向右" src="/!images/groupRight2.gif" /></div>
            </div>
            <div class="focus">
                <ul>
                    <li>
                        <img src="/!images/focus_on.jpg" alt="莓语甜言" /></li>
                    <li>
                        <img src="/!images/focus_off.jpg" alt="完莓无暇" /></li>
                    <li>
                        <img src="/!images/focus_off.jpg" alt="莓丽人生" /></li>
                </ul>
            </div>
        </div>
        <div id="group2" class="group group2">
            <div id="group2_layer1" class="Parallax">
            </div>
            <div id="group2_layer2" class="Parallax">
            </div>
            <div id="group2_layer3" class="Parallax">
            </div>
            <div id="group2_layer4" class="Parallax">
            </div>
            <div id="group2_bg" class="Parallax">
                <div class="group2_text">
                    <p class="group2_txt">
                        <a target="_blank" href="/Product/KiwiStory.aspx">
                            <img src="/!images/group2_text.gif" alt="猕语甜言" /></a></p>
                    <p>
                        <a target="_blank" href="http://detail.tmall.com/item.htm?spm=a1z10.3.w1051275186.20.t8KMpV&id=17009890457&">
                            <img src="/!images/btn_buykiwi.jpg" alt="我要购买" /></a></p>
                </div>
            </div>
            <div class="groupScreen group1_layer2 hidden">
                <div class="group1_2bar">
                    <p class="group1_2pic">
                        <a target="_blank" href="/Product/KiwiPrecious.aspx">
                            <img src="/!images/group2_2pic.jpg" alt="猕足珍贵" /></a></p>
                    <p class="kiwipro_pic">
                        <img src="/!images/group2_2pic.gif" usemap="#Map2" alt="猕足珍贵" />
                        <map name="Map2" id="Map2">
                            <area shape="poly" coords="594,91,354,83,353,238,514,239,516,125,592,127" href="#"
                                alt="黄肉系列" />
                            <area shape="poly" coords="7,188,103,189,194,154,296,160,334,202,310,267,134,260,102,219,7,220"
                                href="#" alt="绿肉系列" />
                            <area shape="poly" coords="396,42,396,15,203,19,220,124,321,94,316,46" href="#" alt="红肉系列" />
                        </map>
                    </p>
                    <div class="kiwipro_pop kiwipro_pop1">
                        <p class="product_txt2">
                            <a href="/Product/KiwiPrecious.aspx#Kiwi1">黄肉猕猴桃</a></p>
                        <p>
                            <a target="_blank" href="http://detail.tmall.com/item.htm?spm=a1z10.3.w1051275186.20.t8KMpV&id=17009890457&">
                                <img src="/!images/btn_buykiwi.gif" alt="我要购买" /></a></p>
                    </div>
                    <div class="kiwipro_pop kiwipro_pop2">
                        <p class="product_txt2">
                            <a href="/Product/KiwiPrecious.aspx#Kiwi2">绿肉猕猴桃</a></p>
                        <p>
                            <a target="_blank" href="http://detail.tmall.com/item.htm?id=17272122121&spm=a220z.1000881.0.50.eELpMS&bucket_id=19">
                                <img src="/!images/btn_buykiwi.gif" alt="我要购买" /></a></p>
                    </div>
                    <div class="kiwipro_pop kiwipro_pop3">
                        <p class="product_txt2">
                            <a href="/Product/KiwiPrecious.aspx#Kiwi3">红肉猕猴桃</a></p>
                        <p>
                            <a target="_blank" href="http://joyvio.tmall.com/">
                                <img src="/!images/btn_buykiwi.gif" alt="我要购买" /></a></p>
                    </div>
                    <p class="icon_kiwiplace icon_kiwiplace1">
                        <img src="/!images/icon_place.gif" alt="智利种植基地" /></p>
                    <p class="icon_kiwiplace icon_kiwiplace2">
                        <img src="/!images/icon_place.gif" alt="陕西种植基地（周至）" /></p>
                    <p class="icon_kiwiplace icon_kiwiplace3">
                        <img src="/!images/icon_place.gif" alt="河南种植基地（西峡）" /></p>
                    <p class="icon_kiwiplace icon_kiwiplace4">
                        <img src="/!images/icon_place.gif" alt="四川种植基地（蒲江）" /></p>
                    <div class="kiwiplace_pop kiwiplace_pop1">
                        <p class="fl">
                            <a href="/Product/KiwiPrecious.aspx#Kiwi4">
                                <img src="/!images/kiwiplace_pic1.jpg" alt="智利种植基地" /></a></p>
                        <div class="place_txt2">
                            <p class="place_title">
                                <a href="/Product/KiwiPrecious.aspx#Kiwi4">智利种植基地</a></p>
                            <p class="txt_info">
                                土壤、气候的自然禀赋造就理想产地。地处南半球，形成反季节优势，确保鲜果全年供应。拥有金桃、海沃德等品种，管理规范，认证齐全，品质上乘。</p>
                            <p class="kiwiplace_icon">
                                <a href="/Product/KiwiPrecious.aspx#Kiwi4">
                                    <img src="/!images/icon2.gif" alt="智利种植基地" /></a></p>
                        </div>
                        <p class="clear">
                        </p>
                        <p class="pop_icon">
                            <img src="/!images/icon_kiwip.gif" /></p>
                    </div>
                    <div class="kiwiplace_pop kiwiplace_pop2">
                        <div class="place_txt2 t_right">
                            <p class="place_title">
                                <a href="/Product/KiwiPrecious.aspx#Kiwi5">陕西种植基地（周至）</a></p>
                            <p class="txt_info">
                                位于秦岭北麓国内最大的猕猴桃种植区域，独特的土壤、雨水、光照等条件，使得该地区成为猕猴桃绿果最佳优生区之一。</p>
                            <p class="kiwiplace_icon1">
                                <a href="/Product/KiwiPrecious.aspx#Kiwi5">
                                    <img src="/!images/icon1.gif" alt="陕西种植基地（周至）" /></a></p>
                        </div>
                        <p class="fl">
                            <a href="/Product/KiwiPrecious.aspx#Kiwi5">
                                <img src="/!images/kiwiplace_pic2.jpg" alt="陕西种植基地" /></a></p>
                        <p class="clear">
                        </p>
                        <p class="kiwipop_icon1">
                            <img src="/!images/icon_kiwip.gif" /></p>
                    </div>
                    <div class="kiwiplace_pop kiwiplace_pop3">
                        <div class="place_txt2">
                            <p class="place_title t_right">
                                <a href="/Product/KiwiPrecious.aspx#Kiwi6">河南种植基地（西峡）</a></p>
                            <p class="txt_info">
                                被誉为“绿色王国“,是我国最早开始猕猴桃商业化栽培的区域，也是优质猕猴桃主产区。发展 “金桃”种植，提供优质的专利黄肉猕猴桃。</p>
                            <p class="kiwiplace_icon1">
                                <a href="/Product/KiwiPrecious.aspx#Kiwi6">
                                    <img src="/!images/icon1.gif" alt="河南种植基地（西峡）" /></a></p>
                        </div>
                        <p class="fl">
                            <a href="/Product/KiwiPrecious.aspx#Kiwi6">
                                <img src="/!images/kiwiplace_pic3.jpg" alt="河南种植基地" /></a></p>
                        <p class="clear">
                        </p>
                        <p class="kiwipop_icon2">
                            <img src="/!images/icon_kiwip.gif" /></p>
                    </div>
                    <div class="kiwiplace_pop kiwiplace_pop4">
                        <div class="place_txt2">
                            <p class="place_title t_right">
                                <a href="/Product/KiwiPrecious.aspx#Kiwi7">四川种植基地（蒲江）</a></p>
                            <p class="txt_info">
                                气候温和，有“绿色蒲江，天然氧吧”美誉。公司自建的种植园区，拥有GAP认证，提供公司拥有专利的黄肉和红肉猕猴桃。</p>
                            <p class="kiwiplace_icon1">
                                <a href="/Product/KiwiPrecious.aspx#Kiwi7">
                                    <img src="/!images/icon1.gif" alt="四川种植基地（蒲江）" /></a></p>
                        </div>
                        <p class="fl">
                            <a href="/Product/KiwiPrecious.aspx#Kiwi7">
                                <img src="/!images/kiwiplace_pic4.jpg" alt="四川种植基地" /></a></p>
                        <p class="clear">
                        </p>
                        <p class="kiwipop_icon2">
                            <img src="/!images/icon_kiwip.gif" /></p>
                    </div>
                    <p class="clear">
                    </p>
                </div>
            </div>
            <div class="groupScreen group2_layer3 hidden">
                <div class="group2_3">
                    <p>
                        <img src="/!images/group2_3title.jpg" alt="甜猕人生" /></p>
                    <div class="group2_3list">
                        <ul>
                            <li>
                                <div class="group2_3pic">
                                    <p>
                                        <img src="/!images/orderkiwi_pic1.jpg" alt="选育" /></p>
                                    <p class="line">
                                        <img src="/!images/order_bg.jpg" /></p>
                                </div>
                                <div class="group2_3pop">
                                    <p class="pop_title order_bg1">
                                        选育</p>
                                    <div class="pop_txt">
                                        <p class="pop_stitle">
                                            全球引种，优质选育</p>
                                        <p>
                                            优良种苗的选育是培育“安全、高品质”猕猴桃的第一步。</p>
                                        <p class="group2_info">
                                            佳沃精选全球优质品种，从源头保证佳沃猕猴桃的健康与美味。</p>
                                        <p class="group2_info">
                                            佳沃汇聚了国内外顶尖的技术力量。来自中国的权威猕猴桃种植专家黄宏文，钟彩虹，刘占德，以及来自全球优质水果产区智利的Julio Domínguez, Chrisitian
                                            Abud及智利农场负责人 Claudio Sanchez，组成了一支国际化的猕猴桃专家团队。对生产的全过程进行管控，确保每一个流程科学精准。</p>
                                        <p class="group2_info">
                                            通过自有基地繁育，高度保证猕猴桃的品种纯度及一致性。全程工业化、标准化的种苗繁育方式为猕猴桃的成长打下坚实基础。</p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="group2_3pic">
                                    <p>
                                        <img src="/!images/orderkiwi_pic2.jpg" alt="种植" /></p>
                                    <p class="line">
                                        <img src="/!images/order_bg.jpg" /></p>
                                </div>
                                <div class="group2_3pop">
                                    <p class="pop_title order_bg2">
                                        种植</p>
                                    <div class="pop_txt">
                                        <p class="pop_stitle">
                                            最佳选址，生态种植</p>
                                        <p>
                                            佳沃精选适宜猕猴桃栽种的核心区域“走设施农业“、”科技农业之路“。</p>
                                        <p class="group2_info">
                                            在国内的四川、陕西、湖北等区域发展自有种植基地。同时大力发展智利种植园区，建立猕猴桃反季节供应优势，保证全年新鲜供给；建设高标准示范园区，繁育过程规模化、设施化。</p>
                                        <p class="group2_info">
                                            依照国际标准，贯彻产品质量检测，实时监控土壤、水源和生长环境。对土地进行地块编号，全程记录农事活动。</p>
                                        <p class="group2_info">
                                            杜绝使用农药，应用太生态农业技术，保持生态平衡，提高种植效率。</p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="group2_3pic">
                                    <p>
                                        <img src="/!images/orderkiwi_pic3.jpg" alt="采摘" /></p>
                                    <p class="line">
                                        <img src="/!images/order_bg.jpg" /></p>
                                </div>
                                <div class="group2_3pop">
                                    <p class="pop_title order_bg3">
                                        采摘</p>
                                    <div class="pop_txt">
                                        <p class="pop_stitle">
                                            自然成熟，精挑细选</p>
                                        <p>
                                            天然栽培，人工采摘，自然成长，佳沃精心呵护每一颗猕猴桃。</p>
                                        <p class="group2_info">
                                            佳沃运用绿色种植技术及规模化、合理化的自有种植方式，最大程度限制农药及化学制剂的使用。</p>
                                        <p class="group2_info">
                                            通过温室大棚、塑料大棚栽培、露地栽培掌控采果期，耐心等待果实最佳期自然成熟。</p>
                                        <p class="group2_info">
                                            人工采摘、挑选流程确保每颗佳沃猕猴桃的最佳品质。</p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="group2_3pic">
                                    <p>
                                        <img src="/!images/orderkiwi_pic4.jpg" alt="筛选" /></p>
                                    <p class="line">
                                        <img src="/!images/order_bg.jpg" /></p>
                                </div>
                                <div class="group2_3pop">
                                    <p class="pop_title order_bg3">
                                        生产</p>
                                    <div class="pop_txt">
                                        <p class="pop_stitle">
                                            标准流程，严格分选</p>
                                        <p>
                                            先进的加工、分选技术最大程度保留猕猴桃原味，佳沃严格依据标准化生产流程，带给您最佳产品体验。</p>
                                        <p class="group2_info">
                                            佳沃坚持产品技术创新，采用国际领先分选设备，按照猕猴桃果品的大小与硬度将严格划分产品，有效保证每一颗猕猴桃的优良品质。</p>
                                        <p class="group2_info">
                                            标准化的加工、分选流程，专业化的预冷控制程序，高品质的低温冷库，保证产品新鲜度及口感。</p>
                                        <p class="group2_info">
                                            依托世界领先技术，佳沃的猕猴桃产品中的营养物质得到最大限度的保护。</p>
                                    </div>
                                </div>
                            </li>
                            <li class="lastli">
                                <div class="group2_3pic">
                                    <p>
                                        <img src="/!images/orderkiwi_pic5.jpg" alt="品控" /></p>
                                    <p class="line">
                                        <img src="/!images/order_bg.jpg" /></p>
                                </div>
                                <div class="group2_3pop">
                                    <p class="pop_title order_bg5">
                                        品控</p>
                                    <div class="pop_txt">
                                        <p class="pop_stitle">
                                            全程追溯，品质保证</p>
                                        <p>
                                            佳沃以完整严密的全程冷链、全程监控、全程可追溯系统保证每一颗猕猴桃的新鲜美味。</p>
                                        <p class="group2_info">
                                            全程冷链管理通过保鲜库和气调库进行保鲜储存，保持果品糖度和成熟度。</p>
                                        <p class="group2_info">
                                            全程监控果品从冷库到冷藏库到超市冷柜的每一步骤。</p>
                                        <p class="group2_info">
                                            佳沃全程可追溯系统提供便捷有效的消费者保障信息。产品上架后，消费者购买的每一颗猕猴桃均可追溯其从农田到餐桌的每一个细节，做到无缝监管。</p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="group_btn">
                <div class="groupLeft">
                    <img alt="向左" src="/!images/groupLeft.gif" /><img class="hidden" alt="向左" src="/!images/groupLeft2.gif" /></div>
                <div class="groupRight">
                    <img alt="向右" src="/!images/groupRight.gif" /><img class="hidden" alt="向右" src="/!images/groupRight2.gif" /></div>
            </div>
            <div class="focus focuskiwi" style="left: 0px;">
                <ul>
                    <li style="cursor: pointer;">
                        <img alt="猕猴桃" src="/!images/focus_on.jpg" /></li>
                    <li style="cursor: pointer;">
                        <img alt="猕猴桃" src="/!images/focus_off.jpg" /></li>
                    <li style="cursor: pointer;">
                        <img alt="猕猴桃" src="/!images/focus_off.jpg" /></li>
                </ul>
            </div>
        </div>
        <div id="group3" class="group group3">
            <div id="group3_layer1" class="Parallax">
            </div>
            <div id="group3_layer2" class="Parallax">
            </div>
            <div id="group3_layer3" class="Parallax">
            </div>
            <div id="group3_layer4" class="Parallax">
            </div>
            <div id="group3_layer5" class="Parallax">
            </div>
            <div id="group3_bg" class="Parallax">
                <div class="group3_text">
                    <a target="_blank" href="/Product/FruitsDetail.aspx">
                        <img src="/!images/group3_text.jpg" alt="果味无穷" /></a>
                    <br />
                    <br />
                    <a target="_blank" href="http://detail.tmall.com/item.htm?spm=a1z10.3.w1051275186.13.bdWSD1&id=22278852699&">
                        <img src="/!images/btn_buyfruits.jpg" alt="我要购买" /></a>
                </div>
            </div>
            <div class="groupScreen group3_screen2 hidden">
                <div class="group1_2bar">
                    <p class="group3_2pic">
                        <a target="_blank" href="/Product/FruitsDetail.aspx">
                            <img src="/!images/group3_2pic.jpg" alt="全球优质产区保证优良血统" /></a></p>
                    <p class="fruitspro_pic">
                        <img src="/!images/group3_2pic.gif" usemap="#Map3" alt="佳沃水果" />
                        <map name="Map3" id="Map3">
                            <area shape="poly" coords="7,70,247,72,245,189,104,184,104,114,7,113" href="#" alt="佳沃提子" />
                            <area shape="poly" coords="290,66,550,66,551,88,452,91,445,196,286,191" href="#"
                                alt="佳沃车厘子" />
                        </map>
                    </p>
                    <div class="fruitspro_pop fruitspro_pop1">
                        <p class="product_txt3">
                            <a href="/Product/FruitsDetail.aspx#Fruits1">佳沃提子</a></p>
                        <p>
                            <a target="_blank" href="http://detail.tmall.com/item.htm?spm=a1z10.3.w1051275186.12.hb7uFh&id=18690879702&">
                                <img src="/!images/btn_buyfruits.gif" alt="我要购买" /></a></p>
                    </div>
                    <div class="fruitspro_pop fruitspro_pop2">
                        <p class="product_txt3">
                            <a href="/Product/FruitsDetail.aspx#Fruits2">佳沃车厘子</a></p>
                        <p>
                            <a target="_blank" href="http://detail.tmall.com/item.htm?spm=a1z10.3.w1051275186.13.bdWSD1&id=22278852699&">
                                <img src="/!images/btn_buyfruits.gif" alt="我要购买" /></a></p>
                    </div>
                    <p class="icon_fruitsplace icon_fruitsplace1">
                        <img src="/!images/icon_place.gif" alt="智利种植基地" /></p>
                    <p class="icon_fruitsplace icon_fruitsplace2">
                        <img src="/!images/icon_place.gif" alt="澳洲种植基地" /></p>
                    <div class="fruitsplace_pop fruitsplace_pop1">
                        <p class="fl">
                            <a href="/Product/FruitsDetail.aspx#Fruits3">
                                <img src="/!images/fruitsplace_pic1.jpg" alt="佳沃车厘子" /></a></p>
                        <div class="place_txt3">
                            <p class="place_title">
                                <a href="/Product/FruitsDetail.aspx#Fruits3">佳沃车厘子</a></p>
                            <p class="txt_info">
                                佳沃车厘子生产基地分布在智利及澳洲，南半球的地域优势造形成了与世隔绝的优质水果产区，有效抑制病虫害，供应特色反季蓝莓；独特的地中海气候带来分明四季、充沛光照和降水。权威专家团队提供技术支持，现代化设备保证种植效率及品质。</p>
                            <p class="place_icon">
                                <a href="/Product/FruitsDetail.aspx#Fruits3">
                                    <img src="/!images/icon2.gif" alt="佳沃车厘子" /></a></p>
                        </div>
                        <p class="clear">
                        </p>
                        <p class="pop_icon">
                            <img src="/!images/icon_fruits.gif" /></p>
                    </div>
                    <div class="fruitsplace_pop fruitsplace_pop2">
                        <div class="place_txt3 t_right">
                            <p class="place_title">
                                <a href="/Product/FruitsDetail.aspx#Fruits4">佳沃提子</a></p>
                            <p class="txt_info">
                                佳沃提子是来自南半球的美味，在大洋的另外一端——智利及澳洲，我们与世隔绝的生产基地占据天然地域优势，拥有分明四季、充沛光照和降水。基地配备权威专家及现代化设备，不断提高提子品质和种植效率。我们供应特色反季提子，即使在冬日，也能给您提供美味提子鲜果。</p>
                            <p class="place_icon1">
                                <a href="/Product/FruitsDetail.aspx#Fruits4">
                                    <img src="/!images/icon1.gif" alt="佳沃提子" /></a></p>
                        </div>
                        <p class="fl">
                            <a href="/Product/FruitsDetail.aspx#Fruits4">
                                <img src="/!images/fruitsplace_pic2.jpg" alt="佳沃提子" /></a></p>
                        <p class="clear">
                        </p>
                        <p class="fruitspop_icon">
                            <img src="/!images/icon_fruits.gif" /></p>
                    </div>
                    <p class="clear">
                    </p>
                </div>
            </div>
            <div class="group_btn">
                <div class="groupLeft">
                    <img alt="向左" src="/!images/groupLeft.gif" /><img class="hidden" alt="向左" src="/!images/groupLeft2.gif" /></div>
                <div class="groupRight">
                    <img alt="向右" src="/!images/groupRight.gif" /><img class="hidden" alt="向右" src="/!images/groupRight2.gif" /></div>
            </div>
            <div class="focus" style="left: 0px;">
                <ul>
                    <li style="cursor: pointer;">
                        <img alt="其他" src="/!images/focus_on.jpg"></li>
                    <li style="cursor: pointer;">
                        <img alt="其他" src="/!images/focus_off.jpg"></li>
                </ul>
            </div>
        </div>
        <div id="group4" class="group group4">
            <div id="group4_bg" class="Parallax">
                <div class="group4_text">
                    <p class="group4_txt">
                        <a target="_blank" href="/Product/GreenTea.aspx">
                            <img src="/!images/group4_txt.gif" alt="佳沃茶叶" /></a></p>
                    <%-- <p>
                        <a target="_blank" href="">
                            <img src="/!images/btn_buytea.jpg" alt="我要购买" /></a></p>--%>
                </div>
            </div>
            <div class="groupScreen group4_3bg hidden">
                <div class="group4_text">
                    <p class="group4_txt">
                        <a target="_blank" href="/Product/GreenTea.aspx">
                            <img src="/!images/group4_3txt.jpg" alt="佳沃绿茶" /></a></p>
                    <%-- <p>
                        <a target="_blank" href="">
                            <img src="/!images/btn_buytea.jpg" alt="我要购买" /></a></p>--%>
                </div>
            </div>
            <div class="groupScreen group4_2bg hidden">
                <div class="group4_text">
                    <p class="group4_txt">
                        <a target="_blank" href="/Product/BlackTea.aspx">
                            <img src="/!images/group4_2txt.gif" alt="佳沃红茶" /></a></p>
                    <%--<p>
                        <a target="_blank" href="">
                            <img src="/!images/btn_buytea.jpg" alt="我要购买" /></a></p>--%>
                </div>
            </div>
            <div class="group_btn">
                <div class="groupLeft">
                    <img alt="向左" src="/!images/groupLeft.gif" /><img class="hidden" alt="向左" src="/!images/groupLeft2.gif" /></div>
                <div class="groupRight">
                    <img alt="向右" src="/!images/groupRight.gif" /><img class="hidden" alt="向右" src="/!images/groupRight2.gif" /></div>
            </div>
            <div class="focus" style="left: 0px;">
                <ul>
                    <li style="cursor: pointer;">
                        <img alt="佳沃茶叶" src="/!images/focus_on.jpg" /></li>
                    <li style="cursor: pointer;">
                        <img alt="佳沃红茶" src="/!images/focus_off.jpg" /></li>
                    <li style="cursor: pointer;">
                        <img alt="佳沃绿茶" src="/!images/focus_off.jpg" /></li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
