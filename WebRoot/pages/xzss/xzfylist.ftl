
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
<style>
#link a:link {color: green}     /* 未访问的链接 */
#link a:visited {color: #B3EE3A;}  /* 已访问的链接 */
#link a:hover {color: #FF8C00;text-decoration:underline;font-size: 18px;}    /* 当有鼠标悬停在链接上 */
#link a:active {color: #0000FF}   /* 被选择的链接 */
</style>
</head>
<body   onload="startTime()">
<form name="Form1" id="Form1" action="../xzss/searchxzfy.action" method="post" onreset>
<#include "../website/header.ftl">

<div class="wal pageNow2">
      <div class="fl">当前位置：<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a>>
  <a href="../xzss/showUndertakerList.action?funcCode=${funcCode}">行政诉讼案件列表</a> >关联行政复议列表</div>
      <div class="fr"></div>
</div>
<div class="pageBg1">
<div class="wal">
      <div id="searchForm">
      <div class="pageBox">
            <div class="searchForm">
                  <ul>
                    <li>
                       <div class="name">案件号:</div>
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
                    <li>
                       <div class="name">行政行为名称:</div>
                       <input class="ui-input-wdm" type="text" 
						<#if xzfyInfo.xwname?has_content>value="${xzfyInfo.xwname}"</#if>  name="xzfyInfo.xwname"/>
                    </li>
                    <li>
                       <div class="name">行政行为文号:</div>
                       <input class="ui-input-wdm" type="text" 
						<#if xzfyInfo.xwnum?has_content>value="${xzfyInfo.xwnum}"</#if>  name="xzfyInfo.xwnum"/>
                    </li>
                    <#if fuyiOrbeishen=="2">
                    <li>
                       <div class="name">复议机关:</div>
                       <!--
                       <select name="xzfyInfo.caseorg" id="check_id" class="select-page" style="width:155px">
						   <option value="0">请选复议机关</option>
						   <#list orgList as org>
						   <option value="${org.getLocbm()}" >${org.getName()}</option>
					   </#list>
					    
					    </select>
					    -->
					    <input class="ui-input-wdm" type="text" name="fuyijiguan" <#if fuyijiguan?has_content>value="${fuyijiguan}"</#if>/> 
                    </li>
                    </#if>
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
	  <input type="hidden" name="pNum" value="${pNum}" id="pageNum">
	  <input type="hidden" name="shenji" value="${shenji}" id="shenji"/>
	  <input type="hidden" name="fuyi" value="${fuyi}" id="fuyi"/>
	  <input type="hidden" name="shenhe1" value="${shenhe1}" id="shenhe1"/>
	  <input type="hidden" name="shenhe2" value="${shenhe2}" id="shenhe2"/>
	  <input type="hidden" name="beigao" value="${beigao}" id="beigao"/>
	  <input type="hidden" name="fuyiOrbeishen" value="${fuyiOrbeishen}" id="fuyiOrbeishen"/>
	  <div class="pageBox">
         <div class="searchList">
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <th width="4%">序号</th>
                    <th width="12%">案件号</th>
                    <th width="8%">收案日期</th>
                    <th width="13%">申请人名称</th>
                    <th width="12%">被申请人名称</th>
                    <th width="7%">立案审查人</th>
                    <th width="8%">承办人</th>
                    <th width="">复议机关</th>
                    <th width="6%">审批人</th>
                    <th width="7%">案件状态</th>
                    <th width="7%">查看</th>
                    <th width="8%">操作</th>
                  </tr>
				  <#assign account=pNum*pageSize-pageSize+1>
				<#list xzfyList as xzfyInfo>
					<#assign handleText='0'>
					<#assign handleUser=''>
					<#assign handlType=''>
					<#assign handleOp=''>
					<#assign handleOpType=''>
						<#if xzfyInfo.status=="1">										
							<#assign handlType='立案审查'>
							<#assign handleText='立案审查'>
							<#assign handleOp='选择审查人'>
							<#assign handleOpType='11'>
							
						<#elseif xzfyInfo.status=="2">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleText='审批'>
							<#assign handlType='补正审批'>
							<#assign handleOp='转审批'>
							<#assign handleOpType='3'>
						<#else>
							<#assign handlType='补正已审批'>
							<#assign handleText='立案审查'>
							<#assign handleOp='选择审查人'>
							<#assign handleOpType='1'>
						</#if>										
						<#elseif xzfyInfo.status=="3">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleText='审批'>
							<#assign handlType='立案审批'>
							<#assign handleOp='转审批'>
							<#assign handleOpType='3'>
						<#else>
							<#assign handlType='立案已审批'>
							<#assign handleText='立案审查'>
							<#assign handleOp='选择审查人'>
							<#assign handleOpType='1'>
						</#if>		
							
						<#elseif xzfyInfo.status=="4">
							<#assign handleText='办理'>	
							<#assign handlType='案件办理'>	
							<#assign handleOp='选择承办人'>	
							<#assign handleOpType='2'>						
							
						<#elseif xzfyInfo.status=="5">
						<#if  xzfyInfo.check_status=='1'>
								<#assign handleText='审批'>
								<#assign handlType='延期审批'>		
								<#assign handleOp='转审批'>
								<#assign handleOpType='3'>
						<#else>
							<#assign handlType='延期已审批'>
							<#assign handleText='办理'>
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
						</#if>	
						
						<#elseif xzfyInfo.status=="6">
							<#assign handleText='办理'>	
							<#assign handlType='案件延期'>	
							<#assign handleOp='选择承办人'>	
							<#assign handleOpType='2'>
							
						<#elseif xzfyInfo.status=="7">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleText='审批'>
							<#assign handlType='中止审批'>	
							<#assign handleOp='转审批'>	
							<#assign handleOpType='3'>
						<#else>
							<#assign handlType='中止已审批'>
							<#assign handleText='办理'>
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
						</#if>	
							
						<#elseif xzfyInfo.status=="8">
							<#assign handleText='办理'>	
							<#assign handlType='案件中止'>		
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
							
						<#elseif xzfyInfo.status=="9">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleText='审批'>
							<#assign handlType='恢复审理审批'>
							<#assign handleOp='转审批'>		
							<#assign handleOpType='3'>
						<#else>
							<#assign handlType='待恢复'>
							<#assign handleText='办理'>
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
						</#if>	
							
						<#elseif xzfyInfo.status=="10">
							<#assign handleText='办理'>	
							<#assign handlType='恢复审理'>	
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
							
						<#elseif xzfyInfo.status=="11">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleText='审批'>
							<#assign handlType='结案审批'>	
							<#assign handleOp='转审批'>
							<#assign handleOpType='3'>
						<#else>
							<#if xzfyInfo.stadardResult=='1'>
							<#assign handlType='结案已审批'>
							<#assign handleText='办理'>
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
							<#else>
							<#assign handlType='结案已审批'>
							<#assign handleText='立案审查'>
							<#assign handleOp='选择审查人'>
							<#assign handleOpType='1'>
							</#if>
						</#if>	
						<#elseif xzfyInfo.status=="12">		
							<#assign handlType='已结案'>								
						</#if>
						
					<tr>
						<!--序号-->
						<td>${account}</td>
						<!--案件号-->
						<td>&nbsp;${xzfyInfo.tjzfzh?default('未立案')}</td>
						<!--收案日期-->
						<td>&nbsp;<#if xzfyInfo.receive_date?has_content>${xzfyInfo.receive_date}</#if></td>
						<!--申请人名称-->
						<#assign app_show=xzfyInfo.app_show?default('')>
						<#assign appdetail=xzfyInfo.appdetail?default('')>
						<#assign agentdetail=xzfyInfo.agentDetail?default('')>
						<#if appdetail==''><#assign detail=agentdetail><#else><#assign detail=appdetail></#if> 
						<td title='${detail}'>&nbsp;
						<#if xzfyInfo.id.length() gt 10>
							<#if app_show?has_content && app_show.length() gt 26>
								${app_show[0..25]}..
							<#else>
								${app_show}
							</#if>
						<#else>
							<#assign appdetail=xzfyInfo.appdetail?default('')>
							<#assign agentdetail=xzfyInfo.agentDetail?default('')>
							<#if appdetail==''><#assign detail=agentdetail><#else><#assign detail=appdetail></#if> 
							<#if detail?has_content && detail.length() gt 26>
								${detail[0..25]}..
							<#else>
								${detail}
							</#if>
						</#if>
						</td>
						<!--被申请人名称-->
						<td>&nbsp;<#if xzfyInfo.defendant_name?has_content>${xzfyInfo.defendant_name}</#if></td>
						<!--立案审查人-->
						<#assign user1="${xzfyInfo.user1_name?default('')}">					
						<#assign user4="${xzfyInfo.user4_name?default('')}">
						<td>&nbsp;<#if user1=="">未指定<#else>${user1}<#if user4!="">，${user4}</#if></#if></td>																	
						<!--承办人-->
						<#assign user2="${xzfyInfo.user2_name?default('')}">					
						<#assign user3="${xzfyInfo.user3_name?default('')}">
						<td>&nbsp;<#if user2=="">未指定<#else>${user2}<#if user3!="">，${user3}</#if></#if></td>
						<td>&nbsp;</td>
						<!--审批人-->
						<td>&nbsp;${xzfyInfo.check_name?default('未指定')}</td>
						<!--案件状态-->
						<td>&nbsp;${handlType}</td>
						<!--查看-->
						<td>
						<div id="link"><a href="../xzfy/viewCase.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}" target="_blank">查看</a></div>
						</td>
						<!--操作-->
						<td>&nbsp;
						<a href="javascript:tiqu('${xzfyInfo.id}')" title="将使新增应诉案件与该条复议案件信息关联">关联</a>
						</td>
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
				<a href="javascript:goThePage(1)" class="ui-page-item ui-page-item-first">首页</a>
			    <a href="javascript:goThePage(${upPage})" class="ui-page-item ui-page-item-prev">上一页</a>
		     	<a href="javascript:goThePage(${downPage})" class="ui-page-item ui-page-next">下一页</a>
			    <a href="javascript:goThePage(${totalPage})" class="ui-page-item ui-page-last">尾页</a>
				<span>到<input class="input1"  name="gotoPageNum" id="gotoPageNum" />页</span>　<a href="#" onclick="gotoPage()" class="ui-button ui-button-go">Go</a>
            </div>
         </div>
      </div>
      <div style="text-align:center;">
      <input  type="button" class="btn5" value="跳过此步" onclick="gotoNewCase()" />
      </div>
</form>
</body>
<script>
function goThePage(pNums){
	document.getElementById("pageNum").value=pNums;
	document.Form1.action="../xzss/searchxzfy.action";
	document.Form1.submit();
}
function gotoNewCase(){
window.location="../xzss/xzssguanli.action?funcCode=${funcCode}&shenji="+${shenji}+"&shenhe2=0&shenhe1=0&fuyi=0&isxinzeng=1&beigao=0";
}
function tiqu(xzfyId){
if(confirm("确认关联该案件？")){
window.location="../xzss/xzssguanli.action?funcCode=${funcCode}&shenji=${shenji}&beigao=${beigao}&fuyi=${fuyi}&shenhe1=${shenhe1}&shenhe2=${shenhe2}&isxinzeng=1&xzfyId="+xzfyId;
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
					document.getElementById("pageNum").value=inputPage;
				    document.Form1.action="../xzss/searchxzfy.action";
					document.Form1.submit();
				}
				return;
}

</script>