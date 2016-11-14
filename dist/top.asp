<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">	
	<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="keywords" content="<%=SiteKey%>" />
	<meta name="description" content="<%=SiteDescription%>" />
	<meta name="author" content="jadebox" />
	<meta name="renderer" content="webkit">		
  	<meta name="apple-mobile-web-app-capable" content="no">
  	<meta name="apple-mobile-web-app-status-bar-style" content="black">
  	<link rel="stylesheet" href="css/swiper.min.css">
	<link rel="stylesheet" href="css/custom.css?121">
	<script src="js/jquery.min.js"></script>
	<script src="js/swiper.min.js"></script>
	<script src="js/comm.js"></script>	
	<title><%=curpageTitle%></title>
</head>

<header>
	<div class="logo"><a href="/"></a></div>
	<div class="menu">
		<a href="javascript:;"></a>
	</div>

    <div class="xiala">
        
      <ul class="parentmenu">

<li><a href="/">首页</a></li>
       <%
    
    k=1
    set rs2=server.CreateObject("adodb.recordset")
    rs.open "select top 10 * from category where followid=0 and ishome=true order by orderid",conn,1,1
    while not rs.eof
    
    if instr(rs("sonid"),",")>0  then
	    if k=1 then
	      response.write "<li class=""open"">"
	      k=k+1
	     else
	     response.write "<li>"
	     end if
      response.write "<a href=""javascript:;"">"&rs("catename")&"</a></li>"
     else
     response.write "<li>"
     response.write "<a href="""&companyURL(rs("cateid"),rs("catetype"),rs("outlinkurl"),rs("modeltype"),rs("dirpath"),supporthtml)&""">"&rs("catename")&"</a></li>"
     end if
    
      'response.write "<a href="""&companyURL(rs("cateid"),rs("catetype"),rs("outlinkurl"),rs("modeltype"),rs("dirpath"),supporthtml)&""">"&rs("catename")&"</a></li>"
   if instr(rs("sonid"),",")>0  then
   if k=2 then
        response.write "<ul class=""submenu1"">"
    else
    response.write  "<ul class=""submenu1 submenu2"">"
    end if
        
        rs2.open "select * from category where depth=2 and ishome=true and followid="&rs("cateid")&" order by orderid",conn,1,1
        while not rs2.eof 
          response.write "<li><a href="""&companyURL(rs2("cateid"),rs2("catetype"),rs2("outlinkurl"),rs2("modeltype"),rs2("dirpath"),supporthtml)&""" >· "&left(rs2("catename"),27)&"</a></li>"
        rs2.movenext
        wend
        rs2.close
        response.write "</ul>"
    end if 
      
      
    rs.movenext
    k=k+1
    wend
    rs.close
    
    %>

      <!-- <li><a href="/">首页</a></li>
      <li id="menu1" class="open"><a href="javascript:;">商用产品</a></li>
      <ul class="submenu1">
      <li><a href="">· 商用热水解决方案</a></li>
      <li><a href="">· 商用采暖解决方案</a></li>
      </ul>
      
      
      
      <li><a href="javascript:;">成功案例</a></li>
      
      <ul class="submenu1 submenu2">
      <li><a href="">· 企事业单位</a></li>
      <li><a href="">· 酒店</a></li>
       <li><a href="">· 工厂</a></li>
       <li><a href="">· 会所别墅</a></li>
      </ul>
      
      
      <li><a href="/">酒店舒适热水，首选A.O.史密斯</a>
      <li><a href="/">关于A.O.史密斯</a>
      <li><a href="/">关于我们</a>
      </ul>
       -->


    </div>

</header>	
<div class="head"></div>

