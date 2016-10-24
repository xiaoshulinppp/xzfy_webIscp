<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title></title>
<link href="../${Session['_USER_STYLE_'].cssPath}/base.css" rel="stylesheet" type="text/css" />
<link href="../${Session['_USER_STYLE_'].cssPath}/main_style.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 7]><link href="../sys_theme/css/ie7hack.css" rel="stylesheet" type="text/css" media="screen"/><![endif]--><!--不可删--->
<link href="../css/style_form.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../js/16B/function.js"></script>

	<!--                       Javascripts 注意不要改变顺序                      -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
<!-- 组件template -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
<style>   
.diva{ 
BORDER:#bfceff 1px solid;
height:22;
FILTER:progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr='#ddecfb',endColorStr='#ffffff');
PADDING-TOP: 3px; 
}
.divb{
BORDER: #bfceff 1px solid;
PADDING-TOP: 10px; 
PADDING-LEFT: 10px;
FONT-SIZE: 12px;
HEIGHT: 100px;
width:180;
border-top:0;
}
</style>

<SCRIPT language=JavaScript src="../pages/xzfy/js/function.js"></SCRIPT>
<!--javascript脚本添加位置。-->

<!--javascript脚本添加位置结束。-->
</head>
<body>

<script>
function getBzPro(status){
	if(status==1){
		document.getElementById("bzDivTable").style.display="block";
		document.getElementById("bzOpen").style.display="none";
		document.getElementById("bzClose").style.display="block";
		document.getElementById("hasbz").value=1;	
	}else{
		document.getElementById("bzDivTable").style.display="none";
		document.getElementById("bzOpen").style.display="block";
		document.getElementById("bzClose").style.display="none";
		document.getElementById("hasbz").value=0;
	}	
}

	function viewBzPro(status){
		if(status==1){
			document.getElementById("bzDivTable").style.display="block";
			document.getElementById("bzOpen").style.display="none";	
			document.getElementById("bzClose").style.display="block";	
		}else{
			document.getElementById("bzDivTable").style.display="none";
			document.getElementById("bzOpen").style.display="block";	
			document.getElementById("bzClose").style.display="none";	
		}
	
	}
	
	function checkBzConfirm(){
		if(document.getElementById("check_id").value==0){
			document.getElementById("bzConfirm").value=0;
			document.getElementById("bzFast").style.display="block";
		}else{
			document.getElementById("bzConfirm").value=1;
			document.getElementById("bzFast").style.display="none";
		}
	}
	
	function checkBzConfirm_la(){
		if(document.getElementById("Lian_check_id").value==0){
			document.getElementById("laFast").style.display="block";
		}else{
			document.getElementById("laFast").style.display="none";
		}	
	}
	
	
	function checkBzConfirm_ja(){
		if(document.getElementById("jiean_check_id").value==0){
			document.getElementById("jaFast").style.display="block";
		}else{
			document.getElementById("jaFast").style.display="none";
		}	
	}
		
function savaToGetDoc(){
		if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			document.getElementById("keyword2").value=1;
			var callBackMethod;
			if(type==1){
				var options = { 
					url:'saveToDoc.action', //提交给哪个执行 
					type:'POST', 
					success: getBuzhengtongzhi //显示操作提示 
				}; 
				$('#form1').ajaxSubmit(options); 
				return false; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
			}
		}
}

	function getDoc(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${admit_name}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url);
	}
	
	function getBuzhengtongzhi(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${admit_name}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url);
	}
	

	function savaToLaDoc(){
		if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			document.getElementById("keyword3").value=1;
			var callBackMethod;
				var options = { 
					url:'saveToDoc.action', //提交给哪个执行 
					type:'POST', 
					success: getLiantongzhi //显示操作提示 
				}; 
				$('#form1').ajaxSubmit(options); 
				return false; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		}
}
	
	function getLiantongzhi(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131021113134&d_username=panglei&caseId=${xzfyInfo.id}";
		window.open(url);
	}
	
	
	function savaToJaDoc(){
		if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			document.getElementById("keyword").value=1;
			var callBackMethod;
				var options = { 
					url:'saveToDoc.action', //提交给哪个执行 
					type:'POST', 
					success: getJieantongzhi //显示操作提示 
				}; 
				$('#form1').ajaxSubmit(options); 
				return false; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		}
	}
	
	function getJieantongzhi(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131024142832&d_username=panglei&caseId=${xzfyInfo.id}";
		window.open(url);
	}
	

function opendg(dgurl,dgw,dgh)
{
  $.dialog({ 
    title:'请选择补正内容',
    width: dgw,
    height: dgh,
    content:'url:'+ dgurl});
}

	function subBuzheng(){
		if(document.getElementById("check_id").value==0){
			alert("请选择审批人");
			return false;
		}else if(document.getElementById("keyword2").value==0){
			alert("请生成文书");
			return false;
		}else{	
			if(confirm("您确认要提交审批？")){			
				document.getElementById("checkStatus").value=1;
				document.getElementById("isBuzheng").value=1;
				document.getElementById("hasbz").value=1;	
				document.getElementById("xzfyStatus").value=2;
				document.getElementById("form1").action="../xzfy/subCheckCase.action";
				document.getElementById("form1").submit();
			}
		}
	}
	
	
	function subLian(){
		if(document.getElementById("Lian_check_id").value==0){
			alert("请选择审批人");
			return false;
		}else if(document.getElementById("keyword3").value==0){
			alert("请生成文书");
			return false;
		}else{	
			if(confirm("您确认要提交审批？")){			
				document.getElementById("checkStatus").value=1;
				document.getElementById("xzfyStatus").value=3;
				document.getElementById("sdResult").value=1;	
				document.getElementById("check_id").value=document.getElementById("Lian_check_id").value;
				document.getElementById("form1").action="../xzfy/subCheckCase.action";
				document.getElementById("form1").submit();
			}
		}
	}
	
	function subJiean(){
		if(document.getElementById("jiean_check_id").value==0){
			alert("请选择审批人");
			return false;
		}else if(document.getElementById("keyword").value==0){
			alert("请生成文书");
			return false;
		}else{	
			if(confirm("您确认要提交审批？")){			
				document.getElementById("checkStatus").value=1;
				document.getElementById("xzfyStatus").value=11;
				document.getElementById("sdResult").value=document.getElementById("scresult").value;;	
				document.getElementById("check_id").value=document.getElementById("jiean_check_id").value;
				document.getElementById("form1").action="../xzfy/subCheckCase.action";
				document.getElementById("form1").submit();
			}
		}
	}
	
	function finishBuzheng(checkSize){
			if(confirm("您确认要完成补正操作？")){			
				document.getElementById("checkStatus").value=0;
				document.getElementById("xzfyStatus").value=1;
				document.getElementById("hasbz").value=1;	
				document.getElementById("check_id").value=0;
				document.getElementById("form1").action="../xzfy/finishCheckCase.action";
				document.getElementById("form1").submit();
			}	
	}
	
	function finishLian(xzfyCheckList_la){
		if(!checknull()){return false;}

	if(document.getElementById("scresult").value==0){
			alert("请选择来件处理！"); 
			return false;
	}  else if(document.getElementById("scresult").value==1){
		if (document.getElementById("lian_date").value==""){
			alert("请填写立案日期！"); 
			return false;
		}
	}
		if(document.getElementById("user").value==""){
			alert("请填写申请人");
			return false;
		}

		if(document.getElementById("xzfyqq1").value==""){
			alert("请填写行政复议请求");
			return false;
		}	
		
		if(document.getElementById("TBeName").value==""){
			alert("请填写被复议的具体行政行为名称");
			return false;
		}	
		
		if(document.getElementById("annum").value==""){
			alert("请填写被复议的具体行政行为案号");
			return false;
		}		
		if(document.getElementById("content").value==""){
			alert("请填写简要内容");
			return false;
		}		
		
		
	
			if(confirm("提交后将进入办理接待，您确认要提交吗？")){
				document.getElementById("checkStatus").value=0;
				document.getElementById("xzfyStatus").value=4;
				document.getElementById("sdResult").value=1;	
				document.getElementById("check_id").value=0;
				
				document.getElementById("form1").action="../xzfy/finishLianCase.action";
				document.getElementById("form1").submit();
			}	

	}
	
	function finishJiean(){
		if(!checknull()){return false;}

	if(document.getElementById("scresult").value==0){
			alert("请选择来件处理！"); 
			return false;
	} else if(document.getElementById("scresult").value==2||document.getElementById("scresult").value==3||document.getElementById("scresult").value==5){
		if (document.getElementById("finish_date").value==""){
			alert("请填写结案日期！"); 
			return false;
		}
	}
		if(document.getElementById("user").value==""){
			alert("请填写申请人");
			return false;
		}

		if(document.getElementById("xzfyqq1").value==""){
			alert("请填写行政复议请求");
			return false;
		}	
		
		if(document.getElementById("TBeName").value==""){
			alert("请填写被复议的具体行政行为名称");
			return false;
		}	
		
		if(document.getElementById("annum").value==""){
			alert("请填写被复议的具体行政行为案号");
			return false;
		}		
		if(document.getElementById("content").value==""){
			alert("请填写简要内容");
			return false;
		}		
			if(document.getElementById("finishtype1").value==0){alert("请选择结案方式!");return false;}
	if(document.getElementById("finishtype1").value==8){if(document.getElementById("finishtype2").value==0){alert("请选择结案方式!");return false;}}
		
	
			if(confirm("提交后将结案，您确认要提交吗？")){
				document.getElementById("checkStatus").value=0;
				document.getElementById("xzfyStatus").value=12;
				document.getElementById("sdResult").value=document.getElementById("scresult").value;				
				document.getElementById("form1").action="../xzfy/finishJieanCase.action";
				document.getElementById("form1").submit();
			}		
	
	}
	
	function cancleBuzheng(){
			if(confirm("您确认要取消审批？")){			
				document.getElementById("checkStatus").value=0;
				document.getElementById("xzfyStatus").value=2;			
				document.getElementById("check_id").value=0;
				document.getElementById("form1").action="../xzfy/subCheckCase.action";
				document.getElementById("form1").submit();
			}	
	}
	
	
	function cancleLian(){
			if(confirm("您确认要取消审批？")){			
				document.getElementById("checkStatus").value=0;
				document.getElementById("xzfyStatus").value=3;			
				document.getElementById("check_id").value=0;
				document.getElementById("form1").action="../xzfy/subCheckCase.action";
				document.getElementById("form1").submit();
			}	
	}
	
	function cancleJiean(){
			if(confirm("您确认要取消审批？")){			
				document.getElementById("checkStatus").value=0;
				document.getElementById("xzfyStatus").value=11;			
				document.getElementById("check_id").value=0;
				document.getElementById("form1").action="../xzfy/subCheckCase.action";
				document.getElementById("form1").submit();
			}	
	}
	
	
	function handle_request(){
		document.getElementById("sdResult").value=document.getElementById("scresult").value;
		if(document.getElementById("scresult").value==1){	
			document.getElementById("shouli_tr1").style.display="block";
			document.getElementById("jiean_div").style.display="none";			
		}else if(document.getElementById("scresult").value==0){	
			document.getElementById("shouli_tr1").style.display="none";
			document.getElementById("jiean_div").style.display="none";	
		}else{	
			document.getElementById("shouli_tr1").style.display="none";
			document.getElementById("jiean_div").style.display="block";		
		}
			
	}
	
	function getCheckForm(type){
		window.open('../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&checkDocType='+type+'&isView=1&funcCode=447');
	}
</script>
<form action="''" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
<div class="ui-flod-cnt fn-clear" id="page1">
<div class="ui-form fn-clear">
 <div class="align-left"  <#if xzfyInfo.status=="2"> style="display:none" <#else>style="display:block"</#if>>
 <#if xzfyInfo.status=="1" && xzfyInfo.isBuzheng=="0">
  <span id="bzOpen" style="display:block"><a href="#" class="btn-blue btn" onclick="javascript:getBzPro(1)">补正程序</a></span>
  <span id="bzClose" style="display:none"><a href="#" class="btn-blue btn" onclick="javascript:getBzPro(0)">取消补正</a></span>
  <#elseif xzfyInfo.isBuzheng=="1">
  <span id="bzOpen" style="display:block"><a href="#" class="btn-blue btn" onclick="javascript:viewBzPro(1)">查看补正程序</a></span>
  <span id="bzClose" style="display:none"><a href="#" class="btn-blue btn" onclick="javascript:viewBzPro(0)">取消查看</a></span>  
  </#if>
  </div>
 <div class="align-left"  <#if xzfyInfo.status=="2"> style="display:block" <#else>style="display:none"</#if>>
  <a href="#" class="btn-blue btn">补正进行中</a>
  </div>
