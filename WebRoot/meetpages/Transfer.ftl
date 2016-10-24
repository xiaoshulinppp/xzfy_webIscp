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
	<#include "../pages/website/header.ftl">
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
			<tr>
				<td>添加</td>
			</tr>
		</table>
	<form id="createForm" action="../meet/saveFace1" method="post" >
		<input type="hidden" name="meet.Main_id" value="${Main_id}" />
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
			<tr class="trcolor">
    			<td class="tdFormText" width="25%">接待日期</td>
    			<td class="tdFormInput" width="25%">
    			<input name="meet.Face_date" type="text"
    			class="inputTextNormal"  value="${todate}"
    			onClick="WdatePicker()" altname="接待时间" >
      			</td>
				<td class="tdFormText">接待地点</td>
				<td class="tdFormInput" >
				<input type="text" name="meet.Face_address" value="" class="inputTextNormal" />
			    </td>
  			</tr>
			<tr class="trwhite">
				<td class="tdFormText">第一接待人</td>
				<td class="tdFormInput">
					<input type="text" name="meet.Admit1" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">第二接待人</td>
				<td class="tdFormInput">
					<input type="text" name="meet.Admit2" value="" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">接待人数</td>
				<td class="tdFormInput">
					<input type="text" name="meet.Face_allnumber" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">涉及安全</td>
				<td class="tdFormInput">
					<select name="meet.Issafe"  >
					<option value="1" >是</option>
					<option value="2" >否</option>
					</select>


				</td>
			</tr>
			<td class="tdFormText">被接待人</td>
    		<td class="tdFormInput" colspan=3>
     <a href="javascript:opendg('../meet/addApp1.action?Main_id=${Main_id}&funcCode=${funcCode}&protype=0&textId=user&countId=applicationsum',900,600)"  style="display:block" id="addjd">添加</a>
    			<textarea name="app_face.shenqingren" type="text" class="textarea" id="shenqingren" ischeck="y" altname="申请人" ></textarea>
    		</td>
   			</tr>
 <tr class="trcolor">
	 <td  class="tdFormText">送达笔录内容：<br>(鼠标双击添加对话)</td>
	 <td class="tdFormInput" colspan=3>
	  <textarea name="meet.Transfer_content" style="overflow-y:visible;" rows="10" id="answerValue" type="text" class='textarea' ondblclick="getValue(this)">
接待人询问：请问被接待人今天前来何事
被接待人询问：我们今天提交的下列材料，请转交有关工作人员：



</td>
	 </tr>
			<input type="hidden" id="protype" name="protype" value="${protype}">
			
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<input type="button" id="sunbt" class="button" value="提 交" onclick="createApp();" />
					<input type="button" class="button" value="返 回" onclick="gotoBack();" />
					<input type="button" id="sunbt" class="button" value="生成接待笔录" onclick="createApp();" />
				</td>
			</tr>

			<input type="hidden" name="Meet.Main_id" value="${Main_id}"/>
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
			window.createForm.action="saveFace1.action";
		
			window.createForm.submit();
				window.open("http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20130725154319&d_username=panglei&caseId=1");
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
 function getPosition1(obj){
  //alert(obj.tagName);
  var result = 0;
  if(obj.selectionStart){ //非IE浏览器
   result = obj.selectionStart
  }else{ //IE
   var rng;
   if(obj.tagName == "TEXTAREA"){ //如果是文本域
    rng = event.srcElement.createTextRange();
    rng.moveToPoint(event.x,event.y);
   }else{ //输入框
    rng = document.selection.createRange();
   }
   rng.moveStart("character",-event.srcElement.value.length);
   result = rng.text.length;
  }
  return result;
 }
 function getValue(obj){
     var pos = getPosition1(obj);
	 var answerValue=document.getElementById("answerValue");
	 if(answerValue.value.length>0){
		var v1=answerValue.value.substring(0,pos);
		int c=1；
		var v2=answerValue.value.substring(pos,answerValue.length);
		if(pos==answerValue.value.length)
			answerValue.value=v1+"材料+c+：名称 复印件 页数 份数；";
		else
			answerValue.value=v1+"材料+c+：名称 复印件 页数 份数；"+v2;
	 }else{
		answerValue.value="材料+c+：名称 复印件 页数 份数；";
	 }
 }

function createBILU(){
	window.open("http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20130725154319&d_username=panglei&caseId=1");
}
</script>