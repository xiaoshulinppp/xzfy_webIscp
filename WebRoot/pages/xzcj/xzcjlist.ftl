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
	<body>

	<form name="form0" id="form0" action="" method="post">
	<#if panduanGL != "1">
	<#include "../website/header.ftl">
	</#if>
		<div class="wal pageNow2">
	      <div class="fl">当前位置：<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a>> 行政裁决案件列表</div>
	      <div class="fr"></div>
		</div>
	
	<div class="pageBg1">
<div class="wal">

      <div id="searchForm">
      <div class="pageBox">
            <div class="searchForm">
            <!--
                  <ul>
                    <li>
                       <div class="name">案号:</div>
                       <input class="ui-input-wdm" type="text" name="xzfyInfo.tjzfzh"/>
                   </li>
                   <li>  
                       <div class="name">收案日期:</div>
                       <input class="ui-input-wdm" type="text" onClick="WdatePicker()"  name="xzfyInfo.receive_date"/>
                    </li>
                 
                  </ul>
                -->
                  <span class="clear_f"></span>
                  <div class="btnDiv">
                  <#if listType=="banli">
                      <input type="button" name="button" class="btn1" value="新增案件" onclick="xinzeng()" />
                      <input type="button" name="button" class="btn1" value="已结案" onclick="showJieanlist()" />
                      <input type="button" name="button" class="btn1" value="高级搜索" onclick="search()" />
                      <input type="button" class="btn1 btn2" value="部门案件" onclick="showXzcjList()" /> 
                  <#else>  
                  	  <input type="button" name="button" class="btn1" value="个人待办" onclick="daiban()" />  
                  </#if>              
                  </div>
            </div>
      </div>
      <div class="pageBoxBg"></div>
      </div>

		<input type="hidden" name="funcCode" value="${funcCode}">
		<input type="hidden" name="pNum" value="${pNum}" id="pageNum">
	
		

		
      <div class="pageBox">
            <div class="searchList">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">


					<tr>  
					<th>序号</th>
					<th>收案日期</th>
					<th>承办人</th>
					<th>原告类别</th>
					<th>原告姓名</th>
					<th>被告姓名</th>
					<th>项目状态</th>
					<th>结案日期</th>
					<th>操作</th>
					</tr>
					<#assign account=pNum*pageSize-pageSize+1>
					<#list xzcjList as xzcjInfo>
					<tr>
					<td>&nbsp;${account}</td>				
					<td>&nbsp;<#if xzcjInfo.receive_date?has_content>${xzcjInfo.receive_date}</#if></td>
					<td>&nbsp;<#if xzcjInfo.undertaker_name?has_content>${xzcjInfo.undertaker_name}</#if></td>
					<#assign apptype=xzcjInfo.app_type?default('')>
					<td>&nbsp;<#if apptype=='1'>公民<#elseif apptype=='2'>法人或其他组织<#else>未选择</#if></td>	
					<td>&nbsp;<#if xzcjInfo.app_name?has_content>${xzcjInfo.app_name}</#if></td>
					<td>&nbsp;<#if xzcjInfo.jiguan?has_content>${xzcjInfo.jiguan}</#if></td>
					<td>&nbsp;
						<#assign status=xzcjInfo.status?default('0')>
						<#if status=='4'>办理中<#elseif status=='12'>已结案</#if>
					</td>
					<td>&nbsp;<#if xzcjInfo.jieandate?has_content>${xzcjInfo.jieandate}</#if></td>
					
					<td id="cxs" style="display:block" >
						<a href="../xzcj/updatexzcj.action?tempid=${xzcjInfo.id}&funcCode=${funcCode}&isView=0">查看</a>&nbsp;
				<#if panduanGL != "1">		
						<#assign user_id=Session['_USER_LOGIN_'].id?string>
						<#assign undertaker_id=xzcjInfo.undertaker_id?default('')>
					<#if user_id==undertaker_id>
						<a href="../xzcj/updatexzcj.action?tempid=${xzcjInfo.id}&funcCode=${funcCode}&isView=1">修改</a>&nbsp;
						<!--<a href="../xzcj/deletexzcj.action?tempid=${xzcjInfo.id}&funcCode=${funcCode}">删除</a>&nbsp;-->
						<a href="javascript:gotoDelete('${xzcjInfo.id}')">删除</a>&nbsp;
					</#if>
				</#if>
						<#if panduanGL == "1">	
						<a href="#" onclick="contactPeople('${xzcjInfo.id}');" id="guanlian">关联</a>&nbsp;
						</#if>		
					</td>
					<input type="hidden" id="panduanGL" name="panduanGL" value="${panduanGL}" />
					
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
				<a href="../xzcj/showUndertakerList.action?pNum=1&funcCode=${funcCode}" class="ui-page-item ui-page-item-first">首页</a>
			    <a href="../xzcj/showUndertakerList.action?pNum=${upPage}&funcCode=${funcCode}" class="ui-page-item ui-page-item-prev">上一页</a>
		     	<a href="../xzcj/showUndertakerList.action?pNum=${downPage}&funcCode=${funcCode}" class="ui-page-item ui-page-next">下一页</a>
			    <a href="../xzcj/showUndertakerList.action?pNum=${totalPage}&funcCode=${funcCode}" class="ui-page-item ui-page-last">尾页</a>　
				<span>到<input class="input1"  name="gotoPageNum" id="gotoPageNum" />页</span>　<a href="#" onclick="gotoPage()" class="ui-button ui-button-go">Go</a>
            </div>
            </div>
      </div>
      <div class="pageBoxBg"></div>
</div>
</div>
	</form>
	<#if panduanGL != "1">
		<div class="foot">
		版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
		电话：65193431
		</div>
	</#if>
</body>
</html>
		
	
	<script>
	function gotoDelete(id){
	    if(confirm("确定删除吗？")){
	         document.form0.action="../xzcj/deletexzcj.action?tempid="+id;
	         document.form0.submit();
	         //alert("删除成功！");
	    }
	}
	function xinzeng(){
		window.open("addxzcj.action?funcCode=${funcCode}","_top");
	}
	function showJieanlist(){
		window.open("showjieanlist.action?funcCode=${funcCode}","_top");
	}
	function showXzcjList(){
		window.open("showXzcjList.action?funcCode=${funcCode}","_top");
	}
	function daiban(){
		window.open("showUndertakerList.action?funcCode=${funcCode}","_top");
	}
	function search(){
		window.open("searchxzcj.action?funcCode=${funcCode}","_top");
	}
	
		function contactPeople(peopleId){
		var api = frameElement.api, W = api.opener, D = W.document; // api.opener 为载加lhgdialog.min.js文件的页面的window对象
			if(document.getElementById("panduanGL").value == "1"){
				parent.document.getElementById("shen1").value=peopleId;
				parent.document.getElementById("sf1sselect").style.display="none";
				parent.document.getElementById("yiguanlian1").style.display="block";
				parent.document.getElementById("yiguanlian1").innerHTML="已关联";
			}
			else{
				parent.document.getElementById("shen2").value=peopleId;
				parent.document.getElementById("sf2sselect").style.display="none";
				parent.document.getElementById("yiguanlian2").style.display="block";
				parent.document.getElementById("yiguanlian2").innerHTML="已关联";
			}
			api.close();
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
					window.location = "../xzcj/showUndertakerList.action?funcCode=${funcCode}&pNum=" + inputPage;
				}
				return;
			}
	</script>
	