<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/base.css" rel="stylesheet" type="text/css" />
		<link href="../${Session['_USER_STYLE_'].cssPath}/main_style.css" rel="stylesheet" type="text/css" />
		<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
		<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
	
	<!--                       Javascripts 注意不要改变顺序                      -->
		<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
	<!-- 组件template -->
	<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
	</head>
	<body>
		<!--search box end-->
		<span class="x-line fn-clear"><img src="../${Session['_USER_STYLE_'].imagePath}/pic_search_line.png"/></span><!--我是有箭头灰色的分割线-->
		<input type="hidden" name="funcCode" value="${funcCode}" />
		<!--列表开始-->
	
	 	<div class="ui-list-nobtnbar fn-clear " id="bzTable">
	 		<form name="saveForm" action="" method="post">
	    		<table  id="" class="ui-table ui-table-form " >
          	 		<tbody class="discolor">
						<tr><td class="fn-text-left">
							（一）申请人是公民，无申请人身份证明；<input value="1" id="check1" name="bzContent" type="checkbox" class="checkbox">
							<span id="appDiv"  style="display:none">
								<table>
									<#list xzfyApp as app>
										<tr>
											<td>${app.app_name}</td>
											<td>${app.app_id?default('')}</td>
											<td><input name="app" type="checkbox" value="${app.id}"></input></td>
										</tr>
									</#list>
								</table>
							</span>
						</td></tr>
						<tr><td class="fn-text-left">
						（二）行政行为材料；<input value="2" name="bzContent" type="checkbox" class="checkbox">
						</td></tr>
						<tr><td class="fn-text-left">
						（三）授权委托书；<input value="3" name="bzContent" type="checkbox" class="checkbox"">
						</td></tr>
						<tr><td class="fn-text-left">
						（四）其他需要补正的情形；<input value="4" name="bzContent" type="checkbox" class="checkbox">
						</td></tr>
     				</tbody>
     				<input class="ui-btn ui-btn-normal" id="btn" type="button" onclick="addContent()" value='提交'>
     				<input class="ui-btn ui-btn-normal" type="button" onclick="closeContent()" value='关闭'>
	     		</table>
	     	</form>
	     	<input type="hidden" id="hello" value="${(xzfyInfo.buzhengContentType)?default('')}"></input>
		</div>	
	</body>
</html>
<script>
	$(function(){
		var type1=$("#hello").val();
		if(type1!=""){
			var bzContent = type1.split("|");
			var bzContentType= bzContent[0].split(",");
			var bzApp = bzContent[1].split(",");
			var len = bzContentType.length-1;
			var lenApp = bzApp.length-1;
			var $app = $("input[name='app']");
			var l = $app.length;
			for(var i=0;i<len;i++){
				if(bzContentType[i]==='1'){
					$("#check1")[0].checked=true;
					document.getElementById("appDiv").style.display="block";
					for(var k=0;k<lenApp;k++){
						for(var j = 0;j<l;j++){
							if(bzApp[k]==$app[j].value){
								$app[j].checked=true;
							}
						}
					}
				}
				if(bzContentType[i]=='2'){
					$("input[name='bzContent']:eq(1)")[0].checked=true;
				}
				if(bzContentType[i]=='3'){
					$("input[name='bzContent']:eq(2)")[0].checked=true;
				}
				if(bzContentType[i]=='4'){
					$("input[name='bzContent']:eq(3)")[0].checked=true;
				}
			}
		}
	});
	$(function(){
		var br = $("#check1");
		br.click(function(){
			if(br[0].checked){
				document.getElementById("appDiv").style.display="block";
			}
			else{
				document.getElementById("appDiv").style.display="none";
				var objCheckBox = document.getElementsByName("app");
				for(var i=0;i<objCheckBox.length;i++){
					if(objCheckBox[i].checked){
						objCheckBox[i].checked=false;
					}
				}
			}
		});
	});
	var api = frameElement.api, W = api.opener, D = W.document;
	function isChecked(checkName){
		var obj = document.getElementsByName(checkName);
		var objYON = false;
		for(var i=0;i<obj.length;i++){
			if(obj[i].checked){
				objYON = true;
				break;
			}
		}
		return objYON;
	}

	function addContent(){
		if(isChecked("bzContent")==false){
			alert("请选择补证内容！");
		}
		else{
			var $checkBox = $(".checkbox");
			if($checkBox[0].checked){
				if(isChecked("app")==false){
					alert("请选择需要补证的人员！");
				}
				else{
					window.saveForm.action="../xzfy/changeBuzheng.action?funcCode=${funcCode}&xzfyId=${xzfyId}";
					window.saveForm.submit();
				}
			}
			else{
				window.saveForm.action="../xzfy/changeBuzheng.action?funcCode=${funcCode}&xzfyId=${xzfyId}";
				window.saveForm.submit();
			}
		}
	}
	function closeContent(){
		api.close();
	}
</script>
	