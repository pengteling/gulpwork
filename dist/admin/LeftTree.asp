<!--#include file="../FiveInc/conn.asp"-->
<!--#include file="Admin.asp"-->
<!--#include file="inc/privilege.asp"-->
<%
if groupid=2 then
	'sql_sonid_page = "0"
	sql_sonid_page=""
else
	rs.open "select sonid_page from zh_adminGroup where id="&groupid
	if not rs.eof then
		my_sonid_page =rs(0)
		if my_sonid_page="" then my_sonid_page="0"
		sql_sonid_page=" and cateid in ("&my_sonid_page&")"
	end if
	rs.close
end if
%>
<html>
<head>
<meta http-equiv=Content-Type content=text/html;charset=utf-8>
<style type="text/css">
<!--
html,body {
	SCROLLBAR-FACE-COLOR: #6a84ae;
	SCROLLBAR-HIGHLIGHT-COLOR: #aaaaff;
	SCROLLBAR-SHADOW-COLOR: #335997;
	SCROLLBAR-3DLIGHT-COLOR: #335997;
	SCROLLBAR-ARROW-COLOR: #ffffff;
	SCROLLBAR-TRACK-COLOR: #335997;
	SCROLLBAR-DARKSHADOW-COLOR: black;
	background-color:#336699;
	margin-right: 2px;
	overflow-x:hidden;
	margin-top: 0;
	margin-bottom: 0;
	margin-left: 5px;
}

