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
<style>
    .maincontent img{
        width:100%;
    }
</style>


    <div class="nmain">
      
        <div class="maincontent" >

             <img src="images/business/contentThree01.jpg" alt="">
             <img src="images/business/contentThree02.jpg" alt="">
             <img src="images/business/contentThree03.jpg" alt="">
             <img src="images/business/contentThree04.jpg" alt="">
             <img src="images/business/contentThree05.jpg" alt="">
             <img src="images/business/contentThree06.jpg" alt="">
             <img src="images/business/contentThree07.jpg" alt="">
             <img src="images/business/contentThree08.jpg" alt="">
             <img src="images/business/contentThree09.jpg" alt="">
             <img src="images/business/contentThree10.jpg" alt="">
             <img src="images/business/contentThree11.jpg" alt="">
             <img src="images/business/contentThree12.jpg" alt="">
             <img src="images/business/contentThree13.jpg" alt="">
             <img src="images/business/contentThree14.jpg" alt="">
          
        </div>
      </div>
       
   
   
  </div>
