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


<div class="nmain">
  
  <div class="cright fr">
         
      <div class="maincontent" >      
        <%showbbs()%>
      </div> 
   
  </div>
  <div class="rightbbs">
  	<div class="tit">热门推荐</div>
  	<ul>
  		<%
  		k=0
  		rs.open "select top 10 * from news_c where cateid=7 ",conn,1,1
  		while not rs.eof
  			k=k+1
  			tempclass=k mod 2
  			response.write "<li class=""li-"&tempclass&""">>> <a href=""bbsshow.asp?id="&rs("id")&""">"&leftstr(rs("title"),32)&"</a></li>"
  			rs.movenext
  			wend
  			rs.close
  		%>
  	</ul>
  </div>
  <div class="clear"></div>
</div>


<!--#include virtual="/foot.asp"-->

