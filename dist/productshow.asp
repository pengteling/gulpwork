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
<!--#include virtual="/product_top.asp"-->


<style>
.jqzoom{
	text-decoration:none;
	float:left;
	z-index:999;
}
</style>
<script>
$(document).ready(function() {
	$('.jqzoom').jqzoom({
            zoomType: 'standard',
            lens:true,
            preloadImages: false,
            alwaysOn:false,
			position:'right'
        });
	
});
</script>
<div class="width" id="position">您所在的位置：<%=menustr%> > <%=newstitle%></div>
<div class="width">
  <div id="goodsshow" class="">
    <div class="left">
      <div class="shop_big"><a href="<%=uploadfiles(0)%>" class="jqzoom" rel='gal1' title="<%=newstitle%>" ><img src="<%=uploadfiles(0)%>" width="350" height="350" id="shop_big" alt="<%=newstitle%>" title="<%=newstitle%>" /></a>
        <div class="clear"></div>
      </div>
      <div class="shop_plist"> <a href="javascript:;" class="prev"></a>
        <div id="prolist">
          <ul>
            <%
						for i = 0 to ubound(uploadfiles)-1
						%>
            <li <%if i=0 then response.write "class=""hover"""%>><a href="javascript:void(0);" rel="{gallery: 'gal1', smallimage: '<%=uploadfiles(i)%>',largeimage: '<%=uploadfiles(i)%>'}"><img src="<%=uploadfiles(i)%>" border="0" /></a></li>
            <%
							 next
							 %>
          </ul>
        </div>
        <a href="javascript:;" class="next"></a> </div>
    </div>
    <div class="right">
      <h1 style="margin-bottom:30px;"><%=newstitle%></h1>
      
      <div class="pricebox">
      <div class="line1">
      <div class="fl">促销价</div>
      <div class="fr pricered">￥ <%=price%></div>
      <div class="fr2"></div>
      </div>
       
       <div class="line2">
       
       <div class="fl">价格</div>
       <div class="fr">￥ <del><%=price_yuan%></del> <%=price_now%>元/<%=guige%></div>
       </div>
       
        <div class="clear"></div>
      </div>
      
      <div class="gline">
        <div class="fl">品  名：</div>
        <div class="fr"><%=pinming%></div>
        <div class="clear"></div>
      </div>
      
      <div class="gline">
        <div class="fl">产  地：</div>
        <div class="fr"><%=chandi%></div>
        <div class="clear"></div>
      </div>
      
      <div class="gline">
        <div class="fl">规  格：</div>
        <div class="fr"><%=guige%></div>
        <div class="clear"></div>
      </div>
      <div class="gline">
        <div class="fl">评  级：</div>
        <div class="fr"><%=pingji%></div>
        <div class="clear"></div>
      </div>
    
    
    <div class="zybox">
    <%=content_zy%>
    </div>
     
    
    </div>
    
    <div class="right2">
    
    
     <div class="im-3">
      <div class="hd">
        <ul>
        </ul>
      </div>
      <div class="bd">
        <ul>
        
         <%
		rs.open "Select top 5 * from product where cateid="&cateid&" and id<>"&newsid&" order by px desc,posttime desc",conn,1,1
		while not rs.eof
		%>
        
           <li><a href="productshow.asp?id=<%=rs("id")%>"><img src="/images/blank.gif" _src="<%=rs("defaultpicurl")%>" alt="" /></a><span class="ptit"><%=leftstr(rs("title"),30)%></span></li>
         <%
		 rs.movenext
		 wend
		 rs.close
		 %>
         
       
          
        </ul>
      </div>
      <!--<div class="prev"></div>-->
      <div class="next"></div>
    </div>
   
   
    
    </div>
    <div class="clear"></div>
  </div>
</div>
<div class="width" id="cpxj">
<div class="box">
<div class="cpxj-tit"></div>
<div class="con"><%=News_Content%></div>
</div>
</div>

<!--#include virtual="/product_foot.asp"-->