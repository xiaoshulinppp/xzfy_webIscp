<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/base.css" rel="stylesheet" type="text/css" />
		<link href="../${Session['_USER_STYLE_'].cssPath}/main_style_spl.css" rel="stylesheet" type="text/css" />
	
	<!--                       Javascripts 注意不要改变顺序                      -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
<script language = "javascript" src = "../js/Lprint.js"></script>
<script language="javascript" src="../js/LodopFuncs.js"></script>
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<object id="LODOP" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
 <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0 pluginspage="../js/install_lodop.exe"></embed>
</object> 
</script>
<style>
	.formDiv{background:#ffff;border:1px solid #dcdcdc;box-shadow:0px 0px 15px 5px rgba(0,0,0,0.3);padding:20px 20px 20px 20px;width:700px;margin:10px auto;line-height:26px;font-size:12px;}
	.fl{float:left;}
	.fr{float:right;}
	.fra{display:block; width:77px; height:27px; line-height:27px; font-weight:bold; text-align:center; border:#eeeded solid 1px; margin-right:250px; float:right;}
	.btn{display:block; width:260px; height:27px;}
</style>
<title>邮单套打（国内EMS）</title>
</head>
<body style="background-image:url(../images/ems-img1.png);background-repeat:no-repeat;">
<#--<div style="position:absolute; left:0; top:0; width:100%; height:100%"><img src="../images/ems-img1.png" width=100% height=100%></div>-->
<div>

<form name="form1" id="form1" action="" method="post">
	<input type="hidden" name="funcCode" value="${funcCode}" />	
	<input type="hidden" id="caseNO" name="caseNO" value="${xzfyInfo.tjzfzh?default('')}"/>
		
	<input name="_fieldvalue_sp_f250" id="_fieldvalue_sp_f250" type="hidden" value="${_fieldvalue_sp_f250?default("")}" >
	<input name="_fieldvalue_comaddress" id="_fieldvalue_comaddress" type="hidden" value="${_fieldvalue_comaddress?default("")}" >
	<input name="_fieldvalue_name" id="_fieldvalue_name" type="hidden" value="${_fieldvalue_name?default("")}"  >
<#-----------------------------------senderInfo--------------------------------------->
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" style="width:10%;height:20px;" name="sender" id="sender"  value="${sender}" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" style="width:10%;height:20px" name="senderPhone" id="senderPhone" onblur="checkPhone(this.id,this.value)"/>
<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" style="width:18%;height:20px" name="senderFirm" id="senderFirm"  value="${senderFirm}" />
<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" style="width:35%;height:20px" name="senderAddress" id="senderAddress"  value="${senderAddress}" />
<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" style="width:5%;height:15px" name="senderPostcode" id="senderPostcode" value="${senderPostcode}"/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<input type="text" style="width:10%;height:20px;" name="senderSign" id="senderSign"  value="${sender}" />
<#---------------------------------------end--------------------------------------->

<#-----------------------------------receiverInfo--------------------------------------->
<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<input type="text" style="width:30%;height:20px" name="receiver" id="receiver"  value="${receiver}" />

		<select onchange="changeReceiver(this.value)">
			<#list appsList as appsList>
			<option value = ${appsList}>${appsList}</option>
			</#list>
		</select>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" style="width:10%;height:20px;" name="systemDate" id="systemDate" onClick="WdatePicker()"  value="${systemDate}" />
		
<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<#if corpName?exists>
<input type="text" style="width:30%;height:20px" name="receiverFirm" id="receiverFirm"  value="${corpName?default('')}" />
</#if>
<br/>
<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" style="width:35%;height:20px" name="receiverAddress" id="receiverAddress" value="${receiverAddress?default('')}"/>

		<select onchange="changeReceiverAddressDetail(this.value)">
			<#list appsDetailList as appsDetailList>
			<option value = ${appsDetailList}>${appsDetailList}</option>
			</#list>
		</select>
<br/>
<br/>	
<br/>
<br/>
<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="javascript:setUser1('#userDiv')" style="display:block;padding-left:600px;font-weight:bold;" id="userspan" title="点击此处填写内件品名详细信息"><font size="4">添加</font></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
	<input type="text" style="width:35%;height:25px" name="mailDescription" id="mailDescription" value=""/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="javascript:nextOpera()" class="fra" title="点击进入下一步"><font size="4">下一步</font></a>
<#---------------------------------------end--------------------------------------->

<#--<ul >
    <li>
    	<input type='input'  name="style"/><span>&nbsp;&nbsp;同城EMS</span>
    </li>
   		<br/>
   
    <li>
    	<input type='input'  name="style"/><span>&nbsp;&nbsp;国内EMS</span>
    </li>
</ul>-->
<div id="userDiv" style="position:absolute;display:none;background:#ffffff" class="formDiv" >
	<div class="btn" style="font-weight:bold"><div class="fl">	
		<font size="2">内件品名详细信息设置：</font>	
	</div>

	
</div>

<div> 
	<table id="app">
			<tr  >
				<td>文书名称：</td>
				<td>
					<select name="docType" id="docType" isUser="true" retSelect="1" onchange="docTypeChange(this.id)">
						<option value="《行政复议申请材料补正通知书》">《行政复议申请材料补正通知书》</option>
						<option value="《行政复议不予受理决定书》">《行政复议不予受理决定书》</option>
						<option value="《行政复议不予受理告知书》">《行政复议不予受理告知书》</option>
						<option value="《行政复议更正通知书》">《行政复议更正通知书》</option>
						<option value="《行政复议决定书》">《行政复议决定书》</option>
						<option value="《行政复议答复通知书》">《行政复议答复通知书》</option>
						<option value="《驳回行政复议申请决定书》">《驳回行政复议申请决定书》</option>
						<option value="《行政复议终止通知书》">《行政复议终止通知书》</option>
						<option value="《行政复议延期通知书》">《行政复议延期通知书》</option>
						<option value="《行政复议中止通知书》">《行政复议中止通知书》</option>
						<option value="《行政复议恢复审理通知书》">《行政复议恢复审理通知书》</option>
						<option value="《第三人参加行政复议通知书》">《第三人参加行政复议通知书》</option>
						<option value="《行政复议听证通知书》">《行政复议听证通知书》</option>
						<option value="《行政复议意见书》">《行政复议意见书》</option>
						<option value="《行政复议建议书》">《行政复议建议书》</option>
						<option value="《行政复议答复书及相关材料》">《行政复议答复书及相关材料》</option>
						<option value="其它">其它</option>
					</select>
				</td>
					
				<td>文书名称同步：</td>
				<td>
					<input type="text" style="width:200px" id="docTypeSync" name="docTypeSync" onblur="checkEmpty(this.value)" value="《行政复议申请材料补正通知书》" />
				</td>
			</tr>
			<tr>
				<td>请选择案件号：</td>
				<td>
					<label><input type="radio" checked name="yonCaseNO" isUser="true" value="1" onclick="checkYonCaseNO(1)"/>不填写</label>
					<#if xzfyInfo.tjzfzh?exists>
					<label><input type="radio" name="yonCaseNO" isUser="true" value="2" onclick="checkYonCaseNO(2)"/>${xzfyInfo.tjzfzh}</label>
					</#if>
					<label><input type="radio" name="yonCaseNO" isUser="true" value="3" onclick="checkYonCaseNO(3)"/>其它</label>
				</td>
				
				<td id="caseDes" style="display:none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;案件号：</td>
				<td id="caseNODetail" style="display:none">
					<input type="text" style="width:100%" id="caseDetailNO" name="caseDetailNO" onblur="checkEmptyCaseNO(this.value)" value="" />
				</td>
			</tr>
			<tr>
				<td>请选择份数：</td>
				<td>
					<label><input type="radio" checked name="count" isUser="true" value="1" onclick="checkCount(1)"/>1份</label>
					<label><input type="radio" name="count" isUser="true" value="2" onclick="checkCount(2)"/>多份</label>
			    </td>
			    
				<td id="countDes" style="display:none">仅填数字即可：</td>
				<td id="countDetail" style="display:none">
					<input type="text" style="width:100%" id="countOfDoc" name="countOfDoc" onblur="checkEmptyCount(this.value)" value="1" />
				</td>
			</tr>
	</table>
	
	<div align="center">
		<a href="javascript:addUser:closeDiv1()" title="完成" style="font-weight:bold" class=""><font size="2">完成</font></a>&nbsp;&nbsp;
		<a href="javascript:closeDivById()" title="关闭" style="font-weight:bold" class=""><font size="2">关闭</font></a>
	</div>
</div>
</form>
</div>
<script>
	function checkPhone(id,val){
		var dealtVal = $.trim(val);
		if(dealtVal==null || dealtVal== ''){
			alert("请填写电话/手机号码！");
			$('#'+id).val('');
			return;
		}
		
		if(!isPhone(dealtVal)){
			alert("电话/手机号码格式错误！");
			$('#'+id).val('');
			return;
		}
	}
	
	function changeReceiver(val){
		if(val=='其它'){
			document.getElementById("receiver").value="";
		}
		else{
			document.getElementById("receiver").value=val;
		}
	}
	
	function changeReceiverAddressDetail(val){
		if(val=='其它'){
			document.getElementById("receiverAddress").value="";
		}
		else{
			val = val.substring(val.lastIndexOf("址")+1); 
			document.getElementById("receiverAddress").value=val;
		}
	}
	
	function setUser1(divName){
		//closeSelect();
		var top = ($(window).height())/2;    
	    var left = ($(window).width() - $(divName).width())/2;    
	    var scrollTop = $(document).scrollTop();    
	    var scrollLeft = $(document).scrollLeft();    
	    $(divName).css( { position : 'absolute', 'top' : 250, 'left' : left + scrollLeft } ).show();   
	//	var udiv=document.getElementById("userDiv");
	//	var userspan=document.getElementById("userspan");
	//	var areaObject=document.getElementById("user");
	//	
	//	if(udiv.style.display!="block"){
	//	ev = ev || window.event;
	//	var mousePos = getPosition(areaObject);
	//	udiv.style.position = "absolute";
	//	udiv.style.top      = mousePos.y+20;
	//	udiv.style.left     = mousePos.x;
	//	udiv.style.display="block";
		//userspan.style.display="none";
	//	}
	}
	
	function docTypeChange(id){
		var docType = document.getElementById(id).value;
		if(docType=='其它'){
			document.getElementById("docTypeSync").value="";
			$('#docTypeSync').focus();
		}
		else{
			document.getElementById("docTypeSync").value=docType;
		}
	}

	function checkEmpty(val){
		if(val==null || val==''){
			alert("文书名称不能为空！");
			return;
		}
	}
	
	function checkEmptyCaseNO(val){
		if(val==null || val==''){
			alert("案件号不能为空！");
			return;
		}
	}
	
	function checkEmptyCount(val){
		if(val==null || val==''){
			alert("份数不能为空！");
			return;
		}
	}
	
	function checkYonCaseNO(val){
		if(val==1){
			document.getElementById("caseDetailNO").value="";
			document.getElementById("caseNODetail").style.display="none";
			document.getElementById("caseDes").style.display="none";
		}
		else if(val==2){
			document.getElementById("caseDetailNO").value="${xzfyInfo.tjzfzh?default('')}";
			document.getElementById("caseNODetail").style.display="block";
			document.getElementById("caseDes").style.display="block";
		}
		else{
			document.getElementById("caseDetailNO").value="${addedCaseNO}";
			document.getElementById("caseNODetail").style.display="block";
			document.getElementById("caseDes").style.display="block";
		}
	}
	
	function checkCount(val){
		if(val==1){
			document.getElementById("countOfDoc").value="1";
			document.getElementById("countDetail").style.display="none";
			document.getElementById("countDes").style.display="none";
		}
		else{
			document.getElementById("countOfDoc").value="";
			document.getElementById("countDetail").style.display="block";
			document.getElementById("countDes").style.display="block";
			$('#countOfDoc').focus();
		}
	}
	
	function validateYonCaseNO(){
		var yonCaseNOs = document.getElementsByName("yonCaseNO");
		for(var i=0; i< yonCaseNOs.length; i++){
			if(yonCaseNOs[i].checked==true){
				return yonCaseNOs[i].value;
			}
		}
	}
	
	function validateYonCount(){
		var yonCaseNOs = document.getElementsByName("count");
		for(var i=0; i< yonCaseNOs.length; i++){
			if(yonCaseNOs[i].checked==true){
				return yonCaseNOs[i].value;
			}
		}
	}
	
	function notNullValidation(){
		if($("#docTypeSync").val()==null || $("#docTypeSync").val()==''){
			alert("文书名称不能为空！");
			return false;
		}
		
		if($("#docTypeSync").val()==null || $("#docTypeSync").val()==''){
			alert("文书名称不能为空！");
			return false;
		}
		
		if(validateYonCaseNO()!=1){
			if($("#caseDetailNO").val()==null || $("#caseDetailNO").val()==''){
				alert("案件号不能为空！");
				return false;
			}
		}
		
		if(validateYonCount()!=1){
			if($("#countOfDoc").val()==null || $("#countOfDoc").val()==''){
				alert("份数不能为空！");
				return false;
			}
		}
		
		return true;		
	}
	
	function closeDiv1(){
		if(notNullValidation()){
			var mailDescription = $('#docTypeSync').val() + $('#caseDetailNO').val() + "（"+ $('#countOfDoc').val()+"份）";
			$('#mailDescription').val(mailDescription);		
			document.getElementById("userDiv").style.display="none";
		}	
	}
	
	function closeDivById(){
		document.getElementById("userDiv").style.display="none";
	}
	
	function nextOpera(){
		if(mainUnitsValidation()){
			Preview1();
		}				
	}
	
	function mainUnitsValidation(){
		if($.trim($('#sender').val())==null || $.trim($('#sender').val())== ''){
			alert("请填写寄件人！");
			return false;
		}
		
		if($.trim($('#senderPhone').val())==null || $.trim($('#senderPhone').val())== ''){
			alert("请填写手机号码！");
			return false;
		}
		
		if($.trim($('#senderFirm').val())==null || $.trim($('#senderFirm').val())== ''){
			alert("请填写寄件人公司名称！");
			return false;
		}
		
		if($.trim($('#senderAddress').val())==null || $.trim($('#senderAddress').val())== ''){
			alert("请填写寄件人地址！");
			return false;
		}
		
		if($.trim($('#senderPostcode').val())==null || $.trim($('#senderPostcode').val())== ''){
			alert("请填写寄件人邮编！");
			return false;
		}
		
		if($.trim($('#senderSign').val())==null || $.trim($('#senderSign').val())== ''){
			alert("请填写签名！");
			return false;
		}
		
		if($.trim($('#systemDate').val())==null || $.trim($('#systemDate').val())== ''){
			alert("请填写签名日期！");
			return false;
		}
		
		if($.trim($('#receiver').val())==null || $.trim($('#receiver').val())== ''){
			alert("请填写收件人！");
			return false;
		}
		
		var cName = '${corpName?default('')}';
		
		if(cName !=null && cName !=''){
			if($.trim($('#receiverFirm').val())==null || $.trim($('#receiverFirm').val())== ''){
				alert("请填写收件人公司名称！");
				return false;
			}
		}
		
		if($.trim($('#receiverAddress').val())==null || $.trim($('#receiverAddress').val())== ''){
			alert("请填写收件人地址！");
			return false;
		}
		
		if($.trim($('#mailDescription').val())==null || $.trim($('#mailDescription').val())== ''){
			alert("请填写内件品名！");
			return false;
		}
		
		return true;
	}	
	
		/*套打预览*/
	 var LODOP; //声明为全局变量
	 function CreateDataBill(iftaoda){
	  /***************var变量**************/
		var sender = document.getElementById("sender").value;
		var senderPhone = document.getElementById("senderPhone").value;
		var senderFirm = document.getElementById("senderFirm").value;
		var senderAddress = document.getElementById("senderAddress").value;
	  	var senderPostcode = document.getElementById("senderPostcode").value;
	  	
	  	var senderSign = document.getElementById("senderSign").value;
	  	var systemDate = document.getElementById("systemDate").value;
	  	
	  	var receiver = document.getElementById("receiver").value;
	  	
	  	var recFirm = '${corpName?default('')}';
	  	
	  	var receiverFirm = '';
	  	if(recFirm !=null && recFirm !=''){
			receiverFirm = document.getElementById("receiverFirm").value;
		}	
		var receiverAddress = document.getElementById("receiverAddress").value;
		var mailDescription = document.getElementById("mailDescription").value;
	  /****************结束***************/
	  /*打印预览*/
	  LODOP=getLodop(document.getElementById('LODOP'),document.getElementById('LODOP_EM'));
	//  LODOP.PRINT_INITA(0,0,800,1107,"");
		LODOP.PRINT_INITA(0,0,1700,1000,"");
	    LODOP.ADD_PRINT_SETUP_BKIMG("<img border='0' src='../images/ems-img1.png'>");
	//  LODOP.SET_SHOW_MODE("BKIMG_WIDTH",753);
	//  LODOP.SET_SHOW_MODE("BKIMG_HEIGHT",1030);
		LODOP.SET_SHOW_MODE("BKIMG_WIDTH",1873);
		LODOP.SET_SHOW_MODE("BKIMG_HEIGHT",1030);
	  if(iftaoda==1){
		
	  }else{
	    LODOP.SET_SHOW_MODE("BKIMG_IN_PREVIEW",true);
	  LODOP.SET_SHOW_MODE("BKIMG_PRINT",true);
	  }
	
	  //LODOP.ADD_PRINT_IMAGE(1,1,753,1092,"<img border='0' src='../images/16B/16B/xcjc.png'>");
	  //LODOP.SET_PRINT_STYLEA(0,"Stretch",2);//按原图比例(不变形)缩放模式
	/*
	LODOP.PRINT_INITA(0,31,1300,675,"");
	LODOP.ADD_PRINT_SETUP_BKIMG("<img border='0' src='../images/ems-img1.png'>");
	LODOP.SET_SHOW_MODE("BKIMG_WIDTH",1358);
	LODOP.SET_SHOW_MODE("BKIMG_HEIGHT",681);
	LODOP.SET_SHOW_MODE("BKIMG_IN_PREVIEW",true);
	LODOP.SET_SHOW_MODE("BKIMG_PRINT",true);
	LODOP.ADD_PRINT_TEXT(157,194,376,27,senderFirm);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",12);
	LODOP.ADD_PRINT_TEXT(118,430,190,26,"15001058782");
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",12);
	LODOP.ADD_PRINT_TEXT(124,177,131,25,sender);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",12);
	LODOP.ADD_PRINT_TEXT(303,177,327,27,receiver);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",12);
	LODOP.ADD_PRINT_TEXT(244,516,100,27,senderPostcode);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",12);
	LODOP.ADD_PRINT_TEXT(373,164,825,27,receiverAddress);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",12);
	
	if(recFirm !=null && recFirm !=''){
		LODOP.ADD_PRINT_TEXT(339,195,498,25,receiverFirm);
	}
	
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",12);
	LODOP.ADD_PRINT_TEXT(571,192,657,25,mailDescription);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",12);
	LODOP.ADD_PRINT_TEXT(193,162,450,27,senderAddress);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",12);
	*/
	
	
	
	LODOP.PRINT_INITA(38,31,1300,675,"");
	LODOP.ADD_PRINT_SETUP_BKIMG("<img border='0' src='../images/ems-img1.png'>");
	LODOP.SET_SHOW_MODE("BKIMG_WIDTH",1358);
	LODOP.SET_SHOW_MODE("BKIMG_HEIGHT",681);
	LODOP.SET_SHOW_MODE("BKIMG_IN_PREVIEW",true);
	LODOP.SET_SHOW_MODE("BKIMG_PRINT",true);
	LODOP.ADD_PRINT_TEXT(149,225,497,27,senderFirm);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
	LODOP.ADD_PRINT_TEXT(108,453,190,26,senderPhone);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
	LODOP.ADD_PRINT_TEXT(112,207,131,25,sender);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
	LODOP.ADD_PRINT_TEXT(301,197,519,27,receiver);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
	LODOP.ADD_PRINT_TEXT(242,559,100,27,senderPostcode);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
	LODOP.ADD_PRINT_TEXT(377,184,594,135,receiverAddress);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
	
	if(recFirm !=null && recFirm !=''){
		LODOP.ADD_PRINT_TEXT(340,213,797,25,receiverFirm);
		LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
		LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
	}	
	
	LODOP.ADD_PRINT_TEXT(586,196,1031,25,mailDescription);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
	LODOP.ADD_PRINT_TEXT(186,188,530,27,senderAddress);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",18);

	LODOP.ADD_PRINT_TEXT(261,1118,133,27,senderSign);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
	LODOP.ADD_PRINT_TEXT(307,1115,158,26,systemDate);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
		
	
	/*
	LODOP.PRINT_INITA(35,51,1300,675,"");
	LODOP.ADD_PRINT_SETUP_BKIMG("<img border='0' src='../images/ems-img1.png'>");
	LODOP.SET_SHOW_MODE("BKIMG_WIDTH",1358);
	LODOP.SET_SHOW_MODE("BKIMG_HEIGHT",681);
	LODOP.SET_SHOW_MODE("BKIMG_IN_PREVIEW",true);
	LODOP.SET_SHOW_MODE("BKIMG_PRINT",true);
	LODOP.ADD_PRINT_TEXT(156,206,376,27,senderFirm);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
	LODOP.ADD_PRINT_TEXT(116,442,190,26,senderPhone);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
	LODOP.ADD_PRINT_TEXT(117,192,131,25,sender);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
	LODOP.ADD_PRINT_TEXT(304,184,327,27,receiver);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
	LODOP.ADD_PRINT_TEXT(241,548,100,27,senderPostcode);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
	LODOP.ADD_PRINT_TEXT(388,177,1056,27,receiverAddress);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",18);

	if(recFirm !=null && recFirm !=''){		
		LODOP.ADD_PRINT_TEXT(349,199,791,25,receiverFirm);
		LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
		LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
	}


	LODOP.ADD_PRINT_TEXT(596,206,1033,25,mailDescription);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
	LODOP.ADD_PRINT_TEXT(188,178,450,27,senderAddress);
	LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
	*/
	
	};
	/*续页调用方法*/
	function CreateDataBillxy(){
	  var yearValue=document.myform_sp_t49.year.value;
	  
	  var monthValue=document.myform_sp_t49.month.value;
	  var dayValue=document.myform_sp_t49.day.value;
	 var len=document.getElementById("_fieldvalue_jcneirong").createTextRange().getClientRects();
	 var wtstrxy=newtext(9,len.length,"_fieldvalue_jcneirong");
	 
	 LODOP=getLodop(document.getElementById('LODOP'),document.getElementById('LODOP_EM'));
	 LODOP.PRINT_INITA(0,0,800,1107,"");
	 LODOP.ADD_PRINT_SETUP_BKIMG("<img border='0' src='../images/16B/wsxy.png'>");
	 LODOP.SET_SHOW_MODE("BKIMG_WIDTH",753);
	 LODOP.SET_SHOW_MODE("BKIMG_HEIGHT",1092);
		LODOP.SET_SHOW_MODE("BKIMG_IN_PREVIEW",true);
	 LODOP.SET_SHOW_MODE("BKIMG_PRINT",true);
	 
	 
	 //LODOP.ADD_PRINT_IMAGE(1,1,753,1092,"<img border='0' src='../images/16B/wsxy.png'>");
	 //LODOP.SET_PRINT_STYLEA(0,"Stretch",2);//按原图比例(不变形)缩放模式
	 LODOP.ADD_PRINT_TEXT(125,104,570,727,wtstrxy);
	   LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
	 LODOP.SET_PRINT_STYLEA(0,"FontSize",11);
	 LODOP.SET_PRINT_STYLEA(0,"LineSpacing",11);
	 LODOP.ADD_PRINT_TEXT(943,474,34,20,yearValue);
	  LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
	  LODOP.ADD_PRINT_TEXT(943,522,32,20,monthValue);
	  LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
	  LODOP.ADD_PRINT_TEXT(943,565,25,20,dayValue);
	  LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
	 LODOP.ADD_PRINT_TEXT(978,575,23,20,"2");
	 LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
	 LODOP.ADD_PRINT_TEXT(978,625,23,20,"2");
	 LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
	}
	/*打印无续页*/
	 function Preview() {
	  CreateDataBill(1);
	  //LODOP.PRINT();
	  
	  //LODOP.PREVIEW();
	  
	  LODOP.PRINT_DESIGN();
	 };
	 
	 /*打印续页*/
	 function Previewxy() {
	  CreateDataBillxy();
	  //LODOP.PREVIEW();
	  LODOP.PRINT_DESIGN();
	 //LODOP.PRINT();
	 };
	 
	</script>
	<script language="javascript"> 
	/*是否是电话号码*/
	function isPhone(phoneNum){
		return (new RegExp(/^((\(\d{3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,10}(-\d{0,4})?$/)).test(phoneNum);
	}

	function showTips()
	 {
	  if (document.getElementById("beijingCeng").style.display == "block" || document.getElementById("beijingCeng").style.display == ""){
	   document.getElementById("beijingCeng").style.display ="none";
	   document.getElementById("wenziCeng").style.display ="none";
	   document.getElementById("btncls").innerText="展开";   
	   }else
	   {
	 document.getElementById("beijingCeng").style.display ="block";
	    document.getElementById("wenziCeng").style.display ="block";
	    document.getElementById("btncls").innerText="收起";
	   }
	 }
	  var tmp_sp_f58="";
	 	 function changeDanweidizhi(){
			 if (document.getElementById("dizhi2")==null){
				 return;	
			  }
		      if (tmp_sp_f58==""){
		      	tmp_sp_f58=document.getElementById("dizhi2").outerHTML;
		      }  
		      document.getElementById("dizhi2").outerHTML=tmp_sp_f58; 
		      var str1=document.getElementById("dizhi1").options(document.getElementById("dizhi1").selectedIndex).title;
		      for(i=0;i<document.getElementById("dizhi2").length;){
		       	   str2=document.getElementById("dizhi2").options(i).title;
			       if (str2.indexOf(str1,0)!=0){
			         document.getElementById("dizhi2").remove(i);
			       }else{
			         i++;
			       }
		       }
		 }
	
	function Preview1() {
	  CreateDataBill(0);
	  //LODOP.PRINT();
	  //LODOP.PREVIEW();
	  LODOP.PRINT_DESIGN();
	 }
	 function changeyue(){
		 var form=document.myform_sp_t49;
		form.month.value=form.cdyMonth.value;
	 }
	  function changeri(){
		  var form=document.myform_sp_t49;
		 form.day.value=form.cdyDay01.value
	 }
	  function Open_Dialog(id) { 
	//document.getElementById('button1').onclick=function(){
	   //delayCaoan1(id);
	//}
	$('#win').show(); 
	$('#win').dialog({ 
	
	
	
	}); 
	$("#win").parent().appendTo("#dialog_target"); 
	
	} 
	function addXgzl(count){
		
		var id="divid"+count;
		//alert(id);
		//var obj = $("#"+id ); 
		$("#"+id).after("<div id='xgzl"+count+"'><input type ='hidden' name ='xgzluploadshunxu' value='"+count+"'/><input type ='file' name ='xgzlupload'/>"+
		"<a href='javascript:deleteLine(\"xgzl"+count+"\")'>删除</a></div>");
		
		
	}
	/*function addXgzl(){
		alert("11");
		var count=1;
		$("#xgzl").after("<input type ='hidden' name ='xgzluploadshunxu' value='"+count+"'/><input type ='file' name ='xgzlupload'/>");
	}*/
	function deleteLine(id){
		$("#"+id).remove();
	}
	
	</script>
<!--脚本结束-->
</body>