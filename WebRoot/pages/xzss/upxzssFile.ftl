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
    <form id="form1" name="form1" action="" method="post" ENCTYPE="multipart/form-data">
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="xzssId" value="${xzssId}" />
			
			<input type="hidden" id="filepath" name="filepath" value="" />
			<#assign user_id=Session['_USER_LOGIN_'].id>
	<div class="formDiv" id="banan">
		<div class="btn">
			<div class="fl">
				<a href="javascript:saveXzssFile()" style="background:yellow<#if locbm!=xzssInfo.case_org?default('')>;display:none</#if>" >保存案卷</a>
           	</div>
	  	</div>
	  	<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table  ui-table-list  list-fixed " >
	  	<tr>
			<th width="30%">应诉通知书</th>
			<td>
				<#if xzssFileList1?has_content>
						<ul>
						<#if xzssFileList1?has_content>
							<#list xzssFileList1 as xzssFile>
								<li>
									${xzssFile.fileName?default('')}
									<span style="float:right" >													
										<a  href="${xzssFile.fileRelativePath}"  target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
										<a href="javascript:deleteXzssFile('${xzssFile.id?default('')}')"><font color="green" style="font-size:15px">删除</font></a>
									</span>
									<br/>
									上传者：${xzssFile.uploadUserName?default('')} ${xzssFile.uploadTime?default('')}
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
			<th width="30%">起诉状</th>
			<td>
				<#if xzssFileList2?has_content>
						<ul>
						<#if xzssFileList2?has_content>
							<#list xzssFileList2 as xzssFile>
								<li>
									${xzssFile.fileName?default('')}
									<span style="float:right" >													
										<a href="${xzssFile.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
										<a href="javascript:deleteXzssFile('${xzssFile.id?default('')}')"><font color="green" style="font-size:15px">删除</font></a>
									</span>
									<br/>
									上传者：${xzssFile.uploadUserName?default('')} ${xzssFile.uploadTime?default('')}
								</li>
							</#list>
						</#if>
						</ul>
				<#else>
					<font color="green" style="font-size:15px">未上传</font>&nbsp;
				</#if>
				<a href="javascript:add2()">添加</a>
				<div id="div_2"></div>
			</td>
		</tr>
		<tr>
			<th width="30%">应诉手续</th>
			<td>
				<#if xzssFileList3?has_content>
						<ul>
						<#if xzssFileList3?has_content>
							<#list xzssFileList3 as xzssFile>
								<li>
									${xzssFile.fileName?default('')}
									<span style="float:right" >													
										<a href="${xzssFile.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
										<a href="javascript:deleteXzssFile('${xzssFile.id?default('')}')"><font color="green" style="font-size:15px">删除</font></a>
									</span>
									<br/>
									上传者：${xzssFile.uploadUserName?default('')} ${xzssFile.uploadTime?default('')}
								</li>
							</#list>
						</#if>
						</ul>
				<#else>
					<font color="green" style="font-size:15px">未上传</font>&nbsp;
				</#if>
				<a href="javascript:add3()">添加</a>
				<div id="div_3"></div>
			</td>
		</tr>
		<tr>
			<th width="30%">答辩材料</th>
			<td>
				<#if xzssFileList4?has_content>
						<ul>
						<#if xzssFileList4?has_content>
							<#list xzssFileList4 as xzssFile>
								<li>
									${xzssFile.fileName?default('')}
									<span style="float:right" >													
										<a href="${xzssFile.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
										<a href="javascript:deleteXzssFile('${xzssFile.id?default('')}')"><font color="green" style="font-size:15px">删除</font></a>
									</span>
									<br/>
									上传者：${xzssFile.uploadUserName?default('')} ${xzssFile.uploadTime?default('')}
								</li>
							</#list>
						</#if>
						</ul>
				<#else>
					<font color="green" style="font-size:15px">未上传</font>&nbsp;
				</#if>
				<a href="javascript:add4()">添加</a>
				<div id="div_4"></div>
			</td>
		</tr>
		<tr>
			<th width="30%">裁判文书</th>
			<td>
				<#if xzssFileList5?has_content>
						<ul>
						<#if xzssFileList5?has_content>
							<#list xzssFileList5 as xzssFile>
								<li>
									${xzssFile.fileName?default('')}
									<span style="float:right" >													
										<a href="${xzssFile.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
										<a href="javascript:deleteXzssFile('${xzssFile.id?default('')}')"><font color="green" style="font-size:15px">删除</font></a>
									</span>
									<br/>
									上传者：${xzssFile.uploadUserName?default('')} ${xzssFile.uploadTime?default('')}
								</li>
							</#list>
						</#if>
						</ul>
				<#else>
					<font color="green" style="font-size:15px">未上传</font>&nbsp;
				</#if>
				<a href="javascript:add5()">添加</a>
				<div id="div_5"></div>
			</td>
		</tr>
		<tr>
			<th width="30%">司法建议</th>
			<td>
				<#if xzssFileList6?has_content>
						<ul>
						<#if xzssFileList6?has_content>
							<#list xzssFileList6 as xzssFile>
								<li>
									${xzssFile.fileName?default('')}
									<span style="float:right" >													
										<a href="${xzssFile.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
										<a href="javascript:deleteXzssFile('${xzssFile.id?default('')}')"><font color="green" style="font-size:15px">删除</font></a>
									</span>
									<br/>
									上传者：${xzssFile.uploadUserName?default('')} ${xzssFile.uploadTime?default('')}
								</li>
							</#list>
						</#if>
						</ul>
				<#else>
					<font color="green" style="font-size:15px">未上传</font>&nbsp;
				</#if>
				<a href="javascript:add6()">添加</a>
				<div id="div_6"></div>
			</td>
		</tr>
		<tr>
			<th width="30%">其他材料</th>
			<td>
				<#if xzssFileList7?has_content>
						<ul>
						<#if xzssFileList7?has_content>
							<#list xzssFileList7 as xzssFile>
								<li>
									${xzssFile.fileName?default('')}
									<span style="float:right" >													
										<a href="${xzssFile.fileRelativePath?default('')}" target="_blank"><font color="green" style="font-size:15px">下载</font></a>&nbsp;&nbsp;
										<a href="javascript:deleteXzssFile('${xzssFile.id?default('')}')"><font color="green" style="font-size:15px">删除</font></a>
									</span>
									<br/>
									上传者：${xzssFile.uploadUserName?default('')} ${xzssFile.uploadTime?default('')}
								</li>
							</#list>
						</#if>
						</ul>
				<#else>
					<font color="green" style="font-size:15px">未上传</font>&nbsp;
				</#if>
				<a href="javascript:add7()">添加</a>
				<div id="div_7"></div>
			</td>
		</tr>
	  	</table>
	</div>     
    </form>


