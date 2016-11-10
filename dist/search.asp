<!--#include file="fiveinc/inc.asp"-->
<!--#include file="FiveInc/Check_Sql.asp"-->
<!--#include file="FiveInc/page.asp"-->
<%
curpageTitle= "搜索："&request("so")&"-"&SiteTitle
%>



<!--#include virtual="product_top.asp"-->
<!--#include virtual="product_banner.asp"-->
<!--#include virtual="product_tj.asp"-->

<div class="pm3 plistall">
 <div class="main p-sub-t3"></div>
 <div class="main">
 
 
  <%ShowProduct()%>

 </div>
</div>

<!--#include virtual="product_foot.asp"-->
