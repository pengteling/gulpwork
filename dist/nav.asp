<div class="top">
  <div class="mb">
    <div class="logo"><a href="/"><img src="images/logo<%if isindex<>1 then response.write "-nei"%>.png" alt=""></a></div>
    <div class="somelink">
      <a href="mailto:<%=companyEmail%>" class="email"><%=companyEmail%></a><a href="tel:<%=companyTel%>" class="tel"><%=companyTel%></a> <span>中文</span><a href="javascript:;">|English</a>
    </div>
    <div class="nav">
      <ul class="parentmenu">
        <li><a href="/">主页</a></li>
         <%
    
    k=1
    set rs2=server.CreateObject("adodb.recordset")
    rs.open "select top 10 * from category where followid=0 and ishome=true order by orderid",conn,1,1
    while not rs.eof
    if cateid_d1=rs("Cateid") then
        response.write "<li class=""select"">"
    else
        response.write "<li>"
    end if
      response.write "<a href="""&companyURL(rs("cateid"),rs("catetype"),rs("outlinkurl"),rs("modeltype"),rs("dirpath"),supporthtml)&"""><span class=""zh"">"&rs("catename")&"</span><span class=""en"">"&rs("catename_en")&"</span></a>"
   if instr(rs("sonid"),",")>0  then
        response.write "<ul class=""submenu"">"
        
        rs2.open "select * from category where depth=2 and ishome=true and followid="&rs("cateid")&" order by orderid",conn,1,1
        while not rs2.eof 
          response.write "<li><a href="""&companyURL(rs2("cateid"),rs2("catetype"),rs2("outlinkurl"),rs2("modeltype"),rs2("dirpath"),supporthtml)&""" >"&left(rs2("catename"),27)&"</a></li>"
        rs2.movenext
        wend
        rs2.close
        response.write "</ul>"
    end if 
      
      response.write "</li>"
    rs.movenext
    k=k+1
    wend
    rs.close
    
    %>
      </ul>
    </div>
  </div>
</div>