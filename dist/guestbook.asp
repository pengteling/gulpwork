<!--#include file="fiveinc/inc.asp"-->
<%
if request.form("message")<>"" then
	'email = request.Form("email")
	'IP =getIP()
	
	B_name=ChkFormStr(Request.Form("name"))
	
	B_mail=ChkFormStr(Request.Form("email"))
	
	B_dom=ChkFormStr(Request.Form("message"))
	
	'B_sex=strToNum(Request.Form("B_sex"))
	
	
	'if IsValidEmail(email) then		
		sql="select * from liuyan where 1=2"
		Rs.open sql,conn,1,3
		Rs.addnew
			'Rs("styles")=gtitlest
			Rs("B_chengs")=B_chengs
			Rs("B_name")=B_name
			Rs("B_msn")=B_msn
			Rs("B_sex")=B_sex
			Rs("B_mail")=B_mail
			Rs("B_title")=B_title
			Rs("B_face")=Userface
			Rs("B_tel")=B_tel
			Rs("B_dom")=B_dom
			If Checkbook="Yes" Then
				Rs("tgsh")=False
			Else
				Rs("tgsh")=True
			End If
			Rs("B_date")=now()
			rs("B_type")=styles
		Rs.update
		Rs.Close
		set Rs=nothing 
	'end if	
end if


response.write "success"
%>