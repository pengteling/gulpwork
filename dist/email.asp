<!--#include file="fiveinc/inc.asp"-->
<%
if request.form("email")<>"" then
	email = request.Form("email")
	IP =getIP()
	
	if IsValidEmail(email) then
	
		rs.open "Select * from email where email='"&email&"'",conn,1,3
		if rs.eof then
			rs.addnew
			rs("email")=email
			rs("ip")=ip
			rs.update
		end if
		
		rs.close
	end if
end if


response.write "success"
%>