<br>
<#assign isShowBtn=xzfyInfo.check_status?default('0')>
<#assign sdResult=xzfyInfo.stadardResult?default('0')>
 <table  id="bzDivTable" class="ui-table ui-table-form "  <#if xzfyInfo.status=="2"> style="display:block" <#else>style="display:none"</#if>>
   <tr >
  	<th width="20%">通知补正日期：</th>
    <td width="30%">
 	   <input name="xzfyInfo.bzTongzhiriqi" id="addbegin" type="text" onClick="WdatePicker()" altname="通知补正日期"
 	     bzcheck="y" ${xzfyInfo.bzTongzhiriqi?default('')} readonly>
    </td>
    <th width="20%">补齐材料日期</th>
    <td width="30%">
    <input name="xzfyInfo.bzBuqiriqi" id="addend" type="text" onClick="WdatePicker()"
    ${xzfyInfo.bzBuqiriqi?default('')} altname="补正截止日期" readonly>
    </td>
    </tr>
    <tr>
    <th >补正内容：</th>
    <td colspan=3>
    <#if (xzfyInfo.status=="1" && xzfyInfo.isBuzheng=="0") || xzfyInfo.status=="2">
     <a href="javascript:opendg('xzfy/addBzContent.action?funcCode=${funcCode}&textId=bznr',600,500)"  style="display:block">添加补正内容</a>
   </#if>
    <textarea name="xzfyInfo.jdBzContent" id="bznr" ><#if xzfyInfo.jdBzContent?has_content>${xzfyInfo.jdBzContent}<#else>该行政复议申请中有如下材料欠缺或表达不清，根据《中华人民共和国行政复议法实施条例》第29条的规定，请申请人于接待之日起5个工作日内补正。无正当理由逾期不补正的，视为放弃行政复议申请。补正申请材料所用时间不计入行政复议案件审理期限。</#if></textarea>
    </td>
    </tr>
    <tr>
    <th>立案审查人意见：</th>
    <td colspan=3>
    <textarea name="xzfyInfo.bzAdvice" id="bzAdvice" ><#if xzfyInfo.bzAdvice?has_content>${xzfyInfo.bzAdvice}</#if></textarea>
    </td>
    </tr>
    
   <#assign checkUserId=xzfyInfo.check_id?default('0')>
    <tr>
	<th >补正审批人：</th>
    <td colspan="2">
    <select name="xzfyInfo.check_id" id="check_id" onchange="checkBzConfirm()" <#if isShowBtn=='1'>disabled</#if>>
    <option value="0">未指定审批人</option>
    <#list userList as uList>
    <option value="${uList.getId()}" <#if uList.getId().toString()==checkUserId>selected</#if>>${uList.getName()}</option>
    </#list>
    </select>&nbsp;&nbsp;<font color="red">未指定审批人时，系统将不会执行审批操作</font>
    </td>
    <td>
    当前状态：<br>
<#if checkSize gt 0 >
    	<#list xzfyCheckList as checkList>
    		<#if checkList.getCheck_name()?has_content>
    			<font color="red">${checkList.getCheck_name()}:
    			<#if checkList.getCheck_result()?has_content>
    				<#if checkList.getCheck_result()=='1'>
    					已批准；
    				<#else>
    					已退回
    				</#if>
    				</font>
    			</#if>
    		</#if><br>
        </#list>
</#if>
<#if checkSize==0 >
	未审批
</#if>

    </td>

  </tr>
 
  
 
 <tr >
    <th>生成补正通知：</th>
    <td >
<#if (xzfyInfo.status=="1" && xzfyInfo.isBuzheng=="0") || xzfyInfo.status=="2">
    <#if isShowBtn=='0'>
	    <#assign isDoc=xzfyInfo.keyword2?default('0')>
	    <#if isDoc=='0'>
	    	<a href="#" class="btn-blue btn" onclick="javascript:savaToGetDoc('1')">生成</a>
	    <#else>
	    	文书已生成：
	    	<a href="#" class="btn-blue btn" onclick="javascript:savaToGetDoc('1')">编辑文书</a>
	    </#if>
	   <#else>
	   		审批中，无法执行此操作
	   </#if>
<#else>
	<a href="#" class="btn-blue btn" onclick="javascript:getDoc()">查看文书</a>
</#if>
      </td>
	<th>预览补正审批单：</th>
    <td>
    <a href="#" class="btn-blue btn" onclick="javascript:getCheckForm('2')">预览</a>
      </td>
  </tr>
  <#assign isBzSp=xzfyInfo.isBuzhengshenpi?default('0')>
  <tbody id="bzFast"  <#if isBzSp=='0' || (checkSize==0 && isShowBtn=='0') >style="display:block"<#else>style="display:none"</#if> >
<tr >
    <th>补证批准人：</td>
    <td ><input type="text" name="shenpiren" id="shenpiren">
    <br><span id="seshenpiren"></span>
      </td>
	<th></td>
    <td class="tdFormInput2">
    <!--<input type="text" name="shenpishijian" id="shenpishijian" onClick="WdatePicker()" class="inputTextNormal">-->
      </td>
  </tr>
  <tr >
    <th>批准意见：</th>
    <td colspan=3>
    <textarea  name="shenpiyijian" id="shenpiyijian"></textarea>
      </td>
  </tr>
</tbody>
<tr class="trcolor">
	<td colspan="4" align="center">
	 <#if (xzfyInfo.status=="1" && xzfyInfo.isBuzheng=="0") || xzfyInfo.status=="2">
		<#if isShowBtn=='0'>
	            <input class="ui-btn ui-btn-normal" type="button" id="noBz"  value="提交审批" onclick="subBuzheng()">
	            <input class="ui-btn ui-btn-normal" type="button" id="finishBz"  value="完成补正" onclick="finishBuzheng('${checkSize}')">
		<#else>
			 <input class="ui-btn ui-btn-normal" type="button" id="cancleBz"  value="取消审批" onclick="cancleBuzheng()">
		</#if>
	</#if>
    </td>

</tr>
</tbody>
 </table>
 
 
 
<table  id="shouli_tr1" class="ui-table ui-table-form "  
 	<#if xzfyInfo.status=='2'>style="display:none;"
  	<#elseif sdResult!='1'>style="display:none;"
  </#if>
  >
  <tr>
  <td colspan="4" align="center"><font color="red">立案审批 </font></td>
  </tr>
  <tr >
  <th width="20%">立案审查人意见:</th>
  <td width="30%">
  <textarea name="xzfyInfo.laAdvice">${xzfyInfo.laAdvice?default('')}</textarea>
  </td>
  <th width="20%">立案日期:</th>
  <td width="30%"><input type="text"  onClick="WdatePicker()"  readonly name="xzfyInfo.lian_date" id="lian_date" value="${xzfyInfo.lian_date?default('')}"></td>
  </tr>
  <tr >
	<th >立案审批人：</th>
    <td colspan="2">
    <select name="Lian_check_id" id="Lian_check_id" onchange="checkBzConfirm_la()" <#if isShowBtn=='1'>disabled</#if>>
    <option value="0">未指定审批人</option>
    <#list userList as uList>
    <option value="${uList.getId()}" <#if uList.getId().toString()==checkUserId>selected</#if>>${uList.getName()}</option>
    </#list>
    </select>&nbsp;&nbsp;<font color="red">未指定审批人时，系统将不会执行审批操作</font>
    </td>
    <td>
    当前状态：<br>
<#if la_checkSize gt 0 >
    	<#list xzfyCheckList_la as checkList>
    		<#if checkList.getCheck_name()?has_content>
    			<font color="red">${checkList.getCheck_name()}:
    			<#if checkList.getCheck_result()?has_content>
    				<#if checkList.getCheck_result()=='1'>
    					已批准；
    				<#else>
    					已退回
    				</#if>
    				</font>
    			</#if>
    		</#if><br>
        </#list>
</#if>
<#if la_checkSize==0 >
	未审批
</#if>

    </td>
  </tr>  
 <tr >
<th>案号：</td>
<td >
<input name="xzfyInfo.tjzfzh"  value="${xzfyInfo.tjzfzh?default('复字[201]号')}"  id="tjzfzh" type="text" class="inputTextNormal"  onblur="getTitleList()">
</td>
<th>&nbsp;</td>
<td class="tdFormInput">
    &nbsp;
</td>
</tr> 
  <#assign isDoc_la=xzfyInfo.keyword3?default('0')>
  <tr >
    <th>查看受理通知：</th>
    <td >
 <#if xzfyStatus gt 2 || xzfyStatus==1>
    <#if isShowBtn=='0'>
	    <#if isDoc_la=='0'>
	    	<a href="#" class="btn-blue btn" onclick="javascript:savaToLaDoc()">生成</a>
	    <#else>
	    	文书已生成：
	    	<a href="#" class="btn-blue btn" onclick="javascript:savaToLaDoc()">编辑文书</a>
	    </#if>
	   <#else>
	   		审批中，无法执行此操作
	   </#if>   
</#if>
      </td>
	<th>预览立案审批单：</td>
    <td class="tdFormInput">
    <a href="#" class="btn-blue btn" onclick="javascript:getCheckForm('3')">预览</a>
      </td>
  </tr>
 <tbody id="laFast"  <#if xzfyInfo.status=='1' || (la_checkSize==0 && isShowBtn=='0') || (xzfyInfo.status=='3' && isShowBtn=='0')>style="display:block"<#else>style="display:none"</#if> >
  <tr >
    <th>立案批准人：</th>
    <td class="tdFormInput2"><input type="text" name="lashenpiren" id="lashenpiren">
      </td>
	<th>批准意见：</th>
    <td class="tdFormInput2"><textarea name="lashenpiyijian" id="lashenpiyijian"></textarea>
      </td>
  </tr>
</tbody>
  <tr >
   <td colspan="4" align="center">
	 <#if xzfyInfo.status=="1" || xzfyInfo.status=="3">
		<#if isShowBtn=='0'>
	            <input class="ui-btn ui-btn-normal" type="button"  value="提交审批" onclick="subLian()">
	            <input class="ui-btn ui-btn-normal" type="button"  value="完成立案" onclick="finishLian('${checkSize}')">
		<#else>
			 <input class="ui-btn ui-btn-normal" type="button" id="cancleBz"  value="取消审批" onclick="cancleLian()">
		</#if>
	</#if>
    </td> 
	
</tr>

</table>


<!--结案信息-->

  <table  id="jiean_div" class="ui-table ui-table-form "  
 	<#if xzfyInfo.status=='2'>style="display:none;"
  	<#elseif sdResult='1' || sdResult='0'>style="display:none;"
  </#if>>
   <tr>
  <td colspan="4" align="center"><font color="red">结案审批 </font></td>
  </tr>
 <#assign finish_type1=xzfyInfo.finish_type?default('0')>
 <#assign finish_type2=xzfyInfo.finishBreakType?default('0')>
    <tr class="trcolor">
     <th class="tdFormText" width="20%">结案方式：</td>
     <td class="tdFormInput" width="30%">
         <select name="xzfyInfo.finish_type" id="finishtype1" class="selectStyleNormal" onchange="setFT()">
          <option value="0">请选择</option> 
		  <option value="1" <#if finish_type1=='1'>selected</#if>>驳回</option>
		  <option value="2" <#if finish_type1=='2'>selected</#if>>维持</option>
		  <option value="3" <#if finish_type1=='3'>selected</#if>>确认违法</option>
		  <option value="4" <#if finish_type1=='4'>selected</#if>>撤销</option>
		  <option value="5" <#if finish_type1=='5'>selected</#if>>变更</option>
		  <option value="6" <#if finish_type1=='6'>selected</#if>>责令履行</option>
		  <option value="7" <#if finish_type1=='7'>selected</#if>>调解</option>
		  <option value="8" <#if finish_type1=='8'>selected</#if>>终止</option>
		  <option value="9" <#if finish_type1=='9'>selected</#if>>其他</option> 
		 </select>

		  <select name="xzfyInfo.finishBreakType" 
		  <#if finish_type1=='8'>style="display:block"<#else>style="display:none"</#if> altname="结案方式" class="selectStyleNormal" id="finishtype2" ishidden="y">
		  <option value="0">----请选择----</option>
	<option value="1" <#if finish_type2=='1'>selected</#if>>和解协议</option>
	 <option value="2" <#if finish_type2=='2'>selected</#if>>自愿撤回申请</option>
	 <option value="3" <#if finish_type2=='3'>selected</#if>>被申请人改变后撤回申请</option>
	 <option value="4" <#if finish_type2=='4'>selected</#if>>其他</option>
  </select>
		 </td>
	 <th width="20%">&nbsp;</td>
     <td class="tdFormInput" width="30%">&nbsp;</td>
  </tr>
  <input type="hidden" name="xzfyInfo.nationMoney" value="否" >

  
  <tr class="trcolor">
    <th>结案文书：</td>
    <td class="tdFormInput">
    <input type="button" id="jieanwenshuBtn"  value="生成" onclick="" >
       </td>

  	<th>&nbsp;</td>
    <td class="tdFormInput">&nbsp;</td>
  </tr> 
  
 
  <tr >
  <th width="20%">立案审查人意见:</th>
  <td width="30%">
  <textarea name="xzfyInfo.jaAdvice">${xzfyInfo.jaAdvice?default('')}</textarea>
  </td>
  <th width="20%">结案日期:</th>
  <td width="30%"><input type="text"  onClick="WdatePicker()" readonly  name="xzfyInfo.finish_date" id="finish_date" value="${xzfyInfo.finish_date?default('')}"></td>
  </tr>
  <tr >
	<th >结案审批人：</th>
    <td colspan="2">
    <select name="jiean_check_id" id="jiean_check_id" onchange="checkBzConfirm_ja()" <#if isShowBtn=='1'>disabled</#if>>
    <option value="0">未指定审批人</option>
    <#list userList as uList>
    <option value="${uList.getId()}" <#if uList.getId().toString()==checkUserId>selected</#if>>${uList.getName()}</option>
    </#list>
    </select>&nbsp;&nbsp;<font color="red">未指定审批人时，系统将不会执行审批操作</font>
    </td>
    <td>
    当前状态：<br>
