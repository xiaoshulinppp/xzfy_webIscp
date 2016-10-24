
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

<form name="Form1" id="Form1" action="../banan/showTotalList.action" method="post">

<#include "../website/header.ftl">

<div class="wal pageNow2">
      <div class="fl">当前位置：<a href="">待办理案件查询</a></div>
      <div class="fr"></div>
</div>
<div class="pageBg1">
<div class="wal">
      <div id="searchForm">
      <div class="pageBox">
            <div class="searchForm">
                  <ul>
                    <li>
                       <div class="name">案号:</div>
                       <input class="ui-input-wdm" type="text" 
							<#if xzfyInfo.tjzfzh?has_content>value="${xzfyInfo.tjzfzh}"</#if> name="xzfyInfo.tjzfzh"/>
                   </li>
                   <li>  
                       <div class="name">收案日期:</div>
                       <input class="ui-input-wdm" type="text" onClick="WdatePicker()" 
						<#if xzfyInfo.receive_date?has_content>value="${xzfyInfo.receive_date}"</#if>  name="xzfyInfo.receive_date"/>
                    </li>
                    <li>
                       <div class="name">被申请人名称:</div>
                       <input class="ui-input-wdm" type="text" 
						<#if xzfyInfo.defendant_name?has_content>value="${xzfyInfo.defendant_name}"</#if>  name="xzfyInfo.defendant_name"/>
                     </li>
                     <li>
                       <div class="name">申请人名称:</div>
                       <input class="ui-input-wdm" type="text" 
						<#if xzfyInfo.app_show?has_content>value="${xzfyInfo.app_show}"</#if>  name="xzfyInfo.app_show"/>
                    </li>
                  </ul>
                  <span class="clear_f"></span>
                  <div class="btnDiv">
                      <input type="submit" name="button" class="btn1" value="搜索" onclick="" />
                      <input type="reset" class="btn1 btn2" value="重置" />
                  </div>
            </div>
      </div>
      <div class="pageBoxBg"></div>
      </div>
	  
		<input type="hidden" name="funcCode" value="${funcCode}">
		<input type="hidden" name="pageNum" value="${pageNum}" id="pageNum">
	  
      <div class="pageBox">
            <div class="searchList">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <th width="42">序号</th>
                    <th width="140">案件号</th>
                    <th width="88">收案日期</th>
                    <th width="85">申请人名称</th>
                    <th width="78">申请人类别</th>
                    <th width="142">被申请人名称</th>
                    <th width="72">立案审查人</th>
                    <th width="54">承办人</th>
                    <th width="60">审批人</th>
                    <th width="73">案件状态</th>
                    <th width="73">办理</th>
                    <th>操作</th>
                  </tr>
				  <#assign account=pageNum*pageSize-pageSize+1>
				<#list shenpiList as xzfyInfo>
					<#assign handleAction='0'>
					<#assign handleText='0'>
					<#assign handleUser=''>
					<#assign handlType=''>
					<#assign handleOp=''>
					<#assign handleOpType=''>
						<#if xzfyInfo.status=="1">										
							<#assign handlType='立案审查'>
							<#assign handleAction='../xzfy/getlian.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}'>
							<#assign handleText='立案审查'>
							<#assign handleOp='选择审查人'>
							<#assign handleOpType='1'>
							
						<#elseif xzfyInfo.status=="2">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleAction='../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}'>
							<#assign handleText='审批'>
							<#assign handlType='补正审批'>
							<#assign handleOp='转审批'>
							<#assign handleOpType='3'>
						<#else>
							<#assign handlType='补正已审批'>
							<#assign handleAction='../xzfy/getlian.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}'>
							<#assign handleText='立案审查'>
							<#assign handleOp='选择审查人'>
							<#assign handleOpType='1'>
						</#if>										
						<#elseif xzfyInfo.status=="3">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleAction='../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}'>
							<#assign handleText='审批'>
							<#assign handlType='立案审批'>
							<#assign handleOp='转审批'>
							<#assign handleOpType='3'>
						<#else>
							<#assign handlType='立案已审批'>
							<#assign handleAction='../xzfy/getlian.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}'>
							<#assign handleText='立案审查'>
							<#assign handleOp='选择审查人'>
							<#assign handleOpType='1'>
						</#if>		
							
						<#elseif xzfyInfo.status=="4">
							<#assign handleAction='../banan/bananform.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}'>
							<#assign handleText='办理'>	
							<#assign handlType='案件办理'>	
							<#assign handleOp='选择承办人'>	
							<#assign handleOpType='2'>						
							
						<#elseif xzfyInfo.status=="5">
						<#if  xzfyInfo.check_status=='1'>
								<#assign handleAction='../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}'>
								<#assign handleText='审批'>
								<#assign handlType='延期审批'>		
								<#assign handleOp='转审批'>
								<#assign handleOpType='3'>
						<#else>
							<#assign handlType='延期已审批'>
							<#assign handleAction='../banan/bananform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}'>
							<#assign handleText='办理'>
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
						</#if>	
						
						<#elseif xzfyInfo.status=="6">
							<#assign handleAction='../banan/bananform.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}'>
							<#assign handleText='办理'>	
							<#assign handlType='案件延期'>	
							<#assign handleOp='选择承办人'>	
							<#assign handleOpType='2'>
							
						<#elseif xzfyInfo.status=="7">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleAction='../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}'>
							<#assign handleText='审批'>
							<#assign handlType='中止审批'>	
							<#assign handleOp='转审批'>	
							<#assign handleOpType='3'>
						<#else>
							<#assign handlType='中止已审批'>
							<#assign handleAction='../banan/bananform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}'>
							<#assign handleText='办理'>
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
						</#if>	
							
						<#elseif xzfyInfo.status=="8">
							<#assign handleAction='../banan/bananform.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}'>
							<#assign handleText='办理'>	
							<#assign handlType='案件中止'>		
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
							
						<#elseif xzfyInfo.status=="9">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleAction='../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}'>
							<#assign handleText='审批'>
							<#assign handlType='恢复审理审批'>
							<#assign handleOp='转审批'>		
							<#assign handleOpType='3'>
						<#else>
							<#assign handlType='待恢复'>
							<#assign handleAction='../banan/bananform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}'>
							<#assign handleText='办理'>
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
						</#if>	
							
						<#elseif xzfyInfo.status=="10">
							<#assign handleAction='../banan/bananform.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}'>
							<#assign handleText='办理'>	
							<#assign handlType='恢复审理'>	
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
							
						<#elseif xzfyInfo.status=="11">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleAction='../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}'>
							<#assign handleText='审批'>
							<#assign handlType='结案审批'>	
							<#assign handleOp='转审批'>
							<#assign handleOpType='3'>
						<#else>
							<#if xzfyInfo.stadardResult=='1'>
							<#assign handlType='结案已审批'>
							<#assign handleAction='../banan/bananform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}'>
							<#assign handleText='办理'>
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
							<#else>
							<#assign handlType='结案已审批'>
							<#assign handleAction='../xzfy/getlian.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}'>
							<#assign handleText='立案审查'>
							<#assign handleOp='选择审查人'>
							<#assign handleOpType='1'>
							</#if>
						</#if>											
						</#if>
					<tr>
						<td>${account}</td>
						<td>&nbsp;${xzfyInfo.tjzfzh?default('未立案')}</td>
						<td>&nbsp;<#if xzfyInfo.receive_date?has_content>${xzfyInfo.receive_date}</#if></td>
						<td>&nbsp;<#if xzfyInfo.app_show?has_content>${xzfyInfo.app_show}</#if></td>
						<td>&nbsp;	<#if xzfyInfo.app_type?has_content>
										<#if xzfyInfo.app_type=='1'>
											公民
										<#elseif xzfyInfo.app_type=='2'>
											法人
										</#if>
									<#else>
										&nbsp;
									</#if>
						</td>
						<td>&nbsp;<#if xzfyInfo.defendant_name?has_content>${xzfyInfo.defendant_name}</#if></td>
						<td>&nbsp;${xzfyInfo.user1_name?default('未指定')}</td>
						<td>&nbsp;${xzfyInfo.user2_name?default('未指定')}</td>
						<td>&nbsp;${xzfyInfo.check_name?default('未指定')}</td>
						<td>${handlType}</td>
						<td  id="cxs" style="display:block" ><a href="${handleAction}">${handleText}</a>&nbsp;</td>
						<td><a href="javascript:handleOp('${handleOpType}','${xzfyInfo.id}')">${handleOp}</a></td>
					</tr>
					<#assign account=account+1>
				</#list>
             
            </table>
            <div class="pageNum">
               第${pageNum}/${totalPage}页   共${totalCount}条
					<#assign upPage = pageNum -1>
					<#if upPage lt 1 >
					<#assign upPage = 1>
					</#if>
					<#assign downPage = pageNum +1>
					<#if (downPage gt totalPage)>
					<#assign downPage = totalPage>
					</#if>　
				<a href="javascript:goPage(1)" class="ui-page-item ui-page-item-first">首页</a>
				<a href="javascript:goPage(${upPage})" class="ui-page-item ui-page-item-prev">上一页</a>
				<a href="javascript:goPage(${downPage})" class="ui-page-item ui-page-next">下一页</a>
				<a href="javascript:goPage(${totalPage})" class="ui-page-item ui-page-last">尾页</a>　
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
			opendg("../xzfy/handleOpreator.action?funcCode=${funcCode}&listkeyword=${listkeyword}&typeId="+type+"&xzfyId="+xzfyId,300,300)
		}
	
		function opendg(dgurl,dgw,dgh)
			{
			  $.dialog({ 
			    title:'请选择转办人',
			    width: dgw,
			    height: dgh,
			    content:'url:'+ dgurl});
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
					document.getElementById("pageNum").value=inputPage;
					document.Form1.submit();					
				}
				return;
			}
	
	</script>