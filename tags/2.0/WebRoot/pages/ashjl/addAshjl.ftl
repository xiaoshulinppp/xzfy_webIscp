<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../css/style_form.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../plugs/kindeditor/kindeditor.js"></script>
	</head>
	<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
	<body>
	<form name="form" id="form" method="post" ENCTYPE="multipart/form-data">
	<div class="ui-title fn-clear">
     <span class="ui-title-icon fn-left"><img src="../sys_theme/images/icons/crumb.png"/></span>
      <h2 class="ui-title-cnt fn-left">添加案审会记录</h2></span></div> 
<div class="z_info"> 
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
			<tr>
				<th>时间</th>
				<td>
					<input type="text" name="ashjlInfo.time" class="inputTextNormal" id="time" onClick="WdatePicker()"/>
				</td>
				<th>地点</th>
				<td>
					<input type="text" name="ashjlInfo.location"  class="inputTextNormal" id="location"/>
				</td>
			</tr>
			<tr class="trwhite">
				<th>主持人</th>
				<td>
				    <select name="comtStr" id="host" onchange="selecthost()">
				    	<option value="0">选择</option>
				    	<#list committeeList as comt>
				    	<option value="${comt.comtName},${comt.comtId}">${comt.comtName}</option>
				    	</#list>	
				    </select>
				    <select name="host.grade" id="hostgrade" >
				    <#list gradeList1 as g>
				    	<option value="${g.grade}"><#if g.grade=="0">未评价<#else>${g.grade}</#if></option>
				    </#list>
				    </select>
				</td>
				<th>上传听证记录：</th>
	    		<td>
	    			<input name="upFile" type="file" id="upFile" class="inputTextFile">
	   			</td>
				
			</tr>

        <tr>
				<th>参加人</th>
				<td>
				
				    <!--start   --!>
				    
				    
				    <input type="button" onclick="selectwy()" value="添加" />
				    <div style="display:none" id="selectdiv">
				    <#list committeeList as comt>
				    <input type="checkbox" name="checkbox" id="checkbox${comt_index}" value ="${comt.comtName};${comt.comtId}" >${comt.comtName}<br>
					</#list>
					<input type="button" value="确定" onClick="adddiv1()">
					<input type="button" value="取消" onClick="cancelselect()">
				    </div>
				    
				    
				    <!-- end   --!>
				    <div id="newdiv" style="display:block">
				    
				    </div>
				</td>
				<td></td>
				<td></td>
	    </tr>
		</table>
		</div>
			<input type="hidden" name="ashjlId" value="${ashjlId}" />
			<input type="hidden" name="ashjlInfo.id" value="${ashjlId}" />
			<input type="hidden" name="host.ashjlId" value="${ashjlId}" />
			<input type="hidden" name="xzfyId" value="${xzfyId}" />
			<input type="hidden" name="host.xzfyId" value="${xzfyId}" />
			<input type="hidden" name="ashjlInfo.xzfyId" value="${xzfyId}" />
			<input type="hidden" name="funcCode" value="${funcCode}"/>
			<input type="hidden" name="isModify" value="${isModify}"/>
		<div class="align-center">
					<input type="button" id="sub" class="ui-btn ui-btn-normal" value="提 交" onClick="saveAshjl();" />
					<input type="button" class="ui-btn ui-btn-normal" value="返 回" onclick="gotoBack();" />
		</div>
		</form>
	</body>
</html>
<script type="text/javascript">
	var name = 0;
	var list = new Array();
	function adddiv(){
	    if(document.getElementById("attendant").value=="0"){
	    	alert("请先选择委员！");
	    }else{
		    var i = document.getElementById("attendant").value;
		    var k = i.substring(0,i.indexOf(";"));
			var grade = document.getElementById("attendantgrade").value;
			var j;
			if(grade=="0")
			{j="未评价";}
			else
			{j=grade+"分";}
			var a = document.createElement('div');
			a.id="div"+name;
			a.innerHTML="<input readonly name=\"attendantName\" value=\""+i+"\" type=\"hidden\"  />"+"<input readonly name=\"name\" value=\""+k+"\" type=\"text\"  />"+"<input readonly name=\"grade\" value=\""+j+"\" type=\"text\"  />"+"<input type=\"button\" onclick=\"del(\'"+a.id+"\')\" value=\"删除\" />";
			document.getElementById("newdiv").appendChild(a);
			name++;
			document.getElementById("attendant").value="0";
			document.getElementById("attendantgrade").value=0;
		}
	}
	function del1(id,i){
		list[i]=-1;
		var element = document.getElementById(id);
		document.getElementsByName("checkbox")[i].disabled=false;
		document.getElementsByName("checkbox")[i].checked=false;
		document.getElementById("newdiv").removeChild(element);
		
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
	function saveAshjl(){
		
	    if(confirm("确认提交？")){
	    	document.form.action="saveAshjl.action"
			document.form.submit();
		}
	}
	function gotoBack(){
		document.form.action="showAshjlList.action";
		document.form.submit();
	}
	function selectwy(){
		document.getElementById("selectdiv").style.display="block";
		document.getElementById("newdiv").style.display="none";
	}
	function cancelselect(){
		document.getElementById("newdiv").style.display="block";
		document.getElementById("selectdiv").style.display="none";
	}
	function adddiv1(){
		document.getElementById("selectdiv").style.display="none";
		document.getElementById("newdiv").style.display="block";
		var checkbox = document.getElementsByName("checkbox");
		
		for(var i=0;i<checkbox.length;i++)
		{   
			if(checkbox[i].checked){
				if((list[i]==-1)||(list[i]==null)){
				list[i]=i;
				var a = document.createElement('div');
			a.id="div"+i;
			
			a.innerHTML="<input readonly name=\"attendantName\" value=\""+checkbox[i].value+"\" type=\"hidden\"  />"+"<input readonly name=\"name\" value=\""+checkbox[i].value.substring(0,checkbox[i].value.indexOf(";"))+"\" type=\"text\"  />"+
			"<select name=\"grade\" ><option vlaue=\"0\">未评价</option><option vlaue=\"1\">1分</option><option vlaue=\"2\">2分</option><option vlaue=\"3\">3分</option><option vlaue=\"4\">4分</option><option vlaue=\"5\">5分</option><option vlaue=\"6\">6分</option><option vlaue=\"7\">7分</option><option vlaue=\"8\">8分</option><option vlaue=\"9\">9分</option><option vlaue=\"10\">10分</option></select>"+
			"<a href=\"javascript:del1(\'"+a.id+"\','"+i+"\')\"> 删除 </a>";
			document.getElementById("newdiv").appendChild(a);
			checkbox[i].disabled="disabled";
			}
			}else{
				list[i]=-1;
			}
	}
	}
</script>