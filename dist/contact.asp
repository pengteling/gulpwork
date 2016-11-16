<!--#include file="fiveinc/inc.asp"-->
<!--#include file="FiveInc/Check_Sql.asp"-->
<!--#include file="FiveInc/page.asp"-->
<%
nid=34
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
<div style="width:100%; margin-top:0px;height:320px;border:0px solid #a4c2da"  id="bdmap"></div>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script> 
    <script type="text/javascript">
var map = new BMap.Map("bdmap");            // 创建Map实例
var point = new BMap.Point(106.548397,29.587101);    
map.addControl(new BMap.NavigationControl());  
var marker = new BMap.Marker(point);
var sContent =
"<p style='margin:0 0 0px 0; font-size:14px;font-weight: bold;padding:0px 0; color:#CC5522;line-height:1.5;'>重庆沃普斯莱机电设备有限公司</p>" +  
"<p style='margin:0;font-size:12px;line-height:1.5;padding:3px 0'>重庆江北区北城天街33号东和城1栋25-18号</p>" 
+"<p style='margin:0;font-size:12px;line-height:1.5;padding:0px 0;'>设计选型：400-023-7976   售后服务：023-67715181</p>" 

// var point0 = new BMap.Point(106.472424,29.571796); 
// var sContent0 =
// "<p style='margin:0 0 0px 0; font-size:14px;font-weight: bold;padding:0px 0; color:#CC5522;line-height:1.5;'>月读视界项目一组</p>" +  
// "<p style='margin:0;font-size:12px;line-height:1.5;padding:3px 0'>重庆市大学研究生实验室</p>" 
// var marker0 = new BMap.Marker(point0);

// var point1 = new BMap.Point(106.46304,29.565828); 
// var sContent1 =
// "<p style='margin:0 0 0px 0; font-size:14px;font-weight: bold;padding:0px 0; color:#CC5522;line-height:1.5;'>月读视界项目三组</p>" +  
// "<p style='margin:0;font-size:12px;line-height:1.5;padding:3px 0'>沙坪坝区陈家湾宏信大厦</p>" 
// var marker1 = new BMap.Marker(point1);


// var point2 = new BMap.Point(106.30138,29.614513); 
// var sContent2 =
// "<p style='margin:0 0 0px 0; font-size:14px;font-weight: bold;padding:0px 0; color:#CC5522;line-height:1.5;'>月读视界项目四组</p>" +  
// "<p style='margin:0;font-size:12px;line-height:1.5;padding:3px 0'>沙坪坝区大学城龙湖U城3栋</p>" 
// var marker2 = new BMap.Marker(point2);


//map.addOverlay(marker0);
map.addOverlay(marker);
// map.addOverlay(marker1);
// map.addOverlay(marker2); 



var cpoint=new BMap.Point(106.548397,29.587101);
map.centerAndZoom(cpoint, 15);

map.addControl(new BMap.MapTypeControl({mapTypes: [BMAP_NORMAL_MAP,BMAP_HYBRID_MAP]}));     //2D图，卫星图


var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
// var infoWindow0 = new BMap.InfoWindow(sContent0);  // 创建信息窗口对象
// var infoWindow1 = new BMap.InfoWindow(sContent1);  // 创建信息窗口对象
// var infoWindow2 = new BMap.InfoWindow(sContent2);  // 创建信息窗口对象

//map.openInfoWindow(infoWindow, map.getCenter());      // 打开信息窗口
map.openInfoWindow(infoWindow,point);      // 打开信息窗口
//map.openInfoWindow(infoWindow2,point2);      // 打开信息窗口
marker.addEventListener("click", function(){          
   this.openInfoWindow(infoWindow);  
});
// marker0.addEventListener("click", function(){          
//    this.openInfoWindow(infoWindow0);  
// });

// marker1.addEventListener("click", function(){          
//    this.openInfoWindow(infoWindow1);  
// });

// marker2.addEventListener("click", function(){          
//    this.openInfoWindow(infoWindow2);  
// });
</script>
<div class="newscontent" style="color:#cccfd9;">
             <%=Com_Content%>

             
          </div>

<!--#include virtual="/foot.asp"-->