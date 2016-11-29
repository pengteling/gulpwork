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
pagenum = 8
Easp.Db.PageSize = pagenum
'Easp.Var("page") = 1
k=1
Set NewsListRs = Easp.Db.GetRS("select * from news_c where isdel=false and passed=true  and cateid in ("&sonid&")  Order By px desc,posttime Desc,ID Desc")
while not NewsListRs.eof

%>
<%if cateid_d1=24 then%>
<li class="newsitem"><a href="<%=infoURL(NewsListRs("staticUrl"),NewsListRs("dynamicUrl"),supportHtml)%>" style=" display: flex;
    justify-content:center;
    align-items:Center;">
<img src="<%=Thumb_getUrl(newslistRs("defaultpicurl"),210,144)%>" style="float:none;">

<h2 class="smalltit" style="display: inline-block; width: 4.5rem; padding-top: 0; "><%=NewsListRs("title")%></h2>
<!-- <em>
<pre>
<%=leftstr(NewsListRs("content_zy"),40)%>
</pre>
</em> -->

</a></li>

<%else%>

<li class="newsitem"><a href="<%=infoURL(NewsListRs("staticUrl"),NewsListRs("dynamicUrl"),supportHtml)%>">
<img src="<%=newslistRs("defaultpicurl")%>">
<h2><%=NewsListRs("title")%></h2>
<em><%=NewsListRs("posttime")%></em>

</a></li>

<%end if%>

<%

k=k+1
NewsListRs.movenext
wend
NewsListRs.close

'response.write Easp.Db.PageCurrentSize

%>