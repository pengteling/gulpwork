<!--#include virtual="fiveinc/inc.asp"-->
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
  catename_en=  rs("catename_en")  
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

<!--========================================================
                            CONTENT 
  =========================================================-->

  <section id="content">

    <div class="back-texture pb30">
      <div class="container">
        <h2 class="pt37">
          <span class="italic"><%=catename_en%></span><br>
          <%=catename%>
        </h2>

        <div class="wrapper1">
          <div class="post-img"><img src="<%=defaultpic_d1%>" alt="post image"></div>
          <a href="company.asp?id=<%=cateid%>" class="simple-link lh24"><%=com_title%></a>
          <p class="wrap-p"><%=leftstr(clearallhtml(Com_Content),450)%>
</p>
          <a href="company.asp?id=<%=cateid%>" class="button-link no-rad">了解更多</a>
        </div>

        </div>
      </div>

<%
set rs2=server.createobject("adodb.recordset")
rs2.open "select * from category where followid="&cateid &" order by orderid asc",conn,1,1
if not rs2.eof then
  


set rs3=server.createobject("adodb.recordset")

%>

      <div class="container">
         <h2 class="pt37">
         <span class="italic"><%=rs2("catename_en")%> </span><br>
          <%=rs2("catename")%>
        </h2>


        <div class="wrap4 align-center">
          <div class="row">


           <%
      
        rs3.open "select top 4 * from news_c where cateid="&rs2("cateid"),conn,1,1
while not rs3.eof
        %>      

            <div class="grid_3">
              <div class="post pb38">
                <div class="post-img"><img src="<%=rs3("defaultpicurl")%>" alt="post image" width="270" height="164"></div>
                <a href="readnews.asp?id=<%=rs3("id")%>" class="simple-link"><%=rs3("title")%></a>
                
                <p class="pt14 pb32"><%=rs3("content_zy")%></p>
              </div>
            </div>

            <%
rs3.movenext
wend
rs3.close
            %>
            
          </div>
        </div>
      </div>
<%
end if 
rs2.movenext
if not rs2.eof then
%>

      <div class="back-texture">
      <div class="container">
           <h2 class="pt37 ">
          <span class="italic"><%=rs2("catename_en")%> </span><br>
          <%=rs2("catename")%>
        </h2>

                <div class="row">
                <%
rs3.open "select top 4 * from news_c where cateid="&rs2("cateid"),conn,1,1
k=0
while not rs3.eof
k=k+1
                %>
          <div class="grid_4 align-center">
            <div class="circle"><%=k%>.</div>
            <a href="readnews.asp?id=<%=rs3("id")%>" class="simple-link"><%=rs3("title")%></a>
            <p class="p13 pb46"><%=rs3("content_zy")%></p>
          </div>
          <%
rs3.movenext
wend
rs3.close
          %>
          
        </div>
      </div>

         
      </div>
    <%end if
    rs2.movenext
if not rs2.eof then
%>

                <div class="back-orange  pt17 pb41">
      <div class="container">
        <h2 class="pt37 pb55">
          <span class="italic"><%=rs2("catename_en")%> </span><br>
          <%=rs2("catename")%>
        </h2>

        <div class="row">
          <%
          rs3.open "select top 12 * from news_c where cateid="&rs2("cateid"),conn,1,1
          while not rs3.eof
          %>

          <div class="grid_4">
            <div class="post-img"><img src="<%=rs3("defaultpicurl")%>" alt="post image"></div>
            <p class="contact-meta conf-pad-meta"><%=leftstr(rs3("content_zy"),200)%></p>
            <a href="readnews.asp?id=<%=rs3("id")%>" class="button-link back-pine rad-2">了解更多</a>
          </div>
          <%
rs3.movenext
wend
rs3.close

          %>
         
        </div>
      </div>
    </div>

    <%
end if
    %>
  
  </section>

 <!--#include virtual="/foot.asp"-->


	<script src="js/script.js"></script>
  

</body>
</html>