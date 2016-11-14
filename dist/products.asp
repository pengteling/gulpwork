<!--#include file="fiveinc/inc.asp"-->
<!--#include file="FiveInc/Check_Sql.asp"-->
<!--#include file="FiveInc/page.asp"-->
<%
nid=strToNum(Request.QueryString("id"))
rs.open "select * from category where cateid="&nid,conn,1,1
if not rs.eof then
	cateid=nid
	parentid=rs("parentid")
	sonid=rs("sonid")
	followid=rs("followid")	
	catetype=rs("catetype")
	modeltype=rs("modeltype")
	catename= rs("catename")		
	title=rs("title")
	Com_Content=rs("content")

else
	response.write "网址传递参数有误"
	response.End()

end if
rs.close



%>
<!--#include virtual="/lmenu.asp"-->
<!--#include virtual="/top.asp"-->


<div id="container">
 
	<div id="category">
		
		
			<div class="swiper-container" id="product_swiper-container">
			        <div class="swiper-wrapper">
			      
		 			

			            <div class="swiper-slide" >
			             <img   style=" width:100%;  "  src="images/a4aba2c5-1735-4279-97f3-8902e686d766.jpg" />
			            </div>
				  

			            <div class="swiper-slide" >
			             <img   style=" width:100%;  "  src="images/d3a78a93-166a-4d1e-8775-296c34b19ec5.jpg" />
			            </div>
				  

			            <div class="swiper-slide" >
			             <img   style=" width:100%;  "  src="images/1d6ae8ce-37cc-4e28-b0ab-da987dcbba58.jpg" />
			            </div>
				        
			        
			        </div>
			        <div class="swiper-pagination" style="margin-top: -10px;position:relative;"></div>
		</div>	 
	</div>
	<div style="margin-top:1px;"></div>
	
<%
arr_colors = Array("#2da8ed","#2d71ed","#17a9b2","#4d78bc")
set rs2=server.createobject("Adodb.recordset")
rs2.open "select * from category where followid="&cateId_d2&" order by orderid ",conn,1,1
k=-1
while not rs2.eof
k=k+1
%>
	<div  id="product" class="clear productUI" style="background-color:#1a2031;">
			<div class="img_mask" style=" width:100%;border-bottom:1px solid #3f4a68; " ></div>	
			<div id="title"  class="title"  style="background-color:#1a2031;height:57px;line-height:57px;color:#2d71ed;text-align:left;">
			<div id="catvalue" class="displayNone"><%=rs2("cateid")%></div>
			
			<div style="float:left;height:57px;width:5px;background-color:<%=arr_colors(k)%>;"></div>
			
			<div style="float:left;margin-left:15px;font-size:16px;color:#ffffff"><%=rs2("catename")%></div>
			<div style="float:right;width:30px;height:57px;"><img  id="product_ul_img_105"  height="18" width="18"   style="margin-top:20px;" src="./images/arrow_right.png" /></div>
			</div>
			
			<div class="clear"></div>
			<ul id="product_ul_<%=rs2("cateid")%>"  class="displayNone product_class" style="padding-top:10px;padding-left:10px;padding-right:10px; color:white;">
				
				<%
				rs.open "select * from product where cateid="&rs2("cateid")&" order by elite desc, px desc,posttime desc", conn,1,1
				while not rs.eof

				%>
					 <li ><a href="productShow.asp?id=<%=rs("id")%>"><div  style="background:url(./images/product.jpg) no-repeat center;padding:10px;font-size:15px;"><img style="width:100%;" src="<%=rs("defaultpicurl")%>"></img>
					 
					 
					 <div  style="height:50px;margin-top:15px;"><div class="text_column_2" style="text-align:center;color:#fff"> <%=rs("title")%></div></div> 
					 
					 </div></a></li>
				<%				
				rs.movenext
				wend
				rs.close
				%>
				 
					
				 
					 
			</ul>
			<div class="clear "></div>
			
	</div>
	<%
	rs2.movenext
wend
rs2.close
%>
	
	
	
	
	
</div>

<script>
	  var swiper1 = new Swiper('#product_swiper-container', {
        slidesPerView: 1,
        paginationClickable: true,
		pagination: '.swiper-pagination',
        spaceBetween: 30
    });
    
    
 	$(document).ready(function(){	
 	   //$("#bottom1").load("./bottom.html");
 
	   $(".title").each(function() {
	   		$(this).click(function(){
				var cat = $(this).find("#catvalue").text();
				
				if($("#product_ul_"+cat).hasClass("displayNone")){
					$("#product_ul_"+cat).removeClass("displayNone");
					$("#product_ul_img_"+cat).attr("src","./images/arrow_down.png");
				}else{
					$("#product_ul_"+cat).addClass("displayNone");
					$("#product_ul_img_"+cat).attr("src","./images/arrow_right.png");
				}
				

			});
 			 
	  });
});
</script>


<!--#include virtual="/blink.asp"-->
<!--#include virtual="/foot.asp"-->

