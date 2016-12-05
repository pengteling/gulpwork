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

<section id="container" style="margin-top:0.5rem;">
			<div class="contentBox">
				<div class="timeBox">
					<span style=" text-align: center; display: block;"><img style="width: 30%;" src="images/history/Signs_icon.png"/></span>
					<div class="timelineBox">
						<div class="timeline"><img class="width_covered" src="images/history/timeline.png"></div>
						<div class="datesBox" >
							<ul class="dates">
								<div class="swiper-container" id="swiper-container2">
									<div class="swiper-wrapper">
										<li class="swiper-slide pOne"><img  width="20px;" src="images/history/time_dotCurrent.png" />
											<div class="years current">1874</div>
										</li>
										<li class="swiper-slide pTwo"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">1906</div>
										</li>
										<li class="swiper-slide pOne"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">1921</div>
										</li>
										<li class="swiper-slide pOne"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">1928</div>
										</li>
										<li class="swiper-slide pTwo"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">1929</div>
										</li>
										<li class="swiper-slide pOne"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">1930</div>
										</li>
										<li class="swiper-slide pTwo"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">1936</div>
										</li>
										<li class="swiper-slide pOne"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">1970</div>
										</li>
										<li class="swiper-slide pTwo"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">1974</div>
										</li>
										<li class="swiper-slide pOne"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">1985</div>
										</li>
										<li class="swiper-slide pTwo"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">1992</div>
										</li>
										<li class="swiper-slide pOne"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">1998</div>
										</li>
										<li class="swiper-slide pTwo"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">2004</div>
										</li>
										<li class="swiper-slide pOne"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">2008</div>
										</li>
										<li class="swiper-slide pTwo"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">2009</div>
										</li>
										<li class="swiper-slide pOne"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">2009</div>
										</li>
										<li class="swiper-slide pTwo"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">2010</div>
										</li>
										<li class="swiper-slide pOne"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">2012</div>
										</li>
										<li class="swiper-slide pTwo"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">2012</div>
										</li>
										<li class="swiper-slide pOne"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">2013</div>
										</li>
										<li class="swiper-slide pTwo"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">2013</div>
										</li>
										<li class="swiper-slide pTwo"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">2014</div>
										</li>
									</div>
								</div> </ul>
						</div>
					</div>
				</div>
				<div class="swiper-container" id="swiper-container1">
					<div class="swiper-wrapper">
						<div class="swiper-slide yearsTime"><img data-src="images/history/1874.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/1906.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/1921.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/1928.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/1929.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/1930.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/1936.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/1970.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/1974.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/1985.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/1992.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/1998.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/2004.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/2008.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/2009.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/2009-2.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/2010.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/2012.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/2012-2.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/2013.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/2013-2.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/2014.jpg"  class="swiper-lazy"/></div>
					</div>
				</div>
				<!-- Initialize Swiper -->
				<script>
					var mySwiper = new Swiper('#swiper-container1', {
						slidesPerView: 1,
						  preloadImages: false,
        // Enable lazy loading
        lazyLoading: true,
						onSlideChangeEnd:function(swiper){
							Swiper.slideTo(mySwiper.activeIndex);
							$("#swiper-container2 li div").each(function(){
								$(this).removeClass("current");
							});
							$(Swiper.slides[mySwiper.activeIndex]).find("div").addClass("current");
							 
						}
					})
					var Swiper = new Swiper('#swiper-container2', {
						slidesPerView: 3,
						spaceBetween: 55,
						freeMode: false,
						watchSlidesProgress: true,
						watchSlidesVisibility: true,
						onTap: function() {
							mySwiper.slideTo(Swiper.clickedIndex);
						}
					})
					
 
				</script>
			</div>
 

			<div class="clear "></div>

		</section>
  

<!--#include virtual="/blink.asp"-->



<!--#include virtual="/foot.asp"-->
<footer class="footer1">
			<ul>
				<li><a class="footer_curr"  href="history.asp">142年历程</a></li>
				<li><a href="brand.asp">品牌介绍</a></li>
				<li><a href="culture.asp">企业文化</a></li>
				<li><a style="border-right: 0px;" href="activity.asp">企业活动</a></li>
			</ul>
		</footer>