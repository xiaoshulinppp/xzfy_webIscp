<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=7">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行政复议信息管理系统</title>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css">
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../webstyle/script/index/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/index/fun.js"></script>
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script>

<!--[if lte IE 6]>
<script src="../js/index/png.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div, ul, img, li, input , a');
    </script>
<![endif]--> 
</head>
<style type="text/css">img,form3,.form3{behavior: url(../webstyle/style/ie-css3.htc);} </style>
	<body>
<#include "../pages/website/header.ftl">


<div class="wal pageNow2">
      <div class="fl">当前位置：&nbsp;&nbsp;<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a> >&nbsp;&nbsp;  <a href="../xzfy/openReceive.action?funcCode=${funcCode}">接收/新增案件</a>  >&nbsp;&nbsp; 行政复议申请材料处理——阅卷</div>

</div>
<div class="wal">

      <div class="formTitle2">行政复议申请材料处理——阅卷</div>
      <div class="form3">

    <form id="createForm"  method="post">
	<input type="hidden" name="funcCode" value="${funcCode}" />
	
	<input type="hidden" name="meet.Meet_type" value="送达"/>
<input id="main_id" name="meet.main_id" value="${meet.main_id}" type="hidden">
	<input type="hidden" name="meet.Issafe" id="Issafe" value="0"/>
		<table width="98%" cellpadding="0" cellspacing="0" border="0">

<tr >
     <th  width="20%">接待日期：</th>
    <td  width="30%">
    ${meet.face_date?default('')}
      </td>
    
    <th  width="22%">接待地点：</th>
	    <td  width="28%">${meet.face_address?default('')}</td>
  </tr>
    <tr >
  	<th >第一接待人：</th>
    <td >${meet.admit1?default('')}   </td>
   <th >第二接待人：</th>
    <td >${meet.admit2?default('')}
   </td>   
    </tr>
  <tr>
    <th >接待人数：</th>
    <td >${meet.face_allnumber?default('')}</td>  
  </tr>	
<tr >
    <th  >被接待人：</th>
    <td  width="75%" colspan=3>
    <textarea textarea name="meet.Send_content" class="textarea" id="answerValue" type="text"  readonly id="text1">
${meet.client_content?default('')}  </textarea>
    </td>
 </tr>

  <tr >
    <th  width="25%">阅卷笔录内容</th>
    <td  width="75%" colspan=8>
     <textarea textarea name="meet.Send_content" class="textarea" id="answerValue" type="text"  readonly id="text1">
${meet.face_content?default('')}
    </textarea>
    </td>
  </tr>
			
		</table>
			
		
<br>
		<div class="btn">
		<div class="fl">
		<a href="javascript:gotoBack()">返 回</a>	

			

		</div>
		</div>		
		</form>
		
			
 </div>
            
     
	 </div>

<div class="h50"></div>
<!--walEnd-->
</div>
</div>
		<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>
	</body>
</html>
<script type="text/javascript">


	
	

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