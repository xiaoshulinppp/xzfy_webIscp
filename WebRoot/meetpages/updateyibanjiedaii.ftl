<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript">
/*****************身份证阅读器读取js代码*************************/
	function HideActiveX() {
	   //CVR_IDCard.Visible=false; 
	   ClearIDCard();
//	   ClearForm(); 
//	   document.all['ReadResult'].value ="等待验证";
	   document.getElementById("ReadResult").innerHTML ="<font color='orange'>等待读取身份证信息...</font>";
//	   $('#ReadResult').text('等待验证');
//	   return true;
	}

	function ClearIDCard() {
	   CVR_IDCard.Name="";
	   CVR_IDCard.NameL="";
	   CVR_IDCard.Sex="";   
	   //CVR_IDCard.SexL="";   
	   CVR_IDCard.Nation="";
	   //CVR_IDCard.NationL="";
	   CVR_IDCard.Born="";
	   //CVR_IDCard.BornL="";
	   CVR_IDCard.Address="";
	   CVR_IDCard.CardNo="";
	   CVR_IDCard.Police="";
	   CVR_IDCard.Activity="";
	   CVR_IDCard.NewAddr="";
	  
//	   return true;
	}

	function ClearForm() {
	   document.all['bjdr1'].value = ""; 
	   document.all['bsex'].value = ""; 
//	   document.all['Nation'].value = ""; 
//	   document.all['Born'].value = ""; 
//	   document.all['Address'].value = ""; 
	   document.all['bnum'].value = ""; 
	   document.all['baddress'].value = "";
	   
//	   document.all['Police'].value = ""; 
//	   document.all['Activity'].value = ""; 
//	   document.all['NewAddr'].value = "";    
//	   document.all['ActivityLFrom'].value = ""; 
//	   document.all['ActivityLTo'].value = ""; 
//	   document.all['PhotoBuffer'].value = ""; 
	      
//	   return true;
	}

	function FillForm() {
	  var pName=CVR_IDCard.Name; //var pNameL=CVR_IDCard.NameL;
	  
	  var pSex=CVR_IDCard.Sex;   //var pSexL=CVR_IDCard.SexL;

	  var pAddress=CVR_IDCard.Address;	  
	  
	  var pCardNo=CVR_IDCard.CardNo;

//	  document.all['bjdr1'].value = pName;  //document.all['Name'].value = pNameL;
	  document.getElementById(idArray[0]).value = pName;
	  
//	  document.all['bsex'].value = pSex;    // document.all['Sex'].value = pSexL; 
	  document.getElementById(idArray[2]).value = pSex;

//	  document.all['baddress'].value = pAddress; 
	  document.getElementById(idArray[3]).value = pAddress;
	  
//	  document.all['bnum'].value = pCardNo; 
	  document.getElementById(idArray[1]).value = pCardNo;

	  
	  //显示照片Servlet

//	  return true;
	}

	function ReadIDCard() {   
//	   CVR_IDCard.PhotoPath=document.all['PhotoPath'].value;
//	   CVR_IDCard.TimeOut=5;
	   ClearIDCard(); 
//	   ClearForm(); 
//	   document.all['ReadResult'].value ="请在5s时间内扫描身份证信息...";
//	   document.getElementById("ReadResult").innerHTML ="<font color='red'>请在5s时间内扫描身份证信息...</font>";
	   	  
	   strReadResult=CVR_IDCard.ReadCard(); 	  
	   
	   if(strReadResult=='卡认证失败，无卡或卡片已读过。'){			   
//		   document.all['ReadResult'].value ="<font color='red'>身份证阅读器未成功连接，请检查！</font>";
		   document.getElementById("ReadResult").innerHTML ="<font color='red'>读卡失败，请重新读取！</font>";
		   return;
	   }	   
	   else{
	   	   if(i==0 && flagOfFirstPerson==1){
	   	   		i++;
	   	   }
	   	   else{
	   	   		addUserSpecial();
	   	   }
	   	   document.getElementById("ReadResult").innerHTML ="<font color='green'>身份证信息读取成功！</font>";
	   }

	   FillForm();  

//	   document.all['ReadResult'].value ="返回值:"+strReadResult;
	   //alert(strReadResult);  
	   

//	   return true;
	}

	function DoStopRead() {
	   CVR_IDCard.DoStopRead; 
	   ClearIDCard(); 
//	   ClearForm();
//	   document.all['ReadResult'].value ="用户已取消读卡。";
	   document.getElementById("ReadResult").innerHTML ="<font color='orange'>用户已取消读卡。</font>";
	   
	   document.getElementById("ReadResult2").innerHTML ="<font color='orange'>用户已取消读卡。</font>";
//	   return true;
	}	

	function DoCheckReader() {
	   var State=CVR_IDCard.GetState; 
	   if(State==0){
//		   document.all['ReadResult'].value ="身份证阅读器连接测试成功！";
		   document.getElementById("ReadResult").innerHTML ="<font color='green'>身份证阅读器连接测试成功！</font>"; 
		   document.getElementById("ReadResult2").innerHTML ="<font color='green'>身份证阅读器连接测试成功！</font>"; 
		   return;
	   }
	   else{
//		   document.all['ReadResult'].value ="身份证阅读器连接测试失败！请检查是否已连接！";
		   document.getElementById("ReadResult").innerHTML ="<font color='red'>身份证阅读器连接测试失败！请检查是否已连接！</font>"; 
		   document.getElementById("ReadResult2").innerHTML ="<font color='red'>身份证阅读器连接测试失败！请检查是否已连接！</font>"; 
		   return;
	   }		   		   
	   
//	   return true;
	}

	function Save_IDCard() {   
	  var pName=CVR_IDCard.Name; 
	  var pSex=CVR_IDCard.Sex;
	  var pNation=CVR_IDCard.Nation;
	  var pBorn=CVR_IDCard.Born;
	  var pAddress=CVR_IDCard.Address;
	  var pCardNo=CVR_IDCard.CardNo;
	  var pPolice=CVR_IDCard.Police;
	  var pActivity=CVR_IDCard.Activity;
	  var pNewAddr=CVR_IDCard.NewAddr;
	  var pActivityLFrom=CVR_IDCard.ActivityLFrom; 
	  var pActivityLTo=CVR_IDCard.ActivityLTo; 
	  var pPhotoBuffer=CVR_IDCard.GetPhotoBuffer; 

	  if (pName == "") {    
	      ClearForm();
	      alert('读卡内容为空，无法保存数据！请先读卡，再保存。'); 
	      return false;
	  }
	  document.all['Name'].value = pName; 
	  document.all['Sex'].value = pSex; 
	  document.all['Nation'].value = pNation; 
	  document.all['Born'].value = pBorn; 
	  document.all['Address'].value = pAddress; 
	  document.all['CardNo'].value = pCardNo; 
	  document.all['Police'].value = pPolice;  
	  document.all['Activity'].value = pActivity; 
	  document.all['NewAddr'].value = pNewAddr;
	  document.all['ActivityLFrom'].value = pActivityLFrom; 
	  document.all['ActivityLTo'].value = pActivityLTo; 
	  document.all['PhotoBuffer'].value = pPhotoBuffer; 

	  //相片文件默认保存在 CVR_IDCard.PhotoPath

	  ClearIDCard(); 
	  return true;
	}

	/********************************/
	var idArray = new Array();
	var i = 0;//按顺序赋id
	var flagOfFirstPerson=1;//判断第一个身份证姓名是否为空（默认）

	function addUserSpecial(){
		var ob1=document.getElementById("app");
		var ins=document.getElementById("ins");
		var tuser=document.getElementById("tuser");
		ob1=ob1.cloneNode(true);
		
		/*****	
		var name=ob1.getElementByName("bjdr1");
		name.id=i++;//姓名
		idArray[0]= i-1;
		
		var sex=ob1.getElementByName("bsex");
		sex.id=i++;//性别
		idArray[1]= i-1;
		
		var IdCardNum=ob1.getElementByName("bnum");
		IdCardNum.id=i++;//身份证号
		idArray[2]= i-1;
		
		var addressItem=ob1.getElementByName("baddress");
		addressItem.id=i++;//住址
		idArray[3]= i-1;
		****/
		
		var handleList=ob1.getElementsByTagName("input");
		handleList.item(0).value="";
		handleList.item(0).id=i++;//姓名
		idArray[0]= i-1;
		
		handleList.item(1).value="";
		handleList.item(1).id=i++;//身份证号
		idArray[1]= i-1;
		
		handleList.item(2).value="";
		handleList.item(3).value="";
		
		var handleList1=ob1.getElementsByTagName("select");
		handleList1.item(0).value="";
		handleList1.item(0).id=i++;//性别
		idArray[2]= i-1;
		
		var handleList2=ob1.getElementsByTagName("textarea");
		handleList2.item(0).value="";
		handleList2.item(0).id=i++;//住址
		idArray[3]= i-1;
		
		tuser.insertBefore(ob1,ins);
	}
	
	//读取身份证操作，若为第一次，则仅仅读取身份证信息，否则新增信息块的同时读取身份证信息
	function readIdCardAddedToOperation(){		
		if(i==0 && (document.getElementById("app").getElementsByTagName("input").item(0).value == null||document.getElementById("app").getElementsByTagName("input").item(0).value == "")){						
			idArray[0]=-1;
			idArray[1]=-2;
			idArray[2]=-3;
			idArray[3]=-4;
			document.getElementById("app").getElementsByTagName("input").item(0).id="-1";
			document.getElementById("app").getElementsByTagName("input").item(1).id="-2";
			document.getElementById("app").getElementsByTagName("select").item(0).id="-3";
			document.getElementById("app").getElementsByTagName("textarea").item(0).id="-4";
			
			ReadIDCard();
		}
		else{
			if((document.getElementById("app").getElementsByTagName("input").item(0).value != null && document.getElementById("app").getElementsByTagName("input").item(0).value != "")){
				flagOfFirstPerson = 0;
			}
			ReadIDCard();
		}
	}
	
	function addUserManually(){
	    i++;
		var ob1=document.getElementById("app");
		var ins=document.getElementById("ins");
		var tuser=document.getElementById("tuser");
		ob1=ob1.cloneNode(true);
		var handleList=ob1.getElementsByTagName("input");
		handleList.item(0).value="";
		handleList.item(1).value="";
		handleList.item(2).value="";
		handleList.item(3).value="";
		
		var handleList1=ob1.getElementsByTagName("select");
		handleList1.item(0).value="";
		
		var handleList2=ob1.getElementsByTagName("textarea");
		handleList2.item(0).value="";
		
		tuser.insertBefore(ob1,ins);
	}
