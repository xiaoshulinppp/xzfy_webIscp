  <table class="ui-table  ui-table-list  list-fixed "  >
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
           <#assign account=pageNum1*5-5+1>
			<#list totalList1 as xzfyInfo>
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
<div class="ui-page">
 <span class="ui-page-item ui-item-link">
							         			<#assign upPage = pageNum1 -1>
												<#if upPage lt 1 >
												<#assign upPage = 1>
												</#if>
												<#assign downPage = pageNum1 +1>
												<#if (downPage gt totalPage1)>
												<#assign downPage = totalPage1>
												</#if>
												
    <#if pageNum1 gt 1>
    <a href="javascript:goPage1(${upPage})" class="ui-page-item ui-page-item-prev">上一页</a>
	</#if>
    <#if pageNum1<totalPage1>
     <a href="javascript:goPage1(${downPage})" class="ui-page-item ui-page-next">下一页</a>
    </#if>
	</span>
  </div>  