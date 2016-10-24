<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>行政复议信息管理系统</title>
		<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
		<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../plugs/kindeditor/kindeditor.js"></script>
		<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="../js/16B/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="../js/16B/tpl.base.js"></script>
		<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
		<style type="text/css">img,formDiv,.formDiv{behavior: url(../webstyle/style/ie-css3.htc);} </style> 	
		<style type="text/css">img,z_wrap_info,.z_wrap_info{behavior: url(../css/ie-css3.htc);} </style> 
	</head>
	<body>
	
	
	
		<form id="createForm" action="../xzcj/saveNewApp.action" method="post" ENCTYPE="multipart/form-data">
			<input type="hidden" id="protype" name="protype" value="${protype}">
			<input type="hidden" name="xzfyId" value="${xzfyId}" />
			<input type="hidden" name="textId" value="${textId}" />
			<input type="hidden" name="countId" value="${countId}">
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="xzfyApp.proxytype" value="1" />
		
	<div class="formDiv" id="banan" >	
		<table width="100%" border="0" align="center" cellpadding="10" cellspacing="0">
		
			<tr>      
	     		<th width="20%" >申请人</th>
			    <td width="30%" >
					<input type="text" name="xzfyApp.app_name" value="" class="inputTextNormal" />
			    </td>
			    <th width="20%">代表人</th>
				<td width="30%">
					<input type="text" name="xzfyApp.deputyName" value="" class="inputTextNormal" />
				</td>
	  		</tr>
			<tr>      
	     		<th width="20%" >代表人类别</th>
			    <td width="30%" >
				    <input type="text" name="xzfyApp.deputyType" value="" class="inputTextNormal" />
			    </td>
			    <th width="20%">住所地</th>
				<td width="30%">
					<input type="text" name="xzfyApp.mail_address" value="" class="inputTextNormal" />
	  		</tr>
			<tr>      
	     		<th width="20%" >邮政编码</th>
			    <td width="30%" >
				    <input type="text" name="xzfyApp.postcode" value="" class="inputTextNormal" />
			    </td>
			    <th width="20%">电话号码</th>
				<td width="30%">
					<input type="text" name="xzfyApp.mobile" value="" class="inputTextNormal" />
	  		</tr>
			<tr>      
	     		<th width="20%" >其他情形</th>
			    <td width="30%" >
				    <input type="text" name="xzfyApp.otherType" value="" class="inputTextNormal" />
			    </td>
			    <th width="20%"> </th>
				<td width="30%">
					 
	  		</tr>
			

	
		</table>
		<br/>
			<div align="center" class="btnDiv" style="padding-left:300px">
                <input type="button" id="sunbt" class="btn1" value="提 交" onclick="createApp();" />
					<input type="button" class="btn1" value="返 回" onclick="gotoBack();" />
            </div>
        <br/> 
                 
		
	</div>
	</form>

	</body>
</html>


<script type="text/javascript">
	function createApp(){
		if(confirm("确认提交？")){
			window.document.getElementById("sunbt").disabled=true;;
			window.document.getElementById("createForm").submit();
		}
	}
	
	function gotoBack(){
		window.history.back();
	}
</script>




