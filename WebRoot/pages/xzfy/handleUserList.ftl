<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/base.css" rel="stylesheet" type="text/css" />
		<link href="../${Session['_USER_STYLE_'].cssPath}/main_style.css" rel="stylesheet" type="text/css" />
	
	<!--                       Javascripts 注意不要改变顺序                      -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
	</head>
	<body>


		
	
<!--search box end-->
<span class="x-line fn-clear"><img src="../webstyle/images/pic_search_line.png"/></span><!--我是有箭头灰色的分割线-->
			
			<input type="hidden" name="funcCode" value="${funcCode}" />
<!--列表开始-->
 <div class="ui-list-nobtnbar fn-clear " id="bzTable">
 <form name="form" id="form" action="" method="post">
    <table  id="" class="ui-table ui-table-form " width='60'>
  
           <tbody class="discolor">
           <#if typeId=='2'>
           <div align="right">
               <input type="button" onclick="gotoSubmit();" value="提交" style="width:50px;height:30px;color:white;background:green">
           </div>
           <input type="hidden" id="userId1" value=""/>
           <input type="hidden" id="userId2" value=""/>
           <tr>
           <td class="fn-text-center">第一承办人</td><td></td>
           <td class="fn-text-center">第二承办人</td><td></td>
           </tr>
           <#list userList as userList>
			<tr>
			<td class="fn-text-right">${userList.getName()}</td>
			<td class="fn-text-left"><input type='radio' name="username" onclick="setUser1('${userList.getId()}')"></td>
			<td class="fn-text-right">${userList.getName()}</td>
			<td class="fn-text-left"><input type='radio' name="username1" onclick="setUser2('${userList.getId()}')"></td>
			</tr>
			</#list>
			<tr>
			<td></td>
			<td></td>
			<td class="fn-text-left">其他</td>
			<td class="fn-text-left"><input type='text' style="width:50px" name="cbother" id="cbother" value=""></td>
			</tr>
		    <#elseif typeId=="1">
		   <div align="right">
           <input type="button" onclick="gotoSubmit1();" value="提交" style="width:50px;height:30px;color:white;background:green">
           </div>
           <input type="hidden" id="userId3" value=""/>
           <input type="hidden" id="userId4" value=""/>
           <tr>
           <td class="fn-text-center">第一审查人</td><td></td>
           <td class="fn-text-center">第二审查人</td><td></td>
           </tr>
           <#list userList as userList>
			<tr>
			<td class="fn-text-right">${userList.getName()}</td>
			<td class="fn-text-left"><input type='radio' name="username" onclick="setUser3('${userList.getId()}')"></td>
			<td class="fn-text-right">${userList.getName()}</td>
			<td class="fn-text-left"><input type='radio' name="username1" onclick="setUser4('${userList.getId()}')"></td>
			</tr>
			</#list>
			<tr>
			<td></td>
			<td></td>
			<td class="fn-text-left">其他</td>
			<td class="fn-text-left"><input type='text' style="width:50px" name="scother" id="scother" value=""></td>
			</tr> 
		    
           <#else>
           	<#list userList as userList>
			<tr>
			<td class="fn-text-right">${userList.getName()}</td>
			<td class="fn-text-left"><input type='radio' name="username" onclick="setUser('${userList.getId()}')"></td>
			</tr>
			</#list>
			</#if>
     </tbody>
     </table>
</from>
</div>	


		
	</body>
</html>
		
	
<script>
	var api = frameElement.api, W = api.opener, D = W.document; // api.opener 为载加lhgdialog.min.js文件的页面的window对象

	function setUser(userId){
		if(confirm("您确认要转办案件吗？")){
			window.location="../xzfy/setHandleUser.action?xzfyId=${xzfyId}&typeId=${typeId}&funcCode=${funcCode}&listkeyword=${listkeyword}&userId="+userId;
		}
	c
	}
	function setUser1(userId){
		document.getElementById("userId1").value=userId;
	}
	function setUser2(userId){
		document.getElementById("userId2").value=userId;
	}	
	function gotoSubmit(){
		var i = document.getElementById("userId1").value;
		var j = document.getElementById("userId2").value;
		if(i==""){
			alert("请选择第一承办人！");
		}else{
			var k="";
			if(j!=""){
				k=i+","+j;
			}else{
				k=i;
			}
			var other=document.getElementById("cbother").value;
			window.location="../xzfy/setHandleUser.action?xzfyId=${xzfyId}&typeId=${typeId}&funcCode=${funcCode}&listkeyword=${listkeyword}&userId="+k+"&other="+other;
		}
	}
	function setUser3(userId){
		document.getElementById("userId3").value=userId;
	}
	function setUser4(userId){
		document.getElementById("userId4").value=userId;
	}	
	function gotoSubmit1(){
		var i = document.getElementById("userId3").value;
		var j = document.getElementById("userId4").value;
		if(i==""){
			alert("请选择第一审查人！");
		}else{
			var k="";
			if(j!=""){
				k=i+","+j;
			}else{
				k=i;
			}
			var other=document.getElementById("scother").value;
			window.location="../xzfy/setHandleUser.action?xzfyId=${xzfyId}&typeId=${typeId}&funcCode=${funcCode}&listkeyword=${listkeyword}&userId="+k+"&other="+other;
		}
	}


		
	</script>
	