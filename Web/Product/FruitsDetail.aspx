<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="FruitsDetail.aspx.cs" Inherits="Web.Product.FruitsDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>果味无穷-佳沃官方网站</title>
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
                > <a href="/Product/Index.aspx">佳沃产品</a> > <a href="/Product/Index.aspx?skip=2">其他水果</a>
                > <span>果味无穷</span></p>
            <p class="clear">
            </p>
        </div>
        <p>
            <img src="/!images/fruits_pic1.jpg" alt="果味无穷" /></p>
        <div class="blueberriesbar" id="Fruits2">
            <div class="blueberries_left">
                <p class="fruits_title1">
                    车厘子 AMERICAN GRAPE</p>
                <div class="fruits_info1">
                    <p class="fruits_title2">
                        诚意精选，丰富产品，更多选择更多体验</p>
                    <ul class="fruits_list1">
                        <li>
                            <p>
                                <img src="/!images/fruits_pic2.jpg" alt="BING" /></p>
                            <p class="list_title1">
                                BING</p>
                            <p>
                                饱满的暗红色果实惹人喜爱，是车厘子中的“超级大果”。肉厚核小，细腻果肉带来酸甜口感，兼具耐储保鲜的优点。除了鲜食外，也可用于烹饪调味。</p>
                            <p class="clear">
                            </p>
                        </li>
                        <li class="listfr">
                            <p>
                                <img src="/!images/fruits_pic3.jpg" alt="LAPINS" /></p>
                            <p class="list_title1">
                                LAPINS</p>
                            <p>
                                色泽鲜红亮丽，果型巨大，果肉爽脆，入口清爽，口味别具一格。 </p>
                            <p class="clear">
                            </p>
                        </li>
                        <li>
                            <p>
                                <img src="/!images/fruits_pic4.jpg" alt="KODIA" /></p>
                            <p class="list_title1">
                                KODIA</p>
                            <p>
                                品质最佳，但产量较少，属车厘子中的精品。果实紫黑，色泽饱满，清香可口。口感坚实多汁、甜美细嫩，具有独特风味。</p>
                            <p class="clear">
                            </p>
                        </li>
                        <li class="listfr">
                            <p>
                                <img src="/!images/fruits_pic5.jpg" alt="SWEETHEART" /></p>
                            <p class="list_title1">
                                SWEETHEART</p>
                            <p>
                                甜心车厘子因其特别的“心形”果实而得名，外形甜美。品尝起来口感适宜，果肉硬脆有弹性，令您回味无穷。</p>
                            <p class="clear">
                            </p>
                        </li>
                    </ul>
                    <p class="clear">
                    </p>
                </div>
                <div class="fruits_block1">
                    <div class="fruits_info2">
                        <p class="fruits_title3">
                            车厘子营养揭秘——养颜补气佳品</p>
                        <p class="fruits_txt1">
                            相比于其他水果，车厘子的含铁量可谓“一枝独秀”，铁元素含量 59mg/100g，是同等重量草莓的6倍、枣的10倍、山楂的13倍、苹果的20倍，居各种水果之首。</p>
                        <p class="fruits_txt1">
                            车厘子维生素A含量比葡萄、苹果、橘子多4～5倍以上。</p>
                    </div>
                    <p class="fl">
                        <img src="/!images/fruits_pic6.jpg" alt="车厘子营养揭秘——养颜补气佳品" /></p>
                    <p class="clear">
                    </p>
                </div>
            </div>
            <div class="blueberries_right">
                <p class="fruits_title1">
                    车厘子功效初体验</p>
                <p>
                    <img src="/!images/fruits_pic7.jpg" alt="车厘子功效初体验" /></p>
                <div class="fruits_info3">
                    <p class="fruits_title2">
                        补气补血—健脾补气 防治贫血 
                    </p>
                    <p class="fruits_txt2">
                        美国俄勒冈健康与科学大学对运动医学的研究显示： 专业运动员常通过饮用果汁饮品提高运动表现。在众多饮品中，车厘子的功效独树一帜，可以显著提高身体机能，及时补充气血。</p>
                    <p class="fruits_title2">
                        美肤驻颜—红润嫩白 祛皱消斑</p>
                    <p class="fruits_txt2">
                        美国亚利桑那大学关于水果营养成分构成的调研报告显示：车厘子富含抗氧化成分，能够保护肌肤，抚平岁月痕迹，是女性美容驻颜的必选佳品。</p>
                </div>
            </div>
            <p class="clear">
            </p>
        </div>
        <p class="clear">
        </p>
        <div class="blueberriesbar">
            <div class="blueberries_left">
                <div class="fruits_bg" id="Fruits3">
                    <p class="fruits_title3">
                        全球产区 四季鲜果</p>
                    <p>
                        佳沃车厘子是来自南半球的美味。在大洋的另外一端——智利及澳洲，我们与世隔绝的生产基地占据天然地域优势，拥有分明四季、充沛光照和降水。基地配备权威专家及现代化设备，不断提高车厘子品质和种植效率。通过佳沃分布在全球不同纬度的优质水果基地，即使在中国寒冷冬日，我们也能给您提供来自南半球充满阳光美味的新鲜车厘子鲜果。</p>
                </div>
            </div>
            <div class="blueberries_right">
                <div class="fruits_bg">
                    <p class="fruits_title3">
                        车厘子美誉</p>
                    <p class="fruits_txt1">
                        中医古著《名医别录》中有记载：“吃樱桃，令人好颜色，美志”。</p>
                    <p class="fruits_txt1">
                        车厘子自古以来就是美容果，被誉为“水果中的钻石”。</p>
                </div>
            </div>
        </div>
        <p class="clear">
        </p>
        <div class="blueberriesbar" id="Fruits1">
            <div class="blueberries_left">
                <p class="fruits_title1">
                    提子 CHERRY</p>
                <div class="fruits_info1">
                    <p class="fruits_title2">
                        诚意精选，更多选择更多体验</p>
                    <ul class="fruits_list1">
                        <li>
                            <p>
                                <img src="/!images/fruits_pic8.jpg" alt="Ralli Seedless" /></p>
                            <p class="list_title1">
                                RALLI SEEDLESS</p>
                            <p>
                                精选澳大利亚的无核红提品种。玫瑰色的提子串极具吸引力，光滑果皮包裹柔软果肉。提子成熟时期散发独特麝香香味，带来嗅觉、味觉交互享受。</p>
                            <p class="clear">
                            </p>
                        </li>
                        <li class="listfr">
                            <p>
                                <img src="/!images/fruits_pic9.jpg" alt="Midnight beauty Seedless" /></p>
                            <p class="list_title1">
                                MIDNIGHT BEAUTY SEEDLESS</p>
                            <p>
                                被称为“提子之王“。果脆个大、甜酸适口、耐储保鲜。在市场上以其“贵族身份”而备受青睐，被列为世界四大水果之首。</p>
                            <p class="clear">
                            </p>
                        </li>
                        <li>
                            <p>
                                <img src="/!images/fruits_pic10.jpg" alt="Thomson Seedless" /></p>
                            <p class="list_title1">
                                THOMSON SEEDLESS</p>
                            <p>
                                果实翠绿晶莹，果肉紧实，口感脆甜可口。素有“水晶提子”、“绿珍珠”之美称，堪称色、形、味俱美。</p>
                            <p class="clear">
                            </p>
                        </li>
                    </ul>
                    <p class="clear">
                    </p>
                </div>
                <div class="fruits_block1">
                    <div class="fruits_info4">
                        <p class="fruits_title3">
                            提子的营养揭秘——能量之源</p>
                        <p class="fruits_txt1">
                            提子富含易吸收葡萄糖，快速补充人体血糖含量。</p>
                        <p class="fruits_txt1">
                            提子含有丰富维生素C及维生素E，为皮肤提供抗氧化保护，减轻外来环境的侵袭。</p>
                        <p class="fruits_txt1">
                            一升提子汁相当于1700ml牛奶/650g牛肉/1000g鱼/500g面包/3-5个鸡蛋/1200克马铃薯/3500g番茄/1500g梨产生的热量。</p>
                    </div>
                    <p class="fl">
                        <img src="/!images/fruits_pic11.jpg" alt="提子的营养揭秘——能量之源" /></p>
                    <p class="clear">
                    </p>
                </div>
            </div>
            <div class="blueberries_right">
                <p class="fruits_title1">
                    提子功效初体验</p>
                <p>
                    <img src="/!images/fruits_pic12.jpg" alt="车厘子功效初体验" /></p>
                <div class="fruits_info3">
                    <p class="fruits_title2">
                        防癌抗癌—强化身体 促进康复</p>
                    <p class="fruits_txt3">
                        美国伊利诺斯药科大学的研究人员发现，提子中的多酚、白藜芦醇等健康成分可以防止健康细胞癌变，阻止癌细胞扩散。国外多家医院利用提子汁帮助手术患者减少排异反应，促进康复。</p>
                    <p class="fruits_title2">
                        消除疲劳—补充能量 恢复体力</p>
                    <p class="fruits_txt3">
                        美国康乃迪格州大学关于心脑血管保健的研究中显示：提子果实中的葡萄糖、有机酸、氨基酸、维生素的含量都很丰富，对治疗神经衰弱和消除疲劳效果明显。人体出现低血糖时，若及时食用提子，可很快使症状缓解。</p>
                </div>
            </div>
            <p class="clear">
            </p>
        </div>
        <p class="clear">
        </p>
        <div class="blueberriesbar">
            <div class="blueberries_left">
                <div class="fruits_bg" id="Fruits4">
                    <p class="fruits_title3">
                        全球产区 四季鲜果</p>
                    <p>
                        佳沃提子是来自南半球的美味。在大洋的另外一端——智利及澳洲，我们与世隔绝的生产基地占据天然地域优势，拥有分明四季、充沛光照和降水。基地配备权威专家及现代化设备，不断提高提子品质和种植效率。我们供应特色反季节提子，即使在冬日，也能给您提供美味提子鲜果。</p>
                </div>
            </div>
            <div class="blueberries_right">
                <div class="fruits_bg">
                    <p class="fruits_title3">
                        提子美誉</p>
                    <p class="fruits_txt1">
                        《神农本草经》记载: 食用提子“筋骨湿痹，益气，倍力强志，令人肥健，耐饥，忍风寒。久食，轻身不老延年”。</p>
                    <p class="fruits_txt1">
                        《随息居饮食谱》记载: 提子“补气，滋肾液，益肝阴，强筋骨，止渴，安胎”。</p>
                </div>
            </div>
        </div>
        <p class="clear">
        </p>
        <p class="return">
            <a href="/Product/Index.aspx?skip=2">返回其他水果页</a></p>
    </div>
</asp:Content>
