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
	/*
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
		*/
		getJieantongzhi();
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

<br>
<#assign isShowBtn=xzfyInfo.check_status?default('0')>
<#assign sdResult=xzfyInfo.stadardResult?default('0')>
<table  id="jiean_div" class="ui-table ui-table-form "  >
   <tr>
  <td colspan="4" align="center"><font color="red">结案审批 </font></td>
  </tr>
 <#assign finish_type1=xzfyInfo.finish_type?default('0')>
 <#assign finish_type2=xzfyInfo.finishBreakType?default('0')>
    <tr class="trcolor">
     <th class="tdFormText" width="20%">结案方式：</td>
     <td class="tdFormInput" width="30%">
         <select name="xzfyInfo.finish_type" disable id="finishtype1" class="selectStyleNormal" onchange="setFT()">
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
    <td colspan="3">
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
    <th>不予受理通知：</th>
    <td >
<a href="#" class="btn-blue btn" onclick="javascript:savaToJaDoc()">查看</a>
      </td>
	<th>结案审批单：</td>
    <td class="tdFormInput">
    <a href="#" class="btn-blue btn" onclick="javascript:getCheckForm(11)">预览</a>
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
