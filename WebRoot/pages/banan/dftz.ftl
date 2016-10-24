<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

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
<style type="text/css">img,formDiv,.formDiv{behavior: url(../webstyle/style/ie-css3.htc);} </style> 

<style type="text/css">img,z_wrap_info,.z_wrap_info{behavior: url(../css/ie-css3.htc);} </style> 
</head>

<body>



  
    <form id="form1" name="form1" action="''" method="post" ENCTYPE="multipart/form-data">
    		<#assign isde=xzfyInfo.isdelay?default('0')>
			<#assign isst=xzfyInfo.isstop?default('0')>		
			<#assign withdrawsp=xzfyInfo.check_status?default('0')>	
			<input type="hidden" name="listkeyword" value="${listkeyword}" />
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="tempid" value="${xzfyInfo.id}" />
			<input type="hidden" name="xzfyInfo.id" value="${xzfyInfo.id}" />
			<input type="hidden" id="checkstatus" name="tempchsta" value="${xzfyInfo.check_status}" />		
			<input type="hidden" id="zidongzhanshi" name="" value="${xzfyInfo.status}" />			
			<input type="hidden" id="checkid" name="checkid" value="" />			
			<input type="hidden" name="xzfySenpi.sqspren_id" value="<#if xzfyInfo.user2_id?has_content>${xzfyInfo.user2_id}</#if>" />
			<input type="hidden" name="xzfySenpi.sqspren_name" value="<#if xzfyInfo.user2_name?has_content>${xzfyInfo.user2_name}</#if>" />
			<input type="hidden" name="admit_name" value="${admit_name}" />
			<input type="hidden" id="isView" name="isView" value="${isView}" />
			<input type="hidden" name="tempDftzId" value="xzfyDftz.id" />
			<#assign user_id=Session['_USER_LOGIN_'].id>
			<#assign user2_id=xzfyInfo.user2_id?default(0)>
			<#assign user2_id=user2_id?number>
			<#assign user3_id=xzfyInfo.user3_id?default(0)>
			<#assign user3_id=user3_id?number>
			<input type="hidden" id="dftzNum" name="dftzNum" value="${dftzNum}" />
			<input type="hidden" name="pNum" value="${pNum}" />
			<input type="hidden" id="content" name="xzfyDftz.content" value="${xzfyDftz.content?default('')}" />
	
