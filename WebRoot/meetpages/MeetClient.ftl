<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=7">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行政复议信息管理系统</title>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css">
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../webstyle/script/index/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../webstyle/script/index/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/index/fun.js"></script>

<!--[if lte IE 6]>
<script src="../js/index/png.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div, ul, img, li, input , a');
    </script>
<![endif]--> 
</head>
<style type="text/css">img,formDiv,.formDiv{behavior: url(../webstyle/style/ie-css3.htc);} </style>
	<body>
	<div class="headDiv">
<div class="wal">
      <a href="" class="logo"><img src="../webstyle/image/logo.png"/></a>
      <div class="time">当前时间： 2013年10月28日 22点41分</div>
      <div class="nav">
            <ul>
               <li class="li_01"><a href="" class="aNow"><img src="../images/index/lnav_1.png"/></a></li>
               <li class="li_02"><a href=""><img src="../images/index/lnav_2.png"/></a></li>
               <li class="li_03"><a href=""><img src="../images/index/lnav_3.png"/></a></li>
               <li class="li_04"><a href=""><img src="../images/index/lnav_4.png"/></a></li>
               <li class="li_05"><a href=""><img src="../images/index/lnav_5.png"/></a></li>
               <li class="li_06"><a href=""><img src="../images/index/lnav_6.png"/></a></li>
               <li class="li_07"><a href=""><img src="../images/index/lnav_7.png"/></a></li>
            </ul>
      </div>
</div>
</div>
<div class="" style="padding-top:0px;">
<div class="pageNow">当前位置：办理表单</div>
<div class="wal">

      <div class="formTitle2">行政复议申请材料处理</div>
      <div class="formDiv">


	<form id="createForm" action="../meet/saveFace1" method="post" >
		<input type="hidden" name="meet.Main_id" value="${Main_id}" />
		
		
	     
            <!---->

	
		<table width="98%" cellpadding="0" cellspacing="0" border="0">

			<tr >
    			<th width="25%">接待日期</th>
    			<td width="25%">
    			<input name="meet.Face_date" type="text" class="input2"
    			  value="${todate}"
    			onClick="WdatePicker()" altname="接待时间" >
      			</td>
				<th width="25%">接待地点</th>
				<td width="25%">
				<input type="text" name="meet.Face_address" value="" class="input2" />
			    </td>
  			</tr>
			<tr >
				<th width="25%" >第一接待人</th>
				<td width="25%">
					<input type="text" name="meet.Admit1" value=""  class="input2"/>
				</td>
				<th width="25%" >第二接待人</th>
				<td width="25%">
					<input type="text" name="meet.Admit2" value=""  class="input2"/>
				</td>
			</tr>
			<tr >
				<th width="25%" >接待人数</th>
				<td width="25%">
					<input type="text" name="meet.Face_allnumber" value="" class="input2" />
				</td>
				<th width="25%" >涉及安全</th>
				<td width="25%">
					<select name="meet.Issafe"  >
					<option value="1" >是</option>
					<option value="2" >否</option>
					</select>


				</td>
			</tr>
			<th width="25%" >被接待人</th>
    		<td  width="25%" colspan=8>
     <a href="javascript:opendg('../meet/addApp1.action?Main_id=${Main_id}&funcCode=${funcCode}&protype=0&textId=user&countId=applicationsum',900,600)"  style="display:block" id="addjd">添加</a>
    			<textarea name="meet.Client_content" type="text"  id="shenqingren" ischeck="y" altname="申请人" ></textarea>
    		</td>
   			</tr>
 <tr >
	 <th width="25%" >阅卷笔录内容：<br>(鼠标双击添加对话)</th>
	 <td width="25%" colspan=8>
	  <textarea name="meet.Face_content" class="textarea" id="answerValue" type="text"  ondblclick="getValue(this)">
接待人询问：今天请在此查阅“京政复字[201 ]   号”行政复议案卷。
被接待人回答：我（们）已经查阅该案卷。
接待人询问：请问被接待人查阅后有何意见需要陈述？
被接待人回答：我（们）将通过提交书面材料表明意见。

</textarea>
</td>
	 </tr>
			
		</table>
		

		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<th  >
					<input type="button" id="sunbt" class="btn1" value="提 交" onclick="createApp();" />
					<input type="button" class="btn1" value="返 回" onclick="gotoBack();" />
					<input type="button" id="sunbt" class="btn1" value="生成接待笔录" onclick="createApp();" />
					<input type="button" id="sunbt" class="btn1" value="生成收据" onclick="createApp();" />
				</th>
			</tr>

			<input type="hidden" name="Meet.Main_id" value="${Main_id}"/>
			<input type="hidden" name="textId" <#if textId ?has_content>value="${textId}"</#if>>
			<input type="hidden" name="countId"<#if countId ?has_content>value="${countId}"</#if>>
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="Client.proxytype" value="1" />
		</form>
		</table>
			
 </div>
            
     
	 </div>

<div class="h50"></div>
<!--walEnd-->
</div>
</div>
	
	</body>
</html>
<script type="text/javascript">
	function createApp(){
		if(confirm("确认提交？")){
			window.createForm.action="saveFace1.action";
		
			window.createForm.submit();
				window.open("http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20130725154319&d_username=庞磊&caseId=${Main_id}");
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
	window.open("http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20130725154319&d_username=庞磊&caseId=1");
}
</script>