<#if ja_checkSize gt 0 >
    	<#list xzfyCheckList_ja as checkList>
    		<#if checkList.getCheck_name()?has_content>
    			<font color="red">${checkList.getCheck_name()}:
    			<#if checkList.getCheck_result()?has_content>
    				<#if checkList.getCheck_result()=='1'>
    					已批准；
    				<#else>
    					已退回
    				</#if>
    				</font>
    			</#if>
    		</#if><br>
        </#list>
</#if>
<#if ja_checkSize==0 >
	未审批
</#if>

    </td>
  </tr>   
  
 <#assign isDoc_ja=xzfyInfo.keyword?default('0')>
  <tr >
    <th>生成不予受理通知：</th>
    <td >
 <#if xzfyStatus==11 || xzfyStatus==1>
    <#if isShowBtn=='0'>
	    <#if isDoc_ja=='0'>
	    	<a href="#" class="btn-blue btn" onclick="javascript:savaToJaDoc()">生成</a>
	    <#else>
	    	文书已生成：
	    	<a href="#" class="btn-blue btn" onclick="javascript:savaToJaDoc()">编辑文书</a>
	    </#if>
	   <#else>
	   		审批中，无法执行此操作
	   </#if>   
</#if>
      </td>
	<th>预览结案审批单：</td>
    <td class="tdFormInput">
    <a href="#" class="btn-blue btn" onclick="javascript:getCheckForm(11)">预览</a>
      </td>
  </tr>
 <tbody id="jaFast"  <#if (xzfyInfo.status=='11' && isShowBtn=='0') || (ja_checkSize==0 && isShowBtn=='0') >style="display:block"<#else>style="display:none"</#if> >
  <tr >
    <th>结案批准人：</th>
    <td class="tdFormInput2"><input type="text" name="jashenpiren" id="jashenpiren">
    <br><span id="lianSprShow2"></span>
      </td>
	<th>批准意见：</th>
    <td class="tdFormInput2"><textarea name="jashenpiyijian" id="jashenpiyijian"></textarea>
      </td>
  </tr>
</tbody>

  <tr >
   <td colspan="4" align="center">
	 <#if xzfyInfo.status=="1" || xzfyInfo.status=="11">
		<#if isShowBtn=='0'>
	            <input class="ui-btn ui-btn-normal" type="button"  value="提交审批" onclick="subJiean()">
	            <input class="ui-btn ui-btn-normal" type="button"  value="完成结案" onclick="finishJiean('${checkSize}')">
		<#else>
			 <input class="ui-btn ui-btn-normal" type="button" id="cancleBz"  value="取消审批" onclick="cancleJiean()">
		</#if>
	</#if>
    </td> 
	
</tr>
  </table>

<!--主体内容、列表显示区域-->
<input name="bzConfirm" id="bzConfirm" value='0' type="hidden"/ >
<input name="checkBzSpan" id="checkBzSpan"' type="hidden"/ >
<input name="checkJzfz" id="checkJzfz" type="hidden"/ >
<input name="xzfyInfo.isBuzheng" id="hasbz" type="hidden" value="${xzfyInfo.isBuzheng?default('0')}" / >
<input name="xzfyInfo.caseorg" type="hidden" value="${xzfyInfo.caseorg?default('')}">

<input id="xzfyId" name="xzfyInfo.id" value="${xzfyInfo.id}" type="hidden">
<input id="keyword" name="xzfyInfo.keyword" value="${xzfyInfo.keyword?default('0')}" type="hidden">
<input id="keyword2" name="xzfyInfo.keyword2" value="${xzfyInfo.keyword2?default('0')}" type="hidden">
<input id="keyword3" name="xzfyInfo.keyword3" value="${xzfyInfo.keyword3?default('0')}" type="hidden">
<input id="isBuzheng" name="xzfyInfo.isBuzhengshenpi" value="${xzfyInfo.isBuzhengshenpi?default('0')}" type="hidden">
<input id="xzfyStatus" name="xzfyInfo.status" value="${xzfyInfo.status}" type="hidden">
<input id="xzfyshow" name="xzfyInfo.app_show" value="${xzfyInfo.app_show}" type="hidden">
<input type="hidden" name="funcCode" value="${funcCode}" >

<input name="xzfyInfo.receive_type" id="appType" type="hidden" <#if xzfyInfo.receive_type=="1"> value="1"</#if>  
 <#if xzfyInfo.receive_type=="2"> value="2"</#if>
 <#if xzfyInfo.receive_type=="3"> value="3"</#if>
   />

<input type="hidden" id="isShenpi" >
<input type="hidden" id="checkStatus" name="xzfyInfo.check_status"  <#if xzfyInfo.check_status?has_content> 
value="${xzfyInfo.check_status}" <#else>value="0"</#if> />

<input name="isting" id="isting" type="hidden" 
<#if xzfyInfo.istingzheng?has_content>value="${xzfyInfo.istingzheng}"<#else>value="否"</#if> />

<input name="xzfyInfo.TApplicationDeptID" type="hidden" class="inputTextNormal" id="deptid" />
 <table  id="" class="ui-table ui-table-form "  ><!--表单填写项文字居右样式由 fn-text-right控制。td宽度在第一行标记 不要每行都标记-->

  



  <tr class="trcolor" id="handleCase" <#if xzfyInfo.status=='2'>style="display:none"</#if>>

	<th>来件处理：</td>
	    <td class="tdFormInput">
<select name="scresult"  disabled
<#if isShowBtn=='1' || xzfyInfo.status=='3' || xzfyInfo.status=='11'>disabled</#if> id="scresult" nbzcheck="y" altname="来件处理" onchange="handle_request()">
	      <option value="0" <#if sdResult=='0'>selected</#if>>----请选择----</option>
		  <option value="1" <#if sdResult=='1'>selected</#if>>受理</option>
		  <option value="2" <#if sdResult=='2'>selected</#if>>告知</option>
		  <option value="3" <#if sdResult=='3'>selected</#if>>不予受理</option>
		  <option value="5" <#if sdResult=='5'>selected</#if>>其他</option>
	    </select></td>
	    
