<!--#include file="fiveinc/inc.asp"-->
<!--#include file="FiveInc/Check_Sql.asp"-->
<!--#include file="FiveInc/page.asp"-->
<%
newsid=strToNum(Request.QueryString("id"))

rs.open "select * from writers where id="&newsid&" ",conn,1,3
if not rs.eof then
rs("hits")=rs("hits")+1
rs.update
nid =rs("cateid")
cateid=nid
newstitle=rs("title")
News_Content=rs("content")
content1=rs("content1")
content2=rs("content2")
content3=rs("content3")
content4=rs("content4")
content_zy =rs("content_zy")
posttime=formatdate(rs("posttime"),5)
author=rs("ComeFrom")
defaultpicurl=rs("defaultpicurl")
hits=rs("hits")
pimg = rs("uploadfiles")
area=rs("area")
job=rs("job")
email=rs("qqurl")
tel=rs("weibo")
mobile=rs("mobile")

if not isnull(pimg) and pimg<>"" then
	defaultpicurl = split(pimg,"|")(0)
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

set ReadRs=server.CreateObject("adodb.recordset")
ReadRs.open "select top 1 * from news_c where cateid="&nid&" and isdel=false and id>"&newsid &" order by id ",conn,1,1
if not ReadRs.eof then
prelink="<a href=""readnews.asp?id="&ReadRs("id")&""">"&ReadRs("Title")&"</a>"
else
prelink="这是第一篇"
end if
ReadRs.Close
ReadRs.open "select top 1 * from news_c where  cateid="&nid&" and isdel=false and  id<"&newsid&" order by id desc",conn,1,1
if not ReadRs.eof then
nextlink="<a href=""readnews.asp?id="&ReadRs("id")&""">"&ReadRs("Title")&"</a>"
else
nextlink="已经是最后一篇"
end if
set ReadRs=nothing


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
<!--#include virtual="/top.asp"-->
<div class="greybg lawyer">
  <div class="nmain">
    <div class="cleft fl"> 
      <div class="lawyer-fl">
      	<div class="pic"><img src="<%=defaultpicurl%>" width="270" alt=""></div>
      	

      	<div class="pd18"><div class="lname"><%=newstitle%></div>
      		<div class="intro">
      			<p>职 位： <%=job%></p>
      			<p>电 话： <%=tel%></p>
      			<p>手 机： <%=mobile%></p>
      			<p>E--mail： <%=email%></p>
      		
      		
      		
      		</div>
      		<div class="splitline"></div>
      		
      		<div class="subtit">专业领域</div>
      		<div class="zylist">
      			<ul>
      			<%
      			arr_zyly = split(area,",")
      			for i= 0 to ubound(arr_zyly)
      			%>
      			<li><a href="business.asp?cname=<%=server.urlencode(arr_zyly(i))%>"><%=arr_zyly(i)%></a></li>
      			<%
      			next
      			%>
      				
      				
      			</ul>
      		</div>
      		
      		<div class="splitline"></div>
      		<div class="subtit">教育背景</div>
      		<p><%=content3%></p>
      		<div class="splitline"></div>
      		<div class="subtit">执业资格</div>
      		<p><%=content4%></p>

      		</div>

      </div>
    </div>
    <div class="cright fr">
      
        <div class="maincontent" >
          
         
            <%=News_Content%>
          
        </div>
<div class="msubtit"><h3>代表业绩</h3></div>

        <div class="con1">

        	<%=content1%>
        </div>
<%if content2<>"" and not isnull(content2) then%>
<div class="msubtit"><h3>荣誉奖项</h3></div>

        <div class="con1">

        	<%=content2%>
        </div>
        <%end if%>

      </div>
       <div class="clear"></div>
    </div>
   
  </div>
</div>

<!--#include virtual="/foot.asp"-->