/****************************end***************************/
</script>
<meta http-equiv="X-UA-Compatible" content="IE=7">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行政复议信息管理系统</title>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css">
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="../webstyle/script/index/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/index/fun.js"></script>
<script type="text/javascript" src="../js/16B/function1.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 

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
<!--[if lte IE 6]>
<script src="../js/index/png.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div, ul, img, li, input , a');
    </script>
<![endif]--> 
</head>
<style type="text/css">img,form3,.form3{behavior: url(../webstyle/style/ie-css3.htc);} </style>
	<body>
<style type="text/css">img,form3,.form3{behavior: url(../webstyle/style/ie-css3.htc);} </style>
	<body onload="HideActiveX()">
	<#include "../pages/website/header.ftl">
<#--第一步：加载CAB包OCX控件-->
<OBJECT classid="clsid:10946843-7507-44FE-ACE8-2B3483D179B7"
	  id="CVR_IDCard" name="CVR_IDCard" width="0" height="0" >
</OBJECT>
<#--end-->
<div class="wal pageNow2">
      <div class="fl">当前位置：&nbsp;&nbsp;<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a> >&nbsp;&nbsp;  <a href="../xzfy/openReceive.action?funcCode=${funcCode}">接收/新增案件</a>  >&nbsp;&nbsp; 行政复议申请材料处理——一般接待</div>