</body>
</html>


<script>
function saveXzssFile(){
	window.form1.action="../xzss/saveXzssFile.action";
	window.form1.submit();
}
function deleteXzssFile(id){
	window.form1.action="deleteXzssFile.action?fileId="+id;
	window.form1.submit();
}
function downloadFile(path){
document.getElementById("filepath").value=path;
window.form1.action="downloadFile.action";
window.form1.submit();
//window.location="downloadFile.action?funcCode=${funcCode}&filepath="+path+"";
}
function checkfile(fileInput,id) 
	{ 
	  
	  var filename=fileInput.value;
	  var fileText=filename.substring(filename.lastIndexOf("."),filename.length); //获取文件扩展名
	  fileText=fileText.toLowerCase();
	  if (fileText=='.jpg' ||fileText=='.png'||fileText=='.gif'||fileText=='.bmp'||fileText=='.tif'||fileText==".pdf"){
				
		  }else{
	        alert('操作失败！原因：您选择的不是图片或pdf文件。');
	        var subid=id.substr(0,5);
	        var parent=document.getElementById(id).parentNode;
	        parent.parentNode.removeChild(parent);
	        if(subid=="file1")
	        	num1--;
	        else if(subid=="file2")
	        	num2--;
	        else if(subid=="file3")
	        	num3--;
	        else if(subid=="file4")
	        	num4--;
	        else if(subid=="file5")
	        	num5--;
	        else if(subid=="file6")
	        	num6--;
	        else if(subid=="file7")
	        	num7--;	
	      }
	
	}
