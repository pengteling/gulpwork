<!doctype html><!--#include file="../../FiveInc/conn.asp"-->
<!--#include file="../admin.asp"-->
<!-- #include file="../Inc/Head.asp" -->
<!-- #include file="news_config.asp" -->
<style>

#productimages li{
	list-style-image: none;
	list-style-type: none;
	text-align:center;
	width:126px;
	height:146px;
	float:left;
}
</style>
<%
if Request.Cookies("xd_urljilunew")="" then
Response.Cookies("xd_urljilunew")=request.ServerVariables("HTTP_REFERER")
end if
dim rs,sql,count,ID,bclass,sclass,DefaultPic
ID=strToNum(Request("ID"))
Set NewsRs=Conn.execute("select * from "&news_table&" Where ID="&ID)
If NewsRs.Eof then
	Response.Write "产品不存在"
    Response.End
End If
DefaultPic=Trim(NewsRs("DefaultPicUrl"))
If DefaultPic="" then
	DefaultPic="images/Nopic.jpg"
End If


set rs=server.createobject("adodb.recordset")

%>
<script language = "JavaScript">

  

function CheckForm()
{

	if (document.myform.title.value.length == 0) {
		alert("产品标题没有填写.");
		document.myform.title.focus();
		return false;
	}

	editor1.sync();
	editor2.sync();
	editor3.sync();
	if (document.myform.content.value.length == 0){
		alert("产品内容不能为空！");
		
		return false;
	}
    
	return true;
}

function SetDropDownPic(url){
	document.myform.UploadFiles.value=document.myform.UploadFiles.value + url +"|";
	document.myform.IncludePic.value="1";
	document.getElementById("productimages").innerHTML+="<li><img src='" + url + "' width='120' height='120' alt='单击选择图片' style='cursor:hand;' onclick=\"myform.DefaultPicUrl.value='" + url + "';\"/><a href='javascript:DelArray("+(myform.UploadFiles.value.split("|").length -2).toString()+")'>删除</a></li>"
}
</script>
<style type="text/css">
<!--
.tr_southidc {BACKGROUND-COLOR: ECF5FF;}
-->
</style>

<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="table_southidc">
  <form name="myform" method="post" action="News_save.asp" onSubmit="return CheckForm();">
    <tr>
      <td height="30" colspan="3" align="center" class="blod">修改产品</td>
    </tr>
    <tr bgcolor="#ECF5FF">
      <td width="133" height="25" align="center">产品标题：</td>
      <td colspan="2"><input name="title" type="text" class="input" value="<%=NewsRs("title")%>" size="30">
		  </td>
    </tr>
    <tr bgcolor="#ECF5FF">
      <td height="22" align="center" class="tr_southidc">产品编号：</td>
      <td colspan="2" width="80%"><input name="productNo" type="text" class="input" size="20" value="<%=NewsRs("productNo")%>"></td>
    </tr>
   
     <tr>
      <td  height="22" align="center" bgcolor="#C0C0C0" class="tr_southidc">所属类别：</td>
      <td colspan="2" bgcolor="#E3E3E3" class="tr_southidc"><select name="cateid">
	  <%
followid=NewsRs("cateid")
rs.open "select cateid,catename,followid,depth,sonid,parentid,orderID from category where catetype<=3 order by depth,orderID",conn,1,1
			if not rs.eof then
				data= rs.getRows()
			end if
			rs.close
			
	class_list=""
	
	
