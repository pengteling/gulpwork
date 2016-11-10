<!--#include file="../easyasp/easp.asp"-->
<%
Session.CodePage=65001
'Response.CharSet="utf-8"
Response.CharSet="utf-8"
Response.LCID = 2052

%>
<!--#include file="webconfig.asp"-->
<!--#include file="config.asp"-->
<!--#include file="hdp.asp"-->
<!--#include file="Function.asp"-->
<%
dim conn
dim connstr,MyDbPath 
dim db
'on error resume next
MyDbPath =systemroot
Db = "FDatabase/#%&_db.mdb"
'Access
connstr="Provider = Microsoft.Jet.OLEDB.4.0;Data Source = " & Server.MapPath(MyDbPath & db)
'SQL Server
'connstr="Provider=SQLOLEDB.1;Server=JADEBOX-SERVER\SQLEXPRESS;User ID=jadebox;Password=jadebox;Database=jdb_db;"
Easp.Db.SetConnection "default", "ACCESS", MyDbPath & db,""
	Set conn = Server.CreateObject("ADODB.Connection")
	conn.open ConnStr
	If Err Then
		err.Clear
		Set Conn = Nothing
		Response.Write "数据库连接出错，请检查连接字串。"
		Response.End
	End If
Set rs= Server.CreateObject("ADODB.Recordset")
sub CloseConn()
	conn.close
	set conn=nothing
end sub	

'============邮件发送配置=====================
dim login_user,login_pwd,mailhost,mail_user,mail_usert,senduser

login_user="" '邮件登陆用户名
login_pwd="" '邮件登陆所需密码
mailhost="smtp.ym.163.com" '邮件服务器地址
mail_user="" '接受邮件邮箱
mail_usert="" '接受邮件邮箱
senduser=SiteName '发件人名称
%>