<input type="hidden" id="sdResult" value="${sdResult}" name="xzfyInfo.stadardResult">	    
<th></th>
<td></td>
  </tr>
   <tr >
    <th  width="20%">申请人：</td>
    <td width="30%">
    <textarea name="xzfyInfo.appdetail" id="user" ischeck="y" ><#if xzfyInfo.appdetail?has_content>${xzfyInfo.appdetail}</#if></textarea></td>
    <th  width="20%">收案日期：</td>
    <td width="30%">
    <input name="xzfyInfo.receive_date" id="receivedate" ischeck="y" readonly  altname="收案日期"  readonly
    type="text" onClick="WdatePicker()"  <#if xzfyInfo.receive_date?has_content>value="${xzfyInfo.receive_date}"</#if>>
      </td>
  </tr>

   <tr class="trwhite">
    <th>申请人总数：</td>
    <td><input name="xzfyInfo.renCount" type="text" id="rencount" ischeck="y"  class="inputTextNormal" altname="申请人总数" <#if xzfyInfo.renCount?has_content>value="${xzfyInfo.renCount}"</#if>></td>
	<th>&nbsp;</td>
    <td>&nbsp;</td>
   </tr>

   <tr class="trcolor">
    <th>申请人类别： </td>
    <td class="tdFormInput">
     <@ww.select  name="'xzfyInfo.app_type'" id="applicationtype" headerKey="''" headerValue=""  list="getDictMap('sqrlb')" value="'${xzfyInfo.app_type?default('')}'.toString()" onchange="'checksqr()'"/>
     <#--
    <select name="app_face.applicationtype" id="applicationtype" 
    class="selectStyleNormal"
     ischeck="y" altname="申请人类别">
     <#if app_face.applicationtype?has_content>
     <option value="0">----请选择----</option>
     <option value="1" <#if app_face.applicationtype=="1">selected</#if>公民</option>
	    <option value="2" <#if app_face.applicationtype=="2">selected</#if>法人或其他组织</option>
    <#else>
	    <option value="0">----请选择----</option>
	    <option value="1">公民</option>
	    <option value="2">法人或其他组织</option>
    </#if>
 
    </select>
    -->
    </td>
     <th>立案审查人姓名：</td>
    <td class="tdFormInput"><input name="xzfyInfo.user1_name" id="checker" type="text" ischeck="y" readonly altname="立案审查人姓名" class="inputTextNormal"  <#if xzfyInfo.user1_name?has_content>value="${xzfyInfo.user1_name}"</#if>></td>
    
  </tr>  
  

     <tr class="trwhite">
    <th>代表人名称：</td>
    <td class="tdFormInput"><input name="xzfyInfo.deputy_show" type="text" class="inputTextNormal" <#if xzfyInfo.deputy_show?has_content>value="${xzfyInfo.deputy_show}"<#else>value="无"</#if>> </td>
   <th>第三人：</td>
    <td class="tdFormInput"><input name="xzfyInfo.third" type="text" class="inputTextNormal"  <#if xzfyInfo.third?has_content>value="${xzfyInfo.third}"<#else>value="无"</#if>></td>
   </tr>   
   
   <tr class="trwhite">
    <th>代理人：</td>
    <td class="tdFormInput"><input name="xzfyInfo.agent_name" type="text" id="wtdlr" class="inputTextNormal"  <#if xzfyInfo.agent_name?has_content>value="${xzfyInfo.agent_name}"<#else>value="无"</#if>></td>
   <th>第三人代理人：</td>
    <td class="tdFormInput"><input name="xzfyInfo.third_agent" type="text" class="inputTextNormal"  <#if xzfyInfo.third_agent?has_content>value="${xzfyInfo.third_agent}"<#else>value="无"</#if>></td>
   </tr>

   <tr class="trwhite">
    <th>多人复议：</td>
    <td class="tdFormInput">
    <input type="radio" name="xzfyInfo.isMany" value="是"
    	<#if xzfyInfo.isMany?has_content&&xzfyInfo.isMany=="是">checked</#if>
    altname="多人复议" ischeck="y">
      <label for="xzpc_y">是 </label>
      <input type="radio" name="xzfyInfo.isMany" value="否"
      <#if xzfyInfo.isMany?has_content&&xzfyInfo.isMany=="否">checked</#if>
       altname="多人复议" ischeck="y">
      <label for="xzpc_n">否</label>
    </td>
   <th>复议机关类型：</td>
    <td class="tdFormInput">
	    <select name="xzfyInfo.xzfy_org" ischeck="y" altname="复议机关" class="selectStyleNormal" >
			
		  <option value="0">----请选择----</option>	  
		  <option value="2" <#if xzfyInfo.xzfy_org?has_content && xzfyInfo.xzfy_org=="2"> selected </#if>>县级政府</option>		  
		  <option value="3" <#if xzfyInfo.xzfy_org?has_content && xzfyInfo.xzfy_org=="3"> selected </#if>>县级政府的部门</option>	 
		  <option value="6" <#if xzfyInfo.xzfy_org?has_content && xzfyInfo.xzfy_org=="6"> selected </#if>>省部级行政机关</option>
		  <option value="7" <#if xzfyInfo.xzfy_org?has_content && xzfyInfo.xzfy_org=="7"> selected </#if>>省级政府的部门</option>
	    </select>
	</td>
   </tr>
  
  <tr class="trcolor">
  
   <th>被申请人种类：</th>
   <!--onchange="aaa(document.getElementById('beapptype').options[document.getElementById('beapptype').selectedIndex].value)"-->
    <td >
    
    <select name="xzfyInfo.defendant_type" id="beapptype" ischeck="y"
    altname="被申请人种类" class="selectStyleNormal" 
     onchange="aaa(document.getElementById('beapptype').options[document.getElementById('beapptype').selectedIndex].value)">

    <#if xzfyInfo.defendant_type?has_content>
      <option value="0">----请选择----</option>	
	  <option value="1" <#if xzfyInfo.defendant_type=="1">selected</#if>>乡镇政府</option>
	  <option value="2" <#if xzfyInfo.defendant_type=="2">selected</#if>>县级政府</option>
	  <option value="3" <#if xzfyInfo.defendant_type=="3">selected</#if>>县级政府部门</option>
	  <option value="6" <#if xzfyInfo.defendant_type=="6">selected</#if>>省部级行政机关</option>
	  <option value="7" <#if xzfyInfo.defendant_type=="7">selected</#if>>省级政府部门</option>
	  <option value="8" <#if xzfyInfo.defendant_type=="8">selected</#if>>其他</option>
	<#else>
	  <option value="0">----请选择----</option>	
	  <option value="1" >乡镇政府</option>
	  <option value="2" >县级政府</option>
	  <option value="3" >县级政府部门</option>
	  <option value="6" >省部级行政机关</option>
	  <option value="7" >省级政府部门</option>
	  <option value="8" >其他</option>
	  </#if>
	  	 
    </select></td>
        <th>复议前置：</th>
    <td >
	    <input type="radio" name="xzfyInfo.isfront" value="是"
    	<#if xzfyInfo.isfront?has_content&&xzfyInfo.isfront=="是">checked</#if>
    altname="复议前置" ischeck="y">
      <label for="xzpc_y">是 </label>
      <input type="radio" name="xzfyInfo.isfront" value="否"
      <#if xzfyInfo.isfront?has_content&&xzfyInfo.isfront=="否">checked</#if>
       altname="复议前置" ischeck="y">
      <label for="xzpc_n">否</label>
    </td>
 
    </tr>
    <tr >
      
    <th>被申请人名称：</th>   
     <td > 	     	     
	    <span  style="display:none;" id="beappnametd" >
	     <input name="ssss" type="text" class="inputTextNormal" id="beappnameinput" altname="被申请人名称"> 
	      <input name="sss" type="hidden" class="inputTextNormal" id="beappname2" >
	     </span>  
	     <span id="beappnamesel" style="display:block"> 
		    <#if xzfyInfo.defendant_name?has_content>
		    <select name="xzfyInfo.defendant_name" ischeck="y" id="beappname"
		     onchange="beappcode()" altname="被申请人名称" class="selectStyleNormal">
		      <option value="${xzfyInfo.defendant_name}" deptcode="">${xzfyInfo.defendant_name}</option>     	 
		    </select>
		    <#else>
			<select name="xzfyInfo.defendant_name" ischeck="y" id="beappname"
		     onchange="beappcode()" altname="被申请人名称" class="selectStyleNormal">
		        	 
		    </select>
		    </#if>	     
	     </span>
    </td> 
	 
    <th>申请复议事项：</th>
    <td>
   <#assign caseType=xzfyInfo.casetype?default('0')>
    <select name="xzfyInfo.casetype" ischeck="y" altname="申请复议事项"
     class="selectStyleNormal" id="xzfysx" onchange="sqfysx()">

     <option value="0">----请选择----</option>
     <option value="1" <#if caseType=="1">selected</#if>>行政处罚</option>
	 <option value="2" <#if caseType=="2">selected</#if>>行政强制措施</option>
	 <option value="3" <#if caseType=="3">selected</#if>>行政征收</option>
	 <option value="4" <#if caseType=="4">selected</#if>>行政许可</option>
	 <option value="5" <#if caseType=="5">selected</#if>>行政确权</option>
	 <option value="6" <#if caseType=="6">selected</#if>>干预经营自主权</option>
     <option value="7" <#if caseType=="7">selected</#if>>信息公开</option>
	 <option value="8" <#if caseType=="8">selected</#if>>行政不作为</option>
	 <option value="9" <#if caseType=="9">selected</#if>>其他</option>
	
    </select>
 
     <select  <#if caseType=="1"> name="xzfyInfo.casetype2"
      style="display:block"<#else>name="ss" style="display:none"</#if>
       altname="申请复议事项" class="selectStyleNormal" id="xzfysx2xzcf"
        ishidden="y" onchange="">
      <option value="0">----请选择----</option>
 	 <option value="1" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="1">selected</#if>>拘留</option>
	 <option value="2" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="2">selected</#if>>没收</option>
	 <option value="3" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="3">selected</#if>>罚款</option>
	 <option value="4" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="4">selected</#if>>其他</option>
	
  </select>
   <select <#if caseType=="2">
   name="xzfyInfo.casetype2" style="display:block"<#else>name="ss" 
   style="display:none"</#if> altname="申请复议事项" class="selectStyleNormal"
    id="xzfysx2xzqzcs" ishidden="y" onchange="">
      <option value="0">----请选择----</option>

	 <option value="5" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="5">selected</#if>>对人身的强制措施</option>
	 <option value="6" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="6">selected</#if>>对不动产的强制措施</option>
	 <option value="7" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="7">selected</#if>>对其它财产的强制措施</option>

  </select>
   <select <#if caseType=="3">name="xzfyInfo.casetype2" 
   style="display:block"<#else>name="ss" style="display:none"</#if> 
   altname="申请复议事项" class="selectStyleNormal" id="xzfysx2xzsx"
    ishidden="y" onchange="">
      <option value="0">----请选择----</option>

	 <option value="8" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="8">selected</#if>>征收土地</option>
	 <option value="9" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="9">selected</#if>>版税</option>
	 <option value="10" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="10">selected</#if>>收费</option>
	 <option value="11" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="11">selected</#if>>要求履行其他义务</option>	 
  </select>
     
    </td>
  </tr>

     <tr class="trcolor">
 
     <th>行政复议请求：</th>
    <td >
    
    <#assign qingqiu=xzfyInfo.xzfy_requset?default('')>
    <#assign neirong=''>
    <textarea name="xzfyInfo.xzfy_requset" id="xzfyqq1" type="text" 
     altname="行政复议请求"><#if qingqiu=="0">无
<#elseif qingqiu=="1">撤销该具体行政行为
	<#assign neirong='请求撤销该具体行政行为'>
<#elseif qingqiu=="2">变更该具体行政行为
	<#assign neirong='请求变更该具体行政行为'>
<#elseif qingqiu=="3">确认该具体行政行为违法
	<#assign neirong='请求确认该具体行政行为违法'>
<#elseif qingqiu=="4">责令被申请人履行法定职责
	<#assign neirong='请求责令被申请人履行法定职责'>
<#elseif qingqiu=="5">确认被申请人不履行法定职责违法
	<#assign neirong='请求确认被申请人不履行法定职责违法'>
