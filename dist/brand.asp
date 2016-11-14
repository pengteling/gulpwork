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
					<p class="paddings_bottom align_left border_bottom font_white font14 line_height22" style="margin-top: 37px;">艾欧史密斯（中国）热水器有限公司（以下称A.O.史密斯）从1874年到2016年，从美国到全球各大洲，从商用领域到家用领域，从婴儿车金属零件、五金件的生产商到水系统的高品质产品和解决方案的提供者，A.O.史密斯缔造了长达142年的不朽传奇。在这142年里，A.O.史密斯专注研发、不断创新，始终坚持主推高品质的产品和服务。正是因为这份坚持和严守，A.O.史密斯才能始终走在行业领先地位，并在全球创造了一个又一个行业奇迹。与历史对话，与时光共舞，让我们一同踏上A.O.史密斯142周年的时光之旅吧！</p>
					<div class="brand_video">
						<div class="fle percent47">
							<a href="http://7xodmp.com1.z0.glb.clouddn.com/goodway1.mp4"><img class="width_covered" src="images/Brand_video01.jpg"></a>
							<p>
								<i class="video_icon fle"><a href="http://7xodmp.com1.z0.glb.clouddn.com/goodway.mp4"><img src="images/video_icon.png"></a></i>
								<em class="fle">通过研究寻找一种更好的方式</em>
							</p>
						</div>
						<div class="fri percent47">
							<a href="http://7xodmp.com1.z0.glb.clouddn.com/142history.mp4"><img class="width_covered" src="images/Brand_video02.jpg"></a>
							<p>
								<i class="video_icon fle"><a href="http://7xodmp.com1.z0.glb.clouddn.com/142history.mp4"><img src="images/video_icon.png"></a></i>
								<em class="fle">142年创新历史</em>
							</p>
						</div>
					</div>
					<div class="brand_video">
						<div class="fle percent47">
							<a href="http://7xodmp.com1.z0.glb.clouddn.com/142ad.mp4"><img class="width_covered" src="images/Brand_video03.jpg"></a>
							<p>
								<i class="video_icon fle"><a href="http://7xodmp.com1.z0.glb.clouddn.com/142ad.mp4"><img src="images/video_icon.png"></a></i>
								<em class="fle">142 年研发篇广告</em>
							</p>
						</div>
						<div class="fri percent47">
							<a href="http://7xodmp.com1.z0.glb.clouddn.com/52year.mp4"><img class="width_covered" src="images/Brand_video04.jpg"></a>
							<p>
								<i class="video_icon fle"><a href="http://7xodmp.com1.z0.glb.clouddn.com/52year.mp4"><img src="images/video_icon.png"></a></i>
								<em class="fle">52年使用奇迹篇</em>
							</p>
						</div>
					</div>

				</div>

			</div>
 
 
 
			<div class="clear "></div>
			
		</section>
  

<!--#include virtual="/blink.asp"-->
<!--#include virtual="/foot.asp"-->
<footer class="footer1">
			<ul>
				<li><a  href="history.asp">142年历程</a></li>
				<li><a class="footer_curr" href="brand.asp">品牌介绍</a></li>
				<li><a href="culture.asp">企业文化</a></li>
				<li><a style="border-right: 0px;" href="activity.asp">企业活动</a></li>
			</ul>
		</footer>