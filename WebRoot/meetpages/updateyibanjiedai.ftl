<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>当面申请行政复议</title>

<link href="../css/style_form.css" rel="stylesheet" type="text/css">

<SCRIPT src="../css/01/setday.js"></SCRIPT>
<script type="text/javascript" src="../js/16B/function.js"></script>
<script type="text/javascript" src="../js/16B/prototype.js"></script>
<script type="text/javascript" src="../js/16B/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../js/16B/jquery.form.js"></script> 
<script type="text/javascript" src="../js/16B/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="../js/calendar.js"></script>
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<#--
<script type="text/javascript" src="../js/effects.js"></script>
<script type="text/javascript" src="../js/validation_cn_utf-8.js"></script>
-->
<style>
.diva{
BORDER:#dcdcdc 1px solid;
height:22;
FILTER:progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr='#ddecfb',endColorStr='#ffffff');
PADDING-TOP: 3px; 
width:600px;
}
.divb{
BORDER: #dcdcdc 1px solid;
PADDING-TOP: 10px; 
PADDING-LEFT: 10px;
FONT-SIZE: 12px;
HEIGHT: 100px;
width:180;
border-top:0;
}
</style>


</head>
<#include "../website/header.ftl">

<body>
<form action="''" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">



<input type="hidden" name="sta" id="sta" value="11" />

<input type="hidden" name="funcCode" value="${funcCode}" />

   
<div class="z_wrap_info">
<h2 class="z_title">当面申请行政复议</h2>
<div class="z_info">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">


<tr >
     <th width="20%">接待日期：</th>
     <td width="30%">
    <input name="meet.Face_date" type="text"
     id="receivedate"  ischeck="y"
    onClick="WdatePicker()" altname="接待日期" value='${todate}'>
      </td>
    
    <th width="20%">接待地点：</th>
	    <td width="30%">
	    <input name="meet.Face_address" type="text" id="place" >
	    </td>
  </tr>
  

    <tr >
  	<th>接待人：</td>
    <td >
    <input name="xzfyInfo.admit1" id="meet.Admit1" type="text"  value="${admit_name}" ischeck="y"  altname="接待人">    
   </td>
   <th>第二接待人：</td>
    <td>
    <input name="xzfyInfo.admit2" id="meet.Admit2" type="text" value="庞雷" altname="第二接待人" readonly>    
   </td>   
    </tr>	

<tr >
    <th >被接待人：</th>
    <td  >
    <a href="javascript:setUser1('#userDiv')" style="display:block" id="userspan">添加</a>
    <textarea name="meet.Client_content" type="text" class="textarea"  id="user" ischeck="y" altname="被接待人" style="overflow-y:visible;"></textarea>
    </td>
    <th>接待人数：</th>
    <td><input name="meet.Face_allnumber" type="text"
     id="applicationsum" class="inputTextNormal required validate-digits" altname="接待人数" >
   </td>  
</tr>


<tr >
	<th>涉及安全：</th>
    <td  colspan=3>
        <input name="meet.Issafe" id="anquany_y"  value="是" onclick="setAqf(1)" type="radio" class="radio">&nbsp;&nbsp;是
        <input name="meet.Issafe" id="anquany_n"  value="否" onclick="setAqf(2)" type="radio" class="radio" checked>&nbsp;&nbsp;否
        <span id="aqspan"  style="display:none">
		  <a href="javascript:setAqf(1)">添加</a><br>
		  <textarea name="xzfyInfo.safeContent" type="text" class="textarea"  id="aqcontent" altname="安全隐患" style="overflow-y:visible;" onchange="textCounter(this.form.comment,1000);"></textarea>
		</span>
    </td>
</tr>
		<div class="btn">
		<div class="fl">
		<a href="javascript:saveApp()">提交</a>
		<a href="javascript:gotoBack()">返 回</a>	
		<a href="javascript:createApp()">生成接待笔录</a>
		<a href="javascript:createApp()">生成收据</a>	

		</div>
		</div>	
</table>

</div>
</div>



<div id="userDiv" style="position:absolute;display:none;" class="diva" >
<table width="90%">
<tr><td >
<a href="javascript:addUser()">继续添加</a></td>
<td align="right" width=100><a href="javascript:addUser:closeDiv1()">完成</a></td>
<td align="right" width=100><a href="javascript:closeDivById('userDiv')">关闭</a></td>
</tr>

</table>


<table  width="90%">
   <tr >
  	<td id="tuser">
  	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table" id="app">
<tr>
<th>被接待人：</th>
<td><input name="bjdr1" isUser="true" value=""/></td>
<th>性别：</th>
<td><select name="bsex" isUser="true" retSelect="1">
	<option value="男">男</option>
	<option value="女">女</option>
	</select></td>
</tr>
<tr>
<th>身份证号：</th>
<td><input name="bnum" isUser="true" value="" /></td>
<th>通信地址：</th>
<td><textarea name="baddress" type="text" isUser="true" ></textarea>
</td>	
</tr>
<tr>
	<th>
	邮编：
	</th>
	<td><input name="bpost" isUser="true" value="" />
	</td>
	<th>
	电话：
	</th>
	<td><input name="bphone" isUser="true" value='' />
	&nbsp;&nbsp;
	<input value="删除" type="button" class="button" onclick="deleteUser(this)">
	</td>
</tr>
</table>
<table  id="ins">
&nbsp;
</table>
</td></tr>
</table>
</div>



</form>
</body>

<script type="text/javascript">
	function saveApp(){
		if(confirm("确认提交？")){
			window.createForm.action="saveFace4.action";
		
			window.createForm.submit();
   alert("修改成功");
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
		var v2=answerValue.value.substring(pos,answerValue.length);
		if(pos==answerValue.value.length)
			answerValue.value=v1+"接待人询问：\n被接待人回答：";
		else
			answerValue.value=v1+"\n接待人询问：\n被接待人回答："+v2;
	 }else{
		answerValue.value="接待人询问：\n被接待人回答：";
	 }
 }

function createBILU(){
	
}
</script>
