
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

<form name="Form1" id="Form1" action="../banan/showTotalList.action?listkeyword=${listkeyword}" method="post" onreset>

<#include "../website/header.ftl">

<div class="wal pageNow2">
      <div class="fl">当前位置：<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a>> 待办理案件查询</div>
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
		<input type="hidden" name="pNum" value="${pNum}" id="pageNum">
	  
      <div class="pageBox">
            <div class="searchList">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <th width="4%">序号</th>
                    <th width="12%">案件号</th>
                    <th width="8%">收案日期</th>
                    <th width="13%">申请人名称</th>
                  
                    <th width="11%">被申请人名称</th>
                    <th width="7%">立案审查人</th>
                    <th width="8%">承办人</th>
                    <th width="6%">审批人</th>
                    <th width="6%">案件状态</th>
                    <th width="10%">办案处室</th>
                    <#if listkeyword==8||listkeyword==9||listkeyword==10||listkeyword==11><th width="6%">办理</th></#if>
                    
                    <th width="5%">查看</th>
                    <th width="10%">操作</th>
                    <#if listkeyword==9||listkeyword==10||listkeyword==11><th width="5%">&nbsp;</th></#if>
                    <#if listkeyword==6><th width="8%">电子材料</th></#if>
                  </tr>
				  <#assign account=pNum*pageSize-pageSize+1>
				<#list caseList as xzfyInfo>
					<#assign handleAction='0'>
					<#assign handleText='0'>
					<#assign handleUser=''>
					<#assign handlType=''>
					<#assign handleOp=''>
					<#assign handleOpType=''>
						<#if xzfyInfo.status=="1">										
							<#assign handlType='立案审查'>
							<#assign handleAction='../xzfy/getlian.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&listkeyword=${listkeyword}&pNum=${pNum}'>
							<#assign handleText='立案审查'>
							<#assign handleOp='选择审查人'>
							<#assign handleOpType='11'>
							
						<#elseif xzfyInfo.status=="2">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleAction='../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}&listkeyword=${listkeyword}&pNum=${pNum}'>
							<#assign handleText='审批'>
							<#assign handlType='补正审批'>
							<#assign handleOp='转审批'>
							<#assign handleOpType='3'>
						<#else>
							<#assign handlType='补正已审批'>
							<#assign handleAction='../xzfy/getlian.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&listkeyword=${listkeyword}&pNum=${pNum}'>
							<#assign handleText='立案审查'>
							<#assign handleOp='选择审查人'>
							<#assign handleOpType='1'>
						</#if>										
						<#elseif xzfyInfo.status=="3">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleAction='../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}&listkeyword=${listkeyword}&pNum=${pNum}'>
							<#assign handleText='审批'>
							<#assign handlType='立案审批'>
							<#assign handleOp='转审批'>
							<#assign handleOpType='3'>
						<#else>
							<#assign handlType='立案已审批'>
							<#assign handleAction='../xzfy/getlian.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&listkeyword=${listkeyword}&pNum=${pNum}'>
							<#assign handleText='立案审查'>
							<#assign handleOp='选择审查人'>
							<#assign handleOpType='1'>
						</#if>		
							
						<#elseif xzfyInfo.status=="4">
							<#assign handleAction='../banan/bananform.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}&listkeyword=${listkeyword}&pNum=${pNum}'>
							<#assign handleText='办理'>	
							<#assign handlType='案件办理'>	
							<#assign handleOp='选择承办人'>	
							<#assign handleOpType='2'>						
							
						<#elseif xzfyInfo.status=="5">
						<#if  xzfyInfo.check_status=='1'>
								<#assign handleAction='../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}&listkeyword=${listkeyword}&pNum=${pNum}'>
								<#assign handleText='审批'>
								<#assign handlType='延期审批'>		
								<#assign handleOp='转审批'>
								<#assign handleOpType='3'>
						<#else>
							<#assign handlType='延期已审批'>
							<#assign handleAction='../banan/bananform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}&listkeyword=${listkeyword}&pNum=${pNum}'>
							<#assign handleText='办理'>
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
						</#if>	
						
						<#elseif xzfyInfo.status=="6">
							<#assign handleAction='../banan/bananform.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}&listkeyword=${listkeyword}&pNum=${pNum}'>
							<#assign handleText='办理'>	
							<#assign handlType='案件延期'>	
							<#assign handleOp='选择承办人'>	
							<#assign handleOpType='2'>
							
						<#elseif xzfyInfo.status=="7">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleAction='../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}&listkeyword=${listkeyword}&pNum=${pNum}'>
							<#assign handleText='审批'>
							<#assign handlType='中止审批'>	
							<#assign handleOp='转审批'>	
							<#assign handleOpType='3'>
						<#else>
							<#assign handlType='中止已审批'>
							<#assign handleAction='../banan/bananform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}&listkeyword=${listkeyword}&pNum=${pNum}'>
							<#assign handleText='办理'>
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
						</#if>	
							
						<#elseif xzfyInfo.status=="8">
							<#assign handleAction='../banan/bananform.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}&listkeyword=${listkeyword}&pNum=${pNum}'>
							<#assign handleText='办理'>	
							<#assign handlType='案件中止'>		
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
							
						<#elseif xzfyInfo.status=="9">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleAction='../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}&listkeyword=${listkeyword}&pNum=${pNum}'>
							<#assign handleText='审批'>
							<#assign handlType='恢复审理审批'>
							<#assign handleOp='转审批'>		
							<#assign handleOpType='3'>
						<#else>
							<#assign handlType='待恢复'>
							<#assign handleAction='../banan/bananform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}&listkeyword=${listkeyword}&pNum=${pNum}'>
							<#assign handleText='办理'>
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
						</#if>	
							
						<#elseif xzfyInfo.status=="10">
							<#assign handleAction='../banan/bananform.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}&listkeyword=${listkeyword}&pNum=${pNum}'>
							<#assign handleText='办理'>	
							<#assign handlType='恢复审理'>	
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
							
						<#elseif xzfyInfo.status=="11">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleAction='../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}&listkeyword=${listkeyword}&pNum=${pNum}'>
							<#assign handleText='审批'>
							<#assign handlType='结案审批'>	
							<#assign handleOp='转审批'>
							<#assign handleOpType='3'>
						<#else>
							<#if xzfyInfo.stadardResult=='1'>
							<#assign handlType='结案已审批'>
							<#assign handleAction='../banan/bananform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}&listkeyword=${listkeyword}&pNum=${pNum}'>
							<#assign handleText='办理'>
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
							<#else>
							<#assign handlType='结案已审批'>
							<#assign handleAction='../xzfy/getlian.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&listkeyword=${listkeyword}&pNum=${pNum}'>
							<#assign handleText='立案审查'>
							<#assign handleOp='选择审查人'>
							<#assign handleOpType='1'>
							</#if>
						</#if>	
						<#elseif xzfyInfo.status=="12">		
							<#assign handlType='已结案'>								
						</#if>
						
						<#if listkeyword==5>
							<#assign handlType='案件中止'>
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
						<!--审批人-->
						<td>&nbsp;${xzfyInfo.check_name?default('未指定')}</td>
						<!--案件状态-->
						<td>&nbsp;${handlType}</td>
						
						<#assign  chushi=xzfyInfo.app_type2?default(0)>
						
						<td>&nbsp;<#if chushi==224>行政复议案件办理一处<#elseif chushi==1613>行政复议案件办理二处<#else>无 </#if> </td>
						<!--办理-->
					<#if listkeyword==8||listkeyword==9||listkeyword==10||listkeyword==11>
						<#if listkeyword==8 && xzfyInfo.check_status == "1" || listkeyword==9 && xzfyInfo.check_status == "1">
							<td>审批中</td>
						<#else>
							<td  id="cxs" style="display:block" ><div id="link"><a href="${handleAction}">${handleText}</a></div></td>
						</#if>
					</#if>
						<!--查看-->
						<td>
						<div id="link"><a href="../xzfy/viewCase.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}" target="_blank">查看</a></div>
						</td>
						<!--操作-->
						<td>&nbsp;
						<div id="link"><a href="javascript:handleOp('${handleOpType}','${xzfyInfo.id}')">${handleOp}</a></div>
						<#if xzfyInfo.check_status=="1"><div id="link"><a href="javascript:cancleOp('${xzfyInfo.id}')">取消审批</a></div></#if>
						</td>
						<!--批量操作-->
						<#if listkeyword==10||listkeyword==11||listkeyword==9>
							<td><input type="checkbox" name="idList" value="${xzfyInfo.id}"/></td>
						</#if>
						<!--是否上传电子材料-->
						<#if listkeyword==6>
							<td><#if xzfyInfo.shouju_flag?default('0')=='1'>
							<font color="green">已上传</font><#else>未上传</#if></td>
						</#if>
						
					</tr>
					<#assign account=account+1>
				</#list>
             
            </table>
            <#if listkeyword==10||listkeyword==11>
	            <br/>
	            <div align="right">
	            <input type="button" value="批量审批" onclick="plsp('sp')" style="border:1px solid;color:white;background:green;padding:3px;"/>
	            </div>
            </#if>
            <#if listkeyword==9>
	            <br/>
	            <div align="right">
	            <input type="button" value="批量延期" onclick="plsp('yq')" style="border:1px solid;color:white;background:green;padding:3px;"/>
	            <input type="button" value="批量中止" onclick="plsp('zz')" style="border:1px solid;color:white;background:green;padding:3px;"/>
	            <input type="button" value="批量恢复" onclick="plsp('hf')" style="border:1px solid;color:white;background:green;padding:3px;"/>
	            <input type="button" value="听证记录" onclick="plsp('tz')" style="border:1px solid;color:white;background:green;padding:3px;"/>
	            <input type="button" value="调解记录" onclick="plsp('tj')" style="border:1px solid;color:white;background:green;padding:3px;"/>
	            </div>
            </#if>
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
				<a href="../banan/showanjianbanliList.action?pNum=1&funcCode=${funcCode}&listkeyword=${listkeyword}" class="ui-page-item ui-page-item-first">首页</a>
			    <a href="../banan/showanjianbanliList.action?pNum=${upPage}&funcCode=${funcCode}&listkeyword=${listkeyword}" class="ui-page-item ui-page-item-prev">上一页</a>
		     	<a href="../banan/showanjianbanliList.action?pNum=${downPage}&funcCode=${funcCode}&listkeyword=${listkeyword}" class="ui-page-item ui-page-next">下一页</a>
			    <a href="../banan/showanjianbanliList.action?pNum=${totalPage}&funcCode=${funcCode}&listkeyword=${listkeyword}" class="ui-page-item ui-page-last">尾页</a>　
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
			if(type==11){
				opendg("../xzfy/handleOpreatorXinShou.action?funcCode=${funcCode}&listkeyword=${listkeyword}&typeId="+"1"+"&xzfyId="+xzfyId,300,300);
			}else{
				opendg("../xzfy/handleOpreator.action?funcCode=${funcCode}&listkeyword=${listkeyword}&typeId="+type+"&xzfyId="+xzfyId,300,300);
			}
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
				window.location="../xzfy/cancleListCase.action?xzfyId="+xzfyId+"&funcCode=${funcCode}&listkeyword=${listkeyword}";
				
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
					window.location = "../banan/showanjianbanliList.action?funcCode=${funcCode}&pNum=" + inputPage + "&listkeyword=${listkeyword}";
				}
				return;
			}
		var x;
		function plsp(x){
			if(!isSelect()){
				alert("请选择需批量操作的案件！");	
			}else if(x=="sp"){
				var ids=getIds();
				opendg("../xzfy/batchOperation.action?funcCode=${funcCode}&listkeyword=${listkeyword}&ids="+ids,600,200);
			}else if(x=="yq"){
				var ids=getIds();
				opendg("../banan/batOperation.action?funcCode=${funcCode}&listkeyword=${listkeyword}&ids="+ids+"&batType=6",600,300);
			}else if(x=="zz"){
				var ids=getIds();
				opendg("../banan/batOperation.action?funcCode=${funcCode}&listkeyword=${listkeyword}&ids="+ids+"&batType=8",600,300);
			}else if(x=="hf"){
				var ids=getIds();
				opendg("../banan/batOperation.action?funcCode=${funcCode}&listkeyword=${listkeyword}&ids="+ids+"&batType=10",600,300);
			}
			else if(x=="tz"){
				var ids=getIds();
				opendg("../banan/batOperation.action?funcCode=${funcCode}&listkeyword=${listkeyword}&ids="+ids+"&batType=50",600,300);
			}
			else if(x=="tj"){
				var ids=getIds();
				opendg("../banan/batOperation.action?funcCode=${funcCode}&listkeyword=${listkeyword}&ids="+ids+"&batType=60",600,300);
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