<#else>${qingqiu}</#if></textarea></td>
    
    
    <th>行政管理类别：</td>
    <td class="tdFormInput">   
    <#if xzfyInfo.refer?has_content>
    <select name="xzfyInfo.refer" ischeck="y" class="selectStyleNormal"  id="ajsjfm1"
      altname="行政管理类别" onchange="ajgllb()">    
	<option value="0" <#if xzfyInfo.refer=="0">selected</#if>>----请选择----</option>   
	<option value="1" <#if xzfyInfo.refer=="1">selected</#if>>公安</option>
	<option value="2" <#if xzfyInfo.refer=="2">selected</#if>>国家安全</option>
	<option value="3" <#if xzfyInfo.refer=="3">selected</#if>>劳动和社会保障</option>
	<option value="4" <#if xzfyInfo.refer=="4">selected</#if>>司法行政</option>
	<option value="5" <#if xzfyInfo.refer=="5">selected</#if>>民政</option>
	<option value="6" <#if xzfyInfo.refer=="6">selected</#if>>农林环资</option>
	<option value="7" <#if xzfyInfo.refer=="7">selected</#if>>城建</option>
	<option value="8" <#if xzfyInfo.refer=="8">selected</#if>>工交商事</option>
	<option value="9" <#if xzfyInfo.refer=="9">selected</#if>>财政金融</option>
	<option value="10" <#if xzfyInfo.refer=="10">selected</#if>>教科文卫</option>
	<option value="11" <#if xzfyInfo.refer=="11">selected</#if>>其他</option>		
    </select>
    
    <#else>
    <select name="xzfyInfo.refer" ischeck="y" class="selectStyleNormal" id="ajsjfm1"
     altname="行政管理类别" onchange="ajgllb()">
        
	<option value="0">----请选择----</option>
	<option value="1">公安</option>
	<option value="2">国家安全</option>
	<option value="3">劳动和社会保障</option>
	<option value="4">司法行政</option>
	<option value="5">民政</option>
	<option value="6">农林环资</option>
	<option value="7">城建</option>
	<option value="8">工交商事</option>
	<option value="9">财政金融</option>
	<option value="10">教科文卫</option>
	<option value="11">其他</option>		
    </select>
    </#if>

     <select <#if xzfyInfo.refer?has_content&&xzfyInfo.refer=="1">name="xzfyInfo.refer2"
      style="display:block"<#else>name="ss" style="display:none"</#if> 
      class="selectStyleNormal" id="ajgllbga" altname="行政管理类别" ishidden="y">
        <option value="0">----请选择----</option>
	<option value="1" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="1">selected</#if>>治安</option>
	<option value="2" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="2">selected</#if>>劳教</option>
	<option value="3" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="3">selected</#if>>其他</option>
	 </select>
	 <!--农林环资-->
	 <select <#if xzfyInfo.refer?has_content&&xzfyInfo.refer=="6">name="xzfyInfo.refer2" 
	 style="display:block"<#else>name="ss" style="display:none"</#if>
	  class="selectStyleNormal" id="ajgllbnlhz" altname="行政管理类别" ishidden="y">
	  <option value="0">----请选择----</option>
	<option value="9" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="9">selected</#if>>土地</option>
	<option value="10" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="10">selected</#if>>地矿</option>
	<option value="11" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="11">selected</#if>>环保</option>
	<option value="12" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="12">selected</#if>>农业</option>
	<option value="13" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="13">selected</#if>>水利</option>
	<option value="14" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="14">selected</#if>>林业</option>
	<option value="15" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="15">selected</#if>>其他</option>
	
	</select>
	 <!--城建-->
	 <select <#if xzfyInfo.refer?has_content&&xzfyInfo.refer=="7">
	 name="xzfyInfo.refer2" style="display:block"<#else>name="ss" 
	 style="display:none"</#if> class="selectStyleNormal" id="ajgllbcj" altname="行政管理类别" ishidden="y">
	  <option value="0">----请选择----</option>
	<option value="17" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="17">selected</#if>>规划</option>
	<option value="18" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="18">selected</#if>>拆迁</option>
	<option value="19" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="19">selected</#if>>房屋登记</option>
	<option value="20" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="20">selected</#if>>其他</option>

	</select>
	 <!--工交商事-->
	 <select <#if xzfyInfo.refer?has_content&&xzfyInfo.refer=="8">
	 name="xzfyInfo.refer2" style="display:block"<#else>
	 name="ss" style="display:none"</#if> class="selectStyleNormal" 
	 id="ajgllbgjss" altname="行政管理类别" ishidden="y">
	  <option value="0">----请选择----</option>
	<option value="22" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="22">selected</#if>>工商</option>
	<option value="23" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="23">selected</#if>>质监</option>
	<option value="24" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="24">selected</#if>>商务</option>
	<option value="25" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="25">selected</#if>>物价</option>
	<option value="26" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="26">selected</#if>>能源</option>
	<option value="27" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="27">selected</#if>>交通</option>
	<option value="28" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="28">selected</#if>>信息产业</option>
	<option value="29" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="29">selected</#if>>邮政</option>
	<option value="30" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="30">selected</#if>>烟草专买</option>

	</select>
	 <!--财政金融-->
	 <select <#if xzfyInfo.refer?has_content&&xzfyInfo.refer=="9">
	 name="xzfyInfo.refer2" style="display:block"<#else>name="ss" 
	 style="display:none"</#if> class="selectStyleNormal" id="ajgllbczjr" altname="行政管理类别" ishidden="y">
	  <option value="0">----请选择----</option>
	<option value="32" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="32">selected</#if>>税务</option>
	<option value="33" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="33">selected</#if>>人民银行</option>
	<option value="34" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="34">selected</#if>>证监</option>
	<option value="35" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="35">selected</#if>>保监</option>
	<option value="36" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="36">selected</#if>>银监</option>
	<option value="37" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="37">selected</#if>>外汇</option>
	<option value="38" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="38">selected</#if>>财政</option>
	<option value="39" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="39">selected</#if>>统计</option>
	<option value="40" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="40">selected</#if>>审计</option>
	<option value="41" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="41">selected</#if>>海关</option>
	<option value="42" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="42">selected</#if>>商检</option>

	</select>
	 <!--教科文卫-->
	 <select <#if xzfyInfo.refer?has_content&&xzfyInfo.refer=="10">name="xzfyInfo.refer2" style="display:block"<#else>name="ss" style="display:none"</#if> class="selectStyleNormal" id="ajgllbjkww" altname="行政管理类别" ishidden="y">
	  <option value="0">----请选择----</option>
	<option value="44" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="44">selected</#if>>药监</option>
	<option value="45" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="45">selected</#if>>卫生</option>
	<option value="46" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="46">selected</#if>>计划生育</option>
	<option value="47" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="47">selected</#if>>教育</option>
	<option value="48" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="48">selected</#if>>文化</option>
	<option value="49" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="49">selected</#if>>专利</option>
	<option value="50" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="50">selected</#if>>商标</option>
	<option value="51" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="51">selected</#if>>版权</option>
	<option value="52" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="52">selected</#if>>旅游</option>

     </select>
     <div   id="divxzgllbinput">
     <#if xzfyInfo.referother?has_content>
    <input name="xzfyInfo.referother" type="text" altname="行政管理类别" value="${xzfyInfo.referother}"
     id="xzgllbinput" class="inputTextNormal">
     </#if>
    </div>
    </td>
 
    </tr>
      <tr class="trwhite">
 <th>被复议的具体行政行为名称：</td>
    <td class="tdFormInput">
	    <#if xzfyInfo.xwname?has_content>
	    <input name="xzfyInfo.xwname" type="text" id="TBeName" value="${xzfyInfo.xwname}"
	     ischeck="y" altname="被复议的具体行政行为">
	     <#else>
			 	<input name="xzfyInfo.xwname" type="text" id="TBeName" ischeck="y"
			 	class="inputTextNormal" altname="被复议的具体行政行为">
		 </#if>
    </td>
       <th>被复议的具体行政行为案号：</td>
    <td class="tdFormInput">
	    <#if xzfyInfo.xwnum?has_content>
	    <input name="xzfyInfo.xwnum" type="text" id="annum" value="${xzfyInfo.xwnum}"
	     ischeck="y" altname="被复议的具体行政行为案号">
	     <#else>
			 	<input name="xzfyInfo.xwnum" type="text" id="annum" ischeck="y"
			 	class="inputTextNormal" altname="被复议的具体行政行为案号">
		 </#if>
    </td>
    </tr> 
     <tr class="trcolor">
 		    <th>是否申请听证：</td>
		    <td class="tdFormInput">
		    <select name="xzfyInfo.istingzheng" altname="是否听证" id="istz">
			 <#if xzfyInfo.istingzheng?has_content>
			 <option value="是" <#if xzfyInfo.istingzheng=="是">selected</#if>>是</option>	
			 <option value="否" <#if xzfyInfo.istingzheng=="否">selected</#if>>否</option>
			 <#else>
			 <option value="是">是</option>	
			 <option value="否" selected>否</option>
			 </#if>
			</select>
		    </td>
		    <th>&nbsp;</td>
			 <td class="tdFormInput">&nbsp;
		    </tr>
  
  <tr class="trcolor">
    <th>是否申请行政赔偿：</td>
    <td class="tdFormInput"><input type="radio" name="xzfyInfo.ismoney" value="是"
    	<#if xzfyInfo.ismoney?has_content&&xzfyInfo.ismoney=="是">checked</#if>
    id="xzpc_y" altname="是否行政赔偿" ischeck="y">
      <label for="xzpc_y">是 </label>
      <input type="radio" name="xzfyInfo.ismoney" value="否" id="xzpc_n" 
      <#if xzfyInfo.ismoney?has_content&&xzfyInfo.ismoney=="否">checked</#if>
       altname="是否行政赔偿" ischeck="y">
      <label for="xzpc_n">否</label></td>

    <th>对规范性文件审查：</td>
    <td class="tdFormInput"><input type="radio" name="xzfyInfo.ischeck" value="是""
    	<#if xzfyInfo.ischeck?has_content&&xzfyInfo.ischeck=="是">checked</#if>
    id="xzpc_y" altname="对规范性文件审查" ischeck="y">
      <label for="xzpc_y">是 </label>
      <input type="radio" name="xzfyInfo.ischeck" value="否" id="xzpc_n" 
      <#if xzfyInfo.ischeck?has_content&&xzfyInfo.ischeck=="否">checked</#if>
       altname="对规范性文件审查" ischeck="y">
      <label for="xzpc_n">否</label></td>
  </tr>



     <tr class="trcolor">
    <th>是否经过案前调解：</td>
    <td class="tdFormInput">
    <select name="xzfyInfo.istiaojie" id="tjjg">
    	<#if xzfyInfo.istiaojie?has_content>
		<option value="1" <#if xzfyInfo.istiaojie?has_content&&xzfyInfo.istiaojie=="1">selected</#if>>案前调解</option>
		<option value="2" <#if xzfyInfo.istiaojie?has_content&&xzfyInfo.istiaojie=="2">selected</#if>>调解</option>
		<option value="3" <#if xzfyInfo.istiaojie?has_content&&xzfyInfo.istiaojie=="3">selected</#if>>否</option>
   	    
    <#else>
    		<option value="1">案前调解</option>
		<option value="2">调解</option>
		<option value="3" selected>否</option>
     </#if>
     </select>
      </td>
	<th>调解结果：</td>
    <td class="tdFormInput">
    <select name="xzfyInfo.tiaojie_result" id="tiaojie">
	<option value="无">无</option>
	<option value="成功">成功</option>
	<option value="不成功">不成功</option>
    </select>
      </td>
  </tr>
  
<#--
  <tr class="trwhite">
     <th>审查人意见：</td>
    <td class="tdFormInput" colspan=3><input name="xzfyInfo.firstSubmitResult" id="cbryj" type="text" class="inputTextNormal" size=100></td>
   </tr>
  <tr class="trwhite"> 
      <th>审查人提交日期：</td>
    <td class="tdFormInput"><input name="xzfyInfo.firstSubmitDate" id="cbrtjrq" ischeck="y" altname="审查人提交日期" onClick="WdatePicker()" type="text" class="inputTextNormal">
     <th>&nbsp;</td>
    <td class="tdFormInput">&nbsp;</td>
  </tr>
  -->
  
  <tr class="trcolor">
    <th>简要内容：<br>（限200字）</td>
    <td class="tdFormInput">
<textarea class="textarea" name="xzfyInfo.content_abstract" id="content"><#if xzfyInfo.content_abstract?has_content>${xzfyInfo.content_abstract}
<#elseif xzfyInfo.defendant_name?has_content>申请人不服被申请人${xzfyInfo.defendant_name}<#if xzfyInfo.xwnum?has_content>（${xzfyInfo.xwnum}）</#if>${neirong}。
<#else>${xzfyInfo.xzfy_requset?default("")}
</#if></textarea>
     </td>
	<th>备注：</td>
    <td class="tdFormInput">
<textarea class="textarea" name="xzfyInfo.remark" id="remark"></textarea>
      </td>
  </tr>

  </table>


 
</div>	 </div>

 <div>
<table  id=""class="ui-table  "   width="50%">
  <tfoot>
      <tr>
            <td>
            <#if isView?has_content>
            	<#if isView=='1'>
           		<input class="ui-btn ui-btn-normal" type="button"   value="保存" onClick="saveShencha()">
            	</#if>
           		<#if isView=='0'>
            	<input class="ui-btn ui-btn-normal" type="button"  value="返回" onClick="history.back()" class="button">
             	</#if>
             </#if>
            </td>
      </tr>
    </tfoot></table>
  </div>


</div>
</form>
</body>

<script language="javascript">

function getFacePage(type,id){
	if(type==1){
		window.open('../xzfy/editXzfy.action?xzfyId='+id+'&funcCode=447');
	}
}


function addnotchecked(){

	document.getElementById("addbegin").value="";
	document.getElementById("addend").value="";
	document.getElementById("buzheng").style.display='none';
	document.getElementById("scresult").value="0";
	document.getElementById("buzheng").style.display="none";
	document.getElementById("yaobuzheng5").style.display="none";
	document.getElementById("bzfs").value="";
	document.getElementById("shenpiBtn").style.display="none";
	document.getElementById("buzhengshenpi").style.display="none";
}

function ajgllb(){
	
	if(document.getElementById("ajsjfm1").value==1){		
		
		document.getElementById("ajgllbga").style.display="block";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="xzfyInfo.refer2";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="sss";

		
	}
	if(document.getElementById("ajsjfm1").value==6){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="block";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="xzfyInfo.refer2";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="sss";



	}
	if(document.getElementById("ajsjfm1").value==7){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="block";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="xzfyInfo.refer2";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="sss";
	}

	if(document.getElementById("ajsjfm1").value==8){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="block";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="xzfyInfo.refer2";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="sss";
	}
	if(document.getElementById("ajsjfm1").value==9){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="block";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="xzfyInfo.refer2";
		document.getElementById("ajgllbjkww").name="sss";
	}
	if(document.getElementById("ajsjfm1").value==10){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="block";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="xzfyInfo.refer2";
	}

	if(!(document.getElementById("ajsjfm1").value==1||document.getElementById("ajsjfm1").value==6||document.getElementById("ajsjfm1").value==7||document.getElementById("ajsjfm1").value==8||document.getElementById("ajsjfm1").value==9||document.getElementById("ajsjfm1").value==10))
	{
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="ss";
	}
	//document.getElementById("divxzgllbinput").innerHTML='<input name="app_face.TReferOther" type="text" altname="行政管理类别" id="xzgllbinput" class="inputTextNormal">';
}



function sqfysx(){
	if(document.getElementById("xzfysx").value==1){
	document.getElementById("xzfysx2xzcf").style.display="block";
	document.getElementById("xzfysx2xzqzcs").style.display="none";
	document.getElementById("xzfysx2xzsx").style.display="none";
	document.getElementById("xzfysx2xzqzcs").name="sss";
	document.getElementById("xzfysx2xzsx").name="sss";
	document.getElementById("xzfysx2xzcf").name="xzfyInfo.casetype2";
	}
	if(document.getElementById("xzfysx").value==2){	
	document.getElementById("xzfysx2xzcf").style.display="none";
	document.getElementById("xzfysx2xzqzcs").style.display="block";
	document.getElementById("xzfysx2xzsx").style.display="none";
	document.getElementById("xzfysx2xzqzcs").name="xzfyInfo.casetype2";
	document.getElementById("xzfysx2xzcf").name="sss";
	document.getElementById("xzfysx2xzsx").name="sss";
	}
	if(document.getElementById("xzfysx").value==3){
	document.getElementById("xzfysx2xzcf").style.display="none";
	document.getElementById("xzfysx2xzqzcs").style.display="none";
	document.getElementById("xzfysx2xzsx").style.display="block";
	document.getElementById("xzfysx2xzcf").name="sss";
	document.getElementById("xzfysx2xzqzcs").name="sss";
	document.getElementById("xzfysx2xzsx").name="xzfyInfo.casetype2";
	}
	if(!(document.getElementById("xzfysx").value==1||document.getElementById("xzfysx").value==2||document.getElementById("xzfysx").value==3))
	{
	document.getElementById("xzfysx2xzcf").style.display="none";
	document.getElementById("xzfysx2xzqzcs").style.display="none";
	document.getElementById("xzfysx2xzsx").style.display="none";
	document.getElementById("xzfysx2xzcf").name="sss";
	document.getElementById("xzfysx2xzsx").name="sss";
	document.getElementById("xzfysx2xzqzcs").name="sss";
	}
}
function setNotsend_n(){
	document.getElementById("scresult").value=0;
}
function setNotsend(){
   //document.getElementById("scresult").value=5;
   document.getElementById("ajsjfm1").value=0;
   document.getElementById("dlr1").value="";
   document.getElementById("dsdlr1").value="";
   document.getElementById("bfyjtxwah1").value="";
   document.getElementById("xzfyqq1").value="";
   document.getElementById("bfyjtxwmc1").value="";
   document.getElementById("addbegin").value="";
   document.getElementById("addend").value="";
   document.getElementById("cbrsubdate").value="";
   document.getElementById("cbropinion").value="";
   
   
   //document.getElementById("di3ren_y").checked=false;
  // document.getElementById("di3ren_n").checked=false;
   document.getElementById("xzpc_y").checked=false;
   document.getElementById("xzpc_n").checked=false;

   
   
}
function test(){
//alert(document.getElementById("deptid").value);
}
subcat = new Array();
var count=0;
<#-- 
<#list deptlist as dl>	
       subcat[${dl_index}]=new Array("${dl.type}","${dl.name}","${dl.locbm}"); 
       count++;    
