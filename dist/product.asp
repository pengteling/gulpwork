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


<!--#include virtual="product_top.asp"-->

<!--#include virtual="product_banner.asp"-->

<!--#include virtual="product_tj.asp"-->

<div class="pm3 plistall">
 <div class="main p-sub-t3"></div>
 <div class="main">
 
 
  <%ShowProduct()%>

 </div>
</div>

<!--#include virtual="product_foot.asp"-->
