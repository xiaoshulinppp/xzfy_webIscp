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
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
	function getBuzhengtongzhi(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	

	function savaToLaDoc(){
	/*
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
		*/
		getLiantongzhi();
}
	
	function getLiantongzhi(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131021113134&d_username=panglei&caseId=${xzfyInfo.id}";
		window.open(url,'mainwindow','location=no,resizable=yes');
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
		window.open(url,'mainwindow','location=no,resizable=yes');
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
		window.open('../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&checkDocType='+type+'&isView=1&funcCode=${funcCode}');
	}
</script>
<form action="''" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
<div class="ui-flod-cnt fn-clear" id="page1">
<div class="ui-form fn-clear">

<br>
<#assign isShowBtn=xzfyInfo.check_status?default('0')>
<#assign sdResult=xzfyInfo.stadardResult?default('0')>
 <table  id="shouli_tr1" class="ui-table ui-table-form "  
 
  >
  <tr>
  <td colspan="4" align="center"><font color="red">立案审理 </font></td>
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
    <td colspan="3">
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
    <th>受理通知：</th>
    <td >
<a href="#" class="btn-blue btn" onclick="javascript:savaToLaDoc()">查看</a>
      </td>
	<th>立案审批单：</td>
    <td class="tdFormInput">
    <a href="#" class="btn-blue btn" onclick="javascript:getCheckForm('3')">预览</a>
      </td>
  </tr>


</table>

 
</div>
 <div>
<table  id=""class="ui-table  "   width="50%">
  <tfoot>
      <tr>
            <td>
            <input class="ui-btn ui-btn-normal" type="button"  value="返回" onClick="history.back()" class="button">
            </td>
      </tr>
    </tfoot></table>
  </div>


</div>
</form>
</body>


</html>