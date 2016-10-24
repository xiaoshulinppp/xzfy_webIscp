<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>案件办理</title>
		

		<link href="../${Session['_USER_STYLE_'].cssPath}/base.css" rel="stylesheet" type="text/css" />
		<link href="../${Session['_USER_STYLE_'].cssPath}/main_style.css" rel="stylesheet" type="text/css" />
		<link href="../css/style_form.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="../js/16B/prototype.js"></script>
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
	</head>
	
	
	
	
	<!-- 
			xzfyShenpi.check_result默认应设为0
			isdelay,isstop  默认设为0
	 -->
	
	
	
	
	
	
	
	
	
	<body>	

		<span class="x-line fn-clear"><img src="../${Session['_USER_STYLE_'].imagePath}/pic_search_line.png"/></span><!--我是有箭头灰色的分割线-->
		
			
		<div class="ui-form fn-clear">
			<table id="huifushenli" width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table ui-table-form">	  			
		  		<tr >  
		  			<div>    
		     			<h1 align="center"><font color="red">恢复审理</font></h1>
		     		</div>
		  		</tr>
		  		<tr class="trcolor" id="" >      
				    <th class="tdFormText" width="20%" >回复审理日期</td>
					<td class="tdFormInput" width="30%" >
						<input name="breakTo" type="text" class="inputTextNormal"  
					     	   value="<#if xzfyInfo.breakTo?has_content>${xzfyInfo.breakTo}</#if>" onClick="WdatePicker()" altname="" >
					</td>
					<th class="tdFormText" width="20%" ></td>
					<td class="tdFormInput" width="30%" >
					</td>
		  		</tr>
		  		<tr class="trcolor" id="" >      
		     		<th class="tdFormText" width="20%" >恢复审理事由</td>
				    <td class="tdFormInput" width="30%" colspan=3 >		    
				    	<textarea name="stop_reason" type="text" value="" class="textarea" id="" ischeck="y" altname="" ><#if xzfyInfo.stop_reason?has_content>${xzfyInfo.stop_reason}</#if></textarea>
				    </td>
		  		</tr>
		  		<tr class="trcolor" id="" >      
		     		<th class="tdFormText" width="20%" >审批人</td>
				    <td class="tdFormInput" width="30%" >
						<select name="" id="huifuspr" onchange="ishuifusp()">
						    <option value="0">未指定审批人</option>
						    <#list shenpirenList as uList>
						    <option value="${uList.getId()}" >${uList.getName()}</option>
						    </#list>
					    </select>			
				    </td>
				    <th class="tdFormText" width="20%" >审批状态</td>
					<td class="tdFormInput" width="30%" >
						审批状态:
						<#list shenpiList2 as xzfyShenpi><br/>
								<#if xzfyShenpi.check_result == "1" >
									<font color="red">${xzfyShenpi.check_name}：已通过</font>
								<#elseif xzfyShenpi.check_result == "2">
									<font color="red">${xzfyShenpi.check_name}：已拒绝</font>
								<#else>
									<font color="red">${xzfyShenpi.check_name}：未审批</font>
								</#if>
						</#list>
					</td>
		  		</tr>
		  		<tr class="trcolor" id="" >      
		     		<th class="tdFormText" width="20%" >回复审理申请书</td>
				    <td class="tdFormInput" width="30%" >
				    	<input type="button" value="生成" class="ui-btn ui-btn-normal" <#if xzfyInfo.check_status != "0">disabled</#if> onclick="saveToHuifuDoc()" >
				    </td>
				    <th class="tdFormText" width="20%" >回复审理审批单</td>
					<td class="tdFormInput" width="30%" >
						<a href="../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&checkDocType=9&isView=1&funcCode=${funcCode}" target="_blank">生成</a>
					</td>
		  		</tr>
		  		<tr class="trcolor" id="huifupz" style="display:block" >      
		     		<th class="tdFormText" width="20%" >恢复审理批准人</td>
				    <td class="tdFormInput" width="30%" >
					    <input type="text" name="pizhunren2" value="<#if xzfyInfo.pizhunren2?has_content>${xzfyInfo.pizhunren2}</#if>" class="inputTextNormal" />				 
				    </td>
					<th class="tdFormText" width="20%" >恢复审理批复意见</td>
				    <td class="tdFormInput" width="30%"  >
				    	 <textarea name="pifuyijian2" type="text" value="" class="textarea" ><#if xzfyInfo.pifuyijian2?has_content>${xzfyInfo.pifuyijian2}</#if></textarea>
				    </td>
		  		</tr>		  		
				
			</table>
		</div>
	
				<div class="align-center">
				<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" >
					<tr class="trcolor" >
						<td class="tdFormText" width="25%" colspan="4">
						<div align="center">
							
							<input type="button" class="ui-btn ui-btn-normal"  value="返 回" onclick="gotoBack();" />
							</div>
						</td>
					</tr>				
				</table>
			</div>		
	</body>