</#list>
-->
   subcat[0]=new Array("6","北京市人民政府","0000"); 
       count++;    
       subcat[1]=new Array("2","东城区人民政府","0100"); 
       count++;    
       subcat[2]=new Array("2","西城区人民政府","0200"); 
       count++;    
       subcat[3]=new Array("2","崇文区人民政府","0300"); 
       count++;    
       subcat[4]=new Array("2","宣武区人民政府","0400"); 
       count++;    
       subcat[5]=new Array("2","朝阳区人民政府","0500"); 
       count++;    
       subcat[6]=new Array("2","海淀区人民政府","0600"); 
       count++;    
       subcat[7]=new Array("2","丰台区人民政府","0700"); 
       count++;    
       subcat[8]=new Array("2","石景山区人民政府","0800"); 
       count++;    
       subcat[9]=new Array("2","门头沟区人民政府","0900"); 
       count++;    
       subcat[10]=new Array("2","房山区人民政府","1000"); 
       count++;    
       subcat[11]=new Array("2","通州区人民政府","1100"); 
       count++;    
       subcat[12]=new Array("2","顺义区人民政府","1200"); 
       count++;    
       subcat[13]=new Array("2","大兴区人民政府","1300"); 
       count++;    
       subcat[14]=new Array("2","昌平区人民政府","1400"); 
       count++;    
       subcat[15]=new Array("2","平谷区人民政府","1500"); 
       count++;    
       subcat[16]=new Array("2","怀柔区人民政府","1600"); 
       count++;    
       subcat[17]=new Array("2","密云县人民政府","1700"); 
       count++;    
       subcat[18]=new Array("2","延庆县人民政府","1800"); 
       count++;    
       subcat[19]=new Array("7","市发展和改革委员会","1900"); 
       count++;    
       subcat[20]=new Array("7","市教育委员会","2000"); 
       count++;    
       subcat[21]=new Array("7","市科学技术委员会","2100"); 
       count++;    
       subcat[22]=new Array("7","市民族事务委员会","2200"); 
       count++;    
       subcat[23]=new Array("7","市公安局","2300"); 
       count++;    
       subcat[24]=new Array("7","市监察局","2400"); 
       count++;    
       subcat[25]=new Array("7","市民政局","2500"); 
       count++;    
       subcat[26]=new Array("7","市司法局","2600"); 
       count++;    
       subcat[27]=new Array("7","市财政局","2700"); 
       count++;    
       subcat[28]=new Array("7","市人力资源和社会保障局","2900"); 
       count++;    
       subcat[29]=new Array("7","市国土资源局","3000"); 
       count++;    
       subcat[30]=new Array("7","市规划委员会","3100"); 
       count++;    
       subcat[31]=new Array("7","市住房和城乡建设委员会","3200"); 
       count++;    
       subcat[32]=new Array("7","市市政市容管理委员会","3300"); 
       count++;    
       subcat[33]=new Array("7","市交通委员会","3400"); 
       count++;    
       subcat[34]=new Array("7","市水务局","3500"); 
       count++;    
       subcat[35]=new Array("7","市农村工作委员会","3600"); 
       count++;    
       subcat[36]=new Array("7","北京市商务局","3700"); 
       count++;    
       subcat[37]=new Array("7","市文化局","3800"); 
       count++;    
       subcat[38]=new Array("7","市卫生局","3900"); 
       count++;    
       subcat[39]=new Array("7","市人口和计划生育委员会","4000"); 
       count++;    
       subcat[40]=new Array("7","市审计局","4100"); 
       count++;    
       subcat[41]=new Array("7","市人民政府外事办公室","4200"); 
       count++;    
       subcat[42]=new Array("7","市国有资产监督管理委员会","4300"); 
       count++;    
       subcat[43]=new Array("7","市地方税务局","4400"); 
       count++;    
       subcat[44]=new Array("7","市工商行政管理局","4500"); 
       count++;    
       subcat[45]=new Array("7","市质量技术监督局","4600"); 
       count++;    
       subcat[46]=new Array("7","市环境保护局","4700"); 
       count++;    
       subcat[47]=new Array("7","北京市工业促进局","4800"); 
       count++;    
       subcat[48]=new Array("7","市农业局","4900"); 
       count++;    
       subcat[49]=new Array("7","市广播电影电视局","5000"); 
       count++;    
       subcat[50]=new Array("7","市新闻出版局","5100"); 
       count++;    
       subcat[51]=new Array("7","市文物局","5200"); 
       count++;    
       subcat[52]=new Array("7","市体育局","5300"); 
       count++;    
       subcat[53]=new Array("7","市统计局","5400"); 
       count++;    
       subcat[54]=new Array("7","市园林绿化局","5500"); 
       count++;    
       subcat[55]=new Array("7","市药品监督管理局","5600"); 
       count++;    
       subcat[56]=new Array("7","市安全生产监督管理局","5700"); 
       count++;    
       subcat[57]=new Array("7","市旅游局","5800"); 
       count++;    
       subcat[58]=new Array("7","市人民政府侨务办公室","5900"); 
       count++;    
       subcat[59]=new Array("7","市民防局","6000"); 
       count++;    
       subcat[60]=new Array("7","北京市信息化工作办公室","6100"); 
       count++;    
       subcat[61]=new Array("7","市城市管理综合行政执法局","6200"); 
       count++;    
       subcat[62]=new Array("7","市运输管理局","6300"); 
       count++;    
       subcat[63]=new Array("7","北京市交通执法总队","6400"); 
       count++;    
       subcat[64]=new Array("7","路政局","6500"); 
       count++;    
       subcat[65]=new Array("7","北京市乡镇企业局","6600"); 
       count++;    
       subcat[66]=new Array("7","市粮食局","6700"); 
       count++;    
       subcat[67]=new Array("7","市中医管理局","6800"); 
       count++;    
       subcat[68]=new Array("7","北京市地方海事局","6900"); 
       count++;    
       subcat[69]=new Array("7","市文化执法总队","6900"); 
       count++;    
       subcat[70]=new Array("7","市档案局","7000"); 
       count++;    
       subcat[71]=new Array("7","市国家保密局","7100"); 
       count++;    
       subcat[72]=new Array("7","市知识产权局","7200"); 
       count++;    
       subcat[73]=new Array("7","北京市投资促进局","7300"); 
       count++;    
       subcat[74]=new Array("7","市住房公积金管理中心","7400"); 
       count++;    
       subcat[75]=new Array("7","公安交通管理局","7500"); 
       count++;    
       subcat[76]=new Array("7","消防局","7600"); 
       count++;    
       subcat[77]=new Array("7","市地震局","7700"); 
       count++;    
       subcat[78]=new Array("7","北京市气象局","7800"); 
       count++;    
       subcat[79]=new Array("7","北京市通信管理局","7900"); 
       count++;    
       subcat[80]=new Array("7","市邮政管理局","8000"); 
       count++;    
       subcat[81]=new Array("7","市无线电管理局","8100"); 
       count++;    
       subcat[82]=new Array("7","市劳动教养工作管理局","8200"); 
       count++;    
       subcat[83]=new Array("8","市经济技术开发区管委会","8300"); 
       count++;    
       subcat[84]=new Array("7","市烟草专卖局","8400"); 
       count++;    
       subcat[85]=new Array("7","市爱国卫生运动委员会办公室","8400"); 
       count++;    
       subcat[86]=new Array("7","市政府台湾事务办公室","8500"); 
       count++;    
       subcat[87]=new Array("7","市人民政府新闻办公室","8600"); 
       count++;    
       subcat[88]=new Array("7","市商务委员会","8700"); 
       count++;    
       subcat[89]=new Array("7","中关村科技园区管理委员会","8800"); 
       count++;    
       subcat[90]=new Array("7","市社会建设工作办公室","8900"); 
       count++;    
       subcat[91]=new Array("7","市经济信息化委","9007"); 
       count++;    
       subcat[92]=new Array("7","市劳动教养管理委员会","9008"); 
       count++;    
       subcat[93]=new Array("7","市医院管理局","9009"); 
       count++;    
       

function setYJ(){
  <#--
	if(document.getElementById("scresult").value==1){
		document.getElementById("cbryj").value="　　建议立案，请    并灵雁同志阅示。"
	}else if(document.getElementById("scresult").value==2){
		document.getElementById("cbryj").value="　　不符合市政府行政复议受理条件，建议告知处理，请    并灵雁同志阅示。"
	}else if(document.getElementById("scresult").value==3){
		document.getElementById("cbryj").value="　　不符合市政府行政复议受理条件，建议不予受理，请    并灵雁同志阅示。"
	}else if(document.getElementById("scresult").value==5){
		document.getElementById("cbryj").value="　　建议不予立案，结案方式按照其他处理，请    并灵雁同志阅示。"
	}-->
}
function aaa(ss)
{
    if( document.getElementById('beapptype').value==8){
    document.getElementById("beappname").setAttribute("ischeck","y");
    document.getElementById("beappnamesel").style.display="block";
	document.getElementById("beappnametd").style.display="none";
	document.getElementById("beappname").name="xzfyInfo.defendant_name";
	document.getElementById("beappnameinput").name="ssss";
	document.getElementById("beappnameinput").removeAttribute("ischeck");	
	
    document.getElementById('beappname').length=0;
   var tempOption=new Option("北京经济技术开发区管理委员会","北京经济技术开发区管理委员会");
   document.getElementById('beappname').options[1] = tempOption;
  
   }
   else if(document.getElementById('beapptype').value==1||document.getElementById('beapptype').value==3){
	document.getElementById("beappnameinput").setAttribute("ischeck","y");
	
	document.getElementById("beappnametd").style.display="block";
	document.getElementById("beappnamesel").style.display="none";
	document.getElementById("beappnameinput").name="xzfyInfo.defendant_name";
	document.getElementById("beappname").name="ssss";
	document.getElementById("beappname").removeAttribute("ischeck");
   
   }
   else{
   document.getElementById("beappname").setAttribute("ischeck","y");
    document.getElementById("beappnamesel").style.display="block";
	document.getElementById("beappnametd").style.display="none";
	document.getElementById("beappname").name="xzfyInfo.defendant_name";
	document.getElementById("beappnameinput").name="ssss";
	document.getElementById("beappnameinput").removeAttribute("ischeck");
	 document.getElementById('beappname').length = 0; 
		document.getElementById('beappname').options[document.getElementById('beappname').length] = new Option("----请选择-----", "0");
        var locationid=locationid;
		var x;
        for (x=0; x < count; x++)
         {
            if (subcat[x][0] == ss)

               {   var tempOption=new Option(subcat[x][1], subcat[x][1]);tempOption.deptcode=subcat[x][2];
                   document.getElementById('beappname').options[document.getElementById('beappname').length] = tempOption;
                } 
           }
	}
}
function beappcode(){
	var code=document.getElementById('beappname').options[document.getElementById('beappname').selectedIndex].deptcode;	
	if(document.getElementById('beappname').value!=''){
	//var code=document.getElementById('beappname').deptcode;
	document.getElementById('deptid').value=code;	}
}


function checkfysx(){
	if(document.getElementById("xzfysx").value==1){
	if(document.getElementById("xzfysx2xzcf").value==0)
	return false;
	}
	if(document.getElementById("xzfysx").value==2){
	if(document.getElementById("xzfysx2xzqzcs").value==0)
	return false;
	}
	if(document.getElementById("xzfysx").value==3){
	if(document.getElementById("xzfysx2xzsx").value==0)
	return false;
	}


	return true;
}
function checkajgllb(){
	if(document.getElementById("ajsjfm1").value==0||(document.getElementById("ajsjfm1").value==1&&document.getElementById("ajgllbga").value==0)||(document.getElementById("ajsjfm1").value==6&&document.getElementById("ajgllbnlhz").value==0)||(document.getElementById("ajsjfm1").value==7&&document.getElementById("ajgllbcj").value==0)||(document.getElementById("ajsjfm1").value==8&&document.getElementById("ajgllbgjss").value==0)||(document.getElementById("ajsjfm1").value==9&&document.getElementById("ajgllbczjr").value==0)||(document.getElementById("ajsjfm1").value==10&&document.getElementById("ajgllbjkww").value==0))
	
	{return false;}
	
	else{

	return true;
	}
}
function check_remark(){
	if(document.getElementById("handle").value==2){
		document.getElementById("handle_detail").style.display="block";
		document.getElementById("advicespan").style.display="block";
		document.getElementById("check_select").style.display="block";
		document.getElementById("otherAdvice").style.display="block";
	}else if(document.getElementById("handle").value==3){
		document.getElementById("handle_detail").style.display="none";
		document.getElementById("advicespan").style.display="none";
		document.getElementById("check_select").style.display="none";
		document.getElementById("otherAdvice").style.display="none";
	}else{
		document.getElementById("handle_detail").style.display="none";
		document.getElementById("advicespan").style.display="none";
		document.getElementById("check_select").style.display="none";
		document.getElementById("otherAdvice").style.display="block";
	}
}