sub classlist(byval t0)
		dim i
		for i=0 to ubound(data,2)
			if t0=data(2,i) then
				if followid = data(0,i) then
					isslected="selected"
				else
					isslected=""
				end if
				class_list=class_list&"<option value="""&data(0,i)&""" "&isslected&">"

For k=2 To data(3,i)
class_list=class_list&"&nbsp;&nbsp;&nbsp;&nbsp;"
next

If data(3,i)>1 then class_list=class_list& "├"
				class_list=class_list& data(1,i)&"</option>"
				
				classlist(data(0,i))
			end if
		next
	end sub
	if isarray(data) then	
		call classlist(cateid_parent_m)	
	end if	
		response.write class_list
%>    </select></td>
    </tr>
    
<tr>
      <td height="30" align="center" bgcolor="#ECF5FF"><span class="tr_southidc">产品小图：</span></td>
      <td width="314" height="30" bgcolor="#ECF5FF"><span class="tr_southidc">
        <input name="DefaultPicUrl" type="text" id="DefaultPicUrl" value="<%=DefaultPic%>" size="30" maxlength="120" /> <input name="UploadFiles" type="hidden" id="UploadFiles" value="<%=NewsRs("UploadFiles")%>" />
      </span></td>
      <td width="499" bgcolor="#ECF5FF"><span class="tr_southidc">
        
        <input name="Submit222" type="button" value="上传图片"   id="image3"><input type="button" id="J_selectImage" value="上传产品大图" />
      </span></td>
    </tr> 
 	<tr>
      <td height="22" align="center" bgcolor="#C0C0C0" class="tr_southidc">产品大图：</td>
	  <td colspan="2" bgcolor="#E3E3E3" class="tr_southidc"><ul id="productimages">
<script language="javascript">
var ImgUrl,ImgList;
ImgList="";
ImgUrl=myform.UploadFiles.value;
ImgUrlArray=ImgUrl.split("|");

if(ImgUrlArray.length<=1){
//document.write('您没有上传图片');

}
for(i=0;i<ImgUrlArray.length-1;i++){
ImgList=ImgList+"<li><img src='" + ImgUrlArray[i] + "' width='120' height='120' alt='单击选择图片' style='cursor:hand;' onclick=\"myform.DefaultPicUrl.value='" + ImgUrlArray[i] + "';\"/><a href='javascript:DelArray("+i+")'>删除</a></li>"
}
document.write(ImgList);

function DelArray(n)
{
	
	if(confirm("确定要删除该图片？删除后点击下面【确认修改】才会生效！")){
	ImgList="";
	var arraylist="";
	ImgUrl=myform.UploadFiles.value;
	ImgUrlArray=ImgUrl.split("|");
	for(i=0;i<ImgUrlArray.length-1;i++){
		if (i!=n){
ImgList=ImgList+"<li><img src='" + ImgUrlArray[i] + "' width='120' height='120' alt='单击选择图片' style='cursor:hand;' onclick=\"myform.DefaultPicUrl.value='" + ImgUrlArray[i] + "';\"/><a href='javascript:DelArray("+(i>n?i-1:i)+")'>删除</a></li>";
arraylist=arraylist+ImgUrlArray[i]+"|";
		}
}
myform.UploadFiles.value=arraylist;
document.getElementById("productimages").innerHTML=ImgList;
	}
	}
</script></ul>	
	</td>
       
    
    <tr bgcolor="#ECF5FF">
      <td height="25" align="center" valign="top">简单介绍：</td>
      <td colspan="2" valign="top"><textarea id="content_zy" name="content_zy" style="width:700px;height:60px;visibility:;"><%=NewsRs("content_zy")%></textarea>限255字</td>
    </tr>
    
      
    <tr bgcolor="#ECF5FF">
      <td height="25" align="center" valign="top">产品内容：</td>
      <td colspan="2" valign="top">      

<link rel="stylesheet" href="/kindeditor/themes/default/default.css" />
	 <link rel="stylesheet" href="/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="/kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="/kindeditor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="/kindeditor/plugins/code/prettify.js"></script>
	<script>
		var editor1;
		var editor2;
		var editor3;
		KindEditor.ready(function(K) {
			editor1 = K.create('#contentid', {
				cssPath : '/kindeditor/plugins/code/prettify.css',
				uploadJson : '/kindeditor/asp/upload_json.asp',
				fileManagerJson : '/kindeditor/asp/file_manager_json.asp',
				 filterMode : false,
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
				}
				
			});
			editor2 = K.create('#guigeid', {
				cssPath : '/kindeditor/plugins/code/prettify.css',
				uploadJson : '/kindeditor/asp/upload_json.asp',
				fileManagerJson : '/kindeditor/asp/file_manager_json.asp',
				allowFileManager : true,
				filterMode : false, // true:开启过滤模式, false:关闭过滤模式
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
				}
				
			});


			editor3 = K.create('#pingjiid', {
				cssPath : '/kindeditor/plugins/code/prettify.css',
				uploadJson : '/kindeditor/asp/upload_json.asp',
				fileManagerJson : '/kindeditor/asp/file_manager_json.asp',
				allowFileManager : true,
				filterMode : false, // true:开启过滤模式, false:关闭过滤模式
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
				}
				
			});
			
			prettyPrint();
		});
		
		KindEditor.ready(function(K) {
				var editor = K.editor({
					allowFileManager : true,	
					cssPath : '/kindeditor/plugins/code/prettify.css',
					uploadJson : '/kindeditor/asp/upload_json.asp',
					fileManagerJson : '/kindeditor/asp/file_manager_json.asp'
				});
				K('#J_selectImage').click(function() {
					editor.loadPlugin('multiimage', function() {
						editor.plugin.multiImageDialog({
							clickFn : function(urlList) {
								//var div = K('#productimages');
								//div.html('');								
								K.each(urlList, function(i, url) {
									//div.append('<li><img src="' + url.url + '"></li>');
									SetDropDownPic(url.url);
								});
								editor.hideDialog();
							}
						});
					});
				});
				K('#image3').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							showRemote : true,
							imageUrl : K('#DefaultPicUrl').val(),
							clickFn : function(url, title, width, height, border, align) {
								K('#DefaultPicUrl').val(url);
								editor.hideDialog();
							}
						});
					});
				});
			});
		
			</script>
<textarea name="content" id="contentid" style="width:700px;height:500px;visibility:hidden;"><%if not isnull(NewsRs("content")) then response.write htmlspecialchars(NewsRs("content"))%></textarea>
      <div>
       <input name="saveimg" type="checkbox" value="1">保存远程图片</div>
           </td>
    </tr>
   
 <tr bgcolor="#ECF5FF">
      <td height="22" align="center" class="tr_southidc">参数：</td>
      <td colspan="2" width="80%">
<textarea id="guigeid" name="guige"  style="width:700px;height:500px;visibility:hidden;"><%if not isnull(NewsRs("guige")) then response.write htmlspecialchars(NewsRs("guige"))%></textarea>

    </tr>
 <tr bgcolor="#ECF5FF">
      <td height="22" align="center" class="tr_southidc">优点：</td>
      <td colspan="2" width="80%">
<textarea id="pingjiid" name="pingji"  style="width:700px;height:500px;visibility:hidden;"><%if not isnull(NewsRs("pingji")) then response.write htmlspecialchars(NewsRs("pingji"))%></textarea>

    </tr>


    <tr>
      <td height="30" align="center" bgcolor="#ECF5FF"><span class="tr_southidc">是否推荐：</span></td>
      <td height="30" colspan="2" align="left" bgcolor="#ECF5FF"><input name="Elite" type="checkbox" id="Elite" value="yes" <%if NewsRs("Elite")=true then%>checked<%end if%>>
      是<font color="#0000FF">（如果选中的话将在首页做为图片产品显示）</font></td>
    </tr>
	<tr>
      <td height="30" align="center" bgcolor="#ECF5FF">排序：</td>
      <td height="30" colspan="2" align="left" bgcolor="#ECF5FF"><span class="tr_southidc">
        <input name="px" type="text" id="px" value="<%=NewsRs("px")%>" size="10" maxlength="5" />
        数字越大越靠前
      </span></td>
    </tr>
      <tr>
      <td height="30" align="center" bgcolor="#C0C0C0" class="tr_southidc">是否审核：</td>
      <td colspan="2" bgcolor="#E3E3E3" class="tr_southidc"><input name="Passed" type="checkbox" id="Passed" value="yes" <% if NewsRs("Passed")=true then response.Write("checked") end if%>>
        是<font color="#0000FF">（如果选中的话将直接发布）</font></td>
    </tr>
    <tr>
      <td height="30" align="center" bgcolor="#ECF5FF"><span class="tr_southidc">发布时间：</span></td>
      <td height="30" colspan="2" align="left" bgcolor="#ECF5FF"><span class="tr_southidc">
        <input name="PostTime" type="text" id="PostTime" value="<%=NewsRs("PostTime")%>" size="30" maxlength="120" />
      </span><font color="#0000FF">（为了避免出错，尽量不要更改。格式：<%=NewsRs("PostTime")%>）</font></td>
    </tr>
    <tr>
      <td height="30" colspan="3" align="center" bgcolor="#ECF5FF"><input type="submit" name="Submit" value="确认修改" class="input">
        &nbsp;
        <input type="button" name="Submit2" value="返回上一页" class="input" onClick="history.go(-1);">
        <input name="Act" type="hidden" id="Act" value="Edit">        <input name="ID" type="hidden" id="ID" value="<%=ID%>">
       
        <span class="tr_southidc">
		<%
		If NewsRs("IncludePic") Then
		    ii=1
		Else
		    ii=0
		End If	
		'Response.Write ii
		%>
        <input name="IncludePic" type="hidden" id="IncludePic" value="<%=ii%>" />
        </span></td>
    </tr>
  </form>
</table>
<!-- #include file="../Inc/Foot.asp" -->