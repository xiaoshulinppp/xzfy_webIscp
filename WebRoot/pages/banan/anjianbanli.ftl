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
	<form id="form1" name="form1" action="saveanjianbanli.action" method="post" ENCTYPE="multipart/form-data" >
	<#assign isde=xzfyInfo.isdelay?default('0')>
			<#assign isde=xzfyInfo.isdelay?default('0')>
			<#assign isst=xzfyInfo.isstop?default('0')>		
			<#assign withdrawsp=xzfyInfo.check_status?default('0')>	
			<input type="hidden" name="listkeyword" value="${listkeyword}" />
			<input type="hidden" name="xzfyDftz.sentanswerdate" value="${todate}" />
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="tempstatus" value="${tempstatus}" />
			<input type="hidden" name="tempid" value="${xzfyInfo.id}" />
			<input type="hidden" name="xzfyInfo.id" value="${xzfyInfo.id}" />
			<input type="hidden" id="checkstatus" name="tempchsta" value="${xzfyInfo.check_status}" />		
			<input type="hidden" id="zidongzhanshi" name="" value="${xzfyInfo.status}" />			
			<input type="hidden" id="checkid" name="checkid" value="" />			
			<input type="hidden" name="xzfySenpi.sqspren_id" value="<#if xzfyInfo.user2_id?has_content>${xzfyInfo.user2_id}</#if>" />
			<input type="hidden" name="xzfySenpi.sqspren_name" value="<#if xzfyInfo.user2_name?has_content>${xzfyInfo.user2_name}</#if>" />
			<input type="hidden" name="admit_name" value="${admit_name}" />
			<input type="hidden" id="isView" name="isView" value="${isView}" />
			<#assign user_id=Session['_USER_LOGIN_'].id>
			<#assign user2_id=xzfyInfo.user2_id?default(0)>
			<#assign user2_id=user2_id?number>
			<#assign user3_id=xzfyInfo.user3_id?default(0)>
			<#assign user3_id=user3_id?number>
			<input type="hidden" name="pNum" value="${pNum}" />
	<div class="formDiv" id="banan" >
		      <div class="btn">
		           <div class="fl">
		           <#if user_id==user2_id || user_id==user3_id>
						<#if isView==1>
		               	<a href="javascript:save()" <#if xzfyInfo.status?exists && xzfyInfo.status = "12" || xzfyInfo.check_status != "0" >disabled</#if> style="background:yellow" >保存</a>
	           			<!--<a href="javascript:gotoBack()">返 回</a>-->
	           			</#if>
           			</#if>
		           </div>
		      </div>
              <table id="banan" width="100%" border="0" cellpadding="0" cellspacing="0" >	
              
              	<tr style="display:none">      
		     		<th width="25%">选择关键词：</th>
				    <td width="75%" colspan=3>
					  	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<#list keywordList as xzfyKeyword>
							<input type="checkbox" name="keyword" value="<#if xzfyKeyword.keyword?has_content>${xzfyKeyword.keyword}</#if>" 
								<#list keywordCheckedList as checkedKeyword>
									<#if xzfyKeyword.keyword == checkedKeyword.keyword > checked </#if>
								</#list>
							 />&nbsp;&nbsp;<#if xzfyKeyword.keyword?has_content>${xzfyKeyword.keyword}</#if>
							&nbsp;&nbsp;&nbsp;
						</#list>
				    </td>					
		  		</tr>
		  		<tr style="display:none">      
				    <th>已选择关键词：</th>
					<td colspan=3>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<#list keywordCheckedList as xzfyKeyword>
							<font color="red"><#if xzfyKeyword.keyword?has_content>${xzfyKeyword.keyword}</#if></font>&nbsp;
						</#list>
					</td>
					
		  		</tr>
		  		
		  		<!--
		  		<tr>      
		     		<th>现在审理方式：</th>
				    <td colspan=3>	
				    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<select name="trailMode" id="slfsid"  onchange="slfs()">
						  <option value="0" <#if xzfyInfo.trailMode?exists && xzfyInfo.trailMode=="0">selected</#if> >无</option>
						  <option value="1" <#if xzfyInfo.trailMode?exists && xzfyInfo.trailMode=="1">selected</#if> >设置听证</option>
						  <option value="2" <#if xzfyInfo.trailMode?exists && xzfyInfo.trailMode=="2">selected</#if> >会商</option>
						  <option value="3" <#if xzfyInfo.trailMode?exists && xzfyInfo.trailMode=="3">selected</#if> >会审</option>
						  <option value="4" <#if xzfyInfo.trailMode?exists && xzfyInfo.trailMode=="4">selected</#if> >专家论证会</option>
						  <option value="5" <#if xzfyInfo.trailMode?exists && xzfyInfo.trailMode=="5">selected</#if> >协调会</option>
						  <option value="6" <#if xzfyInfo.trailMode?exists && xzfyInfo.trailMode=="6">selected</#if> >其他审理方式</option>		 
					    </select>
				    </td>
		  		</tr>
		  		-->
		  		<tr>      
		     		<th>添加听证记录：</th>
				    <td>
				    	<input type="file" name="upFileTzjl" class="inputTextFile" />
				    	<a href="javascript:view()">查看</a>
							<script type="text/javascript">
								var b=1;
								function view(){
									if(b==1){
										document.getElementById("tzjl").style.display="block";
										b=0;
									}
									else{
										document.getElementById("tzjl").style.display="none";
										b=1;
									}
								}
							</script>
						<div id="tzjl"  style="display:none">
				    	<#list tzjlList as tzjl>
				    	<a href="${tzjl.realFilePath}" target="_blank">${tzjl.fileName}</a>
				    	<#if isView?default('0')==1><a href="../banan/deleteFile.action?fileId1=${tzjl.id}&funcCode=${funcCode}&tempid=${xzfyInfo.id}&listkeyword=${listkeyword}&isView=1"><font color="green">删除</font></a></#if>
				    	<br/>
				    	</#list>
				    	</div>
						<#--<nobr><a href="javascript:opendg('../tzjl/tzjlInfoList.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}',900,600)" style="display:block" id="">添加</a>-->
				    	<#--已有:&nbsp;<#if tzjlList.size()?has_content><font color="red">${tzjlList.size()}</font></#if>条</nobr>-->
				    </td>
				  
		  		</tr>
		  		<tr>      
		     		
				    <th>上传现场调查附件：</th>
					<td>
						<input type="file" name="upFile" class="inputTextFile" />
						<a href="javascript:addxcdc()">添加</a>
						<a href="javascript:checkxcdc()">查看</a>
							<script type="text/javascript">
								var a=1;
								function checkxcdc(){
									if(a==1){
										document.getElementById("checkxcdc").style.display="block";
										a=0;
									}
									else{
										document.getElementById("checkxcdc").style.display="none";
										a=1;
									}
								}
							</script>
						<div id="addxcdc"></div>
						<div id="checkxcdc" style="display:none">
						<#list xcdcList as xzfyXcdc>
							<a href="<#if xzfyXcdc.xcdcfile1?has_content>${xzfyXcdc.xcdcfile1}</#if>" target="_blank" ><#if xzfyXcdc.xcdcfile?has_content>${xzfyXcdc.xcdcfile}</#if></a>
							<#if isView?default('0')==1><a href="../banan/deleteFile.action?fileId=${xzfyXcdc.id}&funcCode=${funcCode}&tempid=${xzfyInfo.id}&listkeyword=${listkeyword}&isView=1"><font color="green">删除</font></a></#if>
							<br/>							
						</#list>
						</div>
					</td>
		  		</tr>
		  		
		  		<tr>      
		     		<th>复议委员会案审会：</th>
				    <td>
				    <#if wyList.size()==0>
					    <a href="javascript:opendg('../ashjl/addAshjl.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}',650,300)">添加</a>
					<#else>
						<a href="javascript:opendg('../ashjl/modifyAshjl.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}&ashjlId=${ashjlInfo.id}',650,300)">修改</a></#if>
				    	<#--已有:&nbsp;<#if ashjlList.size()?has_content><font color="red">${ashjlList.size()}</font></#if>条-->
				    	<div>
				    	<#assign length=wyList.size()>
				    	<#list wyList as wy>
				    	${wy.committeeName}
				    	<#if wy_index!=length-1>，</#if>
				    	</#list>
				    	<br/>
				    	案审会记录附件：<a href="${ashjlInfo.realFilePath?default('')}" target="_blank">${ashjlInfo.fileName?default('无')}</a>
				    	</div>
				    </td>
				   
					
		  		</tr>
		  		<tr>      
		     		
				    <th>上传调解记录：</th>
					<td>
						<!--
						<select name="xzfyInfo.mid_tiaojie" id="tj" onchange="tiaojie()" >
							<option value="0" >否</option>
							<option value="1" >是</option>			
						</select>
						-->
						<input type="file" name="upFile1" value="" class="inputTextFile" id="tj1" style="display:block" />
						<a href="<#if xzfyInfo.tiaojiejilu1?has_content>${xzfyInfo.tiaojiejilu1}</#if>" target="_blank" ><#if xzfyInfo.tiaojiejilu?has_content>${xzfyInfo.tiaojiejilu}</#if></a>
						<input type="hidden" name="tiaojiejilu" value="<#if xzfyInfo.taiojiejilu?has_content>${xzfyInfo.tiaojiejilu}</#if>" />
						<input type="hidden" name="tiaojiejilu1" value="<#if xzfyInfo.taiojiejilu?has_content>${xzfyInfo.tiaojiejilu1}</#if>" />
					</td>
					
		  		</tr>
		  		
		  			
		  	</table><br/>
	
        </div>
			
		</form>
	</body>
	</html>
	
	<script type="text/javascript">

	function gotoBack(){
		window.history.back();
	}


	function tiaojie(){
		if(document.getElementById("tj").value==0){
			document.getElementById("tj1").style.display="none";
		}
		else{
			document.getElementById("tj1").style.display="block";
		}
	}

	function opendg(dgurl,dgw,dgh)
	{
	  $.dialog({ 
	    title:'复议委员会案审会记录',
	    width: dgw,
	    height: dgh,
	    content:'url:'+ dgurl});
	}
	
</script>
<script type="text/javascript">
	function save(){
		if(confirm("确认提交？")){	
			
			window.form1.submit();
			alert("操作已完成！");
		}
	}

	function withdrawsp(){
		if(document.getElementById("checkstatus").value==0){	
			alert("您未提交审批");
			return;
		}
		if(confirm("确认取消？")){	
			window.form1.action="withdrawsp.action";	
			window.form1.submit();
		}
	}
	
	
	var count=0;
	function addxcdc(){
		var e=document.createElement('div');
		e.id="div"+count;
		e.innerHTML="<input type=\"file\" name=\"upFile\" class=\"inputTextFile\" />"+"<a href=\"javascript:del(\'"+e.id+"\')\">删除</a>";
		document.getElementById("addxcdc").appendChild(e);
		count++;
	}
	function del(id){
		var e=document.getElementById(id);
		document.getElementById("addxcdc").removeChild(e);
	}

</script>
<script type="text/javascript">

	function docPrint(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyInfo.id}";
		window.open(url);
	}
	
	
</script>