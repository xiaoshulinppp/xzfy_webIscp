<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/base.css" rel="stylesheet" type="text/css" />
		<link href="../${Session['_USER_STYLE_'].cssPath}/main_style.css" rel="stylesheet" type="text/css" />
	<!--[if lt IE 7]><link href="../sys_theme/css/ie7hack.css" rel="stylesheet" type="text/css" media="screen"/><![endif]--><!--不可删--->
	
	<!--                       Javascripts 注意不要改变顺序                      -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
<!-- 组件template -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
	</head>
	<body>

<!--标题开始-->
<div class="ui-title fn-clear">
     <span class="ui-title-icon fn-left"><img src="../${Session['_USER_STYLE_'].imagePath}/icons/crumb.png"/></span>
      <h2 class="ui-title-cnt fn-left">待办理案件</h2>  
       <span class="ui-searchbar-btn" id="search-box-btn">
    <a href="javascript:slideToggle('#search-general')" id="searchbar-icon" class="show-search"  ></a></span></div>       
<!--标题结束-->

		
		<form name="Form1" id="Form1" action="../xzfy/showUserShenChaList.action" method="post">
<!--search start 搜索面板开始-->
<div class="ui-search fn-clear" >
    <div class="ui-search-general fn-clear  fn-hide" id="search-general">
    <table id=""class="ui-table ui-table-search  "  summary="这是一个1行4列的表格样式模板">
        <tbody class="">
        <tr>
          <td  align="right" width="20%">案号:</td>
          <td width="30%"><input class="ui-input-wdm" type="text" 
          <#if xzfyInfo.tjzfzh?has_content>value="${xzfyInfo.tjzfzh}"</#if> name="xzfyInfo.tjzfzh"/></td>
         <td  align="right" width="20%">收案日期:</td>
          <td width="30%"><input class="ui-input-wdm" type="text" onClick="WdatePicker()" 
          <#if xzfyInfo.receive_date?has_content>value="${xzfyInfo.receive_date}"</#if>  name="xzfyInfo.receive_date"/></td>
         
        </tr>
        <tr>
          <td  align="right">被申请人名称:</td>
          <td ><input class="ui-input-wdm" type="text" 
          <#if xzfyInfo.defendant_name?has_content>value="${xzfyInfo.defendant_name}"</#if>  name="xzfyInfo.defendant_name"/></td>
          <td  align="right">申请人名称:</td>
          <td  ><input class="ui-input-wdm" type="text" 
          <#if xzfyInfo.app_show?has_content>value="${xzfyInfo.app_show}"</#if>  name="xzfyInfo.app_show"/></td>
         </tr>
          <tr>
         </tr></tbody>
         <tfoot><!--可以让按钮居中-->
            <tr>
           <td colspan="4"><input  class="ui-btn ui-btn-yellow" type="submit" name="button" id=""  value="搜索"  title="搜索" onclick=""/><input class="ui-btn ui-btn-normal" type="reset" value="重置" title="重新填写"/></td>
         </tr>
        </tfoot>  
        
    </table>
  </div>  
</div>
<input type="hidden" name="funcCode" value="${funcCode}">
<input type="hidden" name="pageNum" value="${pageNum}" id="pageNum">
<!--search box end-->
<span class="x-line fn-clear"><img src="../${Session['_USER_STYLE_'].imagePath}/pic_search_line.png"/></span><!--我是有箭头灰色的分割线-->
			
