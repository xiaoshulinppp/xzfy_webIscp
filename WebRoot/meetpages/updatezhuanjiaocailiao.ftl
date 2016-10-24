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
      <div class="fl">当前位置：&nbsp;&nbsp;<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a> >&nbsp;&nbsp;  <a href="../xzfy/openReceive.action?funcCode=${funcCode}">接收/新增案件</a>  >&nbsp;&nbsp; 行政复议申请材料处理——转交材料</div>

</div>

<div class="wal">

      <div class="formTitle2">行政复议申请材料处理——转交材料</div>
      
      <div class="form3">

    <form id="createForm"  method="post">
	<input type="hidden" name="funcCode" value="${funcCode}" />
	<input type="hidden" name="mainidd" value="${mainidd}"/>
	<input type="hidden" name="meet.Issafe" id="Issafe" value="0"/>
	<input type="hidden" name="meet.Meet_type" value="转交材料"/>
	<input type="hidden" name="meet.Law_id" value="${xzfyInfo.id}"/>
	<input type="hidden" name="meet.admit1id" value="${admitid}"/>
		<table width="98%" cellpadding="0" cellspacing="0" border="0">

			<tr >
    			<th width="25%">接待日期</th>
    			<td width="25%">
				<input type="text"  id="Face_date"  name="meet.Face_date" value="${todate?default('')[0..9]}"  onClick="WdatePicker()" class="inputTextNormal" />
      			</td>
				<th width="25%">接待地点</th>
				<td width="25%">
				<input type="text" name="meet.Face_address" value="${xzfyCom.fullNameRect?default('')}" class="inputTextNormal" />
			    </td>
  			</tr>
			<tr >
				<th width="25%" >第一接待人</th>
				<td width="25%">
					<input type="text" name="meet.Admit1" value="${admit_name}"  class="inputTextNormal"/>
				</td>
				<th width="25%" >第二接待人</th>
				<td width="25%">
					<input type="text" name="meet.Admit2" value=""   class="inputTextNormal"/>
				</td>
			</tr>
			<tr >
				<th width="25%" >被接待人数</th>
				<td width="25%">
					<input type="text" name="meet.Face_allnumber" id="rencount" onchange="countNum('rencount')" name="meet.Face_allnumber" value="0" />
				</td>
				<th width="25%" >&nbsp;</th>
				<td width="25%">&nbsp;
					<!--<input type="text" name="meet.Issafe" value="${xzfyInfo.issafe?default('')}" class="inputTextNormal" />-->
				</td>
			</tr>
			<th width="25%" >被接待人</th>
    		<td  width="25%" colspan=3>
    			<textarea name="meet.Client_content" type="text"   class="textarea">${xzfyInfo.appdetail?default('')}</textarea>
    		</td>
   			</tr>
 <tr >
	 <th width="25%" >转交材料笔录内容：<br>(鼠标双击添加对话)</th>
	 <td width="25%" colspan=3>
	  <textarea name="meet.Transfer_content" class="textarea" id="answerValue" type="text"  ondblclick="getValue(this)">
接待人提问：请问被接待人今天前来何事？
被接待人回答：我们今天提交的下列材料，请转交有关工作人员：
材料1：               （原件）  （页） （份）
接待人回答：我们将及时转交。
</textarea>
</td>
	 </tr>
			
		</table>
   <script>

   
function countNum(idValue){
	var mem_value = document.getElementById(idValue).value;
	for(var i=0; i<mem_value.length; i++)
	{
	if(mem_value.charAt(i)<'0' || mem_value.charAt(i)>'9')
	{
	alert("请输入数字");
	document.getElementById(idValue).value="";
	return false;
	}
	}

}
   </script>	
<br>
		<div class="btn">
		<div class="fl">
		<a href="javascript:saveApp()">提交</a>
		<a href="javascript:gotoBack()">返 回</a>	
		<a href="javascript:createApp()">生成接待笔录</a>
		

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

	function saveApp(){
		if(document.getElementById('rencount').value==''){
			alert("请填写接待人数");
			return;
		}
		if(document.getElementById('Face_date').value==''){
			alert("请填写接待日期");
			return;
		}	
		if(confirm("确认提交？")){
			document.getElementById('Issafe').value=1
			window.createForm.action="saveFace3.action";
		
			window.createForm.submit();
			
		}
	
	}


	function createApp(){
		document.getElementById('Issafe').value=0;
		var options = {
			url:'saveFace1.action', //提交给哪个执行 
			type:'POST',
			success: callbackfun2 //显示操作提示 
		};
		$('#createForm').ajaxSubmit(options);
		return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 		
	}
	
	function callbackfun2(){
		var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${mainidd}&mstype=zhuanjiaocailiaobilu";
		window.open(url,'mainwindow','location=no,resizable=yes');
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