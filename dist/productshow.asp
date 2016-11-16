<!--#include file="fiveinc/inc.asp"-->
<!--#include file="FiveInc/Check_Sql.asp"-->
<!--#include file="FiveInc/page.asp"-->

<%

ispshow=1
newsid=strToNum(Request.QueryString("id"))

rs.open "select * from product where id="&newsid&" ",conn,1,3
if not rs.eof then
rs("hits")=rs("hits")+1
rs.update
nid =rs("cateid")
cateid=nid
newstitle=rs("title")
News_Content=rs("content")
content_zy =rs("content_zy")
posttime=formatdate(rs("posttime"),5)
author=rs("ComeFrom")
price=rs("price")
price_yuan=rs("price_yuan")
price_now=rs("price_now")

productNo=rs("productNo")
pinming=		rs("pinming")
chandi=		rs("chandi")
guige=		rs("guige")
pingji=		rs("pingji")
		
		
defaultpicurl=rs("defaultpicurl")
hits=rs("hits")
uploadfiles=rs("uploadfiles")
uploadfiles=split(uploadfiles,"|")
if ubound(uploadfiles)<1 then
redim uploadfiles(0)
uploadfiles(0)="/images/nopic.jpg"
end if

a=instr(1,News_Content,"<a href=",1)+9
	if a>9 then
	b=instr(a+1,news_content,"""")
	
	downfileurl =mid(news_content,a,b-a)
	
	'response.write "http://"&Request.ServerVariables("Http_Host")&downfileurl
	if instr(lcase(downfileurl),"uploadfile")>0 then
	response.Redirect(downfileurl)
	end if
	end if
else
response.write "该文章不存在或未通过审核！"
response.end
end if
rs.close




rs.open "select * from category where cateid="&nid,conn,1,1
if not rs.eof then
	parentid=rs("parentid")
	sonid=rs("sonid")
	followid=rs("followid")	
	catetype=rs("catetype")
	modeltype=rs("modeltype")
	catename= rs("catename")		
	title=rs("title")
	Com_Content=rs("content")
  catepic = rs("defaultpicurl")

else
	response.write "网址传递参数有误"
	response.End()

end if
rs.close



%>

<!--#include virtual="/lmenu.asp"-->
<%
curpagetitle = newstitle &"-"&curpagetitle
%>
<!--#include virtual="/top.asp"-->
<script src="http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion=402912"></script>
<div id="container">
   
    <div style="background:url(./images/bg_shu.png) no-repeat center; -moz-background-size:100% 100%;background-size:100% 100%;">
       <div></div>
      <div id="all_product"  >
            
          <div class="swiper-container" id="product_swiper-container">
              <div class="swiper-wrapper">
              
<%
rs.open "select * from product where cateid="&cateid&" order by elite desc,px desc,id desc",conn,1,1
k=0
while not rs.eof
%>
                  <div class="swiper-slide"  >
                <img  id="product_img_<%=k%>" class="img_mask" onclick="window.location.href='?id=<%=rs("id")%>'" style="width:80%;margin-top:20px;" src="<%=rs("defaultpicurl")%>"></img>
                <div class="title sansserif" style="color: #c7c9d5;text-overflow:ellipsis; white-space:nowrap; overflow:hidden;font-size:13px;"><%=rs("productNo")%></div>
            </div>

<%
if newsid = rs("id") then
  currentNo = k
end if
k=k+1
rs.movenext
wend
rs.close

%>
              

                  
              
                  
              </div>
   
          </div>
      </div>
      <div class="img_mask" style=" width:100%;border-bottom:1px solid #3f4a68; margin-top:22px; text-align: center" ></div>  
      
      <div style="margin-top:20px;margin-bottom:30px; text-align: center"><img height="28" src="<%=catepic%>"/></div>
      
      <div id="show_product">
            
          <div class="swiper-container" id="show_swiper-container">
              <div class="swiper-wrapper">
                <%
                for i=0 to ubound(uploadfiles)-1
                %>
                  <div class="swiper-slide" style="text-align: center;"><img style="width:50%; " src="<%=uploadfiles(i)%>"></img></div>
                <%
                next
                %>
              </div>
              
                <!-- Add Arrows -->
              <div style="margin-top:-70px;">
              <div class="swiper-button-next" style="float:right;position:relative;    width: 13px;height: 22px;background-size:12px 22px;" ></div>
              <div class="swiper-button-prev" style="float:left;position:relative;width: 13px;height: 22px;background-size:12px 22px;" ></div>
              </div>
              <!-- Add Pagination -->
              <div class="swiper-pagination" style="margin-top:80px;position:relative;"></div>
              <div style="color:#ffffff;font-size:18px; text-align: center"><%=productNo%></div>

          </div>
      </div>
      
      <%=pingji%>
      
      <!-- <div class="function_div" style="margin-top:50px;height:150px;padding-bottom:50px;">
        <ul style="padding-left:15%;color:white;">
           
           <li class="text_column_1" style="text-align:left;height:50px;line-height: 50px;font-size:15px;"><img style="width:30px;margin-right:5px;vertical-align:middle;" src="http://7xodmp.com1.z0.glb.clouddn.com/01e045f0-1c10-4686-a70c-0a33103d2b8d.png"></img>热力按需调配</li>
      
            
           <li class="text_column_1" style="text-align:left;height:50px;line-height: 50px;font-size:15px;"><img style="width:30px;margin-right:5px;vertical-align:middle;" src="http://7xodmp.com1.z0.glb.clouddn.com/04ec0f25-c8a0-44f2-b17a-700aba86936d.png"></img>系统效率更优化</li>
      
            
           <li class="text_column_1" style="text-align:left;height:50px;line-height: 50px;font-size:15px;"><img style="width:30px;margin-right:5px;vertical-align:middle;" src="http://7xodmp.com1.z0.glb.clouddn.com/cfae1ba5-5b5e-4c82-a43d-6de771173853.png"></img>费用更省</li>
      
            
        </ul>
      </div> -->
      
    </div>
    <div style="background-color:#1d293f;height:50px;line-height: 50px; font-size: 18px; text-align: center;" id="product_detail_title">
       <div id="product_detail_btn" style="float:left;width:33%;color:#ffffff;"> 产品详情<div style="margin:0 auto;height:2px;width:50%;background-color:#266ff2;"></div> </div>
       <div id="product_para_btn" style="float:left;width:33%;color:#8d949e;"> 产品参数<div class="displayNone" style="margin:0 auto;height:2px;width:50%;background-color:#266ff2;"></div></div> 
       <div id="product_store_btn" style="float:left;width:33%;color:#8d949e;">分享</div>
 
    </div>
    <div class="product_detail">
          
         <%=news_content%>
    
            
    </div> 
     
    
    <div class="product_para displayNone" >
      
    </div>
    <div class="product_para displayNone">
<%=guige%>

</div>
  </div>
  
  <div class="clear"></div>



<script>
  window._bd_share_config = {
    common : {
      bdText : '产品详情',  
      bdDesc : '产品详情',  
      bdUrl : window.location.href,   
      bdPic : ''
    },
    share : [{
      "bdSize" : 16
    }],
    selectShare : [{
      "bdselectMiniList" : ['qzone','tqq','kaixin001','bdxc','tqf']
    }]
  }
  var swiper1 = new Swiper('#product_swiper-container', {
      
        slidesPerView: 3,
        paginationClickable: true,
        spaceBetween: 30,
 
        freeMode: true
    });    
      var swiper = new Swiper('#show_swiper-container', {
        pagination: '.swiper-pagination',
        paginationClickable: true,
      nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        spaceBetween: 30,
        autoHeight: true, //enable auto height
    });   
    var share_show_click = 0;
  $(document).ready(function(){ 
      
  
 
    $("#product_store_btn").click(function(){
      $(".share_top_div").removeClass("displayNone");
      share_show_click = 1;
    });
    $("#share_cancle").click(function(){
      share_show = 0;
      $(".share_top_div").addClass("displayNone");
    });
     
      bodyclick = document.getElementsByTagName('body').item(0);
 
      bodyclick.onclick = function(){
        if(share_show_click != 1){
          $(".share_top_div").addClass("displayNone");
          share_show = 0;
        }
        share_show_click = 0;
      };
      
    swiper1.slideTo(<%=currentNo%>,0); //跳转到第几
     $("#product_img_<%=currentNo%>").removeClass("img_mask");
  
    $("#product_detail_btn").click(function(){
      $(".product_detail").removeClass("displayNone");
      $("#product_detail_btn div").removeClass("displayNone");
      $(".product_para").addClass("displayNone");
      $("#product_para_btn div").addClass("displayNone");
      
      $("#product_detail_btn").css('color','#ffffff');
      $("#product_para_btn").css('color','#8d949e');
    });

    $("#product_para_btn").click(function(){
      $(".product_detail").addClass("displayNone");
      $("#product_detail_btn div").addClass("displayNone");
      $(".product_para").removeClass("displayNone");
      $("#product_para_btn div").removeClass("displayNone");
      
      $("#product_detail_btn").css('color','#8d949e');
      $("#product_para_btn").css('color','#ffffff');
    });
    

    
    $("#product_ul li").each(function(){
      $(this).click(function(){
         
        window.location = $(this).find(".url").text();
        //window.location = "";
      });
    });

    
    
    $(".product_para table").css("border","solid 1px #3B4151");
    $(".product_para table").css("width","100%");
    $(".product_para table").css("font-size","15px");
    
    $(".product_para table td").css("border","solid 1px #3B4151");
    $(".product_para table td").css("height","50px");
     
    $(".product_para table").css("color","#ffffff"); 
    
    var title = $("#product_detail_title");
    var titleY = title.offset().top;
    window.onscroll = function() {
    var top = document.documentElement.scrollTop || document.body.scrollTop;
    console.log(top);
    console.log(titleY);
    top+=37;
     
    if (top > titleY) {
      title.addClass("product_detail_title_css");
       
     
    } else {
      title.removeClass("product_detail_title_css");
    }
  }
});


  function gotoProduct(cat, id){
    window.location = "./product.jsp?category="+cat+"&product_id=" + id;
  }
 

 </script>
<!--#include virtual="/blink.asp"-->
<!--#include virtual="/foot_p.asp"-->


