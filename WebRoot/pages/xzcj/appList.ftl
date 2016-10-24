<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=7">
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
<!--[if lte IE 6]>
<script src="script/png.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div, ul, img, li, input , a');
    </script>
<![endif]--> 
</head>
	<body>

	<form name="appForm" id="appForm" action="createApp.action" method="post">
		<input type="hidden" name="isView" value="${isView}" />
		<input type="hidden" name="xzcjId" value="${xzcjId}" />
		<input type="hidden" name="funcCode" value="${funcCode}">
		<input type="hidden" id="appId" name="appId" value="">
		<input type="hidden" id="protype" name="protype" value="${protype}">
		<input type="hidden" id="textId" name="textId" value="${textId}">
		<input type="hidden" id="countId" name="countId" value="${countId}">
		<input id="sendValue" name="sendValue" type="hidden" <#if sendValue?has_content> value="${sendValue}" </#if>>
	
	<div class="pageBg1">
<div class="wal">
<#if isView==1>
      <div id="searchForm">
      <div class="pageBox">
            <div class="searchForm">
           
                  <span class="clear_f"></span>
                  <div class="btnDiv">
                      <input type="button" name="button" class="btn1" value="新增" onclick="gotoCreateApp()" />
                           
                  </div>
            </div>
      </div>
      <div class="pageBoxBg"></div>
      </div>
</#if>
		

		
      <div class="pageBox">
            <div class="searchList">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">


					<tr>  
					<th>姓名</th>
					<th>身份证号码</th>
					<th>性别</th>
					<th>通邮地址</th>
					<th>邮政编码</th>
					<th>电话号码</th>
					<th>操作</th>
					</tr>
					<#assign index = 1>
					<#list appList as xzcjApp>
					<tr>
					
						<td>&nbsp;<#if xzcjApp.app_name?has_content>${xzcjApp.app_name}</#if></td>
						<td>&nbsp;<#if xzcjApp.app_id?has_content>${xzcjApp.app_id}</#if></td>
						<td>&nbsp;
							<#if xzcjApp.sexy?has_content>
							<#if xzcjApp.sexy=='1'>
								男
							<#else>
								女
							</#if>
							</#if>
						</td>
						<td>&nbsp;<#if xzcjApp.mail_address?has_content>${xzcjApp.mail_address}</#if></td>
						<td>&nbsp;<#if xzcjApp.mobile?has_content>${xzcjApp.mobile}</#if></td>
						<td>&nbsp;<#if xzcjApp.postcode?has_content>${xzcjApp.postcode}</#if></td>
						<td>
							<#if isView==1>
							<a href="javascript:updateApp('${xzcjApp.id}')">修改</a>&nbsp;
							<a href="javascript:deleteApp('${xzcjApp.id}')">删除</a>
							<#elseif isView==0>
							<a href="javascript:updateApp('${xzcjApp.id}')">查看</a>&nbsp;
							</#if>
						</td>
						
					</tr>
					<#assign index = index + 1>
					</#list>
			
		</table>
		          
            </div>
      </div>
      <div class="pageBoxBg"></div>
</div>
</div>
	</form>
</body>
</html>
		
	
	<script>
	var api = frameElement.api, W = api.opener, D = W.document; // api.opener 为载加lhgdialog.min.js文件的页面的window对象
	var tObj = D.getElementById('${textId}'); // 通过数据共享的方法获取调用页面文本框对象
	var countObj=D.getElementById('${countId}');
	tObj.value = document.getElementById('sendValue').value;
	//countObj.value=;
		function gotoCreateApp(){
			document.appForm.submit();
		}
		
		function deleteApp(id){
			if(confirm("您确认要删除吗？")){
				document.getElementById("appId").value=id;
				document.appForm.action="deleteApp.action";
				document.appForm.submit();
			}
		}
		
		function updateApp(id){
				document.getElementById("appId").value=id;
				document.appForm.action="updateApp.action";
				document.appForm.submit();
		}
	</script>
	