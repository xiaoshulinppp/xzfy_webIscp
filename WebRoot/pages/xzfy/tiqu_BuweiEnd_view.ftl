<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<title>来信申请行政复议</title>

<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/prototype.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/function.js"></script>

<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>

<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>

<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
<SCRIPT src="../css/01/setday.js"></SCRIPT>
<script type="text/javascript" src="../js/calendar.js"></script>
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>

<style type="text/css">img,formDiv,.formDiv{behavior: url(../webstyle/style/ie-css3.htc);} </style> 

<!--javascript脚本添加位置。-->
<SCRIPT LANGUAGE="JavaScript">
<!--
function toggle(id) {
theObj = document.getElementById(id).style;
if ( theObj.display == "none" ) theObj.display = "block"; else theObj.display = "none";
}
//-->
</SCRIPT>

<!--javascript脚本添加位置结束。-->
</head>

<body>
<#include "../website/header.ftl">
<form action="" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">


<!--标题表格结束-->
<!--主体内容、列表显示区域-->


<input id="xzfyId" name="xzfyBuwei.id" value="${xzfyBuwei.id?default('')}" type="hidden">
<input name="xzfyBuwei.userName" value="${admit_name}" type='hidden'>
<input name="xzfyBuwei.status" id="status" value="1" type='hidden'>
<input name="xzfyBuwei.userId" id="status" value="${userId}" type='hidden'>
<input name="xzfyBuwei.localBm" id="status" value="${localBm}" type='hidden'>
<input name="xzfyBuwei.orgName" id="status" value="${localName}" type='hidden'>
<input type="hidden" name="fileName0" value="${xzfyBuwei.fileName0?default('')}" />
<input type="hidden" name="fileName1" value="${xzfyBuwei.fileName1?default('')}" />
<input type="hidden" name="fileName2" value="${xzfyBuwei.fileName2?default('')}" />
<input type="hidden" name="storedName0" value="${xzfyBuwei.storedName0?default('')}" />
<input type="hidden" name="storedName1" value="${xzfyBuwei.storedName1?default('')}" />
<input type="hidden" name="storedName2" value="${xzfyBuwei.storedName2?default('')}" />
<input type="hidden" name="storedLocation0" value="${xzfyBuwei.storedLocation0?default('')}" />
<input type="hidden" name="storedLocation1" value="${xzfyBuwei.storedLocation1?default('')}" />
<input type="hidden" name="storedLocation2" value="${xzfyBuwei.storedLocation2?default('')}" />

<div class="wal pageNow2">
      <div class="fl">当前位置：&nbsp;&nbsp;<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a> >&nbsp;&nbsp;  <a href="../xzfy/openReceive.action?funcCode=${funcCode}">接收/新增案件</a>  >&nbsp;&nbsp; 国家部委受理案件登记</div>
</div>


<div class="" style="padding-top:0px;">

<div class="wal">
<!--wal-->

 <div class="formTitle2">国家部委受理案件登记</div>

      <div class="form2">
      <div class="bg">

   <table width="95%">
     <tr>
    	<th  width="20%">受理机关：</th>
    	<td  width="30%">${xzfyBuwei.shouLiJiGuan?default('')}</td>
    	<th  width="20%">收案日期：</th>
    	<td  width="30%">${xzfyBuwei.receiveDate?default('')}
      	</td>
  	</tr>
  	
    <input type="hidden" id="tiqu" value="0">
    <input type="hidden" id="rencount" value="0">
  	<tr>
  		<th>申请人类别：</th>
  		<td>${xzfyBuwei.appType?default('')}</td>
  		<th></th>
  		<td></td>
  	</tr>
  	<tr  id="shenqingren1"  <#if xzfyBuwei.appType=="2"> style="display:none"</#if>>
  	<th >申请人：</th>
    <td  colspan=3>${xzfyBuwei.appDetail?default('')}
    </td>
   </tr>
   <tr class="trwhite" id="sqr" <#if xzfyBuwei.appType=="1"> style="display:none"</#if>>
    <th>申请人名称：</th>
    <td colspan=3>${xzfyBuwei.agentDetail?default('')}
    </td>
   </tr>
  	<tr>
  		<th>具体行政行为名称：</th>
  		<td>${xzfyBuwei.xwName?default('')}</td>
  		<th>具体行政行为文号：</th>
  		<td>${xzfyBuwei.xwNum?default('')}</td>
  	</tr>
 	<tr>
 		<th>行政复议事项：</th>
 		<td>${xzfyBuwei.xzfyRequest?default('')}</td>
 		<th>行政管理类别：</th>
 		<td>${xzfyBuwei.refer?default('')} </td>
 	</tr>
 	<tr <#if keywordList.size() gt 0>style="display:''"<#else>style="display:none"</#if>>      
		     		<th >统计关键词：</th><td>${xzfyBuwei.keyWord?default('')}</td>
 		<th></th>
 		<td></td>
	</tr>
 	<tr>
 		<th width="20%">结案日期：</th>
 		<td width="30%">${xzfyBuwei.endDate?default('')}</td>
 		<th width="20%">结案方式：</th>
 		<td width="30%">${xzfyBuwei.finishType?default('')} ${xzfyBuwei.finishBreakType?default('')} </td>
 	</tr>
 	<tr>
 		<th>结案文书：</th>
 		<td>
 		<#if xzfyBuwei.fileName0?has_content><a href="#" title="下载" onclick="javascript:download(0)">下载</a><#else>无</#if></td>
 		<th></th>
 		<td></td>
 	</tr>
 	<tr>
 	<th>行政复议意见书：</th>
 		<td><#if xzfyBuwei.fileName1?has_content><a href="#" title="下载" onclick="javascript:download(1)">下载</a><#else>无</#if></td>
 		<th>行政复议建议书：</th>
 		<td><#if xzfyBuwei.fileName2?has_content><a href="#" title="下载" onclick="javascript:download(2)">下载</a><#else>无</#if></td>
 	</tr>
