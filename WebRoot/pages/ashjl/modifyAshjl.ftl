<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title></title>
<link href="../css/style_form.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../plugs/kindeditor/kindeditor.js"></script>
</head>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
<body>
<form id="form" name="form" method="post" ENCTYPE="multipart/form-data">
	<div class="z_info"> 
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
			<#--<tr>
				<th>时间</th>
				<td class="tdFormInput">
					<input type="text" name="ashjlInfo.time" class="inputTextNormal" id="time" onClick="WdatePicker()"
					value="<#if ashjlInfo.time?has_content>${ashjlInfo.time}</#if>"/>
				</td>
				<th>地点</th>
				<td class="tdFormInput">
					<input type="text" name="ashjlInfo.location"  class="inputTextNormal" id="location"
					value="<#if ashjlInfo.location?has_content>${ashjlInfo.location}</#if>"/>
				</td>
			</tr>
			<tr>
				<th>主持人</th>
				<td>
				    <select name="comtStr" id="host" onchange="selecthost()">
				    	<option value="0">选择</option>
				    	<#list committeeList as comt>
				    	<option value="${comt.memName},${comt.memId}" <#if host.committeeName==comt.memName>selected</#if>>${comt.memName}</option>
				    	</#list>	
				    </select>
				    <select name="host.grade" id="hostgrade" >
				    <#list gradeList1 as g>
				    	<option value="${g.grade}" <#if host.grade==g.grade>selected</#if>><#if g.grade=="0">未评价<#else>${g.grade}</#if></option>
				    </#list>
				    </select>
				</td>-->
				
			<tr>
				<th width="30%">参加人</th>
				<td>
				 	<select name="attendant" id="attendant" onchange="selectattendant()">
				    	<option value="0">选择</option>
				    	<#list memberList as comt>
				    	<option value="${comt.memName};${comt.memId}">${comt.memName}</option>
				    	</#list>	
				    </select>
	
				    <input type="button" onClick="adddiv()" value="添加">
				    <div style="display:none">    
				     <input type="button" onclick="selectwy()" value="添加" />
				    <div style="display:none" id="selectdiv">
				    <#list memberList as comt>
				    <#list wypjList as wypj>
				    <#if wypj.committeeName==comt.memName><input type="checkbox" name="checkbox" id="checkbox${comt_index}" value ="${comt.memName};${comt.memId}" checked disabled>${comt.memName}<br>
				    </#if>
					</#list>
					</#list>
					<input type="button" value="确定" onClick="adddiv1()">
					<input type="button" value="取消" onClick="cancelselect()">
				    </div>
				    </div>
				    <div id="newdiv">
				    <#list wypjList as wypj>
				    <div id="div${wypj_index}" >
				    <input name="attendantName" value="${wypj.committeeName};${wypj.committeeId}" type="hidden"/><input readonly name="name" value="${wypj.committeeName}" type="text" />
				    <select name="grade" >
					<option vlaue="0" <#if wypj.grade=="0">selected</#if>>未评价</option>
					<option vlaue="1" <#if wypj.grade=="1">selected</#if>>1分</option>
					<option vlaue="2" <#if wypj.grade=="2">selected</#if>>2分</option>
					<option vlaue="3" <#if wypj.grade=="3">selected</#if>>3分</option>
					<option vlaue="4" <#if wypj.grade=="4">selected</#if>>4分</option>
					<option vlaue="5" <#if wypj.grade=="5">selected</#if>>5分</option>
					<option vlaue="6" <#if wypj.grade=="6">selected</#if>>6分</option>
					<option vlaue="7" <#if wypj.grade=="7">selected</#if>>7分</option>
					<option vlaue="8" <#if wypj.grade=="8">selected</#if>>8分</option>
					<option vlaue="9" <#if wypj.grade=="9">selected</#if>>9分</option>
					<option vlaue="10" <#if wypj.grade=="10">selected</#if>>10分</option>
					</select>
					<a href="javascript:del('div${wypj_index}')"> 删除  </a>
				    </div>
				    </#list>
				    </div>
				</td>
			</tr>
			<tr>
				<th width="30%">上传听证记录：</th>
	    		<td>
	    			<input name="upFile" type="file" id="upFile" class="inputTextFile"><br/>
	    			<a href="<#if ashjlInfo.realFilePath?has_content>${ashjlInfo.realFilePath}</#if>" ><#if ashjlInfo.fileName?has_content>${ashjlInfo.fileName}</#if></a>
	   			</td>			
			</tr>
		</table>
	</div>
	<div class="align-center">
		<a href="#" class="btn-blue btn" onClick="checkForm()" />修改</a>
	    <#--<a href="#" class="btn-blue btn" onClick="gotoList()">返回</a>-->
			<input type="hidden" name="ashjlId" value="${ashjlId}" />
			<input type="hidden" name="ashjlInfo.id" value="${ashjlId}" />
			<#--<input type="hidden" name="host.ashjlId" value="${ashjlId}" />-->
			<input type="hidden" name="xzfyId" value="${xzfyId}" />
			<#--<input type="hidden" name="host.xzfyId" value="${xzfyId}" />-->
			<input type="hidden" name="ashjlInfo.xzfyId" value="${xzfyId}" />
			<input type="hidden" name="funcCode" value="${funcCode}"/>
			<input type="hidden" name="ashjlInfo.filePath" value="<#if ashjlInfo.filePath?has_content>${ashjlInfo.filePath}</#if>"/>
			<input type="hidden" name="ashjlInfo.realFilePath" value="<#if ashjlInfo.realFilePath?has_content>${ashjlInfo.realFilePath}</#if>"/>
			<input type="hidden" name="ashjlInfo.fileName" value="<#if ashjlInfo.fileName?has_content>${ashjlInfo.fileName}</#if>"/>
		    <input type="hidden" name="isModify" value="${isModify}"/>
	</div>
