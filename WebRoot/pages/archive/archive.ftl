<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行政复议信息管理系统</title>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
	
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
</head>

<body>



  
    <form id="form1" name="form1" action="''" method="post" ENCTYPE="multipart/form-data">
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="xzfyId" value="${xzfyId}" />
			<#assign user_id=Session['_USER_LOGIN_'].id>
	
<!--=============================================================================================================================================-->	
<!--========-- start---答复通知---start ======================-- start---答复通知---start --======================-- start---答复通知---start --=========================================================================================-->  
	
		<div class="formDiv" id="banan">
			<div class="btn">
				<div class="fl">
					<a href="javascript:saveArchives()" style="background:yellow<#if locbm!=xzfyInfo.caseorg?default('')>;display:none</#if>" >保存案卷</a>
				
	           		
	           							           		
	           	</div>		 
		  	</div>
		  	
		  	
			
			
			<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table  ui-table-list  list-fixed " >
					
					<tr>
						<th width="30%">申请书</th>
						<td>
							<#if archiveList1?has_content||fileList?has_content>
									<ul>
									<#if archiveList1?has_content>
										<#list archiveList1 as archive>
											<li>
												${archive.fileName?default('')}
												<span style="float:right" >
													<#if xzfyInfo.receive_type=='4'>
														<#if archive.flag?has_content>
															<#if archive.flag=='0'>
																<a href="javascript:archiveToZxfy('${archive.id?default('')}')"><font color="green" style="font-size:15px">推送</font></a>&nbsp;&nbsp;
															<#else>
																<#if archive.status?has_content>
																	<#if archive.status=='0'>
																		<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">开放在线阅卷</font></a>&nbsp;&nbsp;
																	</#if>
																	<#if archive.status=='1'>
																		<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">关闭在线阅卷</font></a>&nbsp;&nbsp;
																	</#if>
																<#else>
																	<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">开放在线阅卷</font></a>&nbsp;&nbsp;
																</#if>
															</#if>
														<#else>
															<a href="javascript:archiveToZxfy('${archive.id?default('')}')"><font color="green" style="font-size:15px">推送</font></a>&nbsp;&nbsp;
														</#if>
													</#if>
													<a href="${archive.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
													<a <#if locbm!=xzfyInfo.caseorg?default('')>style="display:none"</#if> href="javascript:deleteArchive('${archive.id?default('')}')"><font color="green" style="font-size:15px">删除</font></a>
												</span>
												<br/>
												上传者：${archive.uploadUserName?default('')} ${archive.uploadTime?default('')}
											</li>
										</#list>
									</#if>
									<#if fileList?has_content>
										<#list fileList as fList>
									 		<li>
									 			${fList.fileName?default('')}
									 			<span>
									 			<a href="..${fList.storedLocation?default('')}${fList.storedName?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
												<a <#if locbm!=xzfyInfo.caseorg?default('')>style="display:none"</#if> href="../xzfy/deleteFile.action?fileId=${fList.id}&funcCode=${funcCode}&xzfyId=${xzfyInfo.id}"><font color="green" style="font-size:15px">删除</font></a>
									 			</span>
									 		</li>
									 	</#list>
									</#if>
									</ul>
							<#else>
								<font color="green" style="font-size:15px">未上传</font>&nbsp;
							</#if>
							<a href="javascript:add1()">添加</a>
							<div id="div_1"></div>
						</td>
					</tr>
					<tr>
						<th>收件登记材料</th>
						<td>
							<#if archiveList2?has_content>
								<ul>
								<#list archiveList2 as archive>
									<li>
										${archive.fileName?default('')} &nbsp;&nbsp;&nbsp;
										<span style="float:right">
											<#if xzfyInfo.receive_type=='4'>
												<#if archive.flag?has_content>
													<#if archive.flag=='0'>
														<a href="javascript:archiveToZxfy('${archive.id?default('')}')"><font color="green" style="font-size:15px">推送</font></a>&nbsp;&nbsp;
													<#else>
														<#if archive.status?has_content>
															<#if archive.status=='0'>
																<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">开放在线阅卷</font></a>&nbsp;&nbsp;
															</#if>
															<#if archive.status=='1'>
																<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">关闭在线阅卷</font></a>&nbsp;&nbsp;
															</#if>
														<#else>
															<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">开放在线阅卷</font></a>&nbsp;&nbsp;
														</#if>
													</#if>
												<#else>
													<a href="javascript:archiveToZxfy('${archive.id?default('')}')"><font color="green" style="font-size:15px">推送</font></a>&nbsp;&nbsp;
												</#if>
											</#if>
											<a href="${archive.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
											<a <#if locbm!=xzfyInfo.caseorg?default('')>style="display:none"</#if> href="javascript:deleteArchive('${archive.id?default('')}')"><font color="green" style="font-size:15px">删除</font></a>
										</span>
										<br/>
										上传者：${archive.uploadUserName?default('')} ${archive.uploadTime?default('')}
									</li>
								</#list>
								</ul>
							<#else>
								<font color="green" style="font-size:15px">未上传</font>&nbsp;
							</#if>
							<a href="javascript:add2()">添加</a>
							<div id="div_2"></div>
						</td>
					</tr>
					<tr>
						<th>申请人提交的其他材料</th>
						<td>
							<#if xzfyInfo.receive_type=='4'>
								<#if archiveList14?has_content>
									<ul>
										<#list archiveList14 as archive>
											<li>
												${archive.fileName?default('')}
												<span style="float:right">
													<#if archive.status?has_content>
														<#if archive.status=='0'>
															<a href="javascript:updateStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">开放在线阅卷</font></a>&nbsp;&nbsp;
														</#if>
														<#if archive.status=='1'>
															<a href="javascript:updateStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">关闭在线阅卷</font></a>&nbsp;&nbsp;
														</#if>
													</#if>
													<a href="${archive.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
												</span>
												<br/>
												上传者：${archive.uploadUserName?default('')} ${archive.uploadTime?default('')}
											</li>
										</#list>
									</ul>
								<#else>
									<font color="green" style="font-size:15px">未上传</font>&nbsp;
								</#if>
							<#else>
								<#if archiveList3?has_content||fileList1?has_content>
									<ul>
										<#if archiveList3?has_content>
											<#list archiveList3 as archive>
												<li>
													${archive.fileName?default('')}
													<span style="float:right">
													<a href="${archive.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
													<a <#if locbm!=xzfyInfo.caseorg?default('')>style="display:none"</#if> href="javascript:deleteArchive('${archive.id?default('')}')"><font color="green" style="font-size:15px">删除</font></a>
													</span>
													<br/>
													上传者：${archive.uploadUserName?default('')} ${archive.uploadTime?default('')}
												</li>
											</#list>
										</#if>
										<#if fileList1?has_content>
											<#list fileList1 as fList>
										 		<li>
										 			${fList.fileName?default('')} 
										 			<span>
										 			<a href="..${fList.storedLocation?default('')}${fList.storedName?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
													<a <#if locbm!=xzfyInfo.caseorg?default('')>style="display:none"</#if> href="../xzfy/deleteFile.action?fileId=${fList.id}&funcCode=${funcCode}&xzfyId=${xzfyInfo.id}"><font color="green" style="font-size:15px">删除</font></a>
										 			</span>
										 		</li>
									 		</#list>
									 	</#if>
									</ul>
								<#else>
									<font color="green" style="font-size:15px">未上传</font>&nbsp;
								</#if>
								<a href="javascript:add3()">添加</a>
								<div id="div_3"></div>
							</#if>
						</td>
					</tr>
					<tr>
						<th>申请人补正材料</th>
						<td>
							<#if xzfyInfo.receive_type=='4'>
								<#if archiveList15?has_content>
									<ul>
										<#list archiveList15 as archive>
											<li>
												${archive.fileName?default('')} &nbsp;&nbsp;&nbsp;
												<span style="float:right">
													<#if archive.status?has_content>
														<#if archive.status=='0'>
															<a href="javascript:updateStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">开放在线阅卷</font></a>&nbsp;&nbsp;
														</#if>
														<#if archive.status=='1'>
															<a href="javascript:updateStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">关闭在线阅卷</font></a>&nbsp;&nbsp;
														</#if>
													</#if>
													<a href="${archive.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
												</span>
												<br/>
												上传者：${archive.uploadUserName?default('')} ${archive.uploadTime?default('')}
											</li>
										</#list>
									</ul>
								<#else>
									<font color="green" style="font-size:15px">未上传</font>&nbsp;
								</#if>
							<#else>
								<#if archiveList4?has_content>
									<ul>
									<#list archiveList4 as archive>
										<li>
											${archive.fileName?default('')} &nbsp;&nbsp;&nbsp;
											<span style="float:right">
											<a href="${archive.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
											<a <#if locbm!=xzfyInfo.caseorg?default('')>style="display:none"</#if> href="javascript:deleteArchive('${archive.id?default('')}')"><font color="green" style="font-size:15px">删除</font></a>
											</span>
											<br/>
											上传者：${archive.uploadUserName?default('')} ${archive.uploadTime?default('')}
										</li>
									</#list>
									</ul>
								<#else>
									<font color="green" style="font-size:15px">未上传</font>&nbsp;
								</#if>
								<a href="javascript:add4()">添加</a>
								<div id="div_4"></div>
							</#if>
						</td>
					</tr>
					<tr>
						<th>阅卷笔录、阅卷意见及材料</th>
						<td>
							<#if archiveList5?has_content>
								<ul>
								<#list archiveList5 as archive>
									<li>
										${archive.fileName?default('')} &nbsp;&nbsp;&nbsp;
										<span style="float:right">
											<#if xzfyInfo.receive_type=='4'>
												<#if archive.flag?has_content>
													<#if archive.flag=='0'>
														<a href="javascript:archiveToZxfy('${archive.id?default('')}')"><font color="green" style="font-size:15px">推送</font></a>&nbsp;&nbsp;
													<#else>
														<#if archive.status?has_content>
															<#if archive.status=='0'>
																<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">开放在线阅卷</font></a>&nbsp;&nbsp;
															</#if>
															<#if archive.status=='1'>
																<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">关闭在线阅卷</font></a>&nbsp;&nbsp;
															</#if>
														<#else>
															<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">开放在线阅卷</font></a>&nbsp;&nbsp;
														</#if>
													</#if>
												<#else>
													<a href="javascript:archiveToZxfy('${archive.id?default('')}')"><font color="green" style="font-size:15px">推送</font></a>&nbsp;&nbsp;
												</#if>
											</#if>
											<a href="${archive.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
											<a <#if locbm!=xzfyInfo.caseorg?default('')>style="display:none"</#if> href="javascript:deleteArchive('${archive.id?default('')}')"><font color="green" style="font-size:15px">删除</font></a>
										</span>
										<br/>
										上传者：${archive.uploadUserName?default('')} ${archive.uploadTime?default('')}
									</li>
								</#list>
								</ul>
							<#else>
								<font color="green" style="font-size:15px">未上传</font>&nbsp;
							</#if>
							<a href="javascript:add5()">添加</a>
							<div id="div_5"></div>
						</td>
					</tr>
					<tr>
						<th>被申请人答复书</th>
						<td>
							<#if archiveList6?has_content>
								<ul>
								<#list archiveList6 as archive>
									<li>
										${archive.fileName?default('')} &nbsp;&nbsp;&nbsp;
										<span style="float:right">
											<#if xzfyInfo.receive_type=='4'>
												<#if archive.flag?has_content>
													<#if archive.flag=='0'>
														<a href="javascript:archiveToZxfy('${archive.id?default('')}')"><font color="green" style="font-size:15px">推送</font></a>&nbsp;&nbsp;
													<#else>
														<#if archive.status?has_content>
															<#if archive.status=='0'>
																<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">开放在线阅卷</font></a>&nbsp;&nbsp;
															</#if>
															<#if archive.status=='1'>
																<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">关闭在线阅卷</font></a>&nbsp;&nbsp;
															</#if>
														<#else>
															<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">开放在线阅卷</font></a>&nbsp;&nbsp;
														</#if>
													</#if>
												<#else>
													<a href="javascript:archiveToZxfy('${archive.id?default('')}')"><font color="green" style="font-size:15px">推送</font></a>&nbsp;&nbsp;
												</#if>
											</#if>
											<a href="${archive.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
											<a <#if locbm!=xzfyInfo.caseorg?default('')>style="display:none"</#if> href="javascript:deleteArchive('${archive.id?default('')}')"><font color="green" style="font-size:15px">删除</font></a>
										</span>
										<br/>
										上传者：${archive.uploadUserName?default('')} ${archive.uploadTime?default('')}
									</li>
								</#list>
								</ul>
							<#else>
								<font color="green" style="font-size:15px">未上传</font>&nbsp;
							</#if>
							<a href="javascript:add6()">添加</a>
							<div id="div_6"></div>
						</td>
					</tr>
					<tr>
						<th>被申请人证据材料</th>
						<td>
							<#if archiveList7?has_content>
								<ul>
								<#list archiveList7 as archive>
									<li>
										${archive.fileName?default('')} &nbsp;&nbsp;&nbsp;
										<span style="float:right">
											<#if xzfyInfo.receive_type=='4'>
												<#if archive.flag?has_content>
													<#if archive.flag=='0'>
														<a href="javascript:archiveToZxfy('${archive.id?default('')}')"><font color="green" style="font-size:15px">推送</font></a>&nbsp;&nbsp;
													<#else>
														<#if archive.status?has_content>
															<#if archive.status=='0'>
																<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">开放在线阅卷</font></a>&nbsp;&nbsp;
															</#if>
															<#if archive.status=='1'>
																<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">关闭在线阅卷</font></a>&nbsp;&nbsp;
															</#if>
														<#else>
															<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">开放在线阅卷</font></a>&nbsp;&nbsp;
														</#if>
													</#if>
												<#else>
													<a href="javascript:archiveToZxfy('${archive.id?default('')}')"><font color="green" style="font-size:15px">推送</font></a>&nbsp;&nbsp;
												</#if>
											</#if>
											<a href="${archive.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
											<a <#if locbm!=xzfyInfo.caseorg?default('')>style="display:none"</#if> href="javascript:deleteArchive('${archive.id?default('')}')"><font color="green" style="font-size:15px">删除</font></a>
										</span>
										<br/>
										上传者：${archive.uploadUserName?default('')} ${archive.uploadTime?default('')}
									</li>
								</#list>
								</ul>
							<#else>
								<font color="green" style="font-size:15px">未上传</font>&nbsp;
							</#if>
							<a href="javascript:add7()">添加</a>
							<div id="div_7"></div>
						</td>
					</tr>
					<tr>
						<th>被申请人补充材料</th>
						<td>
							<#if archiveList8?has_content>
								<ul>
								<#list archiveList8 as archive>
									<li>
										${archive.fileName?default('')} &nbsp;&nbsp;&nbsp;
										<span style="float:right">
											<#if xzfyInfo.receive_type=='4'>
												<#if archive.flag?has_content>
													<#if archive.flag=='0'>
														<a href="javascript:archiveToZxfy('${archive.id?default('')}')"><font color="green" style="font-size:15px">推送</font></a>&nbsp;&nbsp;
													<#else>
														<#if archive.status?has_content>
															<#if archive.status=='0'>
																<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">开放在线阅卷</font></a>&nbsp;&nbsp;
															</#if>
															<#if archive.status=='1'>
																<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">关闭在线阅卷</font></a>&nbsp;&nbsp;
															</#if>
														<#else>
															<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">开放在线阅卷</font></a>&nbsp;&nbsp;
														</#if>
													</#if>
												<#else>
													<a href="javascript:archiveToZxfy('${archive.id?default('')}')"><font color="green" style="font-size:15px">推送</font></a>&nbsp;&nbsp;
												</#if>
											</#if>
											<a href="${archive.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
											<a <#if locbm!=xzfyInfo.caseorg?default('')>style="display:none"</#if> href="javascript:deleteArchive('${archive.id?default('')}')"><font color="green" style="font-size:15px">删除</font></a>
										</span>
										<br/>
										上传者：${archive.uploadUserName?default('')} ${archive.uploadTime?default('')}
									</li>
								</#list>
								</ul>
							<#else>
								<font color="green" style="font-size:15px">未上传</font>&nbsp;
							</#if>
							<a href="javascript:add8()">添加</a>
							<div id="div_8"></div>
						</td>
					</tr>
					<tr>
						<th>第三人有关材料</th>
						<td>
							<#if archiveList9?has_content>
								<ul>
								<#list archiveList9 as archive>
									<li>
										${archive.fileName?default('')} &nbsp;&nbsp;&nbsp;
										<span style="float:right">
											<#if xzfyInfo.receive_type=='4'>
												<#if archive.flag?has_content>
													<#if archive.flag=='0'>
														<a href="javascript:archiveToZxfy('${archive.id?default('')}')"><font color="green" style="font-size:15px">推送</font></a>&nbsp;&nbsp;
													<#else>
														<#if archive.status?has_content>
															<#if archive.status=='0'>
																<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">开放在线阅卷</font></a>&nbsp;&nbsp;
															</#if>
															<#if archive.status=='1'>
																<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">关闭在线阅卷</font></a>&nbsp;&nbsp;
															</#if>
														<#else>
															<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">开放在线阅卷</font></a>&nbsp;&nbsp;
														</#if>
													</#if>
												<#else>
													<a href="javascript:archiveToZxfy('${archive.id?default('')}')"><font color="green" style="font-size:15px">推送</font></a>&nbsp;&nbsp;
												</#if>
											</#if>
											<a href="${archive.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
											<a <#if locbm!=xzfyInfo.caseorg?default('')>style="display:none"</#if> href="javascript:deleteArchive('${archive.id?default('')}')"><font color="green" style="font-size:15px">删除</font></a>
										</span>
										<br/>
										上传者：${archive.uploadUserName?default('')} ${archive.uploadTime?default('')}
									</li>
								</#list>
								</ul>
							<#else>
								<font color="green" style="font-size:15px">未上传</font>&nbsp;
							</#if>
							<a href="javascript:add9()">添加</a>
							<div id="div_9"></div>
						</td>
					</tr>
					<tr>
						<th>复议机构制作获取的材料</th>
						<td>
							<#if archiveList10?has_content>
								<ul>
								<#list archiveList10 as archive>
									<li>
										${archive.fileName?default('')} &nbsp;&nbsp;&nbsp;
										<span style="float:right">
											<#if xzfyInfo.receive_type=='4'>
												<#if archive.flag?has_content>
													<#if archive.flag=='0'>
														<a href="javascript:archiveToZxfy('${archive.id?default('')}')"><font color="green" style="font-size:15px">推送</font></a>&nbsp;&nbsp;
													<#else>
														<#if archive.status?has_content>
															<#if archive.status=='0'>
																<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">开放在线阅卷</font></a>&nbsp;&nbsp;
															</#if>
															<#if archive.status=='1'>
																<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">关闭在线阅卷</font></a>&nbsp;&nbsp;
															</#if>
														<#else>
															<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">开放在线阅卷</font></a>&nbsp;&nbsp;
														</#if>
													</#if>
												<#else>
													<a href="javascript:archiveToZxfy('${archive.id?default('')}')"><font color="green" style="font-size:15px">推送</font></a>&nbsp;&nbsp;
												</#if>
											</#if>
											<a href="${archive.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
											<a <#if locbm!=xzfyInfo.caseorg?default('')>style="display:none"</#if> href="javascript:deleteArchive('${archive.id?default('')}')"><font color="green" style="font-size:15px">删除</font></a>
										</span>
										<br/>
										上传者：${archive.uploadUserName?default('')} ${archive.uploadTime?default('')}
									</li>
								</#list>
								</ul>
							<#else>
								<font color="green" style="font-size:15px">未上传</font>&nbsp;
							</#if>
							<a href="javascript:add10()">添加</a>
							<div id="div_10"></div>
						</td>
					</tr>
					<tr>
						<th>正卷其他材料</th>
						<td>
							<#if archiveList11?has_content>
								<ul>
								<#list archiveList11 as archive>
									<li>
										${archive.fileName?default('')} &nbsp;&nbsp;&nbsp;
										<span style="float:right">
											<#if xzfyInfo.receive_type=='4'>
												<#if archive.flag?has_content>
													<#if archive.flag=='0'>
														<a href="javascript:archiveToZxfy('${archive.id?default('')}')"><font color="green" style="font-size:15px">推送</font></a>&nbsp;&nbsp;
													<#else>
														<#if archive.status?has_content>
															<#if archive.status=='0'>
																<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">开放在线阅卷</font></a>&nbsp;&nbsp;
															</#if>
															<#if archive.status=='1'>
																<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">关闭在线阅卷</font></a>&nbsp;&nbsp;
															</#if>
														<#else>
															<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">开放在线阅卷</font></a>&nbsp;&nbsp;
														</#if>
													</#if>
												<#else>
													<a href="javascript:archiveToZxfy('${archive.id?default('')}')"><font color="green" style="font-size:15px">推送</font></a>&nbsp;&nbsp;
												</#if>
											</#if>
											<a href="${archive.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
											<a <#if locbm!=xzfyInfo.caseorg?default('')>style="display:none"</#if> href="javascript:deleteArchive('${archive.id?default('')}')"><font color="green" style="font-size:15px">删除</font></a>
										</span>
										<br/>
										上传者：${archive.uploadUserName?default('')} ${archive.uploadTime?default('')}
									</li>
								</#list>
								</ul>
							<#else>
								<font color="green" style="font-size:15px">未上传</font>&nbsp;
							</#if>
							<a href="javascript:add11()">添加</a>
							<div id="div_11"></div>
						</td>
					</tr>
					<tr>
						<th>副卷材料</th>
						<td>
							<#if archiveList12?has_content>
								<ul>
								<#list archiveList12 as archive>
									<li>
										${archive.fileName?default('')} &nbsp;&nbsp;&nbsp;
										<span style="float:right">
											<#if xzfyInfo.receive_type=='4'>
												<#if archive.flag?has_content>
													<#if archive.flag=='0'>
														<a href="javascript:archiveToZxfy('${archive.id?default('')}')"><font color="green" style="font-size:15px">推送</font></a>&nbsp;&nbsp;
													<#else>
														<#if archive.status?has_content>
															<#if archive.status=='0'>
																<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">开放在线阅卷</font></a>&nbsp;&nbsp;
															</#if>
															<#if archive.status=='1'>
																<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">关闭在线阅卷</font></a>&nbsp;&nbsp;
															</#if>
														<#else>
															<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">开放在线阅卷</font></a>&nbsp;&nbsp;
														</#if>
													</#if>
												<#else>
													<a href="javascript:archiveToZxfy('${archive.id?default('')}')"><font color="green" style="font-size:15px">推送</font></a>&nbsp;&nbsp;
												</#if>
											</#if>
											<a href="${archive.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
											<a <#if locbm!=xzfyInfo.caseorg?default('')>style="display:none"</#if> href="javascript:deleteArchive('${archive.id?default('')}')"><font color="green" style="font-size:15px">删除</font></a>
										</span>
										<br/>
										上传者：${archive.uploadUserName?default('')} ${archive.uploadTime?default('')}
									</li>
								</#list>
								</ul>
							<#else>
								<font color="green" style="font-size:15px">未上传</font>&nbsp;
							</#if>
							<a href="javascript:add12()">添加</a>
							<div id="div_12"></div>
						</td>
					</tr>
					<tr>
						<th title="1.请上传.doc后缀文件，以便在高级检索中进行全文检索;  2.上传的结案文书和在线保存的文书互相覆盖，仅保留最新版">结案文书</th>
						<td title="1.请上传.doc后缀文件，以便在高级检索中进行全文检索;  2.上传的结案文书和在线保存的文书互相覆盖，仅保留最新版">
							<#if archiveList13?has_content||jieandocsize != 0||xzfyInfo.jieanwenshu?has_content>
								<ul>
									<#if archiveList13?has_content>
										<#list archiveList13 as archive>
											<li>
												${archive.fileName?default('')} &nbsp;&nbsp;&nbsp;
												<span style="float:right">
													<#if xzfyInfo.receive_type=='4'>
												<#if archive.flag?has_content>
													<#if archive.flag=='0'>
														<a href="javascript:archiveToZxfy('${archive.id?default('')}')"><font color="green" style="font-size:15px">推送</font></a>&nbsp;&nbsp;
													<#else>
														<#if archive.status?has_content>
															<#if archive.status=='0'>
																<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">开放在线阅卷</font></a>&nbsp;&nbsp;
															</#if>
															<#if archive.status=='1'>
																<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">关闭在线阅卷</font></a>&nbsp;&nbsp;
															</#if>
														<#else>
															<a href="javascript:updateXzfyStatus('${archive.id?default('')}')"><font color="green" style="font-size:15px">开放在线阅卷</font></a>&nbsp;&nbsp;
														</#if>
													</#if>
												<#else>
													<a href="javascript:archiveToZxfy('${archive.id?default('')}')"><font color="green" style="font-size:15px">推送</font></a>&nbsp;&nbsp;
												</#if>
											</#if>
													<a href="${archive.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
													<a <#if locbm!=xzfyInfo.caseorg?default('')>style="display:none"</#if> href="javascript:deleteArchive('${archive.id?default('')}')"><font color="green" style="font-size:15px">删除</font></a>
												</span>
												<br/>
												上传者：${archive.uploadUserName?default('')} ${archive.uploadTime?default('')}
											</li>
										</#list>
									</#if>
									<#if jieandocsize != 0>
										<li>
											已保存在线文书 &nbsp;&nbsp;&nbsp;
											<span>
											<a href="javascript:getjieanDoc()"><font color="green" style="font-size:15px">查看</font></a>&nbsp;&nbsp;
											</span>
										</li>
									</#if>
									<#if xzfyInfo.jieanwenshu?has_content>
										<li>
											已上传文书 &nbsp;&nbsp;&nbsp;
											<span>
											<a href="${xzfyInfo.jieanwenshu}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
											<a <#if locbm!=xzfyInfo.caseorg?default('')>style="display:none"</#if> href="javascript:deleteOldJieanWenshu('${xzfyInfo.id}')"><font color="green" style="font-size:15px">删除</font></a>
											</span>
										</li>
									</#if>
								</ul>
							<#else>
								<font color="green" style="font-size:15px">未上传</font>&nbsp;
								<a id="addJiean" href="javascript:add13()">添加</a>
							</#if>
							<div id="div_13" style="display:none">
							<input type="file" id="upFile13" name="upFile13" class="inputTextFile" /><a href="javascript:del13('upFile13')">删除</a>
							</div>
						</td>
					</tr>
				</table>
		<div style="margin-left:40px">
			<p></p>
		</div>
