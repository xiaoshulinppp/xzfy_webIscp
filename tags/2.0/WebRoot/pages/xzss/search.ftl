<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../plugs/kindeditor/kindeditor.js"></script>
		<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="../js/16B/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="../js/16B/tpl.base.js"></script>
		<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
	</head>
	<body>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
			<tr>
				<td>诉讼案件查询</td>
			</tr>
		</table>
		
		
		
		<form id="form1" name="form1" action="''" method="post" ENCTYPE="multipart/form-data">
		
		<input type="hidden" name="funcCode" value="${funcCode}" />
		<input type="hidden" name="panduanGL" value="${panduanGL}" />
	
	
		
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
		
			<tr class="trcolor">      
	     		<td class="tdFormText" width="25%" >收案日期：</td>
			    <td class="tdFormInput" width="25%" >
				    <input name="receive_date" type="text" class="inputTextNormal"  
				     value="" onClick="WdatePicker()" altname="收案日期" >
			    </td>
			    <td class="tdFormText">承办人</td>
				<td class="tdFormInput">
					<input type="text" name="undertaker_name" value="" class="inputTextNormal" />
				</td>
	  		</tr>
		
			<tr class="trwhite">
				<td class="tdFormText">复议承办人</td>
				<td class="tdFormInput">
					<input type="text" name="fyundertaker_name" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">原告姓名</td>
				<td class="tdFormInput">
					<input type="text" name="app_name" value="" class="inputTextNormal" />
				</td>
			</tr>
		
			<tr class="trwhite">
				<td class="tdFormText">原告总数</td>
				<td class="tdFormInput">
					<input type="text" name="app_num" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">原告类别</td>
				<td class="tdFormInput">
					<select name="app_type"  >
				      <option value="">----请选择----</option>
				      <option value="公民">公民</option>
				      <option value="法人或其他组织">法人或其他组织</option>
				    </select>
				</td>
			</tr>

			
			<tr class="trwhite">
				<td class="tdFormText">被告姓名</td>
				<td class="tdFormInput">
					<input type="text" name="defendant" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">代理人</td>
				<td class="tdFormInput">
					<input type="text" name="agent" value="" class="inputTextNormal" />
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">应诉机关类别</td>
				<td class="tdFormInput">
					<select name="jiguan_type"  >
				      <option value="">----请选择----</option>
				      <option value="原具体行政行为机关">原具体行政行为机关</option>
				      <option value="复议机关">复议机关</option>
				    </select>
				</td>
				<td class="tdFormText">应诉机关级别</td>
				<td class="tdFormInput">
					<select name="jiguan_level"  >
				      <option value="">----请选择----</option>
				      <option value="乡镇政府">乡镇政府</option>
				      <option value="县级政府">县级政府</option>
				      <option value="县级政府部门">县级政府部门</option>
				      <option value="省部级行政机关">省部级行政机关</option>
				      <option value="省部级部门">省部级部门</option>
				      <option value="其他">其他</option>
				      
				    </select>
				</td>
			</tr>
			<tr class="trwhite">	
				<td class="tdFormText">应诉机关</td>
				<td class="tdFormInput">
					<input type="text" name="jiguan" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">诉讼请求</td>
				<td class="tdFormInput">
					<input type="text" name="request" value="" class="inputTextNormal" />
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">行政管理类别</td>
				<td class="tdFormInput">
					<input type="text" name="manage_type" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">是否行政赔偿</td>
				<td class="tdFormInput">
					<input type="radio" name="ismoney" value="是"  />  是
					<input type="radio" name="ismoney" value="否"  />  否
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">被诉具体行政行为名称</td>
				<td class="tdFormInput">
					<input type="text" name="action_name" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">被诉具体行政行为案号</td>
				<td class="tdFormInput">
					<input type="text" name="action_id" value="" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">结案日期</td>
				<td class="tdFormInput">
					<input name="jieandate" type="text" class="inputTextNormal"  
				     value="" onClick="WdatePicker()"  >
				</td>
				<td class="tdFormText">是否复议</td>
				<td class="tdFormInput">
					
					<select name="fuyi_id"   id="sffyselect"  >
						<option value="">否</option>
						<option value="1">是</option>	
				   	</select>
				</td>
			</tr>
			
			
			
			<tr class="trwhite">
				
				<td class="tdFormText">是否一审</td>
				<td class="tdFormInput">
					
					<select name="shen1"   id="sf1sselect"  >
						<option value="">否</option>
						<option value="1">是</option>	
				   	</select>
				</td>
				<td class="tdFormText">是否二审</td>
				<td class="tdFormInput">
					
					<select name="shen2"   id="sf2sselect" >
						<option value="">否</option>
						<option value="1">是</option>	
				   	</select>
				</td>
			</tr>
			
		

			
	
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<input type="button" id="sunbt" class="button" value="查询" onclick="search();" />
					<input type="button" id="sunbt" class="button" value="重置" onclick="createXzss();" />					
				</td>
			</tr>
		</table>	
		</form>
		
	</body>
</html>


<script type="text/javascript">
	function search(){
		//alert(111)
		window.form1.action="dosearch.action?funcCode=${funcCode}";
		window.form1.submit();
		
	}
</script>