</table>
                   <br>
  <div align="center" border="0">
 <div class="btn">
                       <div class="fl">
<a href="#" title="返回" onclick="javascript:back1()">返回</a>
                       </div>
                  </div>
      </div>
      </div>
 
</div>
</div>


<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>


<div id="appDiv" style="position:absolute;display:none;" class="formDiv">
<div class="btn">
<div class="fl">
<a href="javascript:addApp()">继续添加</a>
</div>
<div class="fr">
<a href="javascript:closeApp()" id="appEnd">完成</a>
<a href="javascript:closeDivById('appDiv')">关闭</a>
</div>
</div>

<table width="90%">
<tr>
<td id="tapp">
<table width="100%" border="0" cellspacing="0" cellpadding="0"  id="appapp">
<tr>
<th>申请人：</th>
<td><input name="appsqr"  isUser="true" value=""/></td>
<th>性别：</th>
<td><select name="appsex" isUser="true" retSelect="1">
	<option value="男">男</option>
	<option value="女">女</option>
	</select></td>
	</tr>
<tr>
	<th>身份证号：</th>
	<td><input name="appnum"  isUser="true" value="" />
	</td>
	<th>
	送达地址：
	</th>
	<td>
	<textarea name="appaddress"  type="text" isUser="true"></textarea>
	</td>
</tr>
<tr>
	<th>
	邮编：
	</th>
	<td><input name="apppost"  isUser="true" value=""/>
	</td>
	<th>
	电话：
	</th>
	<td><input name="appphone"  isUser="true" value='' />
	<a href="#" onclick="deleteApp(this);return false;" title="删除"  >删除</a>
	</td>
</tr>
</table>
<table  id="insapp">
&nbsp;
</table>
</td></tr>
</table>
</div>

<div id="frDiv" style="position:absolute;display:none;" class="formDiv">
 <div class="btn">
                       <div class="fl">
<a href="javascript:addFr()">继续添加</a>
</div>
<div class="fr">
<a href="javascript:checkFr();closeDivById('frDiv')">完成</a>
<a href="javascript:closeDivById('frDiv')">关闭</a>
                       </div>
                  </div>
</table>
<table width="90%">
<tr>
<td id="tfaren">
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="appfaren">
<tr>
<th >
申请人：</th>
<td colspan=3>
<input name="frsqr"  isUser="true" size="50" value=""/>
</td>
</tr>
<tr>
<th>
	代表人类别：</th>
<td>
<select name="fzrlb" isUser="true" retSelect="1">
<option value="法定代表人">法定代表人</option>
	<option value="负责人">负责人</option>
    <option value="执行合伙事务的合伙人">执行合伙事务的合伙人</option>
    <option value="合伙人">合伙人</option>
    <option value="主要负责人">主要负责人</option>
    <option value="被共同推选的非法人组织其他成员">被共同推选的非法人组织其他成员</option>
	</select>

	</td>
<th width="18%">
代表人姓名：
</th>
<td width="32%"><input  name="fuzeren" isUser="true" value=""/>
</td>

</tr>
	<tr>
	<th width="18%">
	送达地址：</th>
<td width="32%">
<textarea name="fzraddress"  isUser="true" ></textarea>
<!--<input name="fzraddress" isUser="true" value="" size=30/>-->
	</td>
	<th>
	邮编：</th>
<td><input name="fzrpost"  isUser="true" value=""/>
	</td>	
	</tr>
	<tr>
	<th>
	电话：</th>
<td><input name="fzrtele"  isUser="true" value=""/>
	</td>
</tr>
<tr>
<th>
	其他情形：
	</th>
