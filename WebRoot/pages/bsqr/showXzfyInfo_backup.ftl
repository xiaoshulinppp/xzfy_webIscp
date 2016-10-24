<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="textml; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>案件办理</title>
		

		<link href="../${Session['_USER_STYLE_'].cssPath}/base.css" rel="stylesheet" type="text/css" />
		<link href="../${Session['_USER_STYLE_'].cssPath}/main_style.css" rel="stylesheet" type="text/css" />
		<link href="../css/style_form.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="../js/16B/prototype.js"></script>
		<script type="text/javascript" src="../js/16B/function.js"></script>
		
			<!--                       Javascripts 注意不要改变顺序                      -->
		<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
		<!-- 组件template -->
		<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}l.base.js"></script>

		<style>
			.diva{
			BORDER:#bfceff 1px solid;
			height:22;
			FILTER:progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr='#ddecfb',endColorStr='#ffffff');
			PADDING-TOP: 3px; 
			}
			.divb{
			BORDER: #bfceff 1px solid;
			PADDING-TOP: 10px; 
			PADDING-LEFT: 10px;
			FONT-SIZE: 12px;
			HEIGHT: 100px;
			width:180;
			border-top:0;
			}
		</style>
		<SCRIPT language=JavaScript src="../pages/xzfy/js/function.js"></SCRIPT>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>
</head>

<body onload="startTime()">
<#include "../website/header.ftl">
<form name="form" id="form" method="post" ENCTYPE="multipart/form-data">
<input type="hidden" name="funcCode" value="${funcCode}" />
<input name="userLocbm" value="${userLocbm}" type="hidden" />
<input name="userName" id="userName" value="${userName}" type="hidden" />
<input name="xzfyId" value="${xzfyId}" type="hidden" />
<div class="wal pageNow2">
	<div class="fl">
	当前位置：&nbsp;&nbsp;<a href="../bsqr/showList.action?funcCode=459">被申请列表</a>--生成答复
    </div>
</div>

<!--您的位置表格结束-->
<!--标题表格开始-->
<!--标题表格结束-->
<!--主体内容、列表显示区域-->
<div class="pageBg1">
	<div class="wal">
    	<div id="searchForm">
    		<div class="searchForm">
    			<div class="align-right">
				 	<input type="button" class="btn1" value="生成文书" onClick="getDftzDoc()" />	   
				    <input type="button" class="btn2 btn1" onclick="checkForm()" value="提交答复" />
				</div><br/>
    			<table class="ui-table ui-table-form ">
    				<tr>
    					<th width="15%">答复通知</th>
    					<td width="35%"><a href="${xzfyDftz.content?default('#')}"><#if xzfyDftz.content?has_content>查看通知<#else>未上传</#if></a>
    					</td>
    					<th width="15%">在线通知</th>
    					<td width="35%">
    					<#assign t = dftzOnline.size()>
    					<#if t!=0><a href="javascript:dftzDoc()">查看在线通知</a><#else>未在线生成文书</#if>
    					</td>
    				</tr>
    				<tr>
    					<th width="15%">申请书</th>
    					<td width="35%">
									<#if archiveList1?has_content>
										<#list archiveList1 as archive>
											
												${archive.fileName?default('')}
												
												<a href="${archive.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;												
												
												<br/>
											
										</#list>
									</#if>    					
    					</td>
    					<th width="15%">申请人提交的其他材料</th>
    					<td width="35%">
									<#if archiveList3?has_content>
										<#list archiveList3 as archive>
											
												${archive.fileName?default('')}
												
												<a href="${archive.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;												
												
												<br/>
											
										</#list>
									</#if>	
    					</td>
    				</tr>
    			</table>
    			<table class="ui-table ui-table-form ">
			  		<tr>
			    		<th width="15%">上传答复文书：</th>
			    		<td width="35%">
							<input name="dftzFile" type="file" id="dftzFile" class="inputTextFile" />	
			    		</td>
			    		<th width="15%">上传证据</th>
				    	<td width="35%">
					    	<div align="left">
					    		<a href="javascript:addattachment()">+添加</a>
					    	</div>
				    		<div id="newdiv">
				    	
				    		</div>
				    	</td>
			  		</tr>
 				</table>
				
			</div>
		</div>
	</div>
</div>
</form>
<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>
</body>

<script type="text/javascript">
	var count = 0;
	function checkForm(){
		if(document.getElementById("dftzFile").value==""){
			alert("请上传答复文书！");
		}else if(count==0){
			alert("请至少上传一个证明材料！");
		}else{
			if(confirm("确定提交答复吗?")){
				document.form.action="saveInfo.action";			
				document.form.submit();
			}
		}
	}
	function gotoList(){
		window.history.back();
	}

	
	function addattachment(){
		if(count<3){
			var a=document.createElement('div');
			a.id="div"+count;
			a.innerHTML="<input type=\"file\" name=\"upFile\" class=\"inputTextFile\" />"+"<a href=\"javascript:del(\'"+a.id+"\')\">-删除</a>";
			document.getElementById("newdiv").appendChild(a);
			count++;
		}else{
			alert("最多三个附件！");
		}
		
	}
	function del(id){
		var e = document.getElementById(id);
		document.getElementById("newdiv").removeChild(e);
 		count--;
	}
	<#--
	function savaToLaDoc(){
		var options = { 
			url:'updateDftz_content.action', //提交给哪个执行 
			type:'POST', 
			success: getLiantongzhi //显示操作提示 
			}; 
		$('#form').ajaxSubmit(options); 
		return false; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
				

	}
	-->
	function getDftzDoc(){
		var userName= document.getElementById("userName").value;
		var url="../fzb_default_dafutongzhi.jsp?d_filetype=doc&caseId=${xzfyId}&mstype=dafudafutongzhishu&d_username=${Session['_USER_LOGIN_'].id}";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
	function dftzDoc(){
		var userName= document.getElementById("userName").value;
		var url="../fzb_default_dafutongzhi.jsp?actiontype=yuedu&d_filetype=doc&caseId=${xzfyId}&mstype=dafutongzhi&d_username=${Session['_USER_LOGIN_'].id}";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
</script>
</html>