<!--=============================================================================================================================================-->	
<!--========-- start---答复通知---start ======================-- start---答复通知---start --======================-- start---答复通知---start --=========================================================================================-->  
	
		<div class="formDiv" id="banan">
			<div class="btn">
				<div class="fl">
				<#if !xzfyInfo.dftzstatus?has_content || xzfyInfo.dftzstatus=="0">
					<#if isPermission==1>
					<a href="javascript:getDftzshu()" style="background:yellow" >生成文书</a>
	           		<!--<a href="javascript:saveDftz()" >保存通知</a>-->
	           		<a href="javascript:commitDftz()" style="background:yellow" >发送通知</a>
	           		</#if>
	           	<#else>
	           		<#if isPermission==1>
	           		<a href="javascript:getDftzshu()" style="background:yellow" >生成文书</a>
	           		</#if>
				</#if>
	           		
	           		<!--
	           		<a href="javascript:opendg('../banan/showDftzList.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}&xzfyInfo.id=${xzfyInfo.id}&admit_name=${admit_name}',900,600)" >查看记录</a>
	           		<a href="javascript:savedftz()">保存附件</a>	
	           		-->						           		
	           	</div>		 
		  	</div>
		  	
		  	<!--
		  	<table id="dftz"  width="100%" cellpadding="0" cellspacing="0" border="0">	  			
		  		<tr>  			   
					<th width="20%" >请输入通知内容</td>
					<td width="80%" colspan="3">&nbsp;
						<textarea type="text" name="xzfyDftz.content" style="width:500px;height:45px;" ></textarea>						
					</td>     		
		  		</tr>
		  		<tr>  			   
					<th width="20%" >请添加材料</td>
					<td width="80%" colspan="3">
						&nbsp;&nbsp;<input type="file" name="upFile2" class="inputTextFile" /><br/>
						&nbsp;&nbsp;<input type="file" name="upFile3" class="inputTextFile" /><br/>
						&nbsp;&nbsp;<input type="file" name="upFile4" class="inputTextFile" />
				
					</td>     		
		  		</tr>		  				
			</table><br/>
			-->
			
			<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table  ui-table-list  list-fixed " >
					<input type="hidden" name="xzfyDftz.xzfy_id" value="${xzfyInfo.id}" />
					
					<!--
					<tr>
						<th>发送通知日期</th>
						<td>&nbsp;<#if xzfyDftz.sentanswerdate?has_content>${xzfyDftz.sentanswerdate?default('')}</#if></td>
					</tr>
					-->
					<tr>
						<th width="25%" rowspan=10>在线发送<br/>《答复通知书》</th>
						
						<td>
						<#if dftzNum!=0 >
							已保存在线文书（答复通知书） &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<#list docdftzList as docdftzList>
							最后保存者：&nbsp;&nbsp;${docdftzList[3]}，${docdftzList[4]}&nbsp;&nbsp 13:35:05;
							</#list>
							<a href="javascript:yueduDftzshu()" ><font color="green" style="font-size:15px">查看</font></a>
						<#else>
							未生成在线文书
						</#if>	
						</td>
					</tr>
										<#--<#assign tempdftzstatus=xzfyInfo.dftzstatus?default('')>
										<#if tempdftzstatus=='1' && !xzfyDftz.content?has_content>
										<#else>
										</#if>-->
					<#--
					<tr>
						<td>&nbsp;上传通知
							<input type="file" id="upFile2" name="upFile2" class="inputTextFile" />
							<#if xzfyDftz.content?has_content>
								<a href="${xzfyDftz.content?default('')}" target="_blank"><font color="green">答复通知书</font></a>
							</#if>
						</td>
						<td>
							<#if xzfyDftz.content?has_content>
								<ul>
									<li>
										《答复通知书》已上传 &nbsp;&nbsp;&nbsp;
										<span style="float:right">
										<a href="${xzfyDftz.content?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
										<a href="javascript:deldftzElem(1)"><font color="green" style="font-size:15px">删除</font></a>
										</span>
									</li>
								</ul>
							<#else>
								《答复通知书》未上传&nbsp;
								<a id="new1" href="javascript:add1()"><font color="green" style="font-size:15px">添加</font></a>
							</#if>
							<div id="div_1">
							<div id="divdfs" style="display:none"><input type="file" id="upFile2" name="upFile2" class="inputTextFile" /><a href="javascript:del1('divdfs')">删除</a></div>
							</div>
						</td>
					</tr>
					-->
					<!--
					<tr>
						<td>
							<#if xzfyDftz.fujian4?has_content>
								<ul>
									<li>
										申请书已上传 &nbsp;&nbsp;&nbsp;
										<span style="float:right">
										<a href="${xzfyDftz.fujian44?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
										<a href="javascript:deldftzElem(2)"><font color="green" style="font-size:15px">删除</font></a>
										</span>
									</li>
								</ul>
							<#else>
								申请书未上传&nbsp;
								<a id="new2" href="javascript:add2()"><font color="green" style="font-size:15px">添加</font></a>
							</#if>
							<div id="div_2">
							<div id="divsqs" style="display:none"><input type="file" name="upFilesqs" class="inputTextFile" /><a href="javascript:del2('divsqs')">删除</a></div>
							</div>
						</td>
					</tr>
					-->
					<tr>
					<td>
									<#if archiveList1?has_content>
										<#list archiveList1 as archive>
											<li>
												${archive.fileName?default('')}
												<span style="float:right" >
												<a href="${archive.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;												
												</span>
												<br/>
												上传者：${archive.uploadUserName?default('')} ${archive.uploadTime?default('')}
											</li>
										</#list>
									<#else>
										未上传行政复议申请书<br/>
									</#if>
									
									<#if archiveList3?has_content>
										<#list archiveList3 as archive>
											<li>
												${archive.fileName?default('')}
												<span style="float:right">
												<a href="${archive.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;												
												</span>
												<br/>
												上传者：${archive.uploadUserName?default('')} ${archive.uploadTime?default('')}
											</li>
										</#list>
									<#else>
										未上传申请人提交的其他材料
									</#if>									
					</td>
					</tr>
					
					<tr>
						<#if xzfyDftz.content?has_content>
						<td>
							答复通知书下载：<a href="${xzfyDftz.content}" target="_blank">点击下载</a>
						</td>
						<#else>
						<td>答复通知书上传：
							<input type="file" id="dftzStampedFile" name="dftzStampedFile" class="inputTextFile"/>
						</td>
						</#if>
					</tr>
					
					<tr>
						<#if bsqrFlag=='1'>												
						<td>被申请人为北京市人民政府，请选择发送单位：<br/>
							<label><input type="radio" id="" name="bsqrAttached" value="3000" <#if xzfyInfo.bsqrSpecial?default('')=='3000'>checked</#if>/>市国土局</label>
							<label><input type="radio" id="" name="bsqrAttached" value="3100" <#if xzfyInfo.bsqrSpecial?default('')=='3100'>checked</#if>/>市规划委</label>
							<label><input type="radio" id="" name="bsqrAttached" value="0000" <#if xzfyInfo.bsqrSpecial?default('')=='0000'>checked</#if>/>市政府办公厅信息公开一处</label>
						</td>		
						</#if>										
					</tr>
					
					<#--
					<tr>
						<td>最近修改人：
							<#if xzfyDftz.userName1?has_content>${xzfyDftz.userName1?default('')}
							<#else>无</#if>
						</td>
					</tr>
					-->
					<tr>
						
						<td>选择接收单位：
							<input type="checkbox" name="fasong" value="1" onclick="show(1,this)" <#if xzfyDftz.fasongdanwei1?default('')=='1'>checked</#if>>北京市人民政府</input>
							<input type="checkbox" name="fasong" value="2" onclick="show(2,this)" <#if xzfyDftz.fasongdanwei2?default('')=='1'>checked</#if>>发改委</input>
							<input type="checkbox" name="fasong" value="3" onclick="show(3,this)" <#if xzfyDftz.fasongdanwei3?default('')=='1'>checked</#if>>国土局</input>
							<input type="checkbox" name="fasong" value="4" onclick="show(4,this)" <#if xzfyDftz.fasongdanwei4?default('')=='1'>checked</#if>>建委</input>
						</td>
						
						<#--
						<td>选择接收单位：
							<input type="checkbox" name="fasong" value="1" onclick="show(1,this)" <#if xzfyDftz.fasongdanwei1?default('')=='1'>checked</#if>>市政府办公厅信息公开一处</input>
							<input type="checkbox" name="fasong" value="2" onclick="show(2,this)" <#if xzfyDftz.fasongdanwei2?default('')=='1'>checked</#if>>市国土局</input>
							<input type="checkbox" name="fasong" value="3" onclick="show(3,this)" <#if xzfyDftz.fasongdanwei3?default('')=='1'>checked</#if>>市规划委</input>
						</td>
						-->
					</tr>
					<tr>
						<td><div id="show1" <#if xzfyDftz.fasongdanwei1?default('')=='1'><#else>style="display:none"</#if>>请选择北京市人民政府短信提示人：
								<select name="fasongdanwei1" class="select-page" id="" >
									<option value="" id="show11">未指定</option>
									<#list user1List as user>
									<option value="${user.getId()},${user.getName()}" <#if xzfyDftz.fasongren1?default('')=="${user.getId()}">selected</#if>>${user.getName()}</option>
									</#list>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td><div id="show2" <#if xzfyDftz.fasongdanwei2?default('')=='1'><#else>style="display:none"</#if>>请选择发改委短信提示人：
								<select name="fasongdanwei2" class="select-page" id="" >
									<option value="" id="show21">未指定</option>
									<#list user2List as user>
									<option value="${user.getId()},${user.getName()}" <#if xzfyDftz.fasongren2?default('')=="${user.getId()}">selected</#if>>${user.getName()}</option>
									</#list>
								</select>
							</div></td>
					</tr>
					<tr>
						<td><div id="show3" <#if xzfyDftz.fasongdanwei3?default('')=='1'><#else>style="display:none"</#if>>请选择国土局短信提示人：
								<select name="fasongdanwei3" class="select-page" id="" >
									<option value="" id="show31">未指定</option>
									<#list user3List as user>
									<option value="${user.getId()},${user.getName()}" <#if xzfyDftz.fasongren3?default('')=="${user.getId()}">selected</#if>>${user.getName()}</option>
									</#list>
								</select>
							</div></td>
					</tr>
					
					<tr>
						<td><div id="show4" <#if xzfyDftz.fasongdanwei4?default('')=='1'><#else>style="display:none"</#if>>请选择建委短信提示人：
								<select name="fasongdanwei4" class="select-page" id="" >
									<option value="" id="show41">未指定</option>
									<#list user4List as user>
									<option value="${user.getId()},${user.getName()}" <#if xzfyDftz.fasongren4?default('')=="${user.getId()}">selected</#if>>${user.getName()}</option>
									</#list>
								</select>
							</div></td>
					</tr>
					
					
					<tr>		
						<td>
							<#if !xzfyInfo.dftzstatus?has_content>
								未发送
							<#elseif xzfyInfo.dftzstatus=="0">
								<#if xzfyDftz.content1?has_content>已回复
								<#else>已撤回</#if>
							<#else>
								${xzfyInfo.user2_name?default('')}&nbsp;已于&nbsp;${xzfyDftz.sentanswerdate?default('')}&nbsp;在线发送答复通知至&nbsp;${xzfyInfo.defendant_name}
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<#if isPermission==1>
								<a href="../banan/withdrawDftz.action?tempid=${xzfyInfo.id}&tempDftzId=${xzfyDftz.id?default('')}&funcCode=${funcCode}">
									<font color="green" style="font-size:18px">撤回</font>
								</#if>
								</a>
							</#if>
						</td>
					</tr>
					
					<tr>
						<td colspan=2>&nbsp;</td>
					</tr>
					
					<tr>
						<th rowspan=5>被申请人<br/>《答复书》返回情况</th>
						<td>
							<#if xzfyDftz.userName2?has_content>${xzfyDftz.userName2?default('')}&nbsp;已阅读&nbsp;阅读时间：${xzfyDftz.receiveanswerdate?default('')}
							<#else>未阅读</#if>
						</td>
					</tr>
					<tr>
						<td>
							<ul>
								<#if xzfyDftz.content1?has_content>
									<li>
										答复书已上传 &nbsp;&nbsp;&nbsp;
										<span style="float:right">
										<a href="${xzfyDftz.content1?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
										</span>
									</li>
								<#else>
									答复书未上传
								</#if>
								<#if dfdftzNum != 0 && xzfyInfo.dftzstatus == '0'>
									<li>
										在线答复书已保存 &nbsp;&nbsp;&nbsp;
										<span style="float:right">
										<a href="javascript:gethuifuDoc()"><font color="green" style="font-size:15px">查看</font></a>&nbsp;&nbsp;
										</span>
									</li>
								<#else>
									在线答复书未保存
								</#if>
							</ul>
						</td>
					</tr>
					<tr>
						<td>
								<ul>
									<#assign zhengjushu=1>
									<#if xzfyDftz.fujian1?has_content||xzfyDftz.fujian2?has_content||xzfyDftz.fujian3?has_content>
									<#if xzfyDftz.fujian1?has_content>
									<li>
										证据材料${zhengjushu}：&nbsp;&nbsp;&nbsp;${xzfyDftz.fujian1?default('')}
										<span style="float:right">
										<a href="${xzfyDftz.fujian11?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
										<a href="#"><font color="green" style="font-size:15px"></font></a>
										</span><#assign zhengjushu=zhengjushu+1>
									</li>
									</#if>
									<#if xzfyDftz.fujian2?has_content>
									<li>
										证据材料${zhengjushu}：&nbsp;&nbsp;&nbsp;${xzfyDftz.fujian2?default('')}
										<span style="float:right">
										<a href="${xzfyDftz.fujian22?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
										<a href="#"><font color="green" style="font-size:15px"></font></a>
										</span><#assign zhengjushu=zhengjushu+1>
									</li>
									</#if>
									<#if xzfyDftz.fujian3?has_content>
									<li>
										证据材料${zhengjushu}：&nbsp;&nbsp;&nbsp;${xzfyDftz.fujian3?default('')}
										<span style="float:right">
										<a href="${xzfyDftz.fujian33?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
										<a href="#"><font color="green" style="font-size:15px"></font></a>
										</span><#assign zhengjushu=zhengjushu+1>
									</li>
									</#if>
									<#else>
									<li>
										<font color="green" style="font-size:15px">未上传证据材料</font>&nbsp;
									</li>
									</#if>
								</ul>
						</td>
					</tr>
					<tr>
						<td>备注：
							<#if xzfyDftz.fujian55?has_content>${xzfyDftz.fujian55?default('')}&nbsp;
								<a href="javascript:addbeizhu()"><font color="green" style="font-size:15px">修改</font></a>
							<#else>无&nbsp;
								<a href="javascript:addbeizhu()"><font color="green" style="font-size:15px">添加</font></a>
							</#if>
							<textarea name="dftzbeizhu" id="beizhu" type="text" class="textarea" style="display:none">${xzfyDftz.fujian55?default('')}</textarea>
						</td>
					</tr>
						<script>
							var b=1;
							function addbeizhu(){
								if(b==1){document.getElementById("beizhu").style.display="block";b=0}
								else{document.getElementById("beizhu").style.display="none";b=1}
							}
						</script>
					
					<tr>
						<td>
							<#if xzfyDftz.fujian5?has_content>
								<ul>
									<li>
										补充材料已上传 &nbsp;&nbsp;&nbsp;
										<span style="float:right">
										<a href="${xzfyDftz.fujian5?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
										<a href="#"><font color="green" style="font-size:15px">删除</font></a>
										</span>
									</li>
								</ul>
							<#else>
								补充材料未上传&nbsp;
								<a id="new3" href="javascript:add3()"><font color="green" style="font-size:15px">添加</font></a>
							</#if>
							<div id="div_3"></div>
						</td>
					</tr>

				
					
			
				</table>

