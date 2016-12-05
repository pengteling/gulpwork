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
					<!-- <span style=" text-align: center; display: block;"><img style="width: 30%;" src="images/history/Signs_icon.png"/></span> -->
					<div class="timelineBox">
						<div class="timeline"><img class="width_covered" src="images/history/timeline.png"></div>
						<div class="datesBox" >
							<ul class="dates">
								<div class="swiper-container" id="swiper-container2">
									<div class="swiper-wrapper">
										<li class="swiper-slide pOne"><img  width="20px;" src="images/history/time_dotCurrent.png" />
											<div class="years current">2000</div>
										</li>
										<li class="swiper-slide pTwo"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">2004</div>
										</li>
										<li class="swiper-slide pOne"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">2012</div>
										</li>
										<li class="swiper-slide pOne"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">2014</div>
										</li>
										<li class="swiper-slide pTwo"><img width="20px;" src="images/history/time_dot.png" />
											<div class="years ">2015</div>
										</li>
										
									</div>
								</div> </ul>
						</div>
					</div>
				</div>
				<div class="swiper-container" id="swiper-container1" style="margin-top: 0.85rem;">
					<div class="swiper-wrapper">
						<div class="swiper-slide yearsTime"><img data-src="images/history/cq-1.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/cq-2.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/cq-3.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/cq-4.jpg"  class="swiper-lazy"/></div>
						<div class="swiper-slide yearsTime"><img data-src="images/history/cq-5.jpg"  class="swiper-lazy"/></div>
						
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
