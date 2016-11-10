<!--#include file="../../FiveInc/conn.asp"-->
<!--#include file="../admin.asp"-->
<!-- #include file="../Inc/Head.asp" -->
<!-- #include file="news_config.asp" -->
<%
if request("category")<>"" and request("title")<>"" then
	title=ChkFormStr(Request("Title"))
	category=ChkFormStr(Request("category"))
	rs.open "select top 1 * from keys",conn,1,3
	rs.addnew
	rs("title")=title
	rs("category")=category
	rs.update
	rs.close
	set rs=nothing
	response.redirect "keywords.asp"
end if
%>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="table_southidc">
  <form name="myform" method="post" action="?" onSubmit="return CheckForm();">
    <tr>
      <td height="30" colspan="3" align="center" class="blod">增加关键词</td>
    </tr>
    <tr bgcolor="#ECF5FF">
      <td height="22" align="center" class="tr_southidc">关键词名称：</td>
      <td colspan="2" width="80%"><input name="title" type="text" class="input" size="30"></td>
    </tr>
    <tr bgcolor="#ECF5FF">
      <td height="22" align="center" class="tr_southidc">所属类别：</td>
      <td colspan="2" width="80%">
<select name="category" id="category">

	<option value="小说书籍">小说书籍</option>
	<option value="作家信息">作家信息</option>
	<option value="新闻资讯">新闻资讯</option>
  <option value="搜索框热词">搜索框热词</option>
</select>
      </td>
    </tr>
    <tr>
      <td height="30" colspan="3" align="center" bgcolor="#ECF5FF"><input type="submit" name="Submit" value="确认添加" class="input">
        
        &nbsp;
        <input type="button" name="Submit2" value="返回上一页" class="input" onClick="history.go(-1);">
        </td>
        </tr>
    </form>
    </table>

<!-- #include file="../Inc/Foot.asp" -->