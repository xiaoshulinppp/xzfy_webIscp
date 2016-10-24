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
		
		
		
		<form id="form1" name="form1" action="''" method="post" >
		
		<input type="hidden" name="funcCode" value="${funcCode}" />
		<input type="hidden" name="xzssid" value="${xzssInfo.id}" />
		<!--<input type="text" name="xzssInfo.status" value="${tempStatus}" />
			-->
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
		
			<tr class="trcolor">      
	     		<td class="tdFormText" width="25%">收案日期：</td>
			    <td class="tdFormInput" width="25%" >
				    <input name="xzssInfo.receive_date" type="text" class="inputTextNormal"  
				     value="<#if xzssInfo.receive_date?has_content>${xzssInfo.receive_date}</#if>" onClick="WdatePicker()" altname="收案日期" >
			    </td>
			    <td class="tdFormText">承办人</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.undertaker_name" value="<#if xzssInfo.undertaker_name?has_content>${xzssInfo.undertaker_name}</#if>" class="inputTextNormal" />
				</td>
	  		</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">复议承办人</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.fyundertaker_name" value="<#if xzssInfo.fyundertaker_name?has_content>${xzssInfo.fyundertaker_name}</#if>" class="inputTextNormal" />
				</td>
				<td class="tdFormText">原告姓名</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.app_name" value="<#if xzssInfo.app_name?has_content>${xzssInfo.app_name}</#if>" class="inputTextNormal" />
				</td>
			</tr>
		
			<tr class="trwhite">
				
				<td class="tdFormText">原告总数</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.app_num" value="<#if xzssInfo.app_num?has_content>${xzssInfo.app_num}</#if>" class="inputTextNormal" />
				</td>
				<td class="tdFormText">原告类别</td>
				<td class="tdFormInput">
						<select name="xzssInfo.app_type"  >					
					      <option value="0" <#if xzssInfo.app_type == "0">selected</#if> >----请选择----</option>
					      <option value="1" <#if xzssInfo.app_type == "1">selected</#if> >公民</option>
					      <option value="2" <#if xzssInfo.app_type == "2">selected</#if> >法人或其他组织</option>
					    </select>
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">被告姓名</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.defendant" value="<#if xzssInfo.defendant?has_content>${xzssInfo.defendant}</#if>" class="inputTextNormal" />
				</td>
				<td class="tdFormText">代理人</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.agent" value="<#if xzssInfo.agent?has_content>${xzssInfo.agent}</#if>" class="inputTextNormal" />
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">应诉机关类别</td>
				<td class="tdFormInput">
				<#if xzssInfo.jiguan_type == "1">
					<select name="xzssInfo.jiguan_type"  >
				      <option value="0">----请选择----</option>
				      <option value="1" selected>原具体行政行为机关</option>
				      <option value="2">复议机关</option>
				    </select>
			    <#elseif xzssInfo.jiguan_type == "2">
				    <select name="xzssInfo.jiguan_type"  >
				      <option value="0">----请选择----</option>
				      <option value="1">原具体行政行为机关</option>
				      <option value="2" selected>复议机关</option>
				    </select>
			    <#else>
			    	<select name="xzssInfo.jiguan_type"  >
				      <option value="0" selected>----请选择----</option>
				      <option value="1">原具体行政行为机关</option>
				      <option value="2">复议机关</option>
				    </select>
			   	</#if> 
			   	
				<!--	<input type="text" name="xzssInfo.jiguan_type" value="<#if xzssInfo.jiguan_type?has_content>${xzssInfo.jiguan_type}</#if>" class="inputTextNormal" />
					-->
				</td>
				<td class="tdFormText">应诉机关级别</td>
				<td class="tdFormInput">
				
					<select name="xzssInfo.jiguan_level"  >
				      <option value="0" <#if xzssInfo.jiguan_level == "0">selected</#if> >----请选择----</option>
				      <option value="1" <#if xzssInfo.jiguan_level == "1">selected</#if> >乡镇政府</option>
				      <option value="2" <#if xzssInfo.jiguan_level == "2">selected</#if> >县级政府</option>
				      <option value="3" <#if xzssInfo.jiguan_level == "3">selected</#if> >县级政府部门</option>
				      <option value="4" <#if xzssInfo.jiguan_level == "4">selected</#if> >省部级行政机关</option>
				      <option value="5" <#if xzssInfo.jiguan_level == "5">selected</#if> >省部级部门</option>
				      <option value="6" <#if xzssInfo.jiguan_level == "6">selected</#if> >其他</option>		      
				    </select>
				<!--	<input type="text" name="xzssInfo.jiguan_level" value="<#if xzssInfo.jiguan_level?has_content>${xzssInfo.jiguan_level}</#if>" class="inputTextNormal" />
					-->
				</td>
			</tr>
			<tr class="trwhite">	
				<td class="tdFormText">应诉机关</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.jiguan" value="<#if xzssInfo.jiguan?has_content>${xzssInfo.jiguan}</#if>" class="inputTextNormal" />
				</td>
				<td class="tdFormText">诉讼请求</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.request" value="<#if xzssInfo.request?has_content>${xzssInfo.request}</#if>" class="inputTextNormal" />
				</td>
			</tr>
			
			<tr class="trwhite">
				
				<td class="tdFormText">行政管理类别</td>
				<td class="tdFormInput">
				<!-- <input type="text" name="xzssInfo.manage_type" value="<#if xzssInfo.manage_type?has_content>${xzssInfo.manage_type}</#if>" class="inputTextNormal" />
					-->
						<select name="xzssInfo.manage_type"   id="ajsjfm1"  onchange="ajgllb()">
					        <option value="0" <#if xzssInfo.manage_type == "0">selected</#if> >----请选择----</option>
							<option value="1" <#if xzssInfo.manage_type == "1">selected</#if> >公安</option>
							<option value="2" <#if xzssInfo.manage_type == "2">selected</#if> >国家安全</option>
							<option value="3" <#if xzssInfo.manage_type == "3">selected</#if> >劳动和社会保障</option>
							<option value="4" <#if xzssInfo.manage_type == "4">selected</#if> >司法行政</option>
							<option value="5" <#if xzssInfo.manage_type == "5">selected</#if> >民政</option>
							<option value="6" <#if xzssInfo.manage_type == "6">selected</#if> >农林环资</option>
							<option value="7" <#if xzssInfo.manage_type == "7">selected</#if> >城建</option>
							<option value="8" <#if xzssInfo.manage_type == "8">selected</#if> >工交商事</option>
							<option value="9" <#if xzssInfo.manage_type == "9">selected</#if> >财政金融</option>
							<option value="10" <#if xzssInfo.manage_type == "10">selected</#if> >教科文卫</option>
							<option value="11" <#if xzssInfo.manage_type == "11">selected</#if> >其他</option>
					    </select>
				    
			     		 <!--公安-->
					     <select name="xzssInfo.manage_type1" style="display:none"  id="ajgllbga"  ishidden="y">
					        <option value="0" <#if xzssInfo.manage_type1 == "0">selected</#if> >----请选择----</option>
							<option value="1" <#if xzssInfo.manage_type1 == "1">selected</#if> >治安</option>
							<option value="2" <#if xzssInfo.manage_type1 == "2">selected</#if> >劳教</option>
							<option value="3" <#if xzssInfo.manage_type1 == "3">selected</#if> >其他</option>
						 </select>
						 											 
						 <!--农林环资-->	 
						 <select name="xzssInfo.manage_type1" style="display:none" id="ajgllbnlhz" ishidden="y">
						  	<option value="0" <#if xzssInfo.manage_type1 == "0">selected</#if> >----请选择----</option>
							<option value="9" <#if xzssInfo.manage_type1 == "9">selected</#if> >土地</option>
							<option value="10" <#if xzssInfo.manage_type1 == "10">selected</#if> >地矿</option>
							<option value="11" <#if xzssInfo.manage_type1 == "11">selected</#if> >环保</option>
							<option value="12" <#if xzssInfo.manage_type1 == "12">selected</#if> >农业</option>
							<option value="13" <#if xzssInfo.manage_type1 == "13">selected</#if> >水利</option>
							<option value="14" <#if xzssInfo.manage_type1 == "14">selected</#if> >林业</option>
							<option value="15" <#if xzssInfo.manage_type1 == "15">selected</#if> >其他</option>
						 </select>
																	
						 <!--城建-->
						 <select name="xzssInfo.manage_type1" style="display:none" class="selectStyleNormal" id="ajgllbcj" altname="行政管理类别" ishidden="y">
						  	<option value="0" <#if xzssInfo.manage_type1 == "0">selected</#if> >----请选择----</option>
							<option value="17" <#if xzssInfo.manage_type1 == "17">selected</#if> >城市规划</option>
							<option value="18" <#if xzssInfo.manage_type1 == "18">selected</#if> >房屋拆迁</option>
							<option value="19" <#if xzssInfo.manage_type1 == "19">selected</#if> >房屋登记</option>
							<option value="20" <#if xzssInfo.manage_type1 == "20">selected</#if> >其他</option>					
						</select>
					
						 <!--工交商事-->
						 <select name="xzssInfo.manage_type1" style="display:none" class="selectStyleNormal" id="ajgllbgjss" altname="行政管理类别" ishidden="y">
						  	<option value="0" <#if xzssInfo.manage_type1 == "0">selected</#if> >----请选择----</option>
							<option value="22" <#if xzssInfo.manage_type1 == "22">selected</#if> >工商</option>
							<option value="23" <#if xzssInfo.manage_type1 == "23">selected</#if> >质监</option>
							<option value="24" <#if xzssInfo.manage_type1 == "24">selected</#if> >商务</option>
							<option value="25" <#if xzssInfo.manage_type1 == "25">selected</#if> >物价</option>
							<option value="26" <#if xzssInfo.manage_type1 == "26">selected</#if> >能源</option>
							<option value="27" <#if xzssInfo.manage_type1 == "27">selected</#if> >交通</option>
							<option value="28" <#if xzssInfo.manage_type1 == "28">selected</#if> >信息产业</option>
							<option value="29" <#if xzssInfo.manage_type1 == "29">selected</#if> >邮政</option>
							<option value="30" <#if xzssInfo.manage_type1 == "30">selected</#if> >烟草专买</option>
						</select>
					
						 <!--财政金融-->
						 <select name="xzssInfo.manage_type1" style="display:none" class="selectStyleNormal" id="ajgllbczjr" altname="行政管理类别" ishidden="y">
						  	<option value="0" <#if xzssInfo.manage_type1 == "0">selected</#if> >----请选择----</option>
							<option value="32" <#if xzssInfo.manage_type1 == "32">selected</#if> >税务</option>
							<option value="33" <#if xzssInfo.manage_type1 == "33">selected</#if> >人民银行</option>
							<option value="34" <#if xzssInfo.manage_type1 == "34">selected</#if> >证监</option>
							<option value="35" <#if xzssInfo.manage_type1 == "35">selected</#if> >保监</option>
							<option value="36" <#if xzssInfo.manage_type1 == "36">selected</#if> >银监</option>
							<option value="37" <#if xzssInfo.manage_type1 == "37">selected</#if> >外汇</option>
							<option value="38" <#if xzssInfo.manage_type1 == "38">selected</#if> >财政</option>
							<option value="39" <#if xzssInfo.manage_type1 == "39">selected</#if> >统计</option>
							<option value="40" <#if xzssInfo.manage_type1 == "40">selected</#if> >审计</option>
							<option value="41" <#if xzssInfo.manage_type1 == "41">selected</#if> >海关</option>
							<option value="42" <#if xzssInfo.manage_type1 == "42">selected</#if> >商检</option>						
						</select>
						
						 <!--教科文卫-->
						 <select name="xzssInfo.manage_type1" style="display:none" class="selectStyleNormal" id="ajgllbjkww" altname="行政管理类别" ishidden="y">
						  	<option value="0" <#if xzssInfo.manage_type1 == "0">selected</#if> >----请选择----</option>
							<option value="44" <#if xzssInfo.manage_type1 == "44">selected</#if> >药监</option>
							<option value="45" <#if xzssInfo.manage_type1 == "45">selected</#if> >卫生</option>
							<option value="46" <#if xzssInfo.manage_type1 == "46">selected</#if> >计划生育</option>
							<option value="47" <#if xzssInfo.manage_type1 == "47">selected</#if> >教育</option>
							<option value="48" <#if xzssInfo.manage_type1 == "48">selected</#if> >文化</option>
							<option value="49" <#if xzssInfo.manage_type1 == "49">selected</#if> >专利</option>
							<option value="50" <#if xzssInfo.manage_type1 == "50">selected</#if> >商标</option>
							<option value="51" <#if xzssInfo.manage_type1 == "51">selected</#if> >版权</option>
							<option value="52" <#if xzssInfo.manage_type1 == "52">selected</#if> >旅游</option>
					     </select>
					
				</td>
				<td class="tdFormText">是否行政赔偿</td>
				<td class="tdFormInput">
				
					<input type="radio" name="xzssInfo.ismoney" value="是" <#if xzssInfo.ismoney?exists && xzssInfo.ismoney == "是" >checked="checked"</#if> />  是
					<input type="radio" name="xzssInfo.ismoney" value="否" <#if xzssInfo.ismoney?exists && xzssInfo.ismoney == "否" >checked="checked"</#if> />  否
				</td>
			</tr>

			
			<tr class="trwhite">
				<td class="tdFormText">被诉具体行政行为名称</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.action_name" value="<#if xzssInfo.action_name?has_content>${xzssInfo.action_name}</#if>" class="inputTextNormal" />
				</td>
				<td class="tdFormText">被诉具体行政行为案号</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.action_id" value="<#if xzssInfo.action_id?has_content>${xzssInfo.action_id}</#if>" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">司法建议</td>
				<td class="tdFormInput">
					<textarea cols="30" rows="5" type="text" name="xzssInfo.issifajianyi" value="<#if xzssInfo.issifajianyi?has_content>${xzssInfo.issifajianyi}</#if>" class="inputTextNormal" />
					</textarea>
					<!-- <input type="text" name="xzssInfo.issifajianyi" value="<#if xzssInfo.issifajianyi?has_content>${xzssInfo.issifajianyi}</#if>" class="inputTextNormal" />
						-->
				</td>
				<td class="tdFormText">应诉通知</td>
				<td class="tdFormInput">
					<#if xzssInfo.yingsutongzhi?has_content>${xzssInfo.yingsutongzhi}</#if>
					<input type="file" name="xzssInfo.yingsutongzhi" value="" class="inputTextFile" />
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">结案文书</td>
				<td class="tdFormInput">
					<#if xzssInfo.jieanwenshu?has_content>${xzssInfo.jieanwenshu}</#if>
					<input type="file" name="xzssInfo.jieanwenshu" value="<#if xzssInfo.jieanwenshu?has_content>${xzssInfo.jieanwenshu}</#if>" class="inputTextFile" />
				</td>
				<td class="tdFormText">结案日期</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.jieandate" value="<#if xzssInfo.jieandate?has_content>${xzssInfo.jieandate}</#if>" class="inputTextNormal" />
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">是否复议</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.fuyi_id" value="<#if xzssInfo.fuyi_id?has_content>${xzssInfo.fuyi_id}</#if>" class="inputTextNormal" />
				</td>
				<td class="tdFormText">是否一审</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.shen1" value="<#if xzssInfo.shen1?has_content>${xzssInfo.shen1}</#if>" class="inputTextNormal" />
				</td>
			</tr>
			

			<tr class="trwhite">
				<td class="tdFormText">是否二审</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.shen2" value="<#if xzssInfo.shen2?has_content>${xzssInfo.shen2}</#if>" class="inputTextNormal" />
				</td>	
				<td class="tdFormText">是否三审</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.shen3" value="<#if xzssInfo.shen3?has_content>${xzssInfo.shen3}</#if>" class="inputTextNormal" />
				</td>
			</tr>
			

			
			
			
			
			
			
			
			
			
			
		
			
		

			
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<input type="button" id="sunbt" class="button" value="修改" onclick="updateXzss();" />
					<input type="button" class="button" value="结案" onclick="jiean();" />
					<input type="button" class="button" value="返 回" onclick="gotoBack();" />
				</td>
			</tr>
			
		</form>
		</table>
	</body>
</html>


<script type="text/javascript">
	function updateXzss(){
		if(confirm("确认修改？")){
			window.form1.action="doUpdatexzss.action";
			window.form1.submit();
		}
	}
	function jiean(){
		if(confirm("确认结案？")){
			window.form1.action="jiean.action";
			window.form1.submit();
		}
	}
	function gotoBack(){
		window.history.back();
	}
	
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
					/*
					if(document.getElementById("sffyselect").value=="是"){
						alert(aaaaa);
						document.getElementById("sffybutton").style.display="block";
					}
					*/
				
					if(!(document.getElementById("sffyselect").value=="是"||document.getElementById("ajsjfm1").value=='公安'||document.getElementById("ajsjfm1").value=="农林环资"||document.getElementById("ajsjfm1").value=="城建"||document.getElementById("ajsjfm1").value=="工交商事"||document.getElementById("ajsjfm1").value=="财政金融"||document.getElementById("ajsjfm1").value=="教科文卫"))
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