</form>
</body>
</html>
<script type="text/javascript">
	var name = 100;
	function adddiv(){
	    if(document.getElementById("attendant").value=="0"){
	    	alert("请先选择委员！");
	    }else{
		    var i = document.getElementById("attendant").value;
		    var k = i.substring(0,i.indexOf(";"));

			var a = document.createElement('div');
			a.id="div"+name;
			a.innerHTML="<input readonly name=\"attendantName\" value=\""+i+"\" type=\"hidden\"  />"+"<input readonly name=\"name\" value=\""+k+"\" type=\"text\"  />"+
			"&nbsp<select name=\"grade\" ><option vlaue=\"0\">未评价</option><option vlaue=\"1\">1分</option><option vlaue=\"2\">2分</option><option vlaue=\"3\">3分</option><option vlaue=\"4\">4分</option><option vlaue=\"5\">5分</option><option vlaue=\"6\">6分</option><option vlaue=\"7\">7分</option><option vlaue=\"8\">8分</option><option vlaue=\"9\">9分</option><option vlaue=\"10\">10分</option></select>&nbsp"
			+"<a href=\"javascript:del(\'"+a.id+"\')\"> 删除 </a>";
			document.getElementById("newdiv").appendChild(a);
			name++;
			document.getElementById("attendant").value="0";
			document.getElementById("attendantgrade").value=0;
		}
	}
	function del(id){
		var element = document.getElementById(id);
		document.getElementById("newdiv").removeChild(element);
		
	}
	function selecthost(){
		document.getElementById("hostgrade").value=0;
		}
	function selectattendant(){
		document.getElementById("attendantgrade").value=0;
	}
	function checkForm(){
		
	    if(confirm("确认修改？")){
	    	document.form.action="saveAshjl.action";
			document.form.submit();
		}
		
	}
	function gotoList(){
		document.form.action="showAshjlList.action";
		document.form.submit();
	}
	function selectwy(){
		document.getElementById("selectdiv").style.display="block";
	}
</script>