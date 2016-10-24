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
				<td>添加</td>
			</tr>
		</table>
		<form id="createForm" action="../meet/appFYfaceInsert1" method="post" >
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
			<tr class="trcolor">
			   	<td class="tdFormText">接待日期</td>
	   			<td class="tdFormInput">
	   				<input name="Meet.Face_date" type="text" id="place" class="inputTextNormal"  title="请输入正确的姓名，格式在50个汉字以内">
	   			</td>
    			<td class="tdFormText" width="25%">接待时间</td>
    			<td class="tdFormInput" width="25%">
    			<input name="Meet.Face_time" type="text"
    			class="inputTextNormal"  value="${todate}"
    			onClick="WdatePicker()" altname="接待时间" >
      			</td>
  			</tr>
			<tr class="trwhite">
				<td class="tdFormText">第一接待人</td>
				<td class="tdFormInput">
					<input type="text" name="Meet.Admit1" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">第二接待人</td>
				<td class="tdFormInput">
					<input type="text" name="Meet.Admit1" value="" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">接待地点</td>
				<td class="tdFormInput" colspan=3>
				<input type="text" name="Client.Client_address" value="" class="textarea" />
			    </td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">接待人数</td>
				<td class="tdFormInput">
					<input type="text" name="Meet.Face_allnumber" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">涉及安全</td>
				<td class="tdFormInput">
					<select name="Meet.Issafe">
					<option value="1" >是</option>
					<option value="2" >否</option>
					</select>
				</td>
			</tr>
			<td class="tdFormText">被接待人</td>
    		<td class="tdFormInput" colspan=3>
    			<a href="javascript:opendg('../meet/addApp1.action?Main_id=${Main_id}&funcCode=${funcCode}&protype=1&textId=shenqingren&countId=rencount',900,600)"  style="display:block" id="appspan1">添加</a>
    			<a href="javascript:opendg('../meet/addLegal1.action?Main_id=${Main_id}&funcCode=${funcCode}&protype=2&textId=shenqingren&countId=rencount',900,600)"  style="display:none" id="appspan2">添加</a>
    			<textarea name="app_face.shenqingren" type="text" class="textarea" id="shenqingren" ischeck="y" altname="申请人" ></textarea>
    		</td>
   			</tr>
 <tr class="trcolor">
 <td class="tdFormText">接待内容：<br>(鼠标双击添加对话)</td>
    <td class="tdFormInput" colspan=3>
        <textarea name="Meet.Face_content" id="otheradvice" class="textarea" style="overflow-y:visible;" altname="意见" ondblclick="getValue1(this)"></textarea>
    </td>
 </tr>
			<input type="hidden" id="protype" name="protype" value="${protype}">
			
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<input type="button" id="sunbt" class="button" value="提 交" onclick="createApp();" />
					<input type="button" class="button" value="返 回" onclick="gotoBack();" />
				</td>
			</tr>

			<input type="hidden" name="Main_id" value="${Main_id}"/>
			<input type="hidden" name="textId" <#if textId ?has_content>value="${textId}"</#if>>
			<input type="hidden" name="countId"<#if countId ?has_content>value="${countId}"</#if>>
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="Client.proxytype" value="1" />
		</form>
		</table>
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
		function opendg(dgurl,dgw,dgh)
{
  $.dialog({ 
    title:'申请人管理',
    width: dgw,
    height: dgh,
    content:'url:'+ dgurl});
}

function checksqr(){
	if(document.getElementById("applicationtype").value==1){
		document.getElementById("appspan1").style.display="block"
		document.getElementById("appspan2").style.display="none"
	}else{
		document.getElementById("appspan2").style.display="block"
		document.getElementById("appspan1").style.display="none"		
	}
}
</script>