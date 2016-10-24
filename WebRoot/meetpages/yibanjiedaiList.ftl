
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=7">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行政复议信息管理系统</title>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
<!--[if lte IE 6]>
<script src="script/png.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div, ul, img, li, input , a');
    </script>
<![endif]--> 
</head>

<body   onload="startTime()">
<form name="Form1" id="Form1" action="" method="post">


<#include "../pages/website/header.ftl">
<div class="wal pageNow2">
      <div class="fl">当前位置：<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a>> 接待信息查询</div>
      <div class="fr"></div>
</div>

<div class="pageBg1">
<div class="wal">
     
	  
		<input type="hidden" name="funcCode" value="${funcCode}">
		<input type="hidden" name="pNum" value="${pNum}" id="pageNum">
	  
      <div class="pageBox">
            <div class="searchList">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <th width="5%">序号</th>
                    <th width="10%">接待类型</th>
                    <th width="8%">接待日期</th>
                    <th width="15%">接待地点</th>                 
                    <th width="10%">第一接待人</th>
                    <th width="10%">第二接待人</th>
                    <th width="28%">被接待人信息</th>
                    <th width="10%">收件单位</th>
                    <th width="13%">操作</th>
                   
                  </tr>
				  <#assign account=pNum*pageSize-pageSize+1>
				<#list jiedaiList as meet>
					
						
					<tr>
						<td>${account}</td>
						<td>&nbsp;${meet.meet_type?default('')}</td>
						<td>&nbsp;${meet.face_date?default('')}</td>
						<td>&nbsp;${meet.face_address?default('')}</td>
						<td>&nbsp;${meet.admit1?default('')}</td>
						<td>&nbsp;${meet.admit2?default('')}</td>
						<td title=${meet.client_content?default('')}>&nbsp;<#if meet.client_content?has_content&&meet.client_content.length() gt 25>${meet.client_content[0..24]}..<#else>${meet.client_content?default('')}</#if></td>
						<td>&nbsp;${meet.caseOrg_name?default('')}</td>
<#if meet.meet_type =="送达" >
<td><a href="../meet/viewSongda.action?funcCode=${funcCode}&Main_id=${meet.main_id}" ><font color="green">查看</font></a></td>
</#if>
<#if meet.meet_type =="阅卷" >
<td><a href="../meet/viewYuejuan.action?funcCode=${funcCode}&Main_id=${meet.main_id}" ><font color="green">查看</font></a></td>
</#if>
 <#if meet.meet_type =="转交材料" >
<td><a href="../meet/viewZhuanjiaocailiao.action?funcCode=${funcCode}&Main_id=${meet.main_id}" ><font color="green">查看</font></a></td>
</#if>
 <#if meet.meet_type =="一般接待" >
<td><a href="../meet/viewYibanjiedai.action?funcCode=${funcCode}&Main_id=${meet.main_id}" ><font color="green">查看</font></a></td>
</#if>
						
						
						
					</tr>
					<#assign account=account+1>
				</#list>
             
            </table>
          
            <div class="pageNum">
               第${pNum}/${totalPage}页   共${totalCount}条
					<#assign upPage = pNum -1>
					<#if upPage lt 1 >
					<#assign upPage = 1>
					</#if>
					<#assign downPage = pNum +1>
					<#if (downPage gt totalPage)>
					<#assign downPage = totalPage>
					</#if>　
				

				<a href="../meet/showYiBanJieDaiList.action?pNum=1&funcCode=${funcCode}" class="ui-page-item ui-page-item-first">首页</a>
			    <a href="../meet/showYiBanJieDaiList.action?pNum=${upPage}&funcCode=${funcCode}" class="ui-page-item ui-page-item-prev">上一页</a>
		     	<a href="../meet/showYiBanJieDaiList.action?pNum=${downPage}&funcCode=${funcCode}" class="ui-page-item ui-page-next">下一页</a>
			    <a href="../meet/showYiBanJieDaiList.action?pNum=${totalPage}&funcCode=${funcCode}" class="ui-page-item ui-page-last">尾页</a>　
				<span>到<input class="input1"  name="gotoPageNum" id="gotoPageNum" />页</span>　<a href="#" onclick="gotoPage()" class="ui-button ui-button-go">Go</a>
            </div>
            </div>
      </div>
      <div class="pageBoxBg"></div>
</div>
</div>
</form>
<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>
</body>
</html>

<script>
	
		function handleOp(type,xzfyId){
			
		}
	
		function opendg(dgurl,dgw,dgh)
			{
			  $.dialog({ 
			    title:'',
			    width: dgw,
			    height: dgh,
			    content:'url:'+ dgurl});
			}
			
		function cancleOp(xzfyId){
			if(confirm("您确认要取消审批？")){
				
				
			}
		}	
			
		function contactPeople(peopleId){
			parent.document.getElementById("shen1").value=peopleId;
		}
		function updatexzss(id){
				//document.getElementById("tempid").value=id;
				tempid = id;
				document.Form1.action="updatexzss.action";
				document.Form1.submit();
		}
		
		function goPage(pNum){		
			document.getElementById("pageNum").value=pNum;
			document.Form1.submit();
		}
		
		function gotoPage(){
				var inputPage = window.document.getElementById("gotoPageNum").value;
				if(!inputPage.match("[\\d+]+")){
					alert("页数必须为整数！");
					return;
				}else{
					for(var i=0;i<inputPage.length;i++){
						if(inputPage.charCodeAt(i)>57 || inputPage.charCodeAt(i)<48){
							alert("页数必须为整数！");
							return;
						}
					}
				}
				if(inputPage > ${totalPage}){
					alert("输入的页数不能超过总页数！");
				}else if(inputPage < 1){
					alert("输入的页数不能少于1页！");
				}else{
			

window.location = "../meet/showYiBanJieDaiList.action?funcCode=${funcCode}&pNum=" + inputPage + "";

				}
				return;
			}

		function plsp(){
			if(!isSelect()){
				alert("请选择需批量审批的案件！");	
			}else{
				var ids=getIds();

			}
		}
		function isSelect(){
			var check=document.getElementsByName("idList");
			b=false;
			for(var i=0;i<check.length;i++){
				if(check[i].checked==true){
					b=true;
				}
			}
			return b;	
		}
		function getIds(){
			var check=document.getElementsByName("idList");
			var id="";
			for(var i=0;i<check.length;i++){
				if(check[i].checked==true){
					if(id=="")
					id+=check[i].value;
					else
					id+=","+check[i].value;
				}
			}
			return id;
		}
	
	</script>