function getUser(){
	var name =encodeURIComponent(document.getElementById("appstring").value);
	if(name==""){
		alert("请填写被接待人名称！")
	}else{
		window.open ("../jds/checkApplication.action?appString="+name,'newwindow','height=300,width=400,top=300,left=300,toolbar=yes,menubar=yes,scrollbars=yes, resizable=yes'); 
	}
}

function getUser1(){
       
	var name = encodeURIComponent(document.getElementById("app_face.TDeputy").value);	
	if(name==""){
		alert("请填写代表人名称！")
	}else{
	window.open ("../jds/dupdenamecheck.action?TDeputy="+name,'newwindow','height=300,width=400,top=300,left=300,toolbar=yes,menubar=yes,scrollbars=yes, resizable=yes'); 
	}
}

function sendchecknull(){
	/*
	if(document.getElementById("user").value=="") {alert("请填写申请人!");return false;}
	else if(document.getElementById("receivedate").value=="") {alert("请填写收案日期!");return false;}
	else if(document.getElementById("applicationtype").value==0) {alert("请填写申请人类别!");return false;}
	
	else if(!document.getElementById("duoren_y").checked&&!document.getElementById("duoren_n").checked) {alert("请填写多人复议!");return false;}
	else if(document.getElementById("beapptype").value==0) {alert("请填写被申请人种类!");return false;}
	else if((document.getElementById("beappname").value==0)&&(document.getElementById("beappname2").value=="")) {alert("请填写被申请人名称!");return false;}
	
	else if(document.getElementById("xzfysx").value==0) {alert("请填写申请复议事项!");return false;}
	else if(document.getElementById("senddept3").value=="") {alert("请填写转送机构名称!");return false;}
	*/
	return true;
}

function jashow(){
	
	if(document.getElementById("isShenpi").value==1 || document.getElementById("checkStatus").value==1){
		document.getElementById("scresult").value==0;
		alert("审批中！无法选择！");
		return false;
	}
	
    if(document.getElementById("scresult").value==2||document.getElementById("scresult").value==3||document.getElementById("scresult").value==5){
      document.getElementById("laBtn").style.display="none";
      document.getElementById("isShoulishenpi").style.display="none";
      document.getElementById("lianshenpi1").style.display="none";
	   // senddept.style.display='block';
	   // senddept1.style.display='block';
	    document.getElementById("jatbody").style.display="block";
	    document.getElementById("jzfz").style.display="none";
	    //document.getElementById("filegz").style.display="none";
      	//结案审批区域
	    document.getElementById("isjashenpi").style.display="block";
	    document.getElementById("bujieanshenpi").style.display="none";
	    document.getElementById("jaBtn").style.display="block";
	    document.getElementById("yaojieanshenpi1").style.display="block";
	    document.getElementById("yaojieanshenpi2").style.display="block";
	    document.getElementById("yaojieanshenpi3").style.display="none";
	    document.getElementById("yaojieanshenpi4").style.display="none";
	    document.getElementById("jieannBtn").style.display="block";
	    document.getElementById("isJieanshenpi").value = "1";
	    
	    
	} <#--else if(document.getElementById("scresult").value==10){
		 document.getElementById("jatbody").style.display="none";
	    document.getElementById("jzfz").style.display="block";
	    //document.getElementById("buzheng").style.display="block";
	    //document.getElementById("filegz").style.display="block";

		
	
		if(document.getElementById("isBuzheng").value==0){
				alert("补证审批才可以选择此项！");
				document.getElementById("scresult").value=0;
				return false;
		}
	}-->
	else if(document.getElementById("scresult").value==1){
		document.getElementById("jatbody").style.display="none";
	    document.getElementById("jzfz").style.display="block";
	    //立案审批区域   
	    document.getElementById("laBtn").style.display="block";
      	document.getElementById("isShoulishenpi").style.display="block";
      	document.getElementById("isLianshenpi").value="1";
      	document.getElementById("lianxuanze1").style.display="block";
      	document.getElementById("lianxuanze2").style.display="block";
      	document.getElementById("lianxuanze3").style.display="none";
      	document.getElementById("lianxuanze4").style.display="none";
      	document.getElementById("lianBtn").style.display="block";
      	//结案审批区域
	    document.getElementById("isjashenpi").style.display="none";
	    document.getElementById("bujieanshenpi").style.display="none";
	    document.getElementById("jaBtn").style.display="none";
	} else{
	    //senddept.style.display='none';
	    //senddept1.style.display='none';
	   // document.getElementById("filegz").style.display="none";
	    document.getElementById("jatbody").style.display="none";
	    document.getElementById("jzfz").style.display="block";
	    //document.getElementById("senddept3").value="";   
	    //立案审批区域   
	    document.getElementById("laBtn").style.display="none";
      document.getElementById("isShoulishenpi").style.display="none";
      document.getElementById("lianshenpi1").style.display="none";
      	//结案审批区域
	    document.getElementById("isjashenpi").style.display="none";
	    document.getElementById("bujieanshenpi").style.display="none";
	    document.getElementById("jaBtn").style.display="none";
	}
	
}

function scjlchange(){
	if(document.getElementById("scresult").value==4){
	senddept.style.display='block';
	senddept1.style.display='block';
	document.getElementById("sendtbody").style.display="block";
	//sendnotuse.style.display='none';
	//shencha.style.display='none';
	//buzheng.style.display='none';
	//setNotsend();
	}
	else{
	senddept.style.display='none';
	senddept1.style.display='none';
	document.getElementById("sendtbody").style.display="none";
	document.getElementById("senddept3").value="";
	//sendnotuse.style.display='block';
	//shencha.style.display='block';
	//setNotsend_n();
	}
}

function update(){
		var aaid = document.getElementById("Aid").value;
		
	    if(confirm("确定要修改吗？"))
	    {
		listForm_= document.getElementById("form1");
		
		listForm_.action="../jds/App_FaceUpdateAction.action?funcCode=${funcCode}&&id="+aaid;
		listForm_.submit();
	   }

}

function finishShencha(){
	
	
	if(!checknull()){return false;}

	var status;
	if(document.getElementById("scresult").value==0){
			alert("请选择来件处理！"); 
			return false;
	} else if(document.getElementById("scresult").value==2||document.getElementById("scresult").value==3||document.getElementById("scresult").value==5){
		if (document.getElementById("finish_date").value==""){
			alert("请填写结案日期！"); 
			return false;
		}
		status=12;
	} else if(document.getElementById("scresult").value==1){
		if (document.getElementById("lian_date").value==""){
			alert("请填写立案日期！"); 
			return false;
		}
		status=4;
	}
	
	
	if(confirm("确定要提交吗？")){
			listForm_= document.getElementById("form1");
			listForm_.action="../xzfy/finishLianshencha.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&status="+status;
			listForm_.submit();
	}

}

function saveShencha(){
	if(document.getElementById("rencount").value==""){
		alert("请填写申请人总数！")
		return false;
	}

	if(confirm("确定要保存吗？"))
	    {
	    
		listForm_= document.getElementById("form1");
		
		listForm_.action="../xzfy/saveLianInfo.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}";
		
		listForm_.submit();
	}

}

function subDJA(){ 
	listForm_= document.getElementById("form1");
	if(document.getElementById("finishtype1").value==0){alert("请选择结案方式!");return;}
	if(document.getElementById("finishtype1").value==8){if(document.getElementById("finishtype2").value==0){alert("请选择结案方式!");return;}}
	if(!document.getElementById("compensate_y").checked&&!document.getElementById("compensate_n").checked){alert("请选择国家赔偿!");return;}
	var doubleReg=/^\d+(\.?\d{2})?$/;	
	if(document.getElementById("compensate_y").checked&&(!doubleReg.test(document.getElementById("countrycompensatenum").value))){alert("请输入赔偿数额!");return;}
	//if(!document.getElementById("finishreport_y").checked&&!document.getElementById("finishreport_n").checked){alert("请选择是否上传结案文书!");return;}
	//if(listForm_.file2.value==""&&document.getElementById("finishreport_y").checked){
	if(listForm_.file2.value==""){
		alert("请上传结案文书!");return;
		}
	//if(listForm_.file2.value!=""&&document.getElementById("finishreport_y").checked){
	if(listForm_.file2.value!=""){
		if(!(listForm_.file2.value.substring(listForm_.file2.value.length-3,listForm_.file2.value.length)=="doc"||listForm_.file2.value.substring(listForm_.file2.value.length-3,listForm_.file2.value.length)=="xls"||listForm_.file2.value.substring(listForm_.file2.value.length-3,listForm_.file2.value.length)=="rar"||listForm_.file2.value.substring(listForm_.file2.value.length-3,listForm_.file2.value.length)=="pdf"||listForm_.file2.value.substring(listForm_.file2.value.length-3,listForm_.file2.value.length)=="ppt"))
		{alert("请确认结案文书文件格式!");return;}
		}
	if(!document.getElementById("opinion_y").checked&&!document.getElementById("opinion_n").checked){alert("请选择是否上传行政复议意见书!");return;}
	if(listForm_.file.value==""&&document.getElementById("opinion_y").checked){alert("请上传行政复议意见书!");return;}
	if(listForm_.file.value!=""&&document.getElementById("opinion_y").checked){
		if(!(listForm_.file.value.substring(listForm_.file.value.length-3,listForm_.file.value.length)=="doc"||listForm_.file.value.substring(listForm_.file.value.length-3,listForm_.file.value.length)=="xls"||listForm_.file.value.substring(listForm_.file.value.length-3,listForm_.file.value.length)=="rar"||listForm_.file.value.substring(listForm_.file.value.length-3,listForm_.file.value.length)=="pdf"||listForm_.file.value.substring(listForm_.file.value.length-3,listForm_.file.value.length)=="ppt"))
		{alert("请确认行政复议意见书文件格式!");return;}
		}
	if(!document.getElementById("advise_y").checked&&!document.getElementById("advise_n").checked){alert("请选择是否上传行政复议建议书!");return;}
	if(listForm_.file1.value==""&&document.getElementById("advise_y").checked){alert("请上传行政复议建议书!");return;}
	if(listForm_.file1.value!=""&&document.getElementById("opinion_y").checked){
	if(!(listForm_.file1.value.substring(listForm_.file1.value.length-3,listForm_.file1.value.length)=="doc"||listForm_.file1.value.substring(listForm_.file1.value.length-3,listForm_.file1.value.length)=="xls"||listForm_.file1.value.substring(listForm_.file1.value.length-3,listForm_.file1.value.length)=="rar"||listForm_.file1.value.substring(listForm_.file1.value.length-3,listForm_.file1.value.length)=="pdf"||listForm_.file1.value.substring(listForm_.file1.value.length-3,listForm_.file1.value.length)=="ppt"))
		{alert("请确认行政复议建议书文件格式!");return;}
	}
	
	
	return true;
	
	
}


function checknull()
{
	var intReg=/^[0-9]*[1-9][0-9]*$/;
	var a=document.getElementsByTagName("input");
	var isbz=0;
	
	for(var i=0;i<a.length;i++)
	{
		if(a.item(i).ischeck){
		    if(a.item(i).type=="radio")
			{
			if(!(((document.getElementsByName(a.item(i).name)[0]).checked)||((document.getElementsByName(a.item(i).name)[1]).checked)))
				{
				alert("请填写:"+document.getElementsByName(a.item(i).name)[0].altname+"!");return false;}			
			}
			else if(a.item(i).value==""){
			alert("请填写:"+a.item(i).altname+"!");return false;
			}
		}	

	}
	
	var a=document.getElementsByTagName("select");
	for(var i=0;i<a.length;i++)
	{
		if(a.item(i).ischeck){
			if(a.item(i).value=="0"){
			alert("请填写:"+a.item(i).altname+"!");return false;
			}			
		}
		
	}
	
	if(!checkfysx()){alert("请填写申请复议事项!");return false;}
	if(!checkajgllb()){alert("请填写行政管理类别!");return false;}
	return true;
}

