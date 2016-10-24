<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../plugs/kindeditor/kindeditor.js"></script>
		<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="../js/16B/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="../js/16B/tpl.base.js"></script>
		<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
	</head>
	<body>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
			<tr>
				<td>诉讼案件录入</td>
			</tr>
		</table>
		
		
		
		<form id="form1" name="form1" action="''" method="post" ENCTYPE="multipart/form-data">
		
		<input type="hidden" name="funcCode" value="${funcCode}" />
	
		
		
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
		
			<tr class="trcolor">      
	     		<td class="tdFormText" width="25%" >收案日期：</td>
			    <td class="tdFormInput" width="25%" >
				    <input name="receive_date" type="text" class="inputTextNormal"  
				     value="" onClick="WdatePicker()" altname="收案日期" >
			    </td>
			    <td class="tdFormText">承办人</td>
				<td class="tdFormInput">
					<input type="text" name="undertaker_name" value="" class="inputTextNormal" />
				</td>
	  		</tr>
		
			<tr class="trwhite">
				<td class="tdFormText">复议承办人</td>
				<td class="tdFormInput">
					<input type="text" name="fyundertaker_name" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">申请人类别</td>
				<td class="tdFormInput">
					<select name="app_type" id="apptype" onchange="checkapptype()">
				      <option value="0">----请选择----</option>
				      <option value="1">公民</option>
				      <option value="2">法人或其他组织</option>
				    </select>
				</td>			
			</tr>
			
		
		
			<tr class="trwhite">		
				<td class="tdFormText">原告总数</td>
				<td class="tdFormInput">
					<input type="text" name="app_num" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">被申请人类别</td>
				<td class="tdFormInput">
				<!--<input type="text" name="xzssInfo.jiguan_type" value="" class="inputTextNormal" /> -->
					<select name="jiguan_type"  >
				      <option value="0">----请选择----</option>
				      <option value="1">原具体行政行为机关</option>
				      <option value="2">复议机关</option>
				    </select>
				</td>				
			</tr>

			
			<tr class="trwhite">
				<td class="tdFormText">被申请人名称</td>
				<td class="tdFormInput">
					<input type="text" name="jiguan" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">代理人</td>
				<td class="tdFormInput">
					<input type="text" name="agent" value="" class="inputTextNormal" />
				</td>
			</tr>
			
			<tr class="trwhite">
				
				<td class="tdFormText">裁决请求</td>
				<td class="tdFormInput">
					<textarea cols="30" rows="5" type="text" name="request" value="" class="inputTextNormal" />
					</textarea>
				</td>
				<td class="tdFormText">是否行政赔偿</td>
				<td class="tdFormInput">
					<input type="radio" name="ismoney" value="是"  />  是
					<input type="radio" name="ismoney" value="否"  />  否
				</td>
			</tr>
			<tr class="trwhite">			
				
				<td class="tdFormText">被裁决具体行政行为名称</td>
				<td class="tdFormInput">
					<input type="text" name="action_name" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">被裁决具体行政行为案号</td>
				<td class="tdFormInput">
					<input type="text" name="action_id" value="" class="inputTextNormal" />
				</td>
			</tr>
			
			<tr class="trwhite">			
				
				<td class="tdFormText">行政管理类别</td>
				<td class="tdFormInput">
				<!-- 
					<input type="text" name="xzssInfo.manage_type" value="" class="inputTextNormal" />
					-->					
							<select name="manage_type"   id="ajsjfm1"  onchange="ajgllb()">
						        <option value=0>----请选择----</option>
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
						    					    
						 
				</td>
				<td class="tdFormText">复议结论</td>
				<td class="tdFormInput">
					<textarea cols="30" rows="5" type="text" name="fuyijielun" value="" class="inputTextNormal" />
					</textarea>
				</td>
			</tr>
			
		

			<tr class="trwhite">
				
				<td class="tdFormText">裁决结论</td>
				<td class="tdFormInput">
					<textarea cols="30" rows="5" type="text" name="caijuejielun" value="" class="inputTextNormal" />
					</textarea>
				</td>	
				<td class="tdFormText">结案日期</td>			
				<td class="tdFormInput" width="25%" >
				    <input name="jieandate" type="text" class="inputTextNormal"  
				     value="" onClick="WdatePicker()"  >
			    </td>
			</tr>
		
			

			
	
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<input type="button" id="sunbt" class="button" value="查询" onclick="searchxzcj();" />
					
				</td>
			</tr>			
		</form>
		</table>
	</body>
</html>


<script type="text/javascript">
	function searchxzcj(){
	//alert(document.getElementById("shen1").value);
			
			window.form1.action="dosearchxzcj.action";
			window.form1.submit();
		
	}
</script>



<script type="text/javascript">	
				function sfxzfy(){

					if(document.getElementById("sffyselect").value=="1"){
						//alert(1);
						document.getElementById("sffybutton").style.display="block";
					}
					else if(document.getElementById("sffyselect").value==""){
						//alert(0);
						document.getElementById("sffybutton").style.display="none";
					}
					else{
						alert(2);
					}
				}
				
				function opendg(dgurl,dgw,dgh)
				{
				//alert(1111);
				  $.dialog({ 
				    title:'申请人管理',
				    width: dgw,
				    height: dgh,
				    content:'url:'+ dgurl});
				}
				
				function checkapptype(){
					if(document.getElementById("apptype").value==1){
						document.getElementById("appspan1").style.display="block"
						document.getElementById("appspan2").style.display="none"
					}
					else if(document.getElementById("apptype").value==2){
						document.getElementById("appspan2").style.display="block"
						document.getElementById("appspan1").style.display="none"		
					}
					else{
						document.getElementById("appspan2").style.display="none"
						document.getElementById("appspan1").style.display="none"		
					}
				}