</html>

<script type="text/javascript">
	var aaaa = 1;
	var bbbb = 1;
	var cccc = 1;
	var dddd = 1;
	var eeee = 1;
	//var temp = 0;
	function gotoBack(){
		window.history.back();
	}
	
	function dftz(){
		document.getElementById("yanqi").style.display="none";
		bbbb=1;
		document.getElementById("zhongzhi").style.display="none";
		cccc=1;
		document.getElementById("huifushenli").style.display="none";
		dddd=1;
		document.getElementById("jiean").style.display="none";
		eeee=1;
		if(aaaa==1){
			document.getElementById("dftz").style.display="block";
			aaaa=0;
		}
		else{
			document.getElementById("dftz").style.display="none";
			aaaa=1;
		}
		temp=1;
	}

	function yanqi(){
		document.getElementById("dftz").style.display="none";
		aaaa=1;
		document.getElementById("zhongzhi").style.display="none";
		cccc=1;
		document.getElementById("huifushenli").style.display="none";
		dddd=1;
		document.getElementById("jiean").style.display="none";
		eeee=1;
		if(bbbb==1){
			document.getElementById("yanqi").style.display="block";
			bbbb=0;
		}
		else{
			document.getElementById("yanqi").style.display="none";
			bbbb=1;
		}
		temp=2;
		temp1=2;
	}

	function zhongzhi(){
		document.getElementById("dftz").style.display="none";
		aaaa=1;
		document.getElementById("yanqi").style.display="none";
		bbbb=1;
		document.getElementById("huifushenli").style.display="none";
		dddd=1;
		document.getElementById("jiean").style.display="none";
		eeee=1;
		if(cccc==1){
			document.getElementById("zhongzhi").style.display="block";
			cccc=0;
		}
		else{
			document.getElementById("zhongzhi").style.display="none";
			cccc=1;
		}
		temp=3;
		temp1=3;
	}

	function huifushenli(){
		document.getElementById("dftz").style.display="none";
		aaaa=1;
		document.getElementById("yanqi").style.display="none";
		bbbb=1;
		document.getElementById("zhongzhi").style.display="none";
		cccc=1;
		document.getElementById("jiean").style.display="none";
		eeee=1;
		if(dddd==1){
			document.getElementById("huifushenli").style.display="block";
			dddd=0;
		}
		else{
			document.getElementById("huifushenli").style.display="none";
			dddd=1;
		}
		temp=4;
	}

	function jiean(){
		document.getElementById("dftz").style.display="none";
		aaaa=1;
		document.getElementById("yanqi").style.display="none";
		bbbb=1;
		document.getElementById("zhongzhi").style.display="none";
		cccc=1;
		document.getElementById("huifushenli").style.display="none";
		dddd=1;
		if(eeee==1){
			document.getElementById("jiean").style.display="block";
			eeee=0;
		}
		else{
			document.getElementById("jiean").style.display="none";
			eeee=1;
		}
		temp=5;
	}

	function isyanqisp(){
		//通过选择延期审批人控制批准人批复意见框是否显示
		if(document.getElementById("yanqispr").value=="0"){
			document.getElementById("yanqipz").style.display="block";			
		}
		else{
			document.getElementById("yanqipz").style.display="none";
		}
	}
	function iszhongzhisp(){
		//通过选择延期审批人控制批准人批复意见框是否显示
		if(document.getElementById("zhongzhispr").value=="0"){
			document.getElementById("zhongzhipz").style.display="block";			
		}
		else{
			document.getElementById("zhongzhipz").style.display="none";
		}
	}
	function ishuifusp(){
		//通过选择延期审批人控制批准人批复意见框是否显示
		if(document.getElementById("huifuspr").value=="0"){
			document.getElementById("huifupz").style.display="block";			
		}
		else{
			document.getElementById("huifupz").style.display="none";
		}
	}
	
	
	
	
	function isjieansp(){
		//通过选择延期审批人控制批准人批复意见框是否显示
		if(document.getElementById("jieanspr").value=="0"){
			document.getElementById("jieanpz").style.display="block";			
		}
		else{
			document.getElementById("jieanpz").style.display="none";
		}
	}
	function jafss(){
		if(document.getElementById("jafs").value==8){
			document.getElementById("jafs1").style.display="block";
		}
		else{
			document.getElementById("jafs1").style.display="none";
		}
	}
	function tiaojie(){
		if(document.getElementById("tj").value==0){
			document.getElementById("tj1").style.display="none";
		}
		else{
			document.getElementById("tj1").style.display="block";
		}
	}
	function gjpcc(){
			document.getElementById("pcje").disabled=true;
	}
	function gjpcc1(){
			document.getElementById("pcje").disabled=false;
	}
	function opendg(dgurl,dgw,dgh)
	{
	//alert(1111);
	  $.dialog({ 
	    title:'',
	    width: dgw,
	    height: dgh,
	    content:'url:'+ dgurl});
	}
	