function setAdvice(ev){
	var udiv=document.getElementById("adviceDiv");
	var userspan=document.getElementById("advicespan");
	var areaObject=document.getElementById("handle_detail");
	if(udiv.style.display!="block"){
	ev = ev || window.event;
	var mousePos = getPosition(areaObject);
	udiv.style.position = "absolute";
	udiv.style.top      = mousePos.y+20;
	udiv.style.left     = mousePos.x+180;
	udiv.style.display="block";
	userspan.style.display="none";
	closeSelect();
	}
}

function closeAdvice(){
	var userspan=document.getElementById("advicespan");
	userspan.style.display="block";
	document.getElementById("adviceDiv").style.display="none";
	openSelect();
}

function rechekAadvice(){
	document.getElementById("handle_detail").value="";

}

function addAdvice(advice){
	document.getElementById("handle_detail").value=advice;
}

function showTiaojie(){
	var tiaojie = document.getElementById("xzpc_y").value;
	
	if(tiaojie=="是"){
		document.getElementById("otherDetail").style.display="block";	
	}
	
}
function showTiaojie2(){

	var tiaojie2 = document.getElementById("xzpc_n").value;
	if(tiaojie2=="否"){
		document.getElementById("otherDetail").style.display="none";
	}
}

 var xmlHttp;
        function createXMLHttpRequest() {
            if (window.ActiveXObject) {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            } 
            else if (window.XMLHttpRequest) {
                xmlHttp = new XMLHttpRequest();                
            }
        }


	function getTitleList(){
		createXMLHttpRequest();
		var tjzfzh=encodeURIComponent(document.getElementById("tjzfzh").value);
		var url = "../jds/chengJzfz.action?appname="+tjzfzh;
		xmlHttp.onreadystatechange = stringCallback;
		xmlHttp.open("GET", url, true);
		xmlHttp.setRequestHeader("contentType","text/html;charset=UTF-8");
		xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xmlHttp.send(null);
		
	}

	function stringCallback(){		
		if (xmlHttp.readyState == 4) {
				  if (xmlHttp.status == 200) { 		  
					var titleList=document.getElementById("checkJzfz");
					titleList.value=xmlHttp.responseText;		
					if(titleList.value==1){
						alert("案号重复，请重新输入！");
						document.getElementById("tjzfzh").value="京政复字[200]号";
						
					}

				}
			}
	}
	
	function shifoubuzheng(){
		if(document.getElementById("isBuzheng").value=="1"){
			document.getElementById("buzhengshenpi").style.display="none";
			document.getElementById("bzfs").value = "书面通知";
			document.getElementById("scresult").value = "10";
			document.getElementById("yaobuzheng1").style.display="block";
			document.getElementById("yaobuzheng2").style.display="block";
			document.getElementById("yaobuzheng3").style.display="none";
			document.getElementById("yaobuzheng4").style.display="none";
			document.getElementById("yaobuzheng5").style.display="block";
			document.getElementById("spBtn").style.display="block";
		} else {
			document.getElementById("buzhengshenpi").style.display="block";
			document.getElementById("yaobuzheng1").style.display="none";
			document.getElementById("yaobuzheng2").style.display="none";
			document.getElementById("yaobuzheng3").style.display="block";
			document.getElementById("yaobuzheng4").style.display="block";
			document.getElementById("yaobuzheng5").style.display="block";
			document.getElementById("spBtn").style.display="none";
		}
	}
	
	function jieanshenpi1(){
		if(document.getElementById("isJieanshenpi").value=="1"){
			document.getElementById("bujieanshenpi").style.display="none";
			document.getElementById("yaojieanshenpi1").style.display="block";
			document.getElementById("yaojieanshenpi2").style.display="block";
			document.getElementById("yaojieanshenpi3").style.display="none";
			document.getElementById("yaojieanshenpi4").style.display="none";
			document.getElementById("jieannBtn").style.display="block";
		} else {
			document.getElementById("bujieanshenpi").style.display="block";
			document.getElementById("yaojieanshenpi1").style.display="none";
			document.getElementById("yaojieanshenpi2").style.display="none";
			document.getElementById("yaojieanshenpi3").style.display="block";
			document.getElementById("yaojieanshenpi4").style.display="block";
			document.getElementById("jieannBtn").style.display="none";
		}
	}
	

	
	
	function getShouLi(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131019091018&d_username=panglei&caseId=${xzfyId}";
		window.open(url);
	}
	
	function getRefuse(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131019091855&d_username=panglei&caseId=${xzfyId}";
		window.open(url);	
	}
	
	function getYijian(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131017113148&d_username=panglei&caseId=${xzfyId}";
		window.open(url);	
	}
	
	function getJianyi(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131017134544&d_username=panglei&caseId=${xzfyId}";
		window.open(url);	
	}
	
	function chooseBzfs(){
		if(document.getElementById("isBuzheng").value=="1"){
			alert("补正审批必须为书面通知！");
			document.getElementById("bzfs").value = "书面通知";
		}
	}
	
	function setChuli(){
		document.getElementById("buzheng").style.display="block";
		document.getElementById("yaobuzheng5").style.display="block";
		document.getElementById("isBuzheng").value=1;
		document.getElementById("bzfs").value="书面通知";
		document.getElementById("shenpiBtn").style.display="block";
	}
	
	
	function tijiaoBuzhengReturn(response) {
		document.getElementById("isShenpi").value = 1;
		document.getElementById("spBtn").style.display = "none";
		alert("审批已经提交！");
	}
	
	function tijiaoLian(){
		if(document.getElementById("lianSpr").value==""){
			alert("请选择审批人！");return false;
		}
		var shenpiren = document.getElementById("lianSpr").value;
		url="../other/tijiaoShenpi.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&shenpiren1="+encodeURI(shenpiren)+"&status=3";
		alert(url);
       var myAjax = new Ajax.Request(
                  url, // 请求的URL
                {
                    method: 'get', // 使用post方式发送HTTP请求
                    onComplete: tijiaoLianReturn // 指定请求成功完成时需要执行的方法
                }
            );
	}
	
	function tijiaoLianReturn(response) {
		document.getElementById("isShenpi").value = 1;
		document.getElementById("lianBtn").style.display = "none";
		alert("审批已经提交！");
	}
	
	function tijiaoJiean(){
		if(document.getElementById("jieanSpr").value==""){
			alert("请选择审批人！");return false;
		}
		var shenpiren = document.getElementById("jieanSpr").value;
		url="../other/tijiaoShenpi.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&shenpiren1="+encodeURI(shenpiren)+"&status=11";
		alert(url);
       var myAjax = new Ajax.Request(
                  url, // 请求的URL
                {
                    method: 'get', // 使用post方式发送HTTP请求
                    onComplete: tijiaoJieanReturn // 指定请求成功完成时需要执行的方法
                }
            );
	}
	
	function tijiaoJieanReturn(response) {
		document.getElementById("isShenpi").value = 1;
		document.getElementById("jieannBtn").style.display = "none";
		alert("审批已经提交！");
	}
	
    function fBuzheng(){
	    if(document.getElementById("isShenpi").value==1 || document.getElementById("checkStatus").value==1){
			alert("审批中！无法完成！");
			return false;
		}
	  
	  if(document.getElementById("isBuzheng").value=="0"){

	  	if(document.getElementById("shenpiren").value==""){
			alert("请填写补证批准人！");
			return false;
	  	}
	  	if(document.getElementById("shenpishijian").value==""){
			alert("请填写批准时间！");
			return false;
	  	}
	  	if(document.getElementById("shenpiyijian").value==""){
			alert("请填写批准意见！");
			return false;
	  	}
	  }
	  
	  
      var isShenpi;
		if (document.getElementById("isBuzheng").value=="1"){
			isShenpi = 1;
		} else {
			isShenpi = 0;
		}	
		var spr = document.getElementById("shenpiren").value;
		var spDate = document.getElementById("shenpishijian").value;
		var spYijian = document.getElementById("shenpiyijian").value;
		url="../other/wanchengShenpi.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&isShenpi="+isShenpi+"&spr="+encodeURI(spr)+"&spDate="+spDate+"&spYijian="+encodeURI(spYijian)+"&status=2";
		//alert(url);
			 var myAjax = new Ajax.Request(
                  url, // 请求的URL
                {
                    method: 'get', // 使用post方式发送HTTP请求
                    onComplete: wanchengBuzhengReturn // 指定请求成功完成时需要执行的方法
                }
            );
	}
	
	function wanchengBuzhengReturn(response) {
		document.getElementById("yishenpiren").innerHTML=response.responseText;
		document.getElementById("seshenpiren").innerHTML=response.responseText;
		alert("审批完成！");
	}
	
	function fLian(){
      if(document.getElementById("isShenpi").value==1 || document.getElementById("checkStatus").value==1){
			alert("审批中！无法完成！");
			return false;
		}
	  
	  if(document.getElementById("isLianshenpi").value=="0"){

	  	if(document.getElementById("lashenpiren").value==""){
			alert("请填写立案批准人！");
			return false;
	  	}
	  	if(document.getElementById("lashenpishijian").value==""){
			alert("请填写批准时间！");
			return false;
	  	}
	  	if(document.getElementById("lashenpiyijian").value==""){
			alert("请填写批准意见！");
			return false;
	  	}
	  }
	  
	  
      var isShenpi;
		if (document.getElementById("isLianshenpi").value=="1"){
			isShenpi = 1;
		} else {
			isShenpi = 0;
		}	
		var spr = document.getElementById("lashenpiren").value;
		var spDate = document.getElementById("lashenpishijian").value;
		var spYijian = document.getElementById("lashenpiyijian").value;
		url="../other/wanchengShenpi.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&isShenpi="+isShenpi+"&spr="+encodeURI(spr)+"&spDate="+spDate+"&spYijian="+encodeURI(spYijian)+"&status=3";
		alert(url);
			 var myAjax = new Ajax.Request(
                  url, // 请求的URL
                {
                    method: 'get', // 使用post方式发送HTTP请求
                    onComplete: wanchengLianReturn // 指定请求成功完成时需要执行的方法
                }
            );
	}
	
	function wanchengLianReturn(response) {
		document.getElementById("lianSprShow1").innerHTML=response.responseText;
		document.getElementById("lianSprShow2").innerHTML=response.responseText;
		alert("审批完成！");
	}
	
	function fjiean(){
      if(document.getElementById("isShenpi").value==1 || document.getElementById("checkStatus").value==1){
			alert("审批中！无法完成！");
			return false;
		}
	  
	  if(document.getElementById("isJieanshenpi").value=="0"){

	  	if(document.getElementById("jaShenpiren").value==""){
			alert("请填写立案批准人！");
			return false;
	  	}
	  	if(document.getElementById("jaShenpishijian").value==""){
			alert("请填写批准时间！");
			return false;
	  	}
	  	if(document.getElementById("jaShenpiyijian").value==""){
			alert("请填写批准意见！");
			return false;
	  	}
	  }
	  
	  
      var isShenpi;
		if (document.getElementById("isJieanshenpi").value=="1"){
			isShenpi = 1;
		} else {
			isShenpi = 0;
		}	
		var spr = document.getElementById("jaShenpiren").value;
		var spDate = document.getElementById("jaShenpishijian").value;
		var spYijian = document.getElementById("jaShenpiyijian").value;
		url="../other/wanchengShenpi.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&isShenpi="+isShenpi+"&spr="+encodeURI(spr)+"&spDate="+spDate+"&spYijian="+encodeURI(spYijian)+"&status=3";
		alert(url);
			 var myAjax = new Ajax.Request(
                  url, // 请求的URL
                {
                    method: 'get', // 使用post方式发送HTTP请求
                    onComplete: wanchengJieanReturn // 指定请求成功完成时需要执行的方法
                }
            );
	}
	
	function wanchengJieanReturn(response) {
		document.getElementById("jieanSprShow1").innerHTML=response.responseText;
		document.getElementById("jieanSprShow2").innerHTML=response.responseText;
		alert("审批完成！");
	}
	
	function shifouLianShenpi() {
		if (document.getElementById("isLianshenpi").value=="1"){
			document.getElementById("lianshenpi1").style.display="none";
			document.getElementById("lianBtn").style.display="block";
			document.getElementById("lianSpr").style.display="block";
			document.getElementById("lianxuanze1").style.display="block";
			document.getElementById("lianxuanze2").style.display="block";
			document.getElementById("lianxuanze3").style.display="none";
			document.getElementById("lianxuanze4").style.display="none";
		} else {
			document.getElementById("lianshenpi1").style.display="block";
			document.getElementById("lianBtn").style.display="none";
			document.getElementById("lianSpr").style.display="none";
			document.getElementById("lianxuanze1").style.display="none";
			document.getElementById("lianxuanze2").style.display="none";
			document.getElementById("lianxuanze3").style.display="block";
			document.getElementById("lianxuanze4").style.display="block";
		}
	}
</script>
</html>