</script>

<script type="text/javascript">	
				function ajgllb(){
				//alert(11);
					//document.getElementById("yxsw_n").checked=true;
					//document.getElementById("yxswlabel").style.display="none";
					//document.getElementById("yxswinput").style.display="none";
					//alert(document.getElementById("ajsjfm1").value);
					if(document.getElementById("ajsjfm1").value=="1"){
					//alert(1111);
						document.getElementById("ajgllbga").style.display="block";
						document.getElementById("ajgllbnlhz").style.display="none";
						document.getElementById("ajgllbcj").style.display="none";
						document.getElementById("ajgllbgjss").style.display="none";
						document.getElementById("ajgllbczjr").style.display="none";
						document.getElementById("ajgllbjkww").style.display="none";
						
						document.getElementById("ajgllbga").name="xzssInfo.manage_type1";
						document.getElementById("ajgllbnlhz").name="sss";
						document.getElementById("ajgllbcj").name="sss";
						document.getElementById("ajgllbgjss").name="sss";
						document.getElementById("ajgllbczjr").name="sss";
						document.getElementById("ajgllbjkww").name="sss";
				
						
					}
					if(document.getElementById("ajsjfm1").value=="6"){
						document.getElementById("ajgllbga").style.display="none";
						document.getElementById("ajgllbnlhz").style.display="block";
						document.getElementById("ajgllbcj").style.display="none";
						document.getElementById("ajgllbgjss").style.display="none";
						document.getElementById("ajgllbczjr").style.display="none";
						document.getElementById("ajgllbjkww").style.display="none";
						
						document.getElementById("ajgllbga").name="sss";
						document.getElementById("ajgllbnlhz").name="xzssInfo.manage_type1";
						document.getElementById("ajgllbcj").name="sss";
						document.getElementById("ajgllbgjss").name="sss";
						document.getElementById("ajgllbczjr").name="sss";
						document.getElementById("ajgllbjkww").name="sss";
				
				
				
					}
					if(document.getElementById("ajsjfm1").value=="7"){
						document.getElementById("ajgllbga").style.display="none";
						document.getElementById("ajgllbnlhz").style.display="none";
						document.getElementById("ajgllbcj").style.display="block";
						document.getElementById("ajgllbgjss").style.display="none";
						document.getElementById("ajgllbczjr").style.display="none";
						document.getElementById("ajgllbjkww").style.display="none";
						
						document.getElementById("ajgllbga").name="sss";
						document.getElementById("ajgllbnlhz").name="sss";
						document.getElementById("ajgllbcj").name="xzssInfo.manage_type1";
						document.getElementById("ajgllbgjss").name="sss";
						document.getElementById("ajgllbczjr").name="sss";
						document.getElementById("ajgllbjkww").name="sss";
					}
				
					if(document.getElementById("ajsjfm1").value=="8"){
						document.getElementById("ajgllbga").style.display="none";
						document.getElementById("ajgllbnlhz").style.display="none";
						document.getElementById("ajgllbcj").style.display="none";
						document.getElementById("ajgllbgjss").style.display="block";
						document.getElementById("ajgllbczjr").style.display="none";
						document.getElementById("ajgllbjkww").style.display="none";
						
						document.getElementById("ajgllbga").name="sss";
						document.getElementById("ajgllbnlhz").name="sss";
						document.getElementById("ajgllbcj").name="sss";
						document.getElementById("ajgllbgjss").name="xzssInfo.manage_type1";
						document.getElementById("ajgllbczjr").name="sss";
						document.getElementById("ajgllbjkww").name="sss";
					}
					if(document.getElementById("ajsjfm1").value=="9"){
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
						document.getElementById("ajgllbczjr").name="xzssInfo.manage_type1";
						document.getElementById("ajgllbjkww").name="sss";
					}
					if(document.getElementById("ajsjfm1").value=="10"){
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
						document.getElementById("ajgllbjkww").name="xzssInfo.manage_type1";
					}
				
					if(!(document.getElementById("ajsjfm1").value=='1'||document.getElementById("ajsjfm1").value=="6"||document.getElementById("ajsjfm1").value=="7"||document.getElementById("ajsjfm1").value=="8"||document.getElementById("ajsjfm1").value=="9"||document.getElementById("ajsjfm1").value=="10"))
					{
						//alert(22222);
						document.getElementById("ajgllbga").style.display="none";
						document.getElementById("ajgllbnlhz").style.display="none";
						document.getElementById("ajgllbcj").style.display="none";
						document.getElementById("ajgllbgjss").style.display="none";
						document.getElementById("ajgllbczjr").style.display="none";
						document.getElementById("ajgllbjkww").style.display="none";
						document.getElementById("sffybutton").style.display="none";
						
						document.getElementById("ajgllbga").name="sss";
						document.getElementById("ajgllbnlhz").name="sss";
						document.getElementById("ajgllbcj").name="sss";
						document.getElementById("ajgllbgjss").name="sss";
						document.getElementById("ajgllbczjr").name="sss";
						document.getElementById("ajgllbjkww").name="ss";
					}
					//document.getElementById("divxzgllbinput").innerHTML='<input name="lawsuit.LReferOther" type="text" altname="行政管理类别" id="xzgllbinput" class="inputTextNormal">';
				}
				
				
					
</script>

