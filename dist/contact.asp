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
<div class="greybg">
<div class="nmain">
  
    
    <div class="maincontent" > 
	


	<div class="contact">
		<div class="fl">
		<%=Com_Content%>
			
		</div>
		<div class="fr">
			<iframe style="border:0px;" marginheight="0" src="/map.html" frameborder="0" width="726" height="564" marginwidth="0" scrolling="no"></iframe>
		</div>

		<div class="clear"></div>
	</div>
	  
      
       
      
      </div>
    </div>
    </div>

<!--#include virtual="/foot.asp"-->