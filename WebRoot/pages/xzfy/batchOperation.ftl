<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/base.css" rel="stylesheet" type="text/css" />
		<link href="../${Session['_USER_STYLE_'].cssPath}/main_style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../sys_theme/js/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="../sys_theme/js/jquery.form.js"></script>
	</head>
	<body>


		
	
<!--search box end-->
<span class="x-line fn-clear"><img src="../${Session['_USER_STYLE_'].imagePath}/pic_search_line.png"/></span><!--我是有箭头灰色的分割线-->
<!--列表开始-->
<div class="ui-list-nobtnbar fn-clear " id="bzTable">
<form name="form" id="form" method="post">
	<input type="hidden" name="funcCode" value="${funcCode}" />
	<input type="hidden" name="ids" value="${ids}"/>
	<input type="hidden" name="listkeyword" value="${listkeyword}"/>
	<table  id="" class="ui-table ui-table-form " width='60'>
		<tr>
			<td width="20%" align="right">批复意见</td>
			<td><textarea id="suggestion" name="suggestion">同意</textarea></td>
		</tr>
		<tr>
			<td width="20%" align="right">请选择审批人</td>
			<td width="40%">
			 	<select name="selectedPerson" id="selectedPerson" onchange="setSuggestion(this.value)">
			 		<option value="">请选择</option>
			        <#list userList as userList>
					<option value="${userList.getName()},${userList.getId()}">${userList.getName()}</option>
					</#list>
				</select>
			</td>
			<td><input type="button" id="finish" value="完成" style="display:block" onclick="finishOperation();"/>
			<input type="button" id="submit" value="提交" style="display:none" onclick="submitOperation();"/></td>
			<td><input type="button" id="return" value="退回" onclick="sendBack()"/></td>	
		</tr>
	</table>

</from>
</div>	
</body>
</html>
<script>
	function setSuggestion(name){
		var textArea;
		if(name==""){
			textArea="同意";	
			document.getElementById("finish").style.display='block';
			document.getElementById("submit").style.display='none';	
		}else{
			textArea="  请"+name.substring(0,name.indexOf(","))+"同志阅示。";
			document.getElementById("finish").style.display='none';
			document.getElementById("submit").style.display='block';
		}
		document.getElementById("suggestion").value=textArea;
	}

	function finishOperation(){
		var options = {
			url:'../xzfy/finishOperation.action', //提交给哪个执行 
			type:'POST',
			success: callbackfun1 //显示操作提示 
		};
		$('#form').ajaxSubmit(options);
		return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 		
	}
	function callbackfun1(){
		alert("完成审批！");
		var api = frameElement.api, W = api.opener, D = W.document; // api.opener 为载加lhgdialog.min.js文件的页面的window对象
		window.parent.location="../banan/showanjianbanliList.action?funcCode=${funcCode}&listkeyword=${listkeyword}";
		api.close();
	}
	function submitOperation(){
		
		var options = {		
			url:'../xzfy/submitOperation.action', //提交给哪个执行 
			type:'POST',
			success: callbackfun2 //显示操作提示 
		};
		$('#form').ajaxSubmit(options);
		return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 		
	}
	function callbackfun2(){
		alert("提交成功！");
		var api = frameElement.api, W = api.opener, D = W.document; // api.opener 为载加lhgdialog.min.js文件的页面的window对象
		window.parent.location="../banan/showanjianbanliList.action?funcCode=${funcCode}&listkeyword=${listkeyword}";
		api.close();
	}
	function sendBack(){
		var options = {
			url:'../xzfy/sendBack.action', //提交给哪个执行 
			type:'POST',
			success: callbackfun3 //显示操作提示 
		};
		$('#form').ajaxSubmit(options);
		return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 		
	}
	function callbackfun3(){
		alert("已退回！");
		var api = frameElement.api, W = api.opener, D = W.document; // api.opener 为载加lhgdialog.min.js文件的页面的window对象
		window.parent.location="../banan/showanjianbanliList.action?funcCode=${funcCode}&listkeyword=${listkeyword}";
		api.close();
	}
</script>
	