<br/>
<!-- 短信短信短信短信短信短信短信短信短信短信短信短信短信短信短信短信短信短信短信短信短信短信短信短信短信短信短信短信短信短信短信短信短信短信短信短信短信 -->				
<!--
				<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table  ui-table-list  list-fixed " >
					<input type="hidden" name="xzfyDftz.xzfy_id" value="${xzfyInfo.id}" />
					<tr>
						<th>发送内容</th>
						<td>
							<textarea name="sms.message" id="message1" type="text" class="textarea"></textarea>
						</td>
					</tr>
					<tr>
						<th width="25%">选择收件人</th>
						<td>
							<a href="javascript:getreceiver()"><font color=green>选择</font></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span>*请先填写内容，然后选择收件人 </span>
							-->
							<!--
							<select name="sms.userid" class="select-page" id="" >
								<option value="">未指定</option>
								<#list smsReceiverList as user>
								<option value="${user.getId()}" >${user.getName()}</option>
								</#list>
							</select>
							-->
							<!--
							<span id="receive"></span>
							<input type="hidden" name="receiverid" id="reid" value="" />
							<input type="hidden" name="receivername" id="rename" value="" />	
						</td>
					</tr>		
				</table>
				-->
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


function show(type,obj){
	if(type==1)
		var oShow = document.getElementById('show1');
	else if(type==2)
		var oShow = document.getElementById('show2');
	else if(type==3)
		var oShow = document.getElementById('show3');
	else if(type==4)
		var oShow = document.getElementById('show4');
	if(obj.checked==true)
		oShow.style.display = 'block';
	else{
		oShow.style.display = 'none';
		if(type==1)
			document.getElementById('show11').selected=true;
		else if(type==2)
			document.getElementById('show21').selected=true;
		else if(type==3)
			document.getElementById('show31').selected=true;
		else if(type==4)
			document.getElementById('show41').selected=true;
	}
	function oClose(){
		oShow.style.display = 'none';
	}
	//document.getElementById("closebtn").onclick=oClose;
}
function hasSelected(){
	
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
	


	function savedftz(){
		window.form1.action="savedftz.action";	
		window.form1.submit();
	}
	function saveToDftzDoc(){	
		if(confirm("点击确定就将保存附件内容。")){
			var options = { 
				url:'savedftz.action', //提交给哪个执行 
				type:'POST', 
				success: getDftzshu //显示操作提示 
			}; 
			$('#form1').ajaxSubmit(options); 
			return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		}
	}
	function getDftzshu(){
		var url ="../fzb_default_dafutongzhi.jsp?actiontype=seal&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=dafutongzhi";
		//var url="http://localhost:8080/webIscp/fzb_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
	function yueduDftzshu(){
		var url ="../fzb_default_dafutongzhi.jsp?actiontype=yuedu&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=dafutongzhi";
		//var url="http://localhost:8080/webIscp/fzb_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
	//判断单选按钮选中与否
	function radioCheckedOrNot(){
		var a = document.getElementsByName("bsqrAttached");
		for(var i=0; i<a.length; i++){
			if(a[i].checked==true){
				return true;
			}
		}
		return false;
	}
	
	function commitDftz(){
		//var upFile22 = document.getElementById("upFile2").value;
		var dftzNumm = document.getElementById("dftzNum").value;
		var content=document.getElementById("content").value;
		if(content==""  && dftzNumm==0){
			alert("请保存在线文书。如已保存在线文书，请刷新本页面。");
			return;
		}
		
		if($('#dftzStampedFile').val()==''){
			alert("请上传答复通知书！");
			return;
		}
		
		if(${bsqrFlag}=='1'){
			if(!radioCheckedOrNot()){
				alert("请选择发送单位！");
				return;
			}
		}
					
		if(confirm("确认发送？")){
			window.form1.action="commitdftz.action";
			window.form1.submit();
		}
	}
	function saveDftz(){
			window.form1.action="savedftz.action";
			window.form1.submit();
	}
	function getreceiver(){
		if(document.getElementById("message1").value==""){
			alert("请先填写内容，然后选择收件人");
			return;
		}
		
		
		//a =encodeURIComponent(document.getElementById("message").value);
		//var a=document.getElementById("message").value;
		//alert(a)
		opendg('../banan/smsReceiver.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}',200,500);
	}
	function saveSms(){
			window.form1.action="saveSms.action";
			window.form1.submit();
	}
	function gethuifuDoc(){
		//var userName= document.getElementById("userName").value;
		var url="../fzb_default_dafutongzhi.jsp?actiontype=yuedu&d_filetype=doc&caseId=${xzfyInfo.id}&mstype=dafudafutongzhishu&d_username=${Session['_USER_LOGIN_'].id}";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}

	var count=0;
	function add1(){
		document.getElementById("new1").style.display="none";
		document.getElementById("divdfs").style.display="block";
		//var e=document.createElement('div');
		//e.id="divdfs";
		//e.innerHTML="<input type=\"file\" name=\"upFile2\" class=\"inputTextFile\" />"+"<a href=\"javascript:del1(\'"+e.id+"\')\">删除</a>";
		//document.getElementById("div_1").appendChild(e);
	}
	function del1(id){
		document.getElementById("new1").style.display="block";
		document.getElementById(id).style.display="none";
		document.getElementById(id).value="";
		//var e=document.getElementById(id);
		//document.getElementById("div_1").removeChild(e);
	}
	function add2(){
		document.getElementById("new2").style.display="none";
		document.getElementById("divsqs").style.display="block";
		//var e=document.createElement('div');
		//e.id="divsqs";
		//e.innerHTML="<input type=\"file\" name=\"upFilesqs\" class=\"inputTextFile\" />"+"<a href=\"javascript:del2(\'"+e.id+"\')\">删除</a>";
		//document.getElementById("div_2").appendChild(e);
	}
	function del2(id){
		document.getElementById("new2").style.display="block";
		document.getElementById(id).style.display="none";
		document.getElementById(id).value="";
		//var e=document.getElementById(id);
		//document.getElementById("div_2").removeChild(e);
	}
	function add3(){
		document.getElementById("new3").style.display="none";
		var e=document.createElement('div');
		e.id="divbccl";
		e.innerHTML="<input type=\"file\" name=\"upFilebccl\" class=\"inputTextFile\" />"+"<a href=\"javascript:del3(\'"+e.id+"\')\">删除</a>";
		document.getElementById("div_3").appendChild(e);
	}
	function del3(id){
		document.getElementById("new3").style.display="block";
		var e=document.getElementById(id);
		document.getElementById("div_3").removeChild(e);
	}
	function deldftzElem(type){
		window.form1.action="deldftzElem.action?deldftztype="+type;
		window.form1.submit();
	}
	
</script>