<!--列表开始-->
 <div class="ui-list-nobtnbar fn-clear ">
    <table class="ui-table  ui-table-list  list-fixed "  >
       <thead class=""  id="" name="" >
 	   <tr>
 	   					<th width="3%">序号</th>
						<th width="10%">案号</th>
						<th width="8%">收案日期</th>
						<th width="10%">申请人名称</th>
						<th width="5%">申请人类别</th>
						<th width="10%">被申请人名称</th>
						<th width="7%">立案审查人</th>
						<th width="5%">承办人</th>
						<th width="5%">审批人</th>
						<th width="5%">案件状态</th>
						<th width="5%">办理</th>
						<th width="5%">操作</th>
 	     </tr>
      </thead>
           <tbody class="discolor">
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
										<#assign handleAction='../banan/banan.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}'>
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
										<#assign handleAction='../banan/banan.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}'>
										<#assign handleText='办理'>
										<#assign handleOp='选择承办人'>
										<#assign handleOpType='2'>
									</#if>	
									
									<#elseif xzfyInfo.status=="6">
										<#assign handleAction='../banan/banan.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}'>
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
										<#assign handleAction='../banan/banan.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}'>
										<#assign handleText='办理'>
										<#assign handleOp='选择承办人'>
										<#assign handleOpType='2'>
									</#if>	
										
									<#elseif xzfyInfo.status=="8">
										<#assign handleAction='../banan/banan.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}'>
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
										<#assign handleAction='../banan/banan.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}'>
										<#assign handleText='办理'>
										<#assign handleOp='选择承办人'>
										<#assign handleOpType='2'>
									</#if>	
										
									<#elseif xzfyInfo.status=="10">
										<#assign handleAction='../banan/banan.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}'>
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
										<#assign handlType='结案已审批'>
										<#assign handleAction='../banan/banan.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}'>
										<#assign handleText='办理'>
										<#assign handleOp='选择承办人'>
										<#assign handleOpType='2'>
									</#if>											
									</#if>			
			
							<tr >
							<td>${account}</td>
								<td  >&nbsp;${xzfyInfo.tjzfzh?default('未立案')}</td>				
								<td  >&nbsp;<#if xzfyInfo.receive_date?has_content>${xzfyInfo.receive_date}</#if></td>
								<td  >&nbsp;<#if xzfyInfo.app_show?has_content>${xzfyInfo.app_show}</#if></td>
								<td  >&nbsp;
										<#if xzfyInfo.app_type?has_content>
						<#if xzfyInfo.app_type=='1'>
						公民
						<#elseif xzfyInfo.app_type=='2'>
						法人
			
						</#if>
				<#else>
				&nbsp;
				</#if>
								
								
								</td>
								<td  >&nbsp;<#if xzfyInfo.defendant_name?has_content>${xzfyInfo.defendant_name}</#if></td>	
								<td  >&nbsp;${xzfyInfo.user1_name?default('未指定')}</td>
								<td  >&nbsp;${xzfyInfo.user2_name?default('未指定')}</td>
								<td  >&nbsp;${xzfyInfo.check_name?default('未指定')}</td>
								<td  >
									${handlType}
								</td>
								<td  id="cxs" style="display:block" >
									<a href="${handleAction}">${handleText}</a>&nbsp;		
								</td>
								<td><a href="javascript:handleOp('${handleOpType}','${xzfyInfo.id}')">${handleOp}</a></td>
							</tr>
							 <#assign account=account+1>
						</#list>
           
     </tbody>
     </table>
</div>

<div class="ui-page">

    <span class="ui-page-item ui-page-item-info"> 第${pageNum}/${totalPage}页   共${totalCount}条</span>
							         			<#assign upPage = pageNum -1>
												<#if upPage lt 1 >
												<#assign upPage = 1>
												</#if>
												<#assign downPage = pageNum +1>
												<#if (downPage gt totalPage)>
												<#assign downPage = totalPage>
												</#if>
												
    <span class="ui-page-item ui-page-item-go"> <h4>到</h4><input class="input-page"   name="gotoPageNum" id="gotoPageNum" /><a href="#" onclick="gotoPage()" class="ui-button ui-button-go">Go</a></span>
    <span class="ui-page-item ui-item-link">
    <a href="javascript:goPage(1)" class="ui-page-item ui-page-item-first">首页</a>
    <a href="javascript:goPage(${upPage})" class="ui-page-item ui-page-item-prev">上一页</a>
     <a href="javascript:goPage(${downPage})" class="ui-page-item ui-page-next">下一页</a>
    <a href="javascript:goPage(${totalPage})" class="ui-page-item ui-page-last">尾页</a></span>
    
</div> 		

		</form>
		
	</body>
</html>
		
	
	<script>
	
		function handleOp(type,xzfyId){
			opendg('xzfy/handleOpreator.action?funcCode=${funcCode}&typeId='+type+"&xzfyId="+xzfyId,300,300)
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
	