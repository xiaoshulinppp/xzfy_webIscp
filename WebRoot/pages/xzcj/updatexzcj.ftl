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
	      <a href="../xzcj/showUndertakerList.action?funcCode=${funcCode}">行政裁决个人案件列表</a> ><#if isView==0>查看<#else>修改</#if>裁决案件</div>
	      <div class="fr"></div>
		</div>
	
	
		<form id="form1" name="form1" action="''" method="post" ENCTYPE="multipart/form-data">
		
		<input type="hidden" name="xzcjInfo.undertaker_id" value="${user.id}" />		
		<input type="hidden" name="funcCode" value="${funcCode}" />
		<input type="hidden" name="xzcjInfo.id" value="${xzcjInfo.id}" />
		<input type="hidden" name="tempid" value="${xzcjInfo.id}" />
		<input type="hidden" name="xzcjId" value="${xzcjInfo.id}" />
		<input type="hidden" name="xzcjInfo.app_name" value="${xzcjInfo.app_name?default('')}" />
		<input type="hidden" name="xzcjInfo.dafutongzhi" value="<#if xzcjInfo.dafutongzhi?has_content>${xzcjInfo.dafutongzhi}</#if>" />
		<input type="hidden" name="xzcjInfo.dafutongzhi1" value="<#if xzcjInfo.dafutongzhi1?has_content>${xzcjInfo.dafutongzhi1}</#if>" />
		<input type="hidden" name="xzcjInfo.fuyiwenshu" value="<#if xzcjInfo.fuyiwenshu?has_content>${xzcjInfo.fuyiwenshu}</#if>" />
		<input type="hidden" name="xzcjInfo.fuyiwenshu1" value="<#if xzcjInfo.fuyiwenshu1?has_content>${xzcjInfo.fuyiwenshu1}</#if>" />
		<input type="hidden" name="xzcjInfo.caijuewenshu" value="<#if xzcjInfo.caijuewenshu?has_content>${xzcjInfo.caijuewenshu}</#if>" />
		<input type="hidden" name="xzcjInfo.caijuewenshu1" value="<#if xzcjInfo.caijuewenshu1?has_content>${xzcjInfo.caijuewenshu1}</#if>" />
		<input type="hidden" name="xzcjInfo.status" value="<#if xzcjInfo.status?has_content>${xzcjInfo.status}</#if>" id="status" />
		<input type="hidden" name="xzcjInfo.locbm" value="${xzcjInfo.locbm?default('')}" />
		
	<div class="formDiv" id="banan" >	
		<table width="100%" border="0" align="center" cellpadding="10" cellspacing="0">
		
			<tr>      
	     		<th width="20%" >收案日期：</th>
			    <td width="30%" >
				    <input name="xzcjInfo.receive_date" type="text" class="inputTextNormal"  
				     value="<#if xzcjInfo.receive_date?has_content>${xzcjInfo.receive_date}</#if>" onClick="WdatePicker()" altname="收案日期" >
			    </td>
			    <th width="20%">承办人</th>
				<td width="30%">
					<input type="text" name="xzcjInfo.undertaker_name" value="<#if xzcjInfo.undertaker_name?has_content>${xzcjInfo.undertaker_name}</#if>" class="inputTextNormal" />
				</td>
	  		</tr>
		
			<tr>
				<th>复议承办人</th>
				<td>
					<input type="text" name="xzcjInfo.fyundertaker_name" value="<#if xzcjInfo.fyundertaker_name?has_content>${xzcjInfo.fyundertaker_name}</#if>" class="inputTextNormal" />
				</td>
				<th>申请人类别</th>
				<td>
					<select name="xzcjInfo.app_type" id="apptype" onchange="checkapptype()">
				      <option value="0" <#if xzcjInfo.app_type == "0">selected</#if> >----请选择----</option>
				      <option value="1" <#if xzcjInfo.app_type == "1">selected</#if> >公民</option>
				      <!--<option value="2" <#if xzcjInfo.app_type == "2">selected</#if> >法人或其他组织</option>-->
				    </select>
				</td>
			</tr>
			<tr>
				<th>申请人：</th>
				<td colspan=3>
					<a href="javascript:opendg('../xzcj/addApp.action?xzcjId=${xzcjInfo.id}&funcCode=${funcCode}&isView=${isView}&protype=1&textId=shenqingren&countId=rencount',1030,400)" style="display:block" id="appspan1">添加</a>
				    <a href="javascript:opendg('../xzcj/addLegal.action?xzcjId=${xzcjInfo.id}&funcCode=${funcCode}&isView=${isView}&protype=2&textId=shenqingren&countId=rencount',1030,400)"  style="display:none" id="appspan2">添加</a>
				    <textarea name="app_face.shenqingren" type="text" rows="3" cols="50" id="shenqingren" ischeck="y" altname="申请人" onfocus="if(value=='请点击添加进行查看或修改申请人信息操作'){value=''}" onblur="if(value==''){value='请点击添加进行查看或修改申请人信息操作'}" >请点击添加进行查看或修改申请人信息操作</textarea>
				</td>
			</tr>
			<tr>
				<th>原告总数</th>
				<td>
					<input type="text" name="xzcjInfo.app_num" value="<#if xzcjInfo.app_num?has_content>${xzcjInfo.app_num}</#if>" class="inputTextNormal" />
				</td>
				<th>被申请人类别</th>
				<td>
					<select name="xzcjInfo.jiguan_type"  >
				      <option value="0" <#if xzcjInfo.jiguan_type == "0">selected</#if> >----请选择----</option>
				      <option value="1" <#if xzcjInfo.jiguan_type == "1">selected</#if> >原具体行政行为机关</option>
				      <option value="2" <#if xzcjInfo.jiguan_type == "2">selected</#if> >复议机关</option>
				    </select>
				</td>				
			</tr>
			<tr>
				<th>被申请人名称</th>
				<td>
					<input type="text" name="xzcjInfo.jiguan" value="<#if xzcjInfo.jiguan?has_content>${xzcjInfo.jiguan}</#if>" class="inputTextNormal" />
				</td>
				<th>代理人</th>
				<td>
					<input type="text" name="xzcjInfo.agent" value="<#if xzcjInfo.agent?has_content>${xzcjInfo.agent}</#if>" class="inputTextNormal" />
				</td>
			</tr>
			<tr>
				<th>答复通知</th>
				<td>
					<a href="${xzcjInfo.dafutongzhi1?default('')}">${xzcjInfo.dafutongzhi?default('')}</a>
					<input type="file" name="upFile" value="" class="inputTextFile" />
				</td>
				<th>裁决请求</th>
				<td>
					<textarea cols="20" rows="3" type="text" name="xzcjInfo.request" value="" class="inputTextNormal" /><#if xzcjInfo.request?has_content>${xzcjInfo.request}</#if></textarea>
				</td>
			</tr>
			<tr>
				<th>是否行政赔偿</th>
				<td>
					<input type="radio" name="xzcjInfo.ismoney" value="是" <#if xzcjInfo.ismoney?exists && xzcjInfo.ismoney == "是" >checked="checked"</#if> />  是
					<input type="radio" name="xzcjInfo.ismoney" value="否" <#if xzcjInfo.ismoney?exists && xzcjInfo.ismoney == "否" >checked="checked"</#if> />  否
				</td>
				<th>被裁决具体行政行为名称</th>
				<td>
					<input type="text" name="xzcjInfo.action_name" value="<#if xzcjInfo.action_name?has_content>${xzcjInfo.action_name}</#if>" class="inputTextNormal" />
				</td>
			</tr>
			<tr>
				<th>被裁决具体行政行为案号</th>
				<td>
					<input type="text" name="xzcjInfo.action_id" value="<#if xzcjInfo.action_id?has_content>${xzcjInfo.action_id}</#if>" class="inputTextNormal" />
				</td>
				<th>行政管理类别</th>
				<td>
					<select name="xzcjInfo.manage_type"   id="ajsjfm1"  ">
						<option value="0">----请选择----</option>
						<option value="1" <#if xzcjInfo.manage_type?default('0')=="1">selected</#if>>公安</option>
						<option value="2" <#if xzcjInfo.manage_type?default('0')=="2">selected</#if>>国家安全</option>
						<option value="3" <#if xzcjInfo.manage_type?default('0')=="3">selected</#if>>劳动和社会保障</option>
						<option value="4" <#if xzcjInfo.manage_type?default('0')=="4">selected</#if>>司法行政</option>
						<option value="5" <#if xzcjInfo.manage_type?default('0')=="5">selected</#if>>民政</option>
						<option value="6" <#if xzcjInfo.manage_type?default('0')=="6">selected</#if>>土地</option>
						<option value="7" <#if xzcjInfo.manage_type?default('0')=="7">selected</#if>>地矿</option>
						<option value="8" <#if xzcjInfo.manage_type?default('0')=="8">selected</#if>>环保</option>
						<option value="9" <#if xzcjInfo.manage_type?default('0')=="9">selected</#if>>农业</option>
						<option value="10" <#if xzcjInfo.manage_type?default('0')=="10">selected</#if>>水利</option>
						<option value="11" <#if xzcjInfo.manage_type?default('0')=="11">selected</#if>>林业</option>
						<option value="12" <#if xzcjInfo.manage_type?default('0')=="12">selected</#if>>城市规划</option>
						<option value="13" <#if xzcjInfo.manage_type?default('0')=="13">selected</#if>>房屋拆迁</option>
						<option value="14" <#if xzcjInfo.manage_type?default('0')=="14">selected</#if>>房屋登记</option>
						<option value="15" <#if xzcjInfo.manage_type?default('0')=="15">selected</#if>>工商</option>
						<option value="16" <#if xzcjInfo.manage_type?default('0')=="16">selected</#if>>质监</option>
						<option value="17" <#if xzcjInfo.manage_type?default('0')=="17">selected</#if>>商务</option>
						<option value="18" <#if xzcjInfo.manage_type?default('0')=="18">selected</#if>>物价</option>
						<option value="19" <#if xzcjInfo.manage_type?default('0')=="19">selected</#if>>能源</option>
						<option value="20" <#if xzcjInfo.manage_type?default('0')=="20">selected</#if>>交通</option>
						<option value="21" <#if xzcjInfo.manage_type?default('0')=="21">selected</#if>>信息产业</option>
						<option value="22" <#if xzcjInfo.manage_type?default('0')=="22">selected</#if>>邮政</option>
						<option value="23" <#if xzcjInfo.manage_type?default('0')=="23">selected</#if>>烟草专卖</option>
						<option value="24" <#if xzcjInfo.manage_type?default('0')=="24">selected</#if>>税务</option>
						<option value="25" <#if xzcjInfo.manage_type?default('0')=="25">selected</#if>>人民银行</option>
						<option value="26" <#if xzcjInfo.manage_type?default('0')=="26">selected</#if>>证监</option>
						<option value="27" <#if xzcjInfo.manage_type?default('0')=="27">selected</#if>>保监</option>
						<option value="28" <#if xzcjInfo.manage_type?default('0')=="28">selected</#if>>银监</option>
						<option value="29" <#if xzcjInfo.manage_type?default('0')=="29">selected</#if>>外汇</option>
						<option value="30" <#if xzcjInfo.manage_type?default('0')=="30">selected</#if>>财政</option>
						<option value="31" <#if xzcjInfo.manage_type?default('0')=="31">selected</#if>>统计</option>
						<option value="32" <#if xzcjInfo.manage_type?default('0')=="32">selected</#if>>审计</option>
						<option value="33" <#if xzcjInfo.manage_type?default('0')=="33">selected</#if>>海关</option>
						<option value="34" <#if xzcjInfo.manage_type?default('0')=="34">selected</#if>>商检</option>
						<option value="35" <#if xzcjInfo.manage_type?default('0')=="35">selected</#if>>药监</option>
						<option value="36" <#if xzcjInfo.manage_type?default('0')=="36">selected</#if>>卫生</option>
						<option value="37" <#if xzcjInfo.manage_type?default('0')=="37">selected</#if>>计划生育</option>
						<option value="38" <#if xzcjInfo.manage_type?default('0')=="38">selected</#if>>教育</option>
						<option value="39" <#if xzcjInfo.manage_type?default('0')=="39">selected</#if>>文化</option>
						<option value="40" <#if xzcjInfo.manage_type?default('0')=="40">selected</#if>>专利</option>
						<option value="41" <#if xzcjInfo.manage_type?default('0')=="41">selected</#if>>商标</option>
						<option value="42" <#if xzcjInfo.manage_type?default('0')=="42">selected</#if>>版权</option>	
						<option value="43" <#if xzcjInfo.manage_type?default('0')=="43">selected</#if>>旅游</option>	
						<option value="44" <#if xzcjInfo.manage_type?default('0')=="44">selected</#if>>其他</option>
					</select>	
				</td>				
			</tr>
			<tr>
				<th>复议文书</th>
				<td>
					<a href="${xzcjInfo.fuyiwenshu1?default('')}">${xzcjInfo.fuyiwenshu?default('')}</a>
					<input type="file" name="upFile1" value="" class="inputTextFile" />
				</td>
				<th>复议结论</th>
				<td>
					<textarea cols="20" rows="3" type="text" name="xzcjInfo.fuyijielun" value="" class="inputTextNormal" /><#if xzcjInfo.fuyijielun?has_content>${xzcjInfo.fuyijielun}</#if></textarea>
				</td>
			</tr>
			<tr>
				<th>裁决文书</th>
				<td>
					<a href="${xzcjInfo.caijuewenshu1?default('')}">${xzcjInfo.caijuewenshu?default('')}</a>
					<input type="file" name="upFile2" value="" class="inputTextFile" />
				</td>
				<th>裁决结论</th>
				<td>
					<textarea cols="20" rows="3" type="text" name="xzcjInfo.caijuejielun" value="" class="inputTextNormal" /><#if xzcjInfo.caijuejielun?has_content>${xzcjInfo.caijuejielun}</#if></textarea>
				</td>
			</tr>
			<tr>
				<th>结案日期</th>
				<td>
					<input name="xzcjInfo.jieandate" type="text" class="inputTextNormal"  
				     value="<#if xzcjInfo.jieandate?has_content>${xzcjInfo.jieandate}</#if>" onClick="WdatePicker()"  >
				</td>
				<th></th>
				<td>
					
				</td>
			</tr>
			
			
			
		
		
			
		
			
	
		</table>
		<#if isView==1>
		<br/>
			<div align="center" class="btnDiv" style="padding-left:300px">
				
                <input type="button" name="button" class="btn1" value="修改" onclick="updateXzcj()" />
                <input type="button" name="button" class="btn1" value="结案" onclick="jiean()" />
            </div>
        <br/> 
		</#if>
        <#if isView==0> 
        <br/>
			<div align="center" class="btnDiv" style="padding-left:300px">
                <input type="button" name="button" class="btn1" value="返回" onclick="gotoBack()" />
            </div>
        <br/>          
		</#if>
	</div>
	</form>
		<div class="foot">
			版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
			电话：65193431
		</div>
	</body>
</html>


<script type="text/javascript">
	
	function opendg(dgurl,dgw,dgh)
				{
				//alert(1111);
				  $.dialog({ 
				    title:'',
				    width: dgw,
				    height: dgh,
				    content:'url:'+ dgurl});
				}
	function updateXzcj(){
		if(confirm("确认修改？")){
			window.form1.action="doupdatexzcj.action";
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



