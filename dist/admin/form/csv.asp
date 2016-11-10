<!--#include file="../../FiveInc/conn.asp"-->
<!--#include file="../admin.asp"-->

<%
date1=cdate(request.Form("date1"))
date2=cdate(request.Form("date2"))+1

Response.Buffer = true
Response.AddHeader "Content-Disposition","attachment; filename=email.csv" 
Response.CharSet = "UTF-8" 
Response.ContentType = "application/octet-stream" 

set rs = conn.Execute("select * from email where addtime>=#"&date1&"# and addtime<=#"&date2&"#  order by id desc")
Response.Write " "&rs.fields(0).name
for i=1 to rs.fields.count-1
Response.Write "," & rs.fields(i).name
next
Response.Flush()
do while not rs.eof
Response.Write vbCrLf & rs(0)
for i=1 to rs.fields.count-1
Response.Write "," & rs(i)
next
Response.Flush()
rs.Movenext
loop
rs.Close
conn.Close
set rs = nothing

Response.End()

%>
