<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行政复议信息管理系统</title>
<link href="../sys_theme/css/base.css" rel="stylesheet" type="text/css" />
<link href="../sys_theme/css/main_style.css" rel="stylesheet" type="text/css" />
<link href="../css/style_form.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>


<style type="text/css">img,formDiv,.formDiv{behavior: url(../webstyle/style/ie-css3.htc);} </style> 
</head>
	<body>


		
 <form name="form1" id="form1" action="" method="post">

 	<input type="hidden" name="message" id="message" value="" />
 	<input type="hidden" name="xzfyInfo.id" value="${tempid}" />
 	<input type="hidden" name="tempid" value="${tempid}" />
 	<input type="hidden" name="funcCode" value="${funcCode}" />
 	
 	<div class="ui-form fn-clear"><br/><br/>
    <table  id="" class="ui-table ui-table-form " width='60'>
   		
  		<#list smsReceiverList as user>
	  		<tr>
	  		<td>
	  			${user.getName()?default('')}:&nbsp;&nbsp;<input type="checkbox" name="receiverid"  value="${user.getId()?default('')}" />
	  			
	  		</td>
	  		</tr>
  		</#list>
  		
  		
  		

     </table><br/>
     <div align="center">
			  	<input type="button" value="保存短信" class="ui-btn ui-btn-normal" onclick="saveSms()" >
			  	<!--
				<input type="button" value="返 回" class="ui-btn ui-btn-normal" onclick="gotoBack()" >
				-->
				
       		</div><br/>
</from>
</div>	


		
	</body>
</html>
		
	
<script>
	var api = frameElement.api, W = api.opener, D = W.document; // api.opener 为载加lhgdialog.min.js文件的页面的window对象



	function saveSms(){
			//alert(111)
			document.getElementById("message").value=D.getElementById("message1").value;
			//alert(222)
			window.form1.action="saveSms.action";
			window.form1.submit();
	}

		
	</script>
	