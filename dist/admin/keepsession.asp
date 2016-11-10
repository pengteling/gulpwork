<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title></title>
	<meta http-equiv="Refresh" content="120;URL=?">
</head>
<body>
	
</body>
</html>

<script language="javascript">
var one=function()
{
window.location.reload()
}
setTimeout("one()",120000)
</script>

<!--#include file="../FiveInc/inc.asp"-->
<%
AdminID=strToNum(CheckSQL(Trim(session("AdminID"))))
AdminName=CheckSQL(Trim(session("AdminName")))
AdminPassword=CheckSQL(Trim(session("AdminPassword")))
AdminRndPassword=CheckSQL(Trim(session("RndPassword")))
%>