<br/>

		<br/><br/>
		</div>
	      <br/><br/>     
            
<!--========-- end---答复通知---end =======================-- end---答复通知--end --=======================-- end---答复通知---end --=======================================================================================-->		
<!--=============================================================================================================================================-->	

<!--=============================================================================================================================================-->	
  </form>


</body>
</html>


<script>
	/*-----------------------------------在线复议内容（阅卷查看）----------------------------------------*/
	/* 更改在线案卷信息是否可查看状态 */
	function updateStatus(id){
		window.form1.action="updateStatus.action?id="+id;
		window.form1.submit();
	}
	/*更改行政复议同步到在线复议材料的状态*/
	function updateXzfyStatus(id){
		window.form1.action="updateXzfyStatus.action?id="+id;
		window.form1.submit();
	}
	/* 推送案卷信息到在线复议 */
	function archiveToZxfy(id){
		if(confirm("是否确认推送？")){
			window.form1.action="archiveToZxfy.action?id="+id;
			window.form1.submit();
		}
	}
	/*-------------------------------------------------------------------------------------------*/
	function getjieanDoc(){
		var url="../viewJiean.jsp?&d_filetype=doc&caseId=${xzfyInfo.id}&mstype=${jieandoctype}&d_username=${Session['_USER_LOGIN_'].id}";
		window.open(url);
	}
					
	function saveArchives(){
		var extension=document.getElementById("upFile13").value;
		if(extension!=""){
	 		idx = extension.lastIndexOf(".");
		 	ext = extension.substr(idx+1).toUpperCase();   
       	 	ext = ext.toLowerCase( );  
       	 	if (ext != 'doc'){  
                alert("只能上传.doc类型的结案文书"); 
                return;  
        	}  
		}
		window.form1.action="saveArchives.action";
		window.form1.submit();
	}
	function deleteArchive(id){
		window.form1.action="deleteArchive.action?id="+id;
		window.form1.submit();
	}
	function deleteOldJieanWenshu(id){
		window.form1.action="deleteOldJieanWenshu.action?xzfyId="+id;
		window.form1.submit();
	}
	
	var count=0;
	function add1(){
		var e=document.createElement('div');
		e.id="div"+count;
		e.innerHTML="<input type=\"file\" name=\"upFile1\" class=\"inputTextFile\" />"+"<a href=\"javascript:del1(\'"+e.id+"\')\">删除</a>";
		document.getElementById("div_1").appendChild(e);
		count++;
	}
	function del1(id){
		var e=document.getElementById(id);
		document.getElementById("div_1").removeChild(e);
	}
	function add2(){
		var e=document.createElement('div');
		e.id="div"+count;
		e.innerHTML="<input type=\"file\" name=\"upFile2\" class=\"inputTextFile\" />"+"<a href=\"javascript:del2(\'"+e.id+"\')\">删除</a>";
		document.getElementById("div_2").appendChild(e);
		count++;
	}
	function del2(id){
		var e=document.getElementById(id);
		document.getElementById("div_2").removeChild(e);
	}
	function add3(){
		var e=document.createElement('div');
		e.id="div"+count;
		e.innerHTML="<input type=\"file\" name=\"upFile3\" class=\"inputTextFile\" />"+"<a href=\"javascript:del3(\'"+e.id+"\')\">删除</a>";
		document.getElementById("div_3").appendChild(e);
		count++;
	}
	function del3(id){
		var e=document.getElementById(id);
		document.getElementById("div_3").removeChild(e);
	}
	function add4(){
		var e=document.createElement('div');
		e.id="div"+count;
		e.innerHTML="<input type=\"file\" name=\"upFile4\" class=\"inputTextFile\" />"+"<a href=\"javascript:del4(\'"+e.id+"\')\">删除</a>";
		document.getElementById("div_4").appendChild(e);
		count++;
	}
	function del4(id){
		var e=document.getElementById(id);
		document.getElementById("div_4").removeChild(e);
	}
	function add5(){
		var e=document.createElement('div');
		e.id="div"+count;
		e.innerHTML="<input type=\"file\" name=\"upFile5\" class=\"inputTextFile\" />"+"<a href=\"javascript:del5(\'"+e.id+"\')\">删除</a>";
		document.getElementById("div_5").appendChild(e);
		count++;
	}
	function del5(id){
		var e=document.getElementById(id);
		document.getElementById("div_5").removeChild(e);
	}
	function add6(){
		var e=document.createElement('div');
		e.id="div"+count;
		e.innerHTML="<input type=\"file\" name=\"upFile6\" class=\"inputTextFile\" />"+"<a href=\"javascript:del6(\'"+e.id+"\')\">删除</a>";
		document.getElementById("div_6").appendChild(e);
		count++;
	}
	function del6(id){
		var e=document.getElementById(id);
		document.getElementById("div_6").removeChild(e);
	}
	function add7(){
		var e=document.createElement('div');
		e.id="div"+count;
		e.innerHTML="<input type=\"file\" name=\"upFile7\" class=\"inputTextFile\" />"+"<a href=\"javascript:del7(\'"+e.id+"\')\">删除</a>";
		document.getElementById("div_7").appendChild(e);
		count++;
	}
	function del7(id){
		var e=document.getElementById(id);
		document.getElementById("div_7").removeChild(e);
	}
	function add8(){
		var e=document.createElement('div');
		e.id="div"+count;
		e.innerHTML="<input type=\"file\" name=\"upFile8\" class=\"inputTextFile\" />"+"<a href=\"javascript:del8(\'"+e.id+"\')\">删除</a>";
		document.getElementById("div_8").appendChild(e);
		count++;
	}
	function del8(id){
		var e=document.getElementById(id);
		document.getElementById("div_8").removeChild(e);
	}
	function add9(){
		var e=document.createElement('div');
		e.id="div"+count;
		e.innerHTML="<input type=\"file\" name=\"upFile9\" class=\"inputTextFile\" />"+"<a href=\"javascript:del9(\'"+e.id+"\')\">删除</a>";
		document.getElementById("div_9").appendChild(e);
		count++;
	}
	function del9(id){
		var e=document.getElementById(id);
		document.getElementById("div_9").removeChild(e);
	}
	function add10(){
		var e=document.createElement('div');
		e.id="div"+count;
		e.innerHTML="<input type=\"file\" name=\"upFile10\" class=\"inputTextFile\" />"+"<a href=\"javascript:del10(\'"+e.id+"\')\">删除</a>";
		document.getElementById("div_10").appendChild(e);
		count++;
	}
	function del10(id){
		var e=document.getElementById(id);
		document.getElementById("div_10").removeChild(e);
	}
	function add11(){
		var e=document.createElement('div');
		e.id="div"+count;
		e.innerHTML="<input type=\"file\" name=\"upFile11\" class=\"inputTextFile\" />"+"<a href=\"javascript:del11(\'"+e.id+"\')\">删除</a>";
		document.getElementById("div_11").appendChild(e);
		count++;
	}
	function del11(id){
		var e=document.getElementById(id);
		document.getElementById("div_11").removeChild(e);
	}
	function add12(){
		var e=document.createElement('div');
		e.id="div"+count;
		e.innerHTML="<input type=\"file\" name=\"upFile12\" class=\"inputTextFile\" />"+"<a href=\"javascript:del12(\'"+e.id+"\')\">删除</a>";
		document.getElementById("div_12").appendChild(e);
		count++;
	}
	function del12(id){
		var e=document.getElementById(id);
		document.getElementById("div_12").removeChild(e);
	}
	function add13(){
		document.getElementById("div_13").style.display="block";
		document.getElementById("addJiean").style.display="none";
	}
	function del13(id){
		document.getElementById("div_13").style.display="none";
		document.getElementById("addJiean").style.display="block";
	}
	

	function gotoBack(){
		window.history.back();
	}
	

	function opendg(dgurl,dgw,dgh)
	{
	//alert(1111);
	  $.dialog({ 
	    title:'',
	    width: dgw,
	    height: dgh,
	    content:'url:'+ dgurl});
	}



	
	
</script>