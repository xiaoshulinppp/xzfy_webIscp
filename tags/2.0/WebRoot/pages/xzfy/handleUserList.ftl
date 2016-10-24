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
<span class="x-line fn-clear"><img src="../${Session['_USER_STYLE_'].imagePath}/pic_search_line.png"/></span><!--我是有箭头灰色的分割线-->
			
			<input type="hidden" name="funcCode" value="${funcCode}" />
<!--列表开始-->
 <div class="ui-list-nobtnbar fn-clear " id="bzTable">
    <table  id="" class="ui-table ui-table-form " width='60'>
  
           <tbody class="discolor">
           <#list userList as userList>
			<tr>
			<td class="fn-text-right">${userList.getName()}</td>
			<td class="fn-text-left"><input type='radio' name="username" id="username" onclick="setUser('${userList.getId()}')"></td>
</tr>
</#list>
     </tbody>
     </table>
</div>	


		
	</body>
</html>
		
	
	<script>
	var api = frameElement.api, W = api.opener, D = W.document; // api.opener 为载加lhgdialog.min.js文件的页面的window对象
	
	function setUser(userId){
		if(confirm("您确认要转办案件吗？")){
			window.location="../xzfy/setHandleUser.action?xzfyId=${xzfyId}&typeId=${typeId}&funcCode=${funcCode}&userId="+userId;
		}
	
	}

		
	</script>
	