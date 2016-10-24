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

<#include "../website/header.ftl">

  
    <form id="form" name="form" action="''" method="post" ENCTYPE="multipart/form-data">
<input type="hidden" name="funcCode" value="${funcCode}" />
<input name="userLocbm" value="${userLocbm}" type="hidden" />
<input name="userName" id="userName" value="${userName}" type="hidden" />
<input name="xzfyId" value="${xzfyId}" type="hidden" />

		<div class="formDiv" id="banan">
			<div class="btn">
				<div class="fl">
				
					<a href="javascript:getDftzDoc()" style="background:yellow" >生成答复书</a>
	           		<a href="javascript:checkForm()" style="background:yellow" >提交答复</a>
	           				           		
	           	</div>		 
		  	</div>
		  	
	
			
			<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table  ui-table-list  list-fixed " >
					<input type="hidden" name="xzfyDftz.xzfy_id" value="${xzfyInfo.id}" />
					<tr>
						<th width="25%" rowspan=8>在线回复<br/>答复通知</th>
						
						<td>
							<a href="${xzfyDftz.content?default('#')}" target="_blank"><#if xzfyDftz.content?has_content>下载答复通知书<#else>未上传答复通知书</#if>
						</td>
					</tr>
				
					<tr>
						<td>
						<#assign t = dftzOnline.size()>
    					<#if t!=0><a href="javascript:dftzDoc()">查看在线答复通知书</a><#else>未生成在线答复通知书</#if>
						</td>
					</tr>
									
					
				
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
						<td>
						上传答复文书：<input name="dftzFile" type="file" id="dftzFile" class="inputTextFile" />	
						</td>
					</tr>
					
					<tr>
						<td>
						 上传证据
						 <div align="left">
					    		<a href="javascript:addattachment()">+添加</a>
					    	</div>
				    		<div id="newdiv">
				    	
				    		</div>	
						</td>
					</tr>

					

				
					
			
				</table>

<br/>

		<br/><br/>
		</div>
	      <br/><br/>     
  </form>
  
  
  <div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>


</body>
</html>

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

