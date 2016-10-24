<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>行政复议信息管理系统</title>
		<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
		<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../plugs/kindeditor/kindeditor.js"></script>
		<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="../js/16B/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="../js/16B/tpl.base.js"></script>
		<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
		<style type="text/css">img,formDiv,.formDiv{behavior: url(../webstyle/style/ie-css3.htc);} </style> 	
		<style type="text/css">img,z_wrap_info,.z_wrap_info{behavior: url(../css/ie-css3.htc);} </style> 
	</head>
	<body>
	<#include "../website/header.ftl">
	
		<div class="wal pageNow2">
	      <div class="fl">当前位置：<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a> > 
	      <a href="../xzss/showUndertakerList.action?funcCode=${funcCode}">行政诉讼个人案件列表</a> >新增诉讼案件</div>
	      <div class="fr"></div>
		</div>
	
	
		<form id="form1" name="form1" action="''" method="post" ENCTYPE="multipart/form-data">
		
		<input type="hidden" name="funcCode" value="${funcCode}" />
		<input type="hidden" name="xzssInfo.id" value="${tempid}" />
		<input type="hidden" name="xzssInfo.status" value="4" />
		
	<div class="formDiv" id="banan" >	
		<table width="100%" border="0" align="center" cellpadding="10" cellspacing="0">
		
			<tr>      
	     		<th width="20%" >收案日期：</th>
			    <td width="30%" >
				    <input name="xzssInfo.receive_date" type="text" class="inputTextNormal"  
				     value="${todate}" onClick="WdatePicker()" altname="收案日期" >
			    </td>
			    <th width="20%">诉讼承办人</th>
				<td width="30%">
				    <input type="text" name="xzssInfo.undertaker_name" value="" class="inputTextNormal" />
					<!--${admit_name}
					<input type="hidden" name="xzssInfo.undertaker_name" value="${admit_name}"  class="inputTextNormal" />-->
					<input type="hidden" name="xzssInfo.undertaker_id" value="${user.id}"  />
				</td>
	  		</tr>
		
			<tr>
				<th>复议承办人</th>
				<td>
					<input type="text" name="xzssInfo.fyundertaker_name" value="<#if xzfyInfo.user2_name?has_content>${xzfyInfo.user2_name}</#if>" class="inputTextNormal" />
				</td>
				<th>原告姓名</th>
				<td>
					<input type="text" name="xzssInfo.app_name" value="" class="inputTextNormal" />
				</td>
			</tr>
		
			<tr>
				<th>原告总数</th>
				<td>
					<input type="text" name="xzssInfo.app_num" value="" class="inputTextNormal" />
				</td>
				<th>原告类别</th>
				<td>
					<select name="xzssInfo.app_type"  >
				      <option value="0">----请选择----</option>
				      <option value="1">公民</option>
				      <option value="2">法人或其他组织</option>
				    </select>
				</td>
				
	
				
			</tr>

			
			<tr>
				<th>被告姓名</th>
				<td>
					<input type="text" name="xzssInfo.defendant" value="" class="inputTextNormal" />
				</td>
				<th>代理人</th>
				<td>
					<input type="text" name="xzssInfo.agent" value="" class="inputTextNormal" />
				</td>
			</tr>
			
			<tr>
				<th>应诉机关类别</th>
				<td>
				<!--<input type="text" name="xzssInfo.jiguan_type" value="" class="inputTextNormal" /> -->
					<select name="xzssInfo.jiguan_type"  >
				      <option value="0">----请选择----</option>
				      <option value="1">原具体行政行为机关</option>
				      <option value="2">复议机关</option>
				    </select>
				</td>
				<th>应诉机关级别</th>
				<td>
					<!--<input type="text" name="xzssInfo.jiguan_level" value="" class="inputTextNormal" /> -->
					<select name="xzssInfo.jiguan_level"  >
				      <option value="0">----请选择----</option>
				      <option value="1">乡镇政府</option>
				      <option value="2">县级政府</option>
				      <option value="3">县级政府部门</option>
				      <option value="4">省部级行政机关</option>
				      <option value="5">省部级部门</option>
				      <option value="6">其他</option>				      
				    </select>
				</td>
			</tr>
			<tr>	
				<th>应诉机关</th>
				<td>
					<input type="text" name="xzssInfo.jiguan" value="" class="inputTextNormal" />
				</td>
				<th>诉讼请求</th>
				<td>
					<input type="text" name="xzssInfo.request" value="" class="inputTextNormal" />
				</td>
			</tr>
			
			<tr>
				<th>行政管理类别</th>
				<td>
				<!-- 
					<input type="text" name="xzssInfo.manage_type" value="" class="inputTextNormal" />
					-->
							<select name="xzssInfo.manage_type"   id="ajsjfm1"  ">
					        	<option value="0">----请选择----</option>
								<option value="1" <#if xzfyInfo.manage_type?default('0')=="1">selected</#if> <#if xzssInfo.manage_type?default('0')=="1">selected</#if>>公安</option>
								<option value="2" <#if xzfyInfo.manage_type?default('0')=="2">selected</#if> <#if xzssInfo.manage_type?default('0')=="2">selected</#if>>国家安全</option>
								<option value="3" <#if xzfyInfo.manage_type?default('0')=="3">selected</#if> <#if xzssInfo.manage_type?default('0')=="3">selected</#if>>劳动和社会保障</option>
								<option value="4" <#if xzfyInfo.manage_type?default('0')=="4">selected</#if> <#if xzssInfo.manage_type?default('0')=="4">selected</#if>>司法行政</option>
								<option value="5" <#if xzfyInfo.manage_type?default('0')=="5">selected</#if> <#if xzssInfo.manage_type?default('0')=="5">selected</#if>>民政</option>
								<option value="6" <#if xzfyInfo.manage_type?default('0')=="6">selected</#if> <#if xzssInfo.manage_type?default('0')=="6">selected</#if>>土地</option>
								<option value="7" <#if xzfyInfo.manage_type?default('0')=="7">selected</#if> <#if xzssInfo.manage_type?default('0')=="7">selected</#if>>地矿</option>
								<option value="8" <#if xzfyInfo.manage_type?default('0')=="8">selected</#if> <#if xzssInfo.manage_type?default('0')=="8">selected</#if>>环保</option>
								<option value="9" <#if xzfyInfo.manage_type?default('0')=="9">selected</#if> <#if xzssInfo.manage_type?default('0')=="9">selected</#if>>农业</option>
								<option value="10" <#if xzfyInfo.manage_type?default('0')=="10">selected</#if> <#if xzssInfo.manage_type?default('0')=="10">selected</#if>>水利</option>
								<option value="11" <#if xzfyInfo.manage_type?default('0')=="11">selected</#if> <#if xzssInfo.manage_type?default('0')=="11">selected</#if>>林业</option>
								<option value="12" <#if xzfyInfo.manage_type?default('0')=="12">selected</#if> <#if xzssInfo.manage_type?default('0')=="12">selected</#if>>城市规划</option>
								<option value="13" <#if xzfyInfo.manage_type?default('0')=="13">selected</#if> <#if xzssInfo.manage_type?default('0')=="13">selected</#if>>房屋拆迁</option>
								<option value="14" <#if xzfyInfo.manage_type?default('0')=="14">selected</#if> <#if xzssInfo.manage_type?default('0')=="14">selected</#if>>房屋登记</option>
								<option value="15" <#if xzfyInfo.manage_type?default('0')=="15">selected</#if> <#if xzssInfo.manage_type?default('0')=="15">selected</#if>>工商</option>
								<option value="16" <#if xzfyInfo.manage_type?default('0')=="16">selected</#if> <#if xzssInfo.manage_type?default('0')=="16">selected</#if>>质监</option>
								<option value="17" <#if xzfyInfo.manage_type?default('0')=="17">selected</#if> <#if xzssInfo.manage_type?default('0')=="17">selected</#if>>商务</option>
								<option value="18" <#if xzfyInfo.manage_type?default('0')=="18">selected</#if> <#if xzssInfo.manage_type?default('0')=="18">selected</#if>>物价</option>
								<option value="19" <#if xzfyInfo.manage_type?default('0')=="19">selected</#if> <#if xzssInfo.manage_type?default('0')=="19">selected</#if>>能源</option>
								<option value="20" <#if xzfyInfo.manage_type?default('0')=="20">selected</#if> <#if xzssInfo.manage_type?default('0')=="20">selected</#if>>交通</option>
								<option value="21" <#if xzfyInfo.manage_type?default('0')=="21">selected</#if> <#if xzssInfo.manage_type?default('0')=="21">selected</#if>>信息产业</option>
								<option value="22" <#if xzfyInfo.manage_type?default('0')=="22">selected</#if> <#if xzssInfo.manage_type?default('0')=="22">selected</#if>>邮政</option>
								<option value="23" <#if xzfyInfo.manage_type?default('0')=="23">selected</#if> <#if xzssInfo.manage_type?default('0')=="23">selected</#if>>烟草专卖</option>
								<option value="24" <#if xzfyInfo.manage_type?default('0')=="24">selected</#if> <#if xzssInfo.manage_type?default('0')=="24">selected</#if>>税务</option>
								<option value="25" <#if xzfyInfo.manage_type?default('0')=="25">selected</#if> <#if xzssInfo.manage_type?default('0')=="25">selected</#if>>人民银行</option>
								<option value="26" <#if xzfyInfo.manage_type?default('0')=="26">selected</#if> <#if xzssInfo.manage_type?default('0')=="26">selected</#if>>证监</option>
								<option value="27" <#if xzfyInfo.manage_type?default('0')=="27">selected</#if> <#if xzssInfo.manage_type?default('0')=="27">selected</#if>>保监</option>
								<option value="28" <#if xzfyInfo.manage_type?default('0')=="28">selected</#if> <#if xzssInfo.manage_type?default('0')=="28">selected</#if>>银监</option>
								<option value="29" <#if xzfyInfo.manage_type?default('0')=="29">selected</#if> <#if xzssInfo.manage_type?default('0')=="29">selected</#if>>外汇</option>
								<option value="30" <#if xzfyInfo.manage_type?default('0')=="30">selected</#if> <#if xzssInfo.manage_type?default('0')=="30">selected</#if>>财政</option>
								<option value="31" <#if xzfyInfo.manage_type?default('0')=="31">selected</#if> <#if xzssInfo.manage_type?default('0')=="31">selected</#if>>统计</option>
								<option value="32" <#if xzfyInfo.manage_type?default('0')=="32">selected</#if> <#if xzssInfo.manage_type?default('0')=="32">selected</#if>>审计</option>
								<option value="33" <#if xzfyInfo.manage_type?default('0')=="33">selected</#if> <#if xzssInfo.manage_type?default('0')=="33">selected</#if>>海关</option>
								<option value="34" <#if xzfyInfo.manage_type?default('0')=="34">selected</#if> <#if xzssInfo.manage_type?default('0')=="34">selected</#if>>商检</option>
								<option value="35" <#if xzfyInfo.manage_type?default('0')=="35">selected</#if> <#if xzssInfo.manage_type?default('0')=="35">selected</#if>>药监</option>
								<option value="36" <#if xzfyInfo.manage_type?default('0')=="36">selected</#if> <#if xzssInfo.manage_type?default('0')=="36">selected</#if>>卫生</option>
								<option value="37" <#if xzfyInfo.manage_type?default('0')=="37">selected</#if> <#if xzssInfo.manage_type?default('0')=="37">selected</#if>>计划生育</option>
								<option value="38" <#if xzfyInfo.manage_type?default('0')=="38">selected</#if> <#if xzssInfo.manage_type?default('0')=="38">selected</#if>>教育</option>
								<option value="39" <#if xzfyInfo.manage_type?default('0')=="39">selected</#if> <#if xzssInfo.manage_type?default('0')=="39">selected</#if>>文化</option>
								<option value="40" <#if xzfyInfo.manage_type?default('0')=="40">selected</#if> <#if xzssInfo.manage_type?default('0')=="40">selected</#if>>专利</option>
								<option value="41" <#if xzfyInfo.manage_type?default('0')=="41">selected</#if> <#if xzssInfo.manage_type?default('0')=="41">selected</#if>>商标</option>
								<option value="42" <#if xzfyInfo.manage_type?default('0')=="42">selected</#if> <#if xzssInfo.manage_type?default('0')=="42">selected</#if>>版权</option>	
								<option value="43" <#if xzfyInfo.manage_type?default('0')=="43">selected</#if> <#if xzssInfo.manage_type?default('0')=="43">selected</#if>>旅游</option>	
								<option value="44" <#if xzfyInfo.manage_type?default('0')=="44">selected</#if> <#if xzssInfo.manage_type?default('0')=="44">selected</#if>>其他</option>
						    </select>
				</td>
				
				<th>是否行政赔偿</th>
				<td>
					<input type="radio" name="xzssInfo.ismoney" value="是"  />  是
					<input type="radio" name="xzssInfo.ismoney" value="否" checked  />  否
				</td>
			</tr>
			<tr>
				<th>被诉具体行政行为名称</th>
				<td>
					<input type="text" name="xzssInfo.action_name" value="<#if xzfyInfo.xwname?has_content>${xzfyInfo.xwname}</#if>" class="inputTextNormal" />
				</td>
				<th>被诉具体行政行为案号</th>
				<td>
					<input type="text" name="xzssInfo.action_id" value="<#if xzfyInfo.xwnum?has_content>${xzfyInfo.xwnum}</#if>" class="inputTextNormal" />
				</td>
			</tr>
			<tr>
				<th>司法建议</th>
				<td>
					<textarea  type="text" name="xzssInfo.issifajianyi" value=""  ></textarea>
				</td>
				<th>应诉通知</th>
				<td>
					<input type="file" name="upFile" value="" class="inputTextFile" />
				</td>
			</tr>
			<!--
			<tr class="trwhite">
				<td class="tdFormText">结案文书</td>
				<td class="tdFormInput">
					<input type="file" name="upFile1" value="" class="inputTextFile" />
				</td>
				<td class="tdFormText">结案日期</td>
				
				<td class="tdFormInput" width="25%" >
				    <input name="xzssInfo.jieandate" type="text" class="inputTextNormal"  
				     value="" onClick="WdatePicker()"  >
			    </td>
			</tr>
			-->
			<tr>
			<th>一审或二审</th>
				<td>
					<select name="xzssInfo.shen1OrShen2"   >
					    <option value="">----请选择----</option>
						<option value="1">一审</option>
						<option value="2">二审</option>	
					</select>
				</td>
			</tr>
			<tr>
				<th style="display:none">是否已复议</th>
				<td style="display:none">
					<!--xzssInfo.fuyi_id-->
					<!--<input type="hidden" name="xzssInfo.fuyi_id" value="tempfuyi_id" />-->
					<select name="xzssInfo.fuyi_id"   id="sffyselect"  onchange="sfxzfy()">
						<option value="">否</option>
						<option value="1">是</option>	
				   	</select>
					<input type="button" style="display:none"  id="sffybutton1"  value="关联" class="button" onclick="search();"/>
					<p align="center">
						<a href="javascript:opendg('../xzss/search.action?funcCode=${funcCode}',900,600)"  style="display:none" id="sffybutton" >关联</a>
					</p>
				</td>
				
				
				<th>是否已一审</th>
				<td>
					<select name="ss"   id="sf1sselect"  onchange="sf1s()">
						<option value="">否</option>
						<option value="1">是</option>	
				   	</select>
				   	<p id="yiguanlian1" style="display:none"></p>
				   	<input type="hidden" name="xzssInfo.shen1" id="shen1" value="" class="inputTextNormal" />
					
					<p align="center">
						<a href="javascript:opendg('../xzss/search.action?funcCode=${funcCode}&panduanGL=${"1"}',1030,650)"  style="display:none" id="sf1sbutton" >关联</a>
					</p>
					
				</td>
				<th>是否已二审</th>
				<td>
					<select name="ss"   id="sf2sselect"  onchange="sf2s()">
						<option value="">否</option>
						<option value="1">是</option>	
				   	</select>
				   	<p id="yiguanlian2" style="display:none"></p>
				   	<input type="hidden" name="xzssInfo.shen2" id="shen2" value="" class="inputTextNormal" />
				   	
					<p align="center">
						<a href="javascript:opendg('../xzss/search.action?funcCode=${funcCode}&panduanGL=${"2"}',1030,650)"  style="display:none" id="sf2sbutton" >关联</a>
					</p>
				</td>
				
			<tr>
				<th>第一被告</th>
				<td>
					<input type="text" name="xzssInfo.beigao1" class="inputTextNormal" />
				</td>
				<th>第二被告</th>
				<td>
					<input type="text" name="xzssInfo.beigao2" class="inputTextNormal" />
				</td>
			</tr>
			<tr>
				<th>应诉法院</th>
				<td>
					<input type="text" name="xzssInfo.ysfy"  class="inputTextNormal" />
				</td>
				<th>案件类型</th>
				<td>
					<select name="xzssInfo.caseType"   id="caseType"  >
					<option value="">----请选择----</option>
					<option value="1" <#if xzfyInfo.casetype?default('0')=="1">selected</#if> <#if xzssInfo.caseType?default('0')=="1">selected</#if>>行政处罚</option>
					<option value="2" <#if xzfyInfo.casetype?default('0')=="2">selected</#if> <#if xzssInfo.caseType?default('0')=="2">selected</#if>>行政强制措施</option>
					<option value="3" <#if xzfyInfo.casetype?default('0')=="3">selected</#if> <#if xzssInfo.caseType?default('0')=="3">selected</#if>>行政征收</option>
					<option value="4" <#if xzfyInfo.casetype?default('0')=="4">selected</#if> <#if xzssInfo.caseType?default('0')=="4">selected</#if>>行政许可</option>
					<option value="5" <#if xzfyInfo.casetype?default('0')=="5">selected</#if> <#if xzssInfo.caseType?default('0')=="5">selected</#if>>行政确权</option>
					<option value="6" <#if xzfyInfo.casetype?default('0')=="6">selected</#if> <#if xzssInfo.caseType?default('0')=="6">selected</#if>>干预经营自主权</option>
					<option value="7" <#if xzfyInfo.casetype?default('0')=="7">selected</#if> <#if xzssInfo.caseType?default('0')=="7">selected</#if>>信息公开</option>
					<option value="8" <#if xzfyInfo.casetype?default('0')=="8">selected</#if> <#if xzssInfo.caseType?default('0')=="8">selected</#if>>行政不作为</option>
					<option value="9" <#if xzfyInfo.casetype?default('0')=="9">selected</#if> <#if xzssInfo.caseType?default('0')=="9">selected</#if>>其他</option>
					<option value="10" <#if xzfyInfo.casetype?default('0')=="10">selected</#if> <#if xzssInfo.caseType?default('0')=="10">selected</#if>>行政确认</option>
					<option value="11" <#if xzfyInfo.casetype?default('0')=="11">selected</#if> <#if xzssInfo.caseType?default('0')=="11">selected</#if>>举报投诉处理</option>
					
					
					</select>
				</td>
			</tr>
				<th style="display:none">是否三审</th>
				<td style="display:none">
					<input type="text" name="xzssInfo.shen3" value="" class="inputTextNormal" />
				</td>
			</tr>
			
	
		</table>
		<br/>
			<div align="center" class="btnDiv" style="padding-left:300px">
                <input type="button" name="button" class="btn1" value="提 交" onclick="createXzss()" />
            </div>
        <br/> 
                 
		
	</div>
	</form>
		<div class="foot">
			版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
			电话：65193431
		</div>
	</body>
</html>


<script type="text/javascript">
	function createXzss(){
	//alert(document.getElementById("shen1").value);
		if(confirm("确认提交？")){
		
			window.form1.action="saveXzss.action";
			window.form1.submit();
		}
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
				
				function sf1s(){

					if(document.getElementById("sf1sselect").value=="1"){
						//alert(1);
						document.getElementById("sf1sbutton").style.display="block";
					}
					else if(document.getElementById("sf1sselect").value==""){
						//alert(0);
						document.getElementById("sf1sbutton").style.display="none";
					}
					else{
						alert(2);
					}
				}
				
				function sf2s(){

					if(document.getElementById("sf2sselect").value=="1"){
						//alert(1);
						document.getElementById("sf2sbutton").style.display="block";
					}
					else if(document.getElementById("sf2sselect").value==""){
						//alert(0);
						document.getElementById("sf2sbutton").style.display="none";
					}
					else{
						alert(2);
					}
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

