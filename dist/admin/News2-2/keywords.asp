<!--#include file="../../FiveInc/conn.asp"-->
<!--#include file="../admin.asp"-->
<!-- #include file="../Inc/Head.asp" -->
<!-- #include file="news_config.asp" -->
<script>
function ConfirmDel()
{
   if(confirm("确定要执行操作吗？"))
     return true;
   else
     return false;
	 
}
</script>
<div><a href="addkey.asp" style="color:#f00; font-size:16px;">添加关键词</a></div>
<div><a href="keywords.asp">全部类别</a> <a href="?category=<%=server.urlencode("小说书籍")%>">小说书籍</a> <a href="?category=<%=server.urlencode("作家信息")%>">作家信息</a> <a href="?category=<%=server.urlencode("新闻资讯")%>">新闻资讯</a>  <a href="?category=<%=server.urlencode("搜索框热词")%>">搜索框热词</a></div>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="table_southidc">
<tr bgcolor="#A4B6D7">
              <td  height="25" align="center" bgcolor="#A4B6D7" class="blod">序号</td>
    <td  align="center" bgcolor="#A4B6D7" class="blod">关键词</td>
    <td align="center" bgcolor="#A4B6D7" class="blod">添加时间</td>
    <td align="center" bgcolor="#A4B6D7" class="blod">所属类别</td>
    <td align="center" bgcolor="#A4B6D7" class="blod">操作</td>
</tr>
            
            <tr bgcolor="#ECF5FF">


<%
if request("action")="del" and isnumeric(request("keyid")) Then
	keyid = clng(request("keyid"))
	conn.execute("Delete from keys where id="&keyid)

end if

	'Easp.Db.PageParam = "page"
	Easp.Db.PageSize =20

	TrNum=0
	
	msql="select * from keys order by id desc"
	if request("category")<>"" Then
		category=ChkFormStr(Request("category"))
		msql="select * from keys where category='"&category&"' order by id desc"
	end if
	
	Set NewsListRs = Easp.Db.GetRS(msql)

while not NewsListRs.eof
%>       
<tr bgcolor="#ECF5FF" align="center">
              <td><%=NewsListRs("id")%></td>
             <td><%=NewsListRs("title")%></td>
             <td><%=NewsListRs("addtime")%></td>
             <td><%=NewsListRs("category")%></td>
             <td><a href="?action=del&keyid=<%=NewsListRs("id")%>"  onClick="return ConfirmDel();">删除</a></td>
            </tr>

      
<%
NewsListRs.MoveNext
		wend
			Response.Write("</table>")&vbcrlf
		Set NewsListRs = Nothing
		If Easp.Db.PageCount >1 Then			
			'Easp.Db.SetPager("jadebox","{first}{prev}{liststart}{list}{listend}{next}{last}")
			Easp.db.SetPager "jadebox", "{first}{prev}{liststart}{list}{listend}{next}<span class='last'>{last}</span>", Array("listlong:6","listsidelong:3","prev:上一页","next:下一页","first:←","last:→")  
			response.write "<div class=""pagediv""><div class=""pagebar"">"
			Easp.Print Easp.Db.GetPager("jadebox")
			response.write "</div></div>"
		End If
	


%>

<!-- #include file="../Inc/Foot.asp" -->