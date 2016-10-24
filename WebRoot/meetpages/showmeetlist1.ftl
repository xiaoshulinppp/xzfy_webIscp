<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=7">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行政复议信息管理系统</title>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css">
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../webstyle/script/index/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../webstyle/script/index/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/index/fun.js"></script>
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
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

<style type="text/css">img,formDiv,.formDiv{behavior: url(../webstyle/style/ie-css3.htc);} </style>
	<body onload="startTime()">
<form name="Form1" id="Form1" action="" method="post">
<#include "../pages/website/header.ftl">
</div>
<div class="wal pageNow2">
<div class="fl">当前位置：&nbsp;&nbsp;<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a> >&nbsp;&nbsp;  <a href="../xzfy/openReceive.action?funcCode=${funcCode}">接收/新增案件</a>  >&nbsp;&nbsp; 案件信息提取</div>
<div class="fr"></div>
</div>

      		<div class="pageBoxBg"></div>
		</div>
<div class="pageBg1">
<div class="wal">
		<div id="searchForm">
    		<div class="pageBox">
            	<div class="searchForm">
            		<ul>
            		    <li>
            				<div class="name">收案日期:</div>
            				<input class="ui-input-wdm" type="text" onClick="WdatePicker()" name="xzfyInfo.receive_date" value="" id="xzfyInfo.receive_date">
            			</li>
            		    <li>
            				<div class="name">案件号:</div>
            				<input class="ui-input-wdm" type="text" name="xzfyInfo.tjzfzh" value="" id="xzfyInfo.tjzfzh">
            			</li>
                    	<li>
            				<div class="name">申请人:</div>
            				<input class="ui-input-wdm" type="text" name="xzfyInfo.app_show" value="" id="xzfyInfo.app_show">
            			</li>
            			<li>
            				<div class="name">被申请人:</div>
            				<input class="ui-input-wdm" type="text" name="xzfyInfo.defendant_name" value="" id="xzfyInfo.defendant_name">
            			</li>
                    	<li>
            				<div class="name">立案审查人:</div>
            				<input class="ui-input-wdm" type="text" name="xzfyInfo.user1_name" value="" id="xzfyInfo.user1_name">
            			</li>
                    	<li>
            				<div class="name">承办人:</div>
            				<input class="ui-input-wdm" type="text" name="xzfyInfo.user2_name" value="" id="xzfyInfo.user2_name">
            			</li>


					</ul>
					<span class="clear_f"></span>
                    <div class="btnDiv">
                      <input type="submit" name="button" class="btn1" value="搜索" onclick="" />
                      <input type="reset" class="btn1 btn2" value="重置" />
                  	</div>
					
				</div>
      		</div>
      <div class="pageBox">
            <div class="searchList">
   
					
		<form name="Form1" id="Form1" action="">
	
	

	 <div class="ui-list-nobtnbar fn-clear ">
	    <table width="100%" border="0" cellpadding="0" cellspacing="0">

	       <thead class=""  id="" name="" >
	 	   <tr>
	 	    <th width="5%">序号</th>
	 	   	<th width="8%">收案日期</th>
			<th width="8%">案件号</th>
			<th width="19%">申请人</th>
			<th width="20%">被申请人</th>
			<th width="10%">立案审查人</th>
			<th width="10%">承办人</th>
			<th width="10%">案件状态</th>
			<th width="5%">查看</th>
			<th width="5%">操作</th>
 	     	</tr>
	      	</thead>
      	 	<tbody class="discolor">
      	 	<#assign index = 1>
			<#list bananList as xzfyInfo>
				<tr >
					<td  >&nbsp;${index}</td>
					<td  >&nbsp;<#if xzfyInfo.receive_date?has_content>${xzfyInfo.receive_date}</#if></td>	
					<td  >&nbsp;<#if xzfyInfo.tjzfzh?has_content>${xzfyInfo.tjzfzh}</#if></td>				
					<td title= ${xzfyInfo.app_show?default('')}>&nbsp;<#if xzfyInfo.app_show?has_content&&xzfyInfo.app_show.length() gt 25>${xzfyInfo.app_show[0..24]}..<#else>${xzfyInfo.app_show?default('')}</#if></td>
					<td  >&nbsp;<#if xzfyInfo.defendant_name?has_content>${xzfyInfo.defendant_name}</#if></td>	
					<td  >&nbsp;<#if xzfyInfo.user1_name?has_content>${xzfyInfo.user1_name}</#if></td>
					<td  >&nbsp;<#if xzfyInfo.user2_name?has_content>${xzfyInfo.user2_name}</#if></td>
					<td  >&nbsp;
						<#if xzfyInfo.status=="1">
							立案审查
						<#elseif xzfyInfo.status=="2">
							补正审批
						<#elseif xzfyInfo.status=="3">
							立案审批		
						<#elseif xzfyInfo.status=="4">
							案件办理
						<#elseif xzfyInfo.status=="5">
							延期审批
						<#elseif xzfyInfo.status=="6">
							案件延期
						<#elseif xzfyInfo.status=="7">
							中止审批
						<#elseif xzfyInfo.status=="8">
							案件中止
						<#elseif xzfyInfo.status=="9">
							恢复审理审批
						<#elseif xzfyInfo.status=="10">
							恢复审理
						<#elseif xzfyInfo.status=="11">
							结案审批
						
						<#elseif xzfyInfo.status=="12">
							已结案
						</#if>
					</td>
											<td><a href="../xzfy/viewCase.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}" target="_blank" ><font color="green">查看</font></a></td>
						<td >
						<a href="../meet/updatesongda.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}">提取</a>&nbsp;
						</td>

				</tr>
			<#assign index = index + 1>
			</#list> 
	     	</tbody>
     	</table>
             
            


     


	<div class="pageNum">
			<tr align="center">
				<td>第${pageNum}/${totalPage}页 
					<a onclick="gopage('1')"  href ="#">首页</a>
					<#assign upPage = pageNum -1>
					<#if upPage lt 1 >
					<#assign upPage = 1>
					</#if>
					<a onclick="gopage('${upPage}')"  href ="#">上一页</a>
					<#assign downPage = pageNum +1>
					<#if (downPage gt totalPage)>
					<#assign downPage = totalPage>
					</#if>
					<a onclick="gopage('${downPage}')"  href ="#">下一页</a>
					<a onclick="gopage('${totalPage}')" href ="#">末页</a>
					第 <input id="gotoPageNum" name="gotoPageNum" type="text" class="input1" maxlength="4" onkeypress="keyUpFunc(event);"> 页
					<a href="#" onclick="gotoPage()">跳转</a>
				</td>
			</tr> 

      </div>

</div>
</div>
		
	</form>
	<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>
	</body>
</html>
		
	
	<script type="text/javascript">

			function gopage(mpage){
				window.location = "../meet/showDaibanList1.action?funcCode=${funcCode}&pageNum=" + mpage  + "&status=0";
			}
			
			function keyUpFunc(oEvent){
				if(oEvent.keyCode == 13 || oEvent.keyCode == 108){
					oEvent.keyCode=0;
					gotoPage();
				}
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
					window.location = "../banan/showDaibanList1.action?funcCode=${funcCode}&pageNum=" + inputPage + "&status=0";
				}
				return;
			}
				function updateApp(id){
				document.getElementById("id").value=id;
				document.comtForm.action="updateComt.action";
				document.comtForm.submit();
		}

	
	</script>
	