var count=0;
var num1=${list1Size};
function add1(){
	if(num1>4){
		alert("应诉通知书数目不能超过5份！")
		return;
		}
	var e=document.createElement('div');
	e.id="div"+count;
	var fileid="file1"+count;
	e.innerHTML="<input type=\"file\" name=\"upFile1\" id="+fileid+" class=\"inputTextFile\" onchange=\"checkfile(this,this.id)\" /><a href=\"javascript:del1(\'"+e.id+"\')\">删除</a>";
	document.getElementById("div_1").appendChild(e);
	count++;
	num1++;
}
function del1(id){
	var e=document.getElementById(id);
	document.getElementById("div_1").removeChild(e);
	num1--;
}
var num2=${list2Size};
function add2(){
	if(num2>4){
		alert("起诉状数目不能超过5份！")
		return;
	}
	var e=document.createElement('div');
	e.id="div"+count;
	var fileid="file2"+count;
	e.innerHTML="<input type=\"file\" name=\"upFile2\" id="+fileid+" class=\"inputTextFile\" onchange=\"checkfile(this,this.id)\" />"+"<a href=\"javascript:del2(\'"+e.id+"\')\">删除</a>";
	document.getElementById("div_2").appendChild(e);
	count++;
	num2++;
}
function del2(id){
	var e=document.getElementById(id);
	document.getElementById("div_2").removeChild(e);
	num2--;
}
var num3=${list3Size};
function add3(){
	if(num3>4){
		alert("应诉手续数目不能超过5份！")
		return;
		}
	var e=document.createElement('div');
	e.id="div"+count;
	var fileid="file3"+count;
	e.innerHTML="<input type=\"file\" name=\"upFile3\" id="+fileid+" class=\"inputTextFile\" onchange=\"checkfile(this,this.id)\" />"+"<a href=\"javascript:del3(\'"+e.id+"\')\">删除</a>";
	document.getElementById("div_3").appendChild(e);
	count++;
	num3++;
}
function del3(id){
	var e=document.getElementById(id);
	document.getElementById("div_3").removeChild(e);
	num3--;
}
var num4=${list4Size};
function add4(){
	if(num4>4){
		alert("答辩材料数目不能超过5份！")
		return;
		}
	var e=document.createElement('div');
	e.id="div"+count;
	var fileid="file4"+count;
	e.innerHTML="<input type=\"file\" name=\"upFile4\" id="+fileid+" class=\"inputTextFile\" onchange=\"checkfile(this,this.id)\" />"+"<a href=\"javascript:del4(\'"+e.id+"\')\">删除</a>";
	document.getElementById("div_4").appendChild(e);
	count++;
	num4++;
}
function del4(id){
	var e=document.getElementById(id);
	document.getElementById("div_4").removeChild(e);
	num4--;
}
var num5=${list5Size};
function add5(){
	if(num5>4){
		alert("裁判文书数目不能超过5份！")
		return;
		}
	var e=document.createElement('div');
	e.id="div"+count;
	var fileid="file5"+count;
	e.innerHTML="<input type=\"file\" name=\"upFile5\"  id="+fileid+" class=\"inputTextFile\" onchange=\"checkfile(this,this.id)\" />"+"<a href=\"javascript:del5(\'"+e.id+"\')\">删除</a>";
	document.getElementById("div_5").appendChild(e);
	count++;
	num5++;
}
function del5(id){
	var e=document.getElementById(id);
	document.getElementById("div_5").removeChild(e);
	num5--;
}
var num6=${list6Size};
function add6(){
	if(num6>4){
		alert("司法建议数目不能超过5份！")
		return;
		}
	var e=document.createElement('div');
	e.id="div"+count;
	var fileid="file6"+count;
	e.innerHTML="<input type=\"file\" name=\"upFile6\"  id="+fileid+" class=\"inputTextFile\" onchange=\"checkfile(this,this.id)\" />"+"<a href=\"javascript:del6(\'"+e.id+"\')\">删除</a>";
	document.getElementById("div_6").appendChild(e);
	count++;
	num6++;
}
function del6(id){
	var e=document.getElementById(id);
	document.getElementById("div_6").removeChild(e);
	num6--;
}
var num7=${list7Size};
function add7(){
	if(num7>4){
		alert("其他材料数目不能超过5份！")
		return;
		}
	var e=document.createElement('div');
	e.id="div"+count;
	var fileid="file7"+count;
	e.innerHTML="<input type=\"file\" name=\"upFile7\" id="+fileid+" class=\"inputTextFile\" onchange=\"checkfile(this,this.id)\" />"+"<a href=\"javascript:del7(\'"+e.id+"\')\">删除</a>";
	document.getElementById("div_7").appendChild(e);
	count++;
	num7++;
}
function del7(id){
	var e=document.getElementById(id);
	document.getElementById("div_7").removeChild(e);
	num7--;
}
</script>