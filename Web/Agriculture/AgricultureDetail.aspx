<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="AgricultureDetail.aspx.cs" Inherits="Web.Agriculture.AgricultureDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>现代农业理念-佳沃官方网站</title>
    <link href="/!css/style.css" rel="Stylesheet" type="text/css" />
    <link href="/!css/news.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        //分享
        $(function () {
            $(".share").hover(function () {
                $(".share_list").toggle();
            })

        })
        //左右两侧等高
        var left_div = "left";
        var right_div = "right";
        function change(id1, id2) {
            var con1 = document.getElementById(id1);
            var con2 = document.getElementById(id2);
            if (con1.offsetHeight < con2.offsetHeight) {
                con1.style.height = con2.offsetHeight + "px";
            }
            else {
                con2.style.height = con1.offsetHeight + "px";
            }
        }
        window.onload = function () {
            try {
                change(left_div, right_div);
            }
            catch (e) {
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <div class="pagenavi">
            <p class="home">
                <a href="/Index.aspx">
                    <img src="/!images/icon_home.jpg" alt="首页" /></a>
            </p>
            <p class="fl">
                > <a href="/Agriculture/Index.aspx">现代农业</a> > <a href="/Agriculture/AgricultureIdea.aspx">
                    现代农业理念</a> > <span>创新经营体系不是另起炉灶</span></p>
            <p class="clear">
            </p>
        </div>
        <p class="clear">
        </p>
        <div class="rdetail_left" id="left">
            <p class="title">
                创新经营体系不是另起炉灶</p>
            <div class="news_timebar news_timemar">
                <p class="news_time">
                    2013-01-29 09:20</p>
                <p class="news_line">
                    |</p>
                <p class="fl">
                    PDF下载</p>
                <p class="news_line">
                    |</p>
                <div class="share">
                    <span class="cursor">我要分享</span>
                    <div class="share_list">
                        <p class="tqq">
                            <a href="">腾讯微博</a></p>
                        <p class="tsina">
                            <a href="">新浪微博</a></p>
                    </div>
                </div>
                <p class="clear">
                </p>
            </div>
            <%--<div class="news_picbar">
                <p class="fl">
                    <img src="/!images/news_pic.jpg" alt="" /></p>
                <div class="news_piclist">
                    <p>
                        <img src="/!images/icon_top.jpg" alt="向上" /></p>
                    <ul>
                        <li>
                            <img src="/!images/news_spic.jpg" alt="" /></li>
                        <li class="selected">
                            <img src="/!images/news_spic.jpg" alt="" /></li>
                        <li>
                            <img src="/!images/news_spic.jpg" alt="" /></li>
                        <li>
                            <img src="/!images/news_spic.jpg" alt="" /></li>
                    </ul>
                    <p>
                        <img src="/!images/icon_bottom.jpg" alt="向下" /></p>
                </div>
                <p class="clear">
                </p>
            </div>--%>
            <p class="clear">
            </p>
            <div class="s_info">
                今年中央一号文件传递出什么政策信息？有哪些突出新亮点？日前，记者专访了中央农村工作领导小组副组长、办公室主任陈锡文。<br />
                <br />
                主题从何来<br />
                <br />
                供给增长赶不上需求增长；谁来种地问题突显<br />
                <br />
                2004年以来，九个中央一号文件，连续锁定“三农”，构建起强农惠农富农政策体系，农业农村发展进入又一个“黄金期”。今年，第十个中央一号文件继续锁定“三农”，并且确定了加快发展现代农业、进一步增强农村发展活力的主题，有什么特别的针对性吗？<br />
                <br />
                陈锡文说，全面建成小康，农村是难点；“四化”同步，农业是短板。第十个一号文件继续锁定“三农”，充分体现中央持之以恒强化农业、惠及农村、富裕农民的坚定决心。今年一号文件的主题很有深意，是中央对农业农村新情况新问题做出研判之后确定的，有很强的现实针对性。<br />
                <br />
                陈锡文着重介绍了两个重要背景：<br />
                <br />
                首先，粮食产量“九连增”，这个成绩很了不起。但是生产增长得快，消费需求增长得更快，农产品供求仍处于“总量基本平衡、结构性紧缺”状况。一定程度上可以说，当前某些农产品确实存在供给增速赶不上社会消费需求增速的现象。城镇化快速推进，带来消费结构深刻变化。国家统计局的数据显示，2011年城镇居民人均消费食用植物油比农民多24%，猪牛羊肉多51%，禽蛋多87%。13亿人的饭碗要端在自己手里，如果没有农业的更快增长，就难以支撑城镇化，难以支撑经济社会的可持续发展。加快发展现代农业是必然选择。<br />
                <br />
                其次，农村的情况也发生了深刻变化。去年全国农民工达到2.6亿，大量青壮年进城务工，农村社会结构加速转型，农户兼业化、村庄空心化、农民老龄化趋势明显，“谁来种地、怎么种地”问题日益严峻。当然，对农业的支持要继续强化，一刻也不能放松，投入要增长，补贴要增加，流通要改善，但与此同时，必须要研究农村生产要素如何组织，微观经营体制如何创新，农村的发展活力如何增强。<br />
                <br />
                要补上农业短板，除了继续强化农业支持保护制度外，今后要在创新体制机制上下大力气。可以说，今年中央一号文件传递出的最重要信息是：加快农村改革创新，进一步解放和发展农村社会生产力。<br />
                <br />
                突破口在哪里<br />
                <br />
                最大亮点是创新经营体系<br />
                <br />
                “一号文件强调加快改革创新，最大亮点是创新农业经营体系”。陈锡文说，要抓住两个关键，一是在支持普通农户提高生产集约化程度的同时，培育新型农业生产经营主体，扶持联户经营、专业大户和家庭农场，发展多种形式的新型农民合作组织；二是构建新型农业社会化服务体系，提高组织化程度，实现“小生产”与“大市场”的有效对接。<br />
                <br />
                新型农业生产经营主体还是农户吗？<br />
                <br />
                陈锡文毫不迟疑地说，不管农业经营体制怎么创新，真正的主体还是农户。农业选择以家庭经营为基础，既是历史现象，也是世界性的普遍现象，这是由农业自身的产业特征决定的。就全世界来看，基本没哪个地方的农业不搞家庭经营，只是规模大小不同而已。<br />
                <br />
                陈锡文强调，一号文件提出创新农业经营体制，不是要去搞一个新制度，而是要在稳定和完善农村基本经营制度基础上，通过机制创新，更好地激发家庭经营的活力。<br />
                <br />
                家庭经营怎么走向现代化？陈锡文认为，简言之，就是让农业经营主体与新型服务体系结合起来。农户要提高集约化水平，采用先进科技和现代生产要素，增加技术、资本等生产要素投入；通过规范的土地流转，发展适度规模经营。而多元化、多层次、多形式的社会化服务体系，就是要为农民提供全方位、低成本、便利高效的服务，把一家一户做不了、做起来不经济的事情做好，帮助农户降低风险，提高效益。<br />
                <br />
                对新型农业经营主体有什么政策优惠？陈锡文说，今年新增补贴和支农项目将向专业大户、家庭农场、农民合作社等新型经营主体倾斜，为的就是让肯种地、会种地、能种地的农民不吃亏、有效益、得实惠，这也体现了中央的政策导向。<br />
                <br />
                土地怎么流转<br />
                <br />
                守住底线，给工商资本下乡设“门槛”<br />
                <br />
                “创新农业经营体系，要坚守一条底线，那就是充分保障农民土地承包经营权。”陈锡文谈到这里加重了语气，“特别是土地流转，要坚持依法自愿有偿原则，不能搞强迫命令，确保不损害农民权益、不改变土地用途、不破坏农业综合生产能力。”<br />
                <br />
                近年来，工商资本大面积租种农民土地现象有所增加，也存在一些争议。今年一号文件明确提出，对工商资本租赁农户承包耕地，要建立严格的准入和监管制度。这其中的政策含义是什么？<br />
                <br />
                陈锡文说，这就意味着要给工商资本下乡设门槛、立规矩。事前有审查，事后有监管，看你有没有资格、有没有能力做农业？流转土地要干什么？怎么干？是否会改变农业用途，损害农民利益？目的就是防止某些企业以发展农业的名义要地、圈地。尤其要警惕一些企业在租赁的土地上盖别墅、建度假村，造成部分耕地的“非粮化”、“非农化”，任其发展是很危险的。<br />
                <br />
                一号文件首次提出，鼓励工商资本到农村发展适合企业化经营的种养业，这指的是哪一类行业？<br />
                <br />
                陈锡文认为，所谓适合企业化经营的种养业，是指一些设施农业和规模化畜牧业等，在现代技术条件下，动植物生长的过程可以控制，雇员付出的劳动能够计量和监督，能够实现工厂化生产，且资金和技术门槛较高，非一般农户可为。这样的领域工商资本进入有优势。但对于大田生产而言，公司难有优势。<br />
                <br />
                “农业发展要处理好效率和公平问题，只要家庭干得了、还愿意干的，就应该让农民自己干，让农民有更多经营选择权。”陈锡文说，中央一再强调，解决好“三农”问题，不能只考虑农业效率这个单一问题。农民的逐步减少是个趋势，但是农民的转移是被动的，取决于城市能提供多少就业岗位，能容纳多少人进城安居。因此，要引导土地有序流转，充分尊重农民意愿，鼓励支持承包土地向专业大户、家庭农场和农民合作社流转。支持企业在农业产前、产中和产后提供社会化服务，不鼓励企业与农民争夺耕地经营权，把农民硬挤出去。
            </div>
            <div class="article">
                <p>
                    上一篇：<a href="">改良谷朊粉膜在软枣猕猴桃保鲜应用上的研究</a></p>
                <p>
                    下一篇：<a href="">近红外光谱技术在茶叶及茶制品上应用</a></p>
                <p class="return_list">
                    <a href="/Food/FoodTrend.aspx">返回现代农业理念</a></p>
            </div>
        </div>
        <div class="rdetail_right" id="right">
            <p class="related_title">
                精彩推荐</p>
            <div class="related_list">
                <ul>
                    <li>
                        <p>
                            <a href="">联想进军现代农业 来蒲江种猕猴桃首期10万亩</a></p>
                        <p>
                            媒体报道<span class="line">|</span><span class="time">2013-01-29 09:20</span></p>
                        <p class="clear">
                        </p>
                    </li>
                    <li>
                        <p>
                            <a href="">联想进军现代农业 来蒲江种猕猴桃首期10万亩</a></p>
                        <p>
                            媒体报道<span class="line">|</span><span class="time">2013-01-29 09:20</span></p>
                        <p class="clear">
                        </p>
                    </li>
                    <li>
                        <p>
                            <a href="">联想进军现代农业 来蒲江种猕猴桃首期10万亩</a></p>
                        <p>
                            媒体报道<span class="line">|</span><span class="time">2013-01-29 09:20</span></p>
                        <p class="clear">
                        </p>
                    </li>
                    <li>
                        <p>
                            <a href="">联想进军现代农业 来蒲江种猕猴桃首期10万亩</a></p>
                        <p>
                            媒体报道<span class="line">|</span><span class="time">2013-01-29 09:20</span></p>
                        <p class="clear">
                        </p>
                    </li>
                </ul>
            </div>
        </div>
        <p class="clear">
        </p>
    </div>
</asp:Content>
