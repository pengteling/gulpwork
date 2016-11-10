<!--#include file="fiveinc/inc.asp"-->
<!--#include file="FiveInc/Check_Sql.asp"-->
<!--#include file="FiveInc/page.asp"-->
<%
nid=strToNum(Request.QueryString("id"))
rs.open "select * from category where cateid="&nid,conn,1,1
if not rs.eof then
	cateid=nid
	parentid=rs("parentid")
	sonid=rs("sonid")
	followid=rs("followid")	
	catetype=rs("catetype")
	modeltype=rs("modeltype")
	catename= rs("catename")		
	title=rs("title")
	Com_Content=rs("content")

else
	response.write "网址传递参数有误"
	response.End()

end if
rs.close



%>
<!--#include virtual="/lmenu.asp"-->
<!--#include virtual="/top.asp"-->
<link rel="stylesheet" href="/js/select2/css/select2.min.css">
<script src="/js/select2/js/select2.js"></script>

<div class="saixuan">
	<div class="nmain">
  <form action="?" method="get">
  <input type="hidden" name="id" value="<%=nid%>">
	<div class="ico-search"></div>
		<input type="text" name="xm" id="xm" class="ipt-txt" placeholder="姓名">
		<select name="job" id="job" class="ipt"  >
		<option value="">全部</option>
			<option value="管委会委员">管委会委员</option>
			<option value="首席大律师">首席大律师</option>
			<option value="分所主任">分所主任</option>
			<option value="管理委员会主任">管理委员会主任</option>
			<option value="专业领域主任">专业领域主任</option>
			<option value="高级合伙人律师">高级合伙人律师</option>
			<option value="合伙人律师">合伙人律师</option>
			<option value="专职律师">专职律师</option>
			<option value="专家顾问">专家顾问</option>
      <option value="实习律师">实习律师</option>
      <option value="律师助理">律师助理</option>
		</select>

		<select name="business" id="business" class="ipt" >
	<option value="">全部</option>		

<%
rs.open "select * from category where followid=2 order by orderid",conn,1,1
while not rs.eof
response.write "<option value="""&rs("catename")&""">"&rs("catename")&"</option>"
rs.MoveNext
wend
rs.close
%>

		</select>

		<select name="department" id="department" class="ipt" >
			<option value="">全部</option>
<option value="法律顾问部">法律顾问部</option>
<option value="证券部">证券部</option>
<option value="知识产权部">知识产权部</option>
<option value="刑事辩护中心">刑事辩护中心</option>
<option value="诉讼仲裁部">诉讼仲裁部</option>
<option value="CDM清洁能源部">CDM清洁能源部</option>
<option value="房地产部">房地产部</option>
<option value="婚姻家庭部">婚姻家庭部</option>
<option value="国际法律事务部">国际法律事务部</option>
<option value="并购重组部">并购重组部</option>
<option value="惠诚公司部">惠诚公司部</option>
<option value="劳动法部">劳动法部</option>
                       	  

		</select>
		<input type="submit" id="btn" value="搜  索">
    </form>
	</div>
</div>
<script>
$(function(){
	$("#job").select2({
  		placeholder: "职位",
  		allowClear: true
	});
	$("#business").select2({
  		placeholder: "专业领域",
  		allowClear: true
	});
	$("#department").select2({
  		placeholder: "业务部门",
  		allowClear: true
	});	
});
</script>
<div class="nmain">


<div class="writers mb">
   <%
xm = trim(ChkFormStr(Request("xm")))
  job = trim(ChkFormStr(Request("job")))  
    business = trim(ChkFormStr(Request("business")))
      department = trim((Request("department")))
      
        %>
<script>
$(function(){
  $("#xm").val("<%=xm%>");
  $("#job").val("<%=job%>").trigger("change");
  $("#business").val("<%=business%>").trigger("change");;
  $("#department").val("<%=department%>").trigger("change");;

})
</script>

<div class="writerlist">
<div class="wlist-head">

	<div class="tit"><span class="leader"></span>OUR TEAM</div>
	

</div>
        
<%
Function ShowWriters()
  TrNum=0
  cateid = strToNum(Request("id"))  
  Keyword = ChkFormStr(Request("so"))
  
  msql="Select * from writers where isdel=false and passed=true "
If cateid<>0 Then
    'msql=msql&" and cateid="&cateid&""
   msql=msql&" and cateid in ("&sonid&")"
End If
if xm<>"" then
    msql=msql&" and title like '%"&xm&"%'"
end if
if job<>"" then
    msql=msql&" and instr(','+job+',',',"&job&",')>0"
  end if
if business<>"" then
    msql=msql&" and instr(','+area+',',',"&business&",')>0"
  end if
if department<>"" then
    msql=msql&" and instr(','+types+',',',"&department&",')>0"
  end if

If Keyword<>"" Then
    msql=msql&" and (title like '%"&Keyword&"%' or content like '%"&Keyword&"%')"
End If

if order=0 then  
  msql=msql&" Order By [px] desc,posttime Desc,[ID] Desc"
elseif order=1 then
  msql=msql&" Order By posttime Desc"
elseif order=2 then
  msql=msql&" Order By firstchar asc"
elseif order=3 then
  msql=msql&" Order By hits Desc"
end if
    'response.write msql

Easp.Db.PageSize =8
 Set NewsListRs = Easp.Db.GetRS(msql)
  
  If  NewsListRs.Eof Then
    Response.Write "<br />&nbsp;&nbsp;&nbsp;没有找到符合条件的律师!"
  Else
      Response.Write ("<div class=""writerlist2""><ul>")&vbcrlf
    For TrNum=1 To Easp.Db.PageSize
      If NewsListRs.Eof Then Exit For 
%>
<li>
              <div class="pic"><img src="<%=NewsListRs("defaultpicurl")%>" width="230" height="270" alt=""></div>
              <div class="bluemb">
                <p><a href="lawyer.asp?id=<%=NewsListRs("id")%>">
                    <%=leftstr(NewsListRs("content_zy"),200)%>
                  </a></p>
                 
              </div>
              <div class="wtit"><a href="lawyer.asp?id=<%=NewsListRs("id")%>"><%=NewsListRs("title")%></a></div>
            <div class="wcate"><a href="lawyer.asp?id=<%=NewsListRs("id")%>"><%=NewsListRs("job")%></a></div>

</li>
<%    
    
  NewsListRs.MoveNext
    Next
      Response.Write("</ul>")&vbcrlf
    Set NewsListRs = Nothing
    If Easp.Db.PageCount >1 Then
      'Response.Write(""&mypage.showpage()&"")
      'Easp.Db.SetPager("jadebox","{first}{prev}{liststart}{list}{listend}{next}{last}")
      Easp.db.SetPager "jadebox", "{prev}{next}", Array("listlong:6","listsidelong:3","prev:←","next:→","first:←","last:→")  
      response.write "<div class=""pagesimple"">"
      Easp.Print Easp.Db.GetPager("jadebox")
      response.write "</div>"
    End If
  End If

End Function
ShowWriters()
%>


            
         
        </div>
</div>
  
</div>
</div>

<!--#include virtual="/foot.asp"-->