</div>
<div class="wal">

      <div class="formTitle2">行政复议申请一般接待</div>
      <div class="form3">

    <form id="createForm"  method="post">
	<input type="hidden" name="funcCode" value="${funcCode}" />
	<input type="hidden" name="todate" value="${todate}" />
	<input type="hidden" name="admit_name" value="${admit_name}"/>
	<input type="hidden" name="mainidd" value="${mainidd}"/>
	<input type="hidden" name="meet.Issafe" id="Issafe" value="0"/>
	<input type="hidden" name="meet.admit1id" value="${admitid}"/>
	<input type="hidden" name="meet.Meet_type" value="一般接待"/>

		<table width="98%" cellpadding="0" cellspacing="0" border="0">

			<tr >
    			<th width="15%">接待日期</th>
    			<td width="35%">
    			<input name="meet.Face_date" type="text" class="input2"
    			 value="${todate[0..9]}" id="Face_date"
    			onClick="WdatePicker()" altname="接待时间" >
      			</td>
				<th width="15%">接待地点</th>
				<td width="35%">
				<input type="text" name="meet.Face_address"  class="input2" value="${xzfyCom.fullNameRect?default('')}"/>
			    </td>
  			</tr>
			<tr >
				<th width="25%" >第一接待人</th>
				<td width="25%">
					<input type="text" name="meet.Admit1" value="${admit_name}"  class="input2"/>
				</td>
				<th width="25%" >第二接待人</th>
				<td width="25%">
					<input type="text" name="meet.Admit2"   class="input2" value=""/>
				</td>
			</tr>
			<!--
			<tr >
				<th width="25%" >涉及安全</th>
				<td width="25%">
					<select name="meet.Issafe"  >
					<option value="1" >是</option>
					<option value="2" >否</option>
					</select>
				</td>
			</tr>
			-->
