<!--#include file="fiveinc/inc.asp"-->
<!--#include file="FiveInc/Check_Sql.asp"-->
<!--#include file="FiveInc/page.asp"-->
<%
nid=strToNum(Request.QueryString("id"))
nid=30
rs.open "select * from category where cateid="&nid,conn,1,1
if not rs.eof then
	cateid=rs("cateid")
	parentid=rs("parentid")
	sonid=rs("sonid")
	followid=rs("followid")	
	catetype=rs("catetype")
	modeltype=rs("modeltype")
	catename= rs("catename")		
	com_title=rs("title")
	Com_Content=rs("content")
	depth =rs("depth")
	catedir=rs("catedir")
	
	xmname= replace(catename,"培训","")
	if com_title="" or isnull(com_title) then com_title=catename
else
	response.write "网址传递参数有误"
	response.End()

end if
rs.close


%>
<!--#include virtual="/lmenu.asp"-->
<!--#include virtual="/top.asp"-->

<section id="container">
			<div class="contentBox">
				<div class="historyBox">
					<h2><em>我们的口号<span>A.O.Smith slogan</span></em></h2>
					<p>通过研究，寻找一种更好的方式。
						<span>Through Research, a better way</span>
					</p>
					<h2><em>我们的理念<span>A.O.Smith philosophy</span></em></h2>
					<p>对质量的不懈追求
						<span>A clear-eyed pursuit of quality</span>
					</p>
					<h2><em>对技术的笃信<span>An abiding belief in technology</span></em></h2>
					<p>对质量的不懈追求
						<span>A clear-eyed pursuit of quality</span>
					</p>

					<p>坚守商业道德准则
						<span>An unwavering set of business ethics</span>
					</p>
					<p>无所畏惧应对变化
						<span>A fearless commitment to change</span>
					</p>
					<p>对员工负责
						<span>A commitment to its employees</span>
					</p>
					<h2><em>我们的价值观<span>A.O.Smith Values</span></em></h2>
					<p>争创利润，力求发展
						<span>Achieve profitable growth</span>
					</p>
					<p>重视科研，不断创新
						<span>Emphasize innovation</span>
					</p>
					<p>遵纪守法，保持声誉
						<span>Preserve a good name</span>
					</p>
					<p>一视同仁，工作愉快
						<span>Be a good place to work</span>
					</p>
					<p>保护环境，造福社区
						<span>Be a good citizen</span>
					</p>
					<h2><em>价值观推动活<span>Values Recognotion Program</span></em></h2>
					<p>A.O.史密斯从1995年开始开展的价值观推动活动，已成为公司最显著与受欢迎的活动之一。 价值观推动活动之所以能如此受欢迎的一个重要原因是它充分赏识那些能将公司价值观融入工作的行为，如提供优质的客户服务、参与公益活动回报社会以及改进程序以帮助公司提升产量与效率。
						<br> 每位员工都能参与提名身边的同事…
						<br>由于您的提名参与，在过去9年中我们已经授予了来自33个地区的数百名员工获得价值观推动的奖励。
						<br>客户满意奖
						<br>我们肯定在产品质量、客户服务、技能培训等相关工作中做出突出成绩，并超出客户期望值的个人或团队。
						<br>产品创新奖
						<br>我们肯定在参与新产品研发和市场推广中做出杰出贡献的员工和团队，同时也肯定为适应市场需求而对现有产品进行改进的个人或团队。被提名的新产品或改进产品必须是在本年内开发或改进成功并推向市场。
						<br>环保贡献奖
						<br>我们肯定在预防环境污染或减少废弃物排放方面做出杰出贡献的员工。被提名的环保行为强调是自觉自愿而非政府行为。
						<br>公益活动参与奖
						<br>我们肯定在造福社区、参与公益活动方面投入时间和精力的个人或团队。但为公司赞助的社会服务机构工作的员工不在提名范围之内。
						<br>管理流程改进奖
						<br>我们肯定在财会制度、信息技术、物流后勤等管理流程改进方面做出贡献的员工及团队。
						<br>生产流程改进奖
						<br>我们肯定在生产制造、运输配销等流程方面做出改进的个人或团队，包括改进质量，提高效率，减少浪费，解决瓶颈问题或引进新的工艺。
						<br>工作场所安全奖
						<br>我们肯定在创建安全工厂方面做出贡献的个人及团队。诸如为设备安装新防护装置以减少事故发生，为消除工作区潜在危险而提出的改进措施等。被提名的安全行为强调自觉自愿。
					</p>
				</div>
				<ul id="accordion" class="accordion">
					<li>
						<div class="subNav business_activityNav">
							<a href="javascript:;">
								<em>五项基本原则<span>Five Principles</span></em>
								<i class="contraction">展开</i>
							</a>
						</div>
						<div class="navContent business_activityContent">
							<p>在艾欧史密斯公司，为了营造良好的沟通氛围，使得人与人之间的工作交流更加职业化和高效率，所有进入公司的员工都安排参加题为 “ 用基本原则营造合作氛围 ” 的培训课程。该培训告诉员工在史密斯公司所提倡的日常工作中与周围人交流的 “ 五项基本原则 ” 。通过多年的持续推行，目前该五项原则已经成为员工处理日常事务非常重要的行为准则，并业已成为大家的共识。这五个基本原则是：
								<br>对事不对人 <span>Focus on the behavior ,not the person;</span>
								<br>维护他人的自信和自尊<span>Respect people’s self-confidence and self-esteem;</span>
								<br>保持建设性关系<span>Maintain constructive relationship with others;</span>
								<br>主动改善情况<span>Take initiative to make things better;</span>
								<br>以身作则<span>Lead by example.</span>
							</p>
						</div>
					</li>
					<li>
						<div class="subNav business_activityNav">
							<a href="javascript:;">
								<em>A.O.Smith卓越管理人员胜利力模型<span>Victory Force Model Management Excellence</span></em>
								<i class="contraction">展开</i>
							</a>
						</div>
						<div class="navContent business_activityContent">
							<p>团队领导
								<span>Teamwork</span>
							</p>
							<p>结果导向
								<span>Result-Driven</span>
							</p>
							<p>创新能力
								<span>Innovation</span>
							</p>
							<p>专业能力
								<span>Professionalism</span>
							</p>
							<p>激情
								<span>Passion</span>
							</p>

						</div>
					</li>
					<li>
						<div class="subNav business_activityNav">
							<a href="javascript:;">
								<em>用心管理原则<span>Hear Principles</span></em>
								<i class="contraction">展开</i>
							</a>
						</div>
						<div class="navContent business_activityContent">
							<p>倾听并理解我
								<span>Hear and understand me.</span>
							</p>
							<p>即使你不同意我，请不要否定我这个人
								<span>Even if you disagree, please don’t make me wrong.</span>
							</p>
							<p>承认我的伟大之处
								<span>Acknowledge the greatness within me.</span>
							</p>
							<p>记得寻找我良好的意图
								<span>Remember to look for my loving intentions.</span>
							</p>
							<p>用怜恤的心告诉我事实的真相
								<span>Tell me the truth with compassion</span>
							</p>
						</div>
					</li>
					<li>
						<div class="subNav business_activityNav">
							<a href="javascript:;">
								<em>ASTAR项目<span>ASTAR Program</span></em>
								<i class="contraction">展开</i>
							</a>
						</div>
						<div class="navContent business_activityContent">
							<p>在A.O.史密斯，每位员工都会像为客户服务一样服务于他们的同事，这就是A.O.史密斯公司所倡导的“内部客户服务”(ASTAR)。通过不断增强的内部服务意识，以及不断的沟通，使我们的公司更加高效的运转。我们会对每个部门进行ASTAR的调查，并通过对调查结果的分析，不断改善我们的内部客户服务质量。这些选项包括：
							</p>
							<p>关注
								<span>Attention</span>
							</p>
							<p>速度
								<span>Speed</span>
							</p>
							<p>可靠
								<span>Trustworthiness</span>
							</p>
							<p>准确
								<span>Accuracy</span>
							</p>
							<p>有能力
								<span>Resourcefulness</span>
							</p>
						</div>
					</li>
					<li>
						<div class="subNav business_activityNav">
							<a href="javascript:;">
								<em>充满激情的各种活动<span>Activites</span></em>
								<i class="contraction">展开</i>
							</a>
						</div>
						<div class="navContent business_activityContent">
							<p>A.O.史密斯公司的员工都有非常多的机会参加各式各样的团队活动，并在这些活动中寻找到大家庭一样的感觉。这些活动包括：
							</p>
							<p>Family Day
								<span>每年六一，有孩子的员工都会带上自己的孩子和家人，来公司参加各种有趣的活动，并且让家人和孩子了解他们的亲人在A.O.史密斯是如何工作的。</span>
							</p>

							<p>与春天互动
								<span>随着天气渐暖，各种室外活动也格外丰富。我们会和家人一起，参加史密斯的活动，充分享受大自然。</span>
							</p>

							<p>旅游
								<span>每位史密斯员工都可以参加公司组织的旅游活动，或自己组成团队前往心仪的旅游胜地。</span>
							</p>
							<p>春节晚会
								<span>每年总公司的春节晚会总是非常精彩，而且所有的节目都是员工原创的。</span>
							</p>
							<p>体育活动
								<span>足球、篮球、健身、羽毛球……只要你想运动，在史密斯就能找到伙伴！</span>
							</p>
						</div>
					</li>
				</ul>
			</div>
	 
 
 
			<div class="clear "></div>
			
		</section>
  <script type="text/javascript">
			$(function() {
				var Accordion = function(el, multiple) {
					this.el = el || {};
					this.multiple = multiple || false;
					// Variables privadas
					var links = this.el.find('.subNav');
					// Evento
					links.on('click', {
						el: this.el,
						multiple: this.multiple
					}, this.dropdown)
				}
				Accordion.prototype.dropdown = function(e) {
					var $el = e.data.el;
					$this = $(this),
						$next = $this.next();
					$next.slideToggle();
					$this.parent().toggleClass('open');
					if (!e.data.multiple) {
						$el.find('.navContent').not($next).slideUp().parent().removeClass('open');
					};
				}
				var accordion = new Accordion($('#accordion'), false);
			});
		</script>

<!--#include virtual="/blink.asp"-->



<!--#include virtual="/foot.asp"-->
<footer class="footer1">
			<ul>
				<li><a  href="history.asp">142年历程</a></li>
				<li><a href="brand.asp">品牌介绍</a></li>
				<li><a class="footer_curr" href="culture.asp">企业文化</a></li>
				<li><a style="border-right: 0px;" href="activity.asp">企业活动</a></li>
			</ul>
		</footer>