<td colspan=2><select name="fzrother" isUser="true" retSelect="1">
	 <option value="0">无</option>
    <option value="由股东代表大会以股份制企业名义提出申请">由股东代表大会以股份制企业名义提出申请</option>
    <option value="由董事会以股份制企业名义提出申请">由董事会以股份制企业名义提出申请</option>
    <option value="其他">其他</option>
	</select>
	
	</td>
<td align='left'><input value="删除" type="button" class="btn1" onclick="deleteFr(this)"></td>

</tr>
</table>
<table  id="insfaren">
&nbsp;
</table>
</td></tr>
</table>
</div>


</form>
</body>

<script language="javascript">
function download(a){
	listForm_= document.getElementById("form1");
	if (a==0) {	
		listForm_.action="../xzfy/downloadFile.action?funcCode=${funcCode}&type=0";
	}
	if (a==1) {	
		listForm_.action="../xzfy/downloadFile.action?funcCode=${funcCode}&type=1";
	}
	if (a==2) {	
		listForm_.action="../xzfy/downloadFile.action?funcCode=${funcCode}&type=2";
	}
	listForm_.submit();
}

function checksqr1(){
	if(document.getElementById("applicationtype").value==2){
		document.getElementById("sqr").style.display="block";
		document.getElementById("shenqingren1").style.display="none";
		document.getElementById("shenqingren").value="";
	}else{
		document.getElementById("sqr").style.display="none";
		document.getElementById("shenqingren1").style.display="block";
		document.getElementById("appname").value="";
	}
}

function ryq(){
	var request2yiban=document.getElementById("xzfyqq1");
	var requestValue=document.getElementById("request2yiban").value;
				if(requestValue==0){
					request2yiban.value="无";
					request2yiban.innerHTML="";
				}else if(requestValue==1){
					request2yiban.value="请求撤销该具体行政行为";
					request2yiban.innerHTML="请求撤销该具体行政行为";
				}else if(requestValue==2){
					request2yiban.value="请求变更该具体行政行为";
				}else if(requestValue==3){
					request2yiban.value="请求确认该具体行政行为违法";
				}else if(requestValue==4){
					request2yiban.value="请求责令被申请人履行法定职责";
				}else if(requestValue==5){
					request2yiban.value="请求确认被申请人不履行法定职责违法";
				}

}


	function jafss(){
		if(document.getElementById("jafs").value==8){
			document.getElementById("jafs1").style.display="block";
			document.getElementById("jafs2").style.display="none";
			document.getElementById("jafs1").name="xzfyBuwei.finishBreakType"
			document.getElementById("jafs2").name="xzfyfb";
			
		}else if(document.getElementById("jafs").value==1){
			document.getElementById("jafs2").style.display="block";
			document.getElementById("jafs1").style.display="none";
			document.getElementById("jafs2").name="xzfyBuwei.finishBreakType"
			document.getElementById("jafs1").name="xzfyfb";
			
		}
		else{
			document.getElementById("jafs1").style.display="none";
			document.getElementById("jafs2").style.display="none";
		}
	}

function saveNew(id,s){ 
	if(document.getElementById("shoulijiguan").value==""){
		alert("请填写受理机关！");return false;
	}
	if(document.getElementById("receivedate").value==""){
		alert("请填写收案日期！");return false;
	}
	if (document.getElementById("applicationtype").value=="1") {
		if(document.getElementById("shenqingren").value==""){
			alert("请填写申请人！");
			return false;
		}
	} else {
		if(document.getElementById("appname").value==""){
			alert("请填写申请人！");
			return false;
		} 
	}
	if(document.getElementById("xzfyqq1").value==""){
		alert("请填写行政复议事项！");return false;
	}
	if(document.getElementById("ajsjfm1").value=="0"){
		alert("请填写行政管理类别！");return false;
	}
	if (s==2){
		if(document.getElementById("endDate").value==""){
			alert("请填写结案日期！");return false;
		}
		if(document.getElementById("jafs").value=="0"){
			alert("请填写结案方式！");return false;
		}
		if(document.getElementById("jafs").value=="8") {
				if(document.getElementById("jafs1").value=="0") {
					alert("请填写中止原因！");return false;
				}
		}
		if(document.getElementById("jafs").value=="1") {
				if(document.getElementById("jafs2").value=="0") {
					alert("请填写驳回原因！");return false;
				}
		}
		if(document.getElementById("buweiUpFile0").value==""){
			alert("请上传结案文书！");return false;
		}
	}
	document.getElementById("status").value=s;
	listForm_= document.getElementById("form1");	
	listForm_.action="saveBuwei.action?xzfyId=" + id;
	if(confirm("您确认保存吗?"))
	listForm_.submit();
}	
function back1(){
		history.back(-1);
}
</script>
</html>
