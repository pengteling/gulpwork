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
					<img class="width_covered" src="images/business_activity_img01.jpg">
				</div>
				<ul id="accordion" class="accordion">
					<li class="open">
						<div class="subNav business_activityNav">
							<a href="#">
								<em>相关背景简介<span>A background introduction</span></em>
								<i class="contraction"></i>
							</a>
						</div>
						<div class="navContent business_activityContent" style="display: block;">
							<p>“价值观推动”活动是美国总部自1995年开始发起,至今已有20周年了，现已成为A.O.史密斯公司最具影响力和最受欢迎的活动之一。今年，我们仍将大力推广2015年价值观推动活动，旨在更深层次地挖掘将A. O. 史密斯价值观真正融入到平时工作和生活中的员工和团队，同时对他们做出的特别贡献进行认可，并通过各种形式的宣传活动激励其他员工采取更加积极主动的行动，令价值观真正深入人心。</p>
							<p>A. O.史密斯以其独有的价值观把我们凝聚在一起，也使得从1874年至今141年的传统得以传承。这些价值观提供了一套指导方针，告诉我们A.O.史密斯公司是如何对待员工以及如何成为良好的社会公民，同时也告诉我们的员工，作为一个公司，我们所重视的是：
								<br> 为我们的客户提供一流的服务并希望他们不断成功；
								<br> 提高公司的运作效率和所有员工的工作效率；
								<br> 不断创新和坚持研究与技术的恒久信念；
								<br> 为我们的员工提供安全的工作环境；
								<br> 让我们的员工成为良好公民。
							</p>
						</div>
					</li>
					<li>
						<div class="subNav business_activityNav">
							<a href="#">
								<em>公司的价值观<span>A.O.Smith Values</span></em>
								<i class="contraction">展开</i>
							</a>
						</div>
						<div class="navContent business_activityContent">
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
						</div>
					</li>
					<li>
						<div class="subNav business_activityNav">
							<a href="#">
								<em>价值观推动活动7个奖项介绍<span>Values to promote activities seven awards</span></em>
								<i class="contraction">展开</i>
							</a>
						</div>
						<div class="navContent business_activityContent">
							<p>客户满意奖
								<span>我们肯定在产品质量、客户服务、技能培训等相关工作中做出突出成绩，并超出客户期望值的个人或团队。</span>
							</p>
							<p>产品创新奖
								<span>我们肯定在参与新产品研发和市场推广中做出杰出贡献的员工和团队，同时也肯定为适应市场需求而对现有产品进行改进的个人或团队。被提名的新产品或改进产品必须是在本年内开发或改进成功并推向市场。</span>
							</p>
							<p>环保贡献奖
								<span>我们肯定在预防环境污染或减少废弃物排放方面做出杰出贡献的员工。被提名的环保行为强调是自觉自愿而非政府行为。</span>
							</p>
							<p>公益活动参与奖
								<span>我们肯定在造福社区、参与公益活动方面投入时间和精力的个人或团队。但为公司赞助的社会服务机构工作的员工不在提名范围之内。</span>
							</p>
							<p>管理流程改进奖
								<span>我们肯定在财会制度、信息技术、物流后勤等管理流程改进方面做出贡献的员工及团队。</span>
							</p>
							<p>生产流程改进奖
								<span>我们肯定在生产制造、运输配销等流程方面做出改进的个人或团队，包括改进质量，提高效率，减少浪费，解决瓶颈问题或引进新的工艺。</span>
							</p>
							<p>工作场所安全奖
								<span>我们肯定在创建安全工厂方面做出贡献的个人及团队。诸如为设备安装新防护装置以减少事故发生，为消除工作区潜在危险而提出的改进措施等。被提名的安全行为强调自觉自愿。</span>
							</p>
						</div>
					</li>
					<li>
						<div class="subNav business_activityNav">
							<a href="#">
								<em>活动日程<span>schedule</span></em>
								<i class="contraction">展开</i>
							</a>
						</div>
						<div class="navContent business_activityContent">
							<p>2015年9月28日
								<span>2015年价值观推动活动正式启动，请注意我们的宣传海报、手册、邮件、短信等相关宣传。</span>
							</p>
							<p>2015年10月31日（敬请留意）
								<span>提交提名的截止日期，所有提名应该在此日期之前提交，以进行统计整理。</span>
							</p>
							<p>2015年11月16日
								<span>南京工厂管理层评选提名，确定“南京总部季度价值观当选奖”和“南京总部季度价值观入围奖”名单。</span>
							</p>
							<p>2015年11月23日
								<span>2015年价值观推动活动获奖者名单在此日期公布</span>
							</p>
						</div>
					</li>
					<li>
						<div class="subNav business_activityNav">
							<a href="#">
								<em>评选细则<span>The selection rules</span></em>
								<i class="contraction">展开</i>
							</a>
						</div>
						<div class="navContent business_activityContent">
							<p>为体现价值观活动的公平公正性，2015年我们将推行如下的评选方法：
							</p>
							<p>2015年11月2日
								<span>总裁办将已分类的提名表格交由各相应体系进行筛选提炼</span>
							</p>
							<p>2015年11月2日 ---- 2015年11月6日
								<span>各体系对提名进行筛选提炼并按照规定格式进行项目内容填写</span>
							</p>
							<p>2015年11月9日
								<span>各体系提交提名的截止日期，所有提名应该在此日期之前提交，以进行统计整理</span>
							</p>
							<p>2015年11月16日
								<span>南京工厂管理层评选提名，确定“南京总部季度价值观当选奖”和“南京总部季度价值观入围奖”名单。</span>
							</p>
							<p>2015年11月16日---- 2015年11月20日
								<span>各体系内部确认相关项目获奖者名单</span>
							</p>
							<p>2015年11月23日
								<span>2015年价值观推动活动获奖者名单在此日期公布</span>
							</p>
						</div>
					</li>
					<li>
						<div class="subNav business_activityNav">
							<a href="#">
								<em>参与方法<span>participation method</span></em>
								<i class="contraction">展开</i>
							</a>
						</div>
						<div class="navContent business_activityContent">
							<p>我们一直努力不断改进，使价值观推动活动变得更为简单高效，2015年价值观推动活动-第一季将提供三种方便快捷的提名方式，您可以任意选择一种，完整填写相关内容：
							</p>
							<p>1、微信平台提名
								<span>扫描二维码，关注微信订阅号“艾欧史密斯企业文化推广”，回复“提名”进入提名页面，完整填写表格，点击提交即可。确认为提名有效后，可至总裁办前台处登记领取奖品</span>
							</p>
							<p style="text-align: center;">
								<img style="width: 40%;" src="images/QR_code.jpg" />
							</p>
							<p>2、 书面提名表格
								<span>2015年价值观推动活动宣传折页中含有三份提名表格，请完整填写</span>
							</p>
							<p>生产体系提名表格，请提交给内勤登记，由内勤统一交至总裁办前台处;
								<br>行管技提名，请将您的提名交给您的上级主管审核签字后，交至总裁办前台处，并领取提名奖品；
								<br>驻外体系提名，可在内勤处领取宣传折页，填写提名表以邮寄、传真或扫描的方式反馈至总裁办前台，确认为有效提名的奖品在内勤处领取。
							</p>
							<p>3、 电子邮件提名
								<span>登录公司网站www.aosmith.com.cn,进入2015年价值观推动活动专栏，在线填写提名表格，成功提交后将自动发送至Values@hotwater.com.cn信箱。确认为提名有效后，可至总裁办前台处登记领取奖品。</span>
							</p>
							<p>行政楼前台
								<span>金轩媛</span>
								<span>电话：025-85806965</span>
							</p>
							<p>全球工程中心前台
								<span>陈 红</span>
								<span>电话: 025-85806767</span>
							</p>
							<p>新工厂前台
								<span>万 方</span>
								<span>电话：025-89605982</span>
							</p>
						</div>

					</li>
					<li>
						<div class="subNav business_activityNav">
							<a href="#">
								<em>奖励办法<span>Incentives</span></em>
								<i class="contraction">展开</i>
							</a>
						</div>
						<div class="navContent business_activityContent">
							<table>
								<tr class="theadbg">
									<td style="width: 40%;">奖项</td>
									<td style="width: 30%;">奖励措施</td>
									<td class="border_none" style="width: 30%;">备注</td>
								</tr>
								<tr class="Dark_bluebg">
									<td>美国总部价值观当选奖</td>
									<td>缤纷多彩美国游</td>
									<td>美国总部颁奖仪式</td>
								</tr>
								<tr>
									<td>南京总部价值观当选奖</td>
									<td>异域风情亚洲游</td>
									<td>每个奖项5个以内</td>
								</tr>
								<tr class="Dark_bluebg">
									<td>南京总部价值观入围奖</td>
									<td>精美礼品</td>
									<td>每个奖项7个以内</td>
								</tr>
								<tr>
									<td>南京总部价值观提名奖</td>
									<td>精致小礼品一份</td>
									<td>有效提名即可获奖</td>
								</tr>
							</table>
							<p class="paddings_top">备注：
								<br> 2份有效提名限领1份礼品，3份有效提名即可领取2份礼品。
								<br>微信平台提名即可获取1份礼品
								<br>提名表格注意事项：
								<br> 1.严禁从CI系统中照抄提名；
								<br> 2.不能抄袭其他同事的提名；
								<br> 3.提名不得由他人执笔代写；
								<br> 如果未按照提名规则进行提名，则视为无效提名
							</p>
							<p style="text-align: center;">
								<a href="http://m.aosmith.com.cn/ValueMove.html
" target="_blank"><img style="width: 50%;" src="images/Click_nomination.jpg"></a>
							</p>
						</div>

					</li>
					<li>
						<div class="subNav business_activityNav">
							<a href="#">
								<em>往年获美国总部当选奖项目<span>The winning projects in previous years</span></em>
								<i class="contraction">展开</i>
							</a>
						</div>
						<div class="navContent business_activityContent">
							<p><img src="images/Awards.jpg" class="width_covered"></p>
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
				<li><a href="culture.asp">企业文化</a></li>
				<li><a class="footer_curr" style="border-right: 0px;" href="activity.asp">企业活动</a></li>
			</ul>
		</footer>