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


	<ul class="newslist">



<%
pagenum = 20
Easp.Db.PageSize = pagenum
Easp.Var("page") =1
k=1
Set NewsListRs = Easp.Db.GetRS("select * from news_c where isdel=false and passed=true  and cateid in ("&sonid&")  Order By px desc,posttime Desc,ID Desc")
while not NewsListRs.eof

%>
<li class="newsitem"><a href="<%=infoURL(NewsListRs("staticUrl"),NewsListRs("dynamicUrl"),supportHtml)%>">
<img src="<%=newslistRs("defaultpicurl")%>">
<h2><%=NewsListRs("title")%></h2>
<em><%=NewsListRs("posttime")%></em>

</a></li>
<%

k=k+1
NewsListRs.movenext
wend
NewsListRs.close

'response.write Easp.Db.PageCurrentSize

%>
</ul>

<%'if Easp.Db.PageCurrentSize>=Easp.Db.PageSize then
if Easp.Db.PageCount >Easp.Db.PageIndex  then%>
<div class="more"><a id="getmore" data-page="2" data-cateid="<%=nid%>" data-pagecount="<%=Easp.Db.PageCount%>">加载更多</a></div>
<%end if%>

       

</div>

<!--#include virtual="/blink.asp"-->
<!--#include virtual="/foot.asp"-->

