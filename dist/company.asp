<!--#include file="fiveinc/inc.asp"-->
<!--#include file="FiveInc/Check_Sql.asp"-->
<!--#include file="FiveInc/page.asp"-->
<%
nid=strToNum(Request.QueryString("id"))
rs.open "select * from category where cateid="&nid,conn,1,1
if not rs.eof then
	cateid=rs("cateid")
	parentid=rs("parentid")
	sonid=rs("sonid")
	followid=rs("followid")	
	catetype=rs("catetype")
	modeltype=rs("modeltype")
	catename= rs("catename")		
	com_title=rs("title")
	Com_Content=rs("content")
	depth =rs("depth")
	catedir=rs("catedir")
	
	xmname= replace(catename,"培训","")
	if com_title="" or isnull(com_title) then com_title=catename
else
	response.write "网址传递参数有误"
	response.End()

end if
rs.close


%>
<!--#include virtual="/lmenu.asp"-->
<!--#include virtual="/top.asp"-->



    <div class="nmain">
 
      
        <div class="maincontent" >
        <%if cateid<>49 then%>
        <h1 class="comtitle"><%=Com_title%></h1>
          <%end if%>
          <div class="newscontent" style="color:#cccfd9;<%if cateid=49 then response.write "padding:0"%>">
             <%=Com_Content%>

             
          </div>
        </div>
      </div>
       
   
   
  </div>

<!--#include virtual="/blink.asp"-->
<!--#include virtual="/foot.asp"-->