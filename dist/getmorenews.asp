<!--#include virtual="/fiveinc/conn.asp"-->
<%
nid=strToNum(Request.QueryString("nid"))
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
	depth_cate= rs("depth")
else
	response.write "网址传递参数有误"
	response.End()
end if
rs.close
%>
<!--#include virtual="/lmenu.asp"-->

<%
pagenum = 20
Easp.Db.PageSize = pagenum
'Easp.Var("page") = 1
k=1
Set NewsListRs = Easp.Db.GetRS("select * from news_c where isdel=false and passed=true  and cateid in ("&sonid&")  Order By px desc,posttime Desc,ID Desc")
while not NewsListRs.eof

%>
<li class="newsitem"><a href="<%=infoURL(NewsListRs("staticUrl"),NewsListRs("dynamicUrl"),supportHtml)%>">
<img src="<%=newslistRs("defaultpicurl")%>">
<h2 <%if cateid_d1=24 then%>class="smalltit"<%end if%>><%=NewsListRs("title")%></h2>
<em>
<%if cateid_d1=24 then%>
<%=leftstr(NewsListRs("content_zy"),40)%>
<%else%>
<%=NewsListRs("posttime")%>
<%end if%></em>

</a></li>
<%

k=k+1
NewsListRs.movenext
wend
NewsListRs.close

'response.write Easp.Db.PageCurrentSize

%>