</script>
<script type="text/javascript">
	function save(){
		if(confirm("确认提交？")){	
			window.form1.action="savebanan.action?tempstatus=0";
			window.form1.submit();
			alert("操作已完成！");
		}
	}
	function save6(){
		if(confirm("确认提交？")){	
			window.form1.action="savebanan.action?tempstatus=6&tempcheckstatus=0&isdelay=1 ";
			window.form1.submit();
			alert("操作已完成！");
		}
	}
	function save8(){
		if(confirm("确认提交？")){
			window.form1.action="savebanan.action?tempstatus=8&tempcheckstatus=0&isstop=1" ;
			window.form1.submit();
			alert("操作已完成！");
		}
	}
	function save10(){
		if(confirm("确认提交？")){	
			window.form1.action="savebanan.action?tempstatus=10&tempcheckstatus=0";
			window.form1.submit();
			alert("操作已完成！");
		}
	}
	function save12(){
		if(confirm("确认提交？")){
			window.form1.action="savebanan.action?tempstatus=12&tempcheckstatus=0";
			window.form1.submit();
			alert("操作已完成！");
		}
	}
	function tijiaoshenpi5(){
	    //提交延期审批，若未选择审批人，则提示请选择审批人
		if(document.getElementById("yanqispr").value==0){	
			alert("请选择审批人");
			return;
		}
		if(confirm("确认提交？")){
			document.getElementById("checkid").value=document.getElementById("yanqispr").value;	
			window.form1.action="saveshenpi.action?tempstatus=5&xzfyShenpi.check_type=5&tempcheckstatus=1";	
			window.form1.submit();
		}
	}
	function tijiaoshenpi7(){
		//提交延期审批，若未选择审批人，则提示请选择审批人
		if(document.getElementById("zhongzhispr").value==0){	
			alert("请选择审批人");
			return;
		}
		if(confirm("确认提交？")){	
			document.getElementById("checkid").value=document.getElementById("zhongzhispr").value;	
			window.form1.action="saveshenpi.action?tempstatus=7&xzfyShenpi.check_type=7&tempcheckstatus=1";	
			window.form1.submit();
		}
	}
	function tijiaoshenpi9(){
		//提交延期审批，若未选择审批人，则提示请选择审批人
		if(document.getElementById("huifuspr").value==0){	
			alert("请选择审批人");
			return;
		}
		if(confirm("确认提交？")){	
			document.getElementById("checkid").value=document.getElementById("huifuspr").value;	
			window.form1.action="saveshenpi.action?tempstatus=9&xzfyShenpi.check_type=9&tempcheckstatus=1";	
			window.form1.submit();
		}
	}
	function tijiaoshenpi11(){
		//提交延期审批，若未选择审批人，则提示请选择审批人
		if(document.getElementById("jieanspr").value==0){	
			alert("请选择审批人");
			return;
		}
		if(confirm("确认提交？")){
			document.getElementById("checkid").value=document.getElementById("jieanspr").value;		
			window.form1.action="saveshenpi.action?tempstatus=11&xzfyShenpi.check_type=11&tempcheckstatus=1";	
			window.form1.submit();
		}
	}
	function withdrawsp(){
		if(document.getElementById("checkstatus").value==0){	
			alert("您未提交审批");
			return;
		}
		if(confirm("确认取消？")){	
			window.form1.action="withdrawsp.action";	
			window.form1.submit();
		}
	}
	
	
	var count=0;
	function addxcdc(){
		var e=document.createElement('div');
		e.id="div"+count;
		e.innerHTML="<input type=\"file\" name=\"upFile\" class=\"inputTextFile\" />"+"<a href=\"javascript:del(\'"+e.id+"\')\">删除</a>";
		document.getElementById("addxcdc").appendChild(e);
		count++;
	}
	function del(id){
		var e=document.getElementById(id);
		document.getElementById("addxcdc").removeChild(e);
	}
	
	function saveToDftzDoc(){	
		if(confirm("点击确定就将发送答复通知，请务必保存文书。")){
			var options = { 
				url:'savedftz.action', //提交给哪个执行 
				type:'POST', 
				success: getYanqishenqingshu //显示操作提示 
			}; 
			$('#form1').ajaxSubmit(options); 
			return false; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		}
	}
	function getDftzshu(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
	
	function saveToYanqiDoc(){
		getYanqishenqingshu()
	}	
	function getYanqishenqingshu(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
	function saveToZhongzhiDoc(){
		getZhongzhishenqingshu()
	}	
	function getZhongzhishenqingshu(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
	function saveToHuifuDoc(){
		getHuifushenqingshu();
	}	
	function getHuifushenqingshu(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
	function saveToJieanDoc(){
		getJieanshenqingshu()
	}	
	function getJieanshenqingshu(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
	function saveToYijianDoc(){
		getYijianshu();
	}	
	function getYijianshu(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
	function saveToJianyiDoc(){
		getJianyishu()
	}	
	function getJianyishu(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
	
	//模板
	function savaToGetDoc(){
		getBuzhengtongzhi()
	}	
	function getBuzhengtongzhi(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
function dyniframesize(down) { 
	var pTar = null; 
	if (document.getElementById){ 
		pTar = document.getElementById(down); 
	} 
	else{ 
		eval('pTar = ' + down + ';'); 
	} 
	if (pTar && !window.opera){ 
	//begin resizing iframe 
		pTar.style.display="block" 
		if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight){ 
	//ns6 syntax 
			pTar.height = pTar.contentDocument.body.offsetHeight +20; 
			pTar.width = pTar.contentDocument.body.scrollWidth+20; 
		} 
		else if (pTar.Document && pTar.Document.body.scrollHeight){ 
	//ie5+ syntax 
			pTar.height = pTar.Document.body.scrollHeight; 
			pTar.width = pTar.Document.body.scrollWidth; 
		} 
	} 
} 
	
	
	function getFacePage(id){

		window.open('../xzfy/viewXzfyInfo.action?xzfyId='+id+'&funcCode=${funcCode}');

}
</script>