.ETCHED {
	BORDER-RIGHT: #6699cc 1px solid;
	BORDER-TOP: #003366 1px solid;
	BORDER-LEFT: #003366 1px solid;
	WIDTH: 100%;
	BORDER-BOTTOM: #6699cc 1px solid;
	height:auto;
	BACKGROUND-COLOR: #336699;
	margin:0;
	padding:0;
}
.NORMALMain {
	BORDER-RIGHT: #336699 1px solid;
	BORDER-TOP: #336699 1px solid;
	BORDER-LEFT: #336699 0px solid;
	WIDTH: 100%;
	height:24px;
	CURSOR: default;
	BORDER-BOTTOM: #336699 1px solid;
	BACKGROUND-COLOR: #336699;
	margin:0;
	padding:0;
	cursor:hand;
}
.NORMALLeft {
	BORDER-RIGHT: #336699 1px solid;
	BORDER-TOP: #336699 1px solid;
	BORDER-LEFT: #336699 1px solid;
	WIDTH: 100%;
	height:24px;
	CURSOR: default;
	BORDER-BOTTOM: #336699 1px solid;
	BACKGROUND-COLOR: #336699;
	margin:0;
	padding-top: 0;
	padding-right: 0;
	padding-bottom: 0;
	padding-left: 20px;
}
A.w:active {
	COLOR: #ffffff; TEXT-DECORATION: underline;font-size:12px;
}
A.w:visited {
	COLOR: #ffffff; TEXT-DECORATION: none; font-size:12px;
}
A.w:hover {
	COLOR: #ffffff; TEXT-DECORATION: underline; font-size:12px;
}
A.w:link {
	COLOR: #ffffff;	TEXT-DECORATION: none; font-size:12px;
}
-->
</style>
<style type="text/css">
<!--
.style10 {color: #FFFFFF}
td{
	font-size:12px;
	padding-top: 0;
	padding-right: 7px;
	padding-bottom: 0;
	padding-left: 0;
}
.style20 {color: #FF0000}
.style21 {
	color: #006697;
	font-weight: bold;
	font-size: 14px;
}
.pad{padding:0 0 0 50px;}
-->
</style>
<title><%=SystemCompany%>后台管理系统</title>
<SCRIPT>
var MSIE=0;
var lastitemid='undefined';
if(navigator.appName == 'Microsoft Internet Explorer')MSIE=1;

function MouseOver(item, type) {

	item.style.border='1px solid';
	if(type==0) {

		item.style.backgroundColor='#6699CC';
		item.style.borderLeftColor='#99CCFF';
		item.style.borderTopColor='#99CCFF';
		item.style.borderRightColor='#003366';
		item.style.borderBottomColor='#003366';

	} else if(type==1) {

		item.style.backgroundColor='#6699CC';
		item.style.borderLeftColor='#99CCFF';
		item.style.borderTopColor='#99CCFF';
		item.style.borderRightColor='#003366';
		item.style.borderBottomColor='#003366';
	}
}

function MouseOut(item, type) {

	item.style.border='1px solid';
	if(type==0) {
		item.style.backgroundColor='#336699';
		item.style.borderColor='#336699';

	} else if(type==1) {
	
		item.style.backgroundColor='#336699';
		item.style.borderColor='#336699';
	}
}
</SCRIPT>
</head>

<body >
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <td height="29"><div align="left">
      <div align="center"><strong><span class="style10">后台管理<%=SystemVersion%></span></strong></div>
    </div></td>
  </tr>
  <tr>
    <td height="21"><div class="ETCHED">
      <div class="NORMALMain" onMouseOver="javascript:MouseOver(this,1)" onMouseOut="javascript:MouseOut(this,1)">
        <div align="center"><img src="images/icon/home.gif" width="22" height="22" border="0" align="absmiddle"> <a href="default.asp" target="_parent" class="w"> 管理首页</a> <img src="images/icon/logoff.gif" width="22" height="22" border="0" align="absmiddle"> <a href="LoginOut.asp" target="_parent" class="w">退出</a></div>
      </div>
    </div></td>
  </tr>
<%if session("AdminName")="pengteling" or session("AdminName")="jingjing1" then %>
   <tr>
    <td><div class="NORMALMain" onMouseOver="javascript:MouseOver(this,1)" onMouseOut="javascript:MouseOut(this,1)" onClick="showHide('d99')"> <img src="images/icon/folder.gif" width="22" height="22" align="absmiddle"> <span class="style10">网站页面</span></div></td>
  </tr>
  <tr>
    <td><div class="ETCHED" id="d99" style="display:block;">
      <div class="NORMALLeft" onMouseOver="javascript:MouseOver(this,1)" onMouseOut="javascript:MouseOut(this,1)"><img src="images/icon/folder1.gif" width="18" height="18" border="0" align="absmiddle"> <a href="catepage/CompanyAdd.asp" target="mainFrame" class="w">| 添加页面 |</a></div>
      <div class="NORMALLeft" onMouseOver="javascript:MouseOver(this,1)" onMouseOut="javascript:MouseOut(this,1)"><img src="images/icon/folder1.gif" width="18" height="18" border="0" align="absmiddle"> <a href="catepage/CompanyAll.asp" target="mainFrame" class="w">| 页面管理 |</a></div>
    </div></td>
  </tr>
  
<%
end if
set rs2=server.CreateObject("adodb.recordset")
rs.open "Select * from catepage where depth=1 "&sql_sonid_page&" and isHome=true order by orderid",conn,1,1
while not rs.eof
%>  
  <tr>
    <td><div class="NORMALMain" onMouseOver="javascript:MouseOver(this,1)" onMouseOut="javascript:MouseOut(this,1)" onClick="showHide('d<%=rs("cateid")%>')"> <img src="images/icon/folder.gif" width="22" height="22" align="absmiddle"> <span class="style10"><%=rs("catename")%></span></div></td>
  </tr>
  <tr>
    <td><div class="ETCHED" id="d<%=rs("cateid")%>" style="display:block;">
  <%
 ' response.write "Select * from catepage where depth=2 "&sql_sonid_page&" and followid="& rs("cateid")&" order by orderid"
rs2.open "Select * from catepage where depth=2 "&sql_sonid_page&" and followid="& rs("cateid")&" and isHome=true order by orderid",conn,1,1
while not rs2.eof

%>
 <div class="NORMALLeft" onMouseOver="javascript:MouseOver(this,1)" onMouseOut="javascript:MouseOut(this,1)"><img src="images/icon/folder1.gif" width="18" height="18" border="0" align="absmiddle"> <a href="<%=rs2("outlinkurl")%>" target="mainFrame" class="w">| <%=rs2("catename")%> |</a></div>
<%
rs2.movenext
wend
rs2.close  
  
  %>
  </tr>
  <%
  rs.movenext
  wend
  rs.close  %>
 
</table>
<script language="javascript">
function showHide(obj){	
	if(document.getElementById(obj).style.display=="none"){
		document.getElementById(obj).style.display="block";
	}
	else{
		document.getElementById(obj).style.display="none";
	}
}
</script>
</body></html>