<tr >
    <th >被接待人：</th>
    <td  >
    <a href="javascript:setUser1('#userDiv')" style="display:block" id="userspan">添加</a>
    <textarea name="meet.Client_content" type="text" class="textarea"  id="user" ischeck="y" altname="被接待人" style="overflow-y:visible;"></textarea>
    </td>
    <th>被接待人数：</th>
    <td><input name="meet.Face_allnumber" type="text" onchange="countNum('applicationsum')"
     id="applicationsum"  altname="接待人数" >
   </td>  
</tr>
 <tr >
	 <th width="25%" >一般接待笔录内容：<br>(鼠标双击添加对话)</th>
	 <td width="25%" colspan=8>
	  <textarea name="meet.title" class="textarea" id="answerValue" type="text"  ondblclick="getValue(this)">
接待人询问：
被接待人回答：
</textarea>
</td>
</tr>
			
		</table>
		
<br>
		<div class="btn">
		<div class="fl">
		<a href="javascript:saveApp()">提交</a>
		<a href="javascript:gotoBack()">返 回</a>	
		<a href="javascript:createApp()">生成接待笔录</a>

		</div>
		</div>	

		
		
<div id="userDiv" style="position:absolute;display:none;" class="formDiv" >
<table width="90%">
<tr><td >
		<#if localBm == '0000'>
		<a href="javascript:addUserManually()" title="点击手动继续添加"  >继续添加</a>	
		<#else>
		<a href="javascript:addUser()" title="点击继续添加"  >继续添加</a>
		</#if></td>
		
	<#if localBm == '0000'>						
		<td align="right" width=100><a href="javascript:readIdCardAddedToOperation()" title="点击开始读取身份证信息"  >读身份证</a></td>
	</#if>
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
<#if localBm == '0000'>
<th>性别：</th>
<td><select name="bsex" isUser="true" retSelect="1">
	<option value=""></option>
	<option value="男">男</option>
	<option value="女">女</option>
	</select></td>
<#else>
<th>性别：</th>
<td><select name="bsex" isUser="true" retSelect="1">
	<option value="男">男</option>
	<option value="女">女</option>
	</select></td>
</#if>
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
		<#if localBm == '0000'>
		<table  id="ins">
			<tr>
				<th width="15%">操作提示：</th>
				<td  width="85%">
					<#--<input type="text" name="ReadResult"  />-->
					<div id="ReadResult"></div>
				</td>
			</tr>		
		</table>		
		<#else>
		<table  id="ins">
		</table>
		</#if>
</td></tr>
</table>
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

	function saveApp(){
		if(document.getElementById('applicationsum').value==''){
			alert("请填写接待人数");
			return;
		}
		if(document.getElementById('Face_date').value==''){
			alert("请填写接待日期");
			return;
		}
		if(confirm("确认提交？")){
			document.getElementById('Issafe').value=1;
			window.createForm.action="saveFace4.action";
		
			window.createForm.submit();

		}
	
	}
	
	function createApp(){
		document.getElementById('Issafe').value=0;
		alert("111");
		var options = {
			url:'saveFace5.action', //提交给哪个执行 
			type:'POST',
			success: callbackfun2 //显示操作提示 
		};
		$('#createForm').ajaxSubmit(options);
		return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 		
	}
	
	function callbackfun2(){
		var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${mainidd}&mstype=yibanjiedaibilu";
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