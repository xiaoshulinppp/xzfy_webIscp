<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>立案审理</title>

<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">

</head>

<body>
<form action="''" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
<!--您的位置表格开始-->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" id=control>
  <tr>
    <td height="20">您的位置：行政复议案件管理 -&gt; 当面接待案件登记</td>
  </tr>
</table>
<!--您的位置表格结束-->
<!--标题表格开始-->
<!--标题表格结束-->
<!--主体内容、列表显示区域-->

<input id="conutAppname" type=hidden name="conutAppname">

<#--
<input name="app_face.TAdd" type="hidden" id="Tadd" value="0"/ >
<input id="appstring" type=hidden name="appString">
<input name="app_face.appType" type="hidden" value="1" id="appType"/ >
<input type="hidden" name="appType" id="appType" value="1" />
<input name="app_face.TId" type="hidden" class="inputTextNormal" title="请输入正确的姓名，格式在20个汉字以内" value="">
<input type="hidden" name="date" value="${date}" id="facedate"/>
<input name="app_face.TAppFyOrg" type="hidden" class="inputTextNormal" value='6' />
-->

<!-- 被申请人部门id -->
<input name="xzfyInfo.TApplicationDeptID" type="hidden" class="inputTextNormal" id="deptid" />
<!-- 状态 -->
<input type="hidden" name="sta" id="sta" value="11" />
<input id="xzfyId" name="xzfyInfo.id" value="${xzfyInfo.id}" type="hidden">
<input type="hidden" name="funcCode" value="${funcCode}" />
   
 <div id="kkk1" style="display:block">
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">

<tr class="trcolor">
  <td class="tdFormText" width="25%">接待日期：</td>
  <td class="tdFormInput" width="25%">${xzfyInfo.receive_date?default('')}</td>
  <td class="tdFormText">接待地点：</td>
  <td class="tdFormInput">${xzfyInfo.receive_address?default('')}</td>
</tr>

<tr class="trcolor">
  <td class="tdFormText">接待人：</td>
  <td class="tdFormInput">${xzfyInfo.admit1?default('')}</td>
  <td class="tdFormText">第二接待人：</td>
  <td class="tdFormInput">${xzfyInfo.admit2?default('')}</td>
</tr>

<tr class="trcolor">
  <td class="tdFormText" width="25%">被接待人：</td>
  <td class="tdFormInput" width="25%">${xzfyInfo.jd_detail?default('')}</td>
  <td class="tdFormText">接待人数：</td>
  <td class="tdFormInput">${xzfyInfo.applicationsum?default('')}</td>  
</tr>

<tr class="trcolor">
  <td class="tdFormText">多人复议：</td>
  <td class="tdFormInput">${xzfyInfo.ismany?default('')}</td>
</tr>

<tr class="trcolor">
  <td class="tdFormText" >涉及安全：</td>
  <td class="tdFormInput" colspan=3>
  ${xzfyInfo.ismany?default('')}
  <#if xzfyInfo.issafe?exists && xzfyInfo.issafe == "是">
    <span id="aqspan"  style="display:none">
	${xzfyInfo.safe_content?default('')}
	</span>
  </#if>
  </td>
</tr>

<tr class="trcolor">
  <td class="tdFormText">申请人类别：</td>
  <td class="tdFormInput">
  <#if xzfyInfo.app_type?exists && xzfyInfo.app_type == "1">
  	公民
  <#else>
  	法人或其他组织
  </#if>
  </td>
  <td class="tdFormText">申请人人数：</td>
  <td class="tdFormInput">
    ${xzfyInfo.rencount?default('')}
  </td>
</tr>

<tr class="trcolor" id="shenqingren1">
  <td class="tdFormText">申请人：</td>
  <td class="tdFormInput" colspan=3>
    ${xzfyInfo.appdetail?default('')}
  </td>
</tr>

<#if xzfyInfo.agentDetail?exists && xzfyInfo.agentDetail?has_content>
	<tbody id="daibiaorendiv">
	    <tr class="trcolor"> 
		    <td class="tdFormText">代表人和联系人：</td>
		    <td class="tdFormInput" colspan=3>${xzfyInfo.agentDetail?default('')}</td>
	    </tr>
   	</tbody> 
</#if>
   
<tr class="trcolor">
  <td class="tdFormText">是否有代理人：</td>
  <td class="tdFormInput">
    <#if xzfyInfo.agent?exists && xzfyInfo.agent == "1">
   	 有
    <#else>
           无
    </#if>
  </td>
  <td class="tdFormText">&nbsp;</td>
  <td class="tdFormInput">&nbsp;</td>
</tr>	

<#if xzfyInfo.agent?exists && xzfyInfo.agent == "1">
<tr class="trwhite" id="jddlr">
  <td class="tdFormText">委托代理人姓名：</td>
  <td class="tdFormInput">
      ${xzfyInfo.agent_name?default('')}
  </td>
  <td class="tdFormText">是否有授权委托书：</td>
  <td class="tdFormInput">
  <#if xzfyInfo.proxy?exists && xzfyInfo.proxy == "1">无委托
  <#elseif xzfyInfo.proxy == "2">口头委托
  <#elseif xzfyInfo.proxy == "3">特殊情况口头委托
  <#elseif xzfyInfo.proxy == "4">书面委托
  </#if>
  </td>
</tr>
</#if>

<#if xzfyInfo.proxy?exists && xzfyInfo.proxy=="3">
  <tr class="trwhite" id="jddlr1">
    <td class="tdFormText">委托时间：</td>
    <td class="tdFormInput">${xzfyInfo.agent_date?default('')}</td>
    <td class="tdFormText">地点：</td>
    <td class="tdFormInput">${xzfyInfo.agent_address?default('')}</td>
  </tr>
</#if>

<tr class="trcolor">
  <td class="tdFormText" width="25%">被申请人种类：</td>
  <td class="tdFormInput" width="25%">
  <#if xzfyInfo.defendant_type?exists && xzfyInfo.defendant_type?has_content>
   <#if xzfyInfo.defendant_type=='1'>乡镇政府
   <#elseif xzfyInfo.defendant_type=='2'>县级政府
   <#elseif xzfyInfo.defendant_type=='3'>县级政府部门
   <#elseif xzfyInfo.defendant_type=='6'>省部级行政机关
   <#elseif xzfyInfo.defendant_type=='7'>省级政府部门
   <#elseif xzfyInfo.defendant_type=='8'>其他
   <#elseif xzfyInfo.defendant_type=='9'>市经济技术开发区管委会
   </#if>
  </#if>
  </td>
  <td class="tdFormText" width="25%">被申请人名称：</td>
  <td class="tdFormInput" style="display:block;" id="beappnametd" width="25%">
    ${xzfyInfo.defendant_name?default('')}   
  </td>
</tr>

<tr class="trcolor" id="mingan">
  <td class="tdFormText">是否行政不作为：</td>
  <td class="tdFormInput">
   <#if xzfyInfo.ismanage?exists && xzfyInfo.ismanage=="2">
   	是
   <#else>
          否
   </#if>
  </td>
  <td class="tdFormText">要求复议的具体行政行为情况：</td>
  <td class="tdFormInput">
	${xzfyInfo.require_fy?default('')}
  </td>
</tr>
 
  
  <tbody id="sendnotuse" style="display:block;">
  <tr class="trcolor" id="requesttype" style="display:none">
     <td class="tdFormText2">行政管理类别：</td>
	    <td class="tdFormInput2"> 
	    <select name="xzfyInfo.manage_type" id="cardnum" >
	    <option value="0">-请选择-</option>
			<option value="公安治安">公安治安</option>
			<option value="公安劳教">公安劳教</option>
			<option value="公安其他">公安其他</option>
	    		<option value="国家安全">国家安全</option>
		 	<option value="劳动和社会保障">劳动和社会保障</option>
		 	<option value="司法行政">司法行政</option>
		 	<option value="民政">民政</option>
		 	<option value="农林环资土地">农林环资土地</option>
		 	<option value="农林环资地矿">农林环资地矿</option>
		 	<option value="农林环资环保">农林环资环保</option>
		 	<option value="农林环资农业">农林环资农业</option>
		 	<option value="农林环资水利">农林环资水利</option>
		 	<option value="农林环资林业">农林环资林业</option>
		 	<option value="农林环资其他">农林环资其他</option>
		 	<option value="城建规划">城建规划</option>
			<option value="城建拆迁">城建拆迁</option>
			<option value="城建房屋登记">城建房屋登记</option>
			<option value="城建其他">城建其他</option>
			<option value="工交商事工商">工交商事工商</option>
			<option value="工交商事质监">工交商事质监</option>
			<option value="工交商事商务">工交商事商务</option>
			<option value="工交商事物价">工交商事物价</option>
			<option value="工交商事能源">工交商事能源</option>
			<option value="工交商事交通">工交商事交通</option>
			<option value="工交商事信息产业">工交商事信息产业</option>
			<option value="工交商事邮政">工交商事邮政</option>
			<option value="工交商事烟草专卖">工交商事烟草专卖</option>
			<option value="财政金融税务">财政金融税务</option>
			<option value="财政金融人民银行">财政金融人民银行</option>
			<option value="财政金融证监">财政金融证监</option>
			<option value="财政金融保监">财政金融保监</option>
			<option value="财政金融银监">财政金融银监</option>
			<option value="工交商事能源">工交商事能源</option>
			<option value="财政金融外汇">财政金融外汇</option>
			<option value="财政金融财政">财政金融财政</option>
			<option value="财政金融统计">财政金融统计</option>
			<option value="财政金融审计">财政金融审计</option>
			<option value="财政金融海关">财政金融海关</option>
			<option value="财政金融商检">财政金融商检</option>
			<option value="教科文卫药监">教科文卫药监</option>
			<option value="教科文卫卫生">教科文卫卫生</option>
			<option value="教科文卫计划生育">教科文卫计划生育</option>
			<option value="财政金融海关">财政金融海关</option>
			<option value="财政金融商检">财政金融商检</option>
			<option value="教科文卫药监">教科文卫药监</option>
			<option value="教科文卫卫生">教科文卫卫生</option>
			<option value="教科文卫计划生育">教科文卫计划生育</option>
			<option value="教科文卫教育">教科文卫教育</option>
			<option value="教科文卫文化">教科文卫文化</option>
			<option value="教科文卫专利">教科文卫专利</option>
			<option value="教科文卫商标">教科文卫商标</option>
			<option value="教科文卫版权">教科文卫版权</option>
			<option value="其他">其他</option>
		</select>
	    </td>
	    <td class="tdFormText2">&nbsp;</td>
   <td  class="tdFormInput2">&nbsp; </td>
	   </tr>

  <tr class="trwhite" id="requesttype2" style="display:none">
   <td class="tdFormText2">不作为事项：</td>
   <td  class="tdFormInput2">

  <select name="xzfyInfo.matter_type" id="use_type"  onchange="setBzw()">
         <option value="">----请选择----</option>
	 <option value="不颁发证照">不颁发证照</option>
	 <option value="不审批登记">不审批登记</option>
	 <option value="不保护人身权">不保护人身权</option>
	 <option value="不保护其他财产权">不保护其他财产权</option>
	 <option value="不保护受教育权">不保护受教育权</option>
	 <option value="不发放抚恤金">不发放抚恤金</option>
	 <option value="不发放社会保险金">不发放社会保险金</option>
	 <option value="不发放最低生活保障费">不发放最低生活保障费</option>
	 <option value="不履行信息公开职责">不履行信息公开职责</option>
	 <option value="其他">其他</option>
  </select>
  <textarea class="textarea" name="xzfyInfo.matter_detail" id="bzwbc" style="width:300px;overflow-y:visible;"></textarea>
  </span>
  </td>
	    <td class="tdFormText2">申请人曾经要求被申请人<br>履行何种法定职责：</td>
	    <td class="tdFormInput2" ><textarea name="xzfyInfo.duty" id="zhize" type="text" class="textarea"  style="width:300px;overflow-y:visible;"></textarea>
	    </td>
	    </tr>    
	    <tr class="trcolor" id="requesttype3" style="display:none">
	    <td class="tdFormText2">要求被申请人履行日期：</td>
	    <td class="tdFormInput2">
	    <select name="knowy" id="knowy1" onchange='setKnowDate1()' retSelect="1">
	   		<option value="0">选择年</option>
			<option value="1997">1997</option>
	    	<option value="1998">1998</option>
		 	<option value="1999">1999</option>
		 	<option value="2000">2000</option>
		 	<option value="2001">2001</option>
		 	<option value="2002">2002</option>
		 	<option value="2003">2003</option>
		 	<option value="2004">2004</option>
		 	<option value="2005">2005</option>
		 	<option value="2006">2006</option>
		 	<option value="2007">2007</option> 
		 	<option value="2008">2008</option>
		 	<option value="2009">2009</option>
			<option value="2010">2010</option>
			<option value="2011">2011</option>
			<option value="2012">2012</option>
			<option value="2013">2013</option>
		</select>
		<select name="knowm" id="knowm1" onchange='setKnowDate1()' retSelect="1">
			<option value="0">选择月</option>
	    		<option value="1">01</option>
		 	<option value="2">02</option>
		 	<option value="3">03</option>
		 	<option value="4">04</option>
		 	<option value="5">05</option>
		 	<option value="6">06</option>
		 	<option value="7">07</option>
		 	<option value="8">08</option>
		 	<option value="9">09</option>
		 	<option value="10">10</option>
		 	<option value="11">11</option>
			<option value="12">12</option>
		</select>
		<select name="knowd" id="knowd1" onchange='setKnowDate1()' retSelect="1">
			<option value="0">选择日</option>
	    		<option value="1">01</option>
		 	<option value="2">02</option>
		 	<option value="3">03</option>
		 	<option value="4">04</option>
		 	<option value="5">05</option>
		 	<option value="6">06</option>
		 	<option value="7">07</option>
		 	<option value="8">08</option>
		 	<option value="9">09</option>
		 	<option value="10">10</option>
		 	<option value="11">11</option>
			<option value="12">12</option>
		 	<option value="13">13</option>
		 	<option value="14">14</option>
		 	<option value="15">15</option>
		 	<option value="16">16</option>
		 	<option value="17">17</option>
		 	<option value="18">18</option>
		 	<option value="19">19</option>
		 	<option value="20">20</option>
		 	<option value="21">21</option>
			<option value="22">22</option>
		 	<option value="23">23</option>
		 	<option value="24">24</option>
		 	<option value="25">25</option>
		 	<option value="26">26</option>
		 	<option value="27">27</option>
			<option value="28">28</option>
		 	<option value="29">29</option>
		 	<option value="30">30</option>
			<option value="31">31</option>
		</select>
	    </td>
		<td class="tdFormText2">是否有曾要求履责而<br>未履行的证明材料：</td>
	    <td class="tdFormInput2">
	   <select name="xzfyInfo.is_prof" id="ismingque" onchange="ryq2()">
	    <option value="0">----请选择----</option>
	      <option value="有">有</option>
		 <option value="无">无</option>
	  </select>
	    <textarea name="xzfyInfo.is_prof_detail" id="mingque" class="textarea" ></textarea>
	      </td>
	   </tr>
	   
<tr class="trcolor">
  <td class="tdFormText">该具体行政行为侵害&nbsp;&nbsp;&nbsp;&nbsp;<br>申请人何种合法权益：</td>
  <td class="tdFormInput">${xzfyInfo.break_right?default('')}</td>   
  <td  class="tdFormText">行政复议请求：
  </td>
  <td  class="tdFormInput">
  <#if xzfyInfo.xzfy_requset?exists && xzfyInfo.xzfy_requset=="1">撤销该具体行政行为
  <#elseif xzfyInfo.xzfy_requset=="2">变更该具体行政行为
  <#elseif xzfyInfo.xzfy_requset=="3">确认该具体行政行为违法
  <#elseif xzfyInfo.xzfy_requset=="4">责令被申请人履行法定职责
  <#elseif xzfyInfo.xzfy_requset=="5">确认被申请人不履行法定职责违法
  </#if></br>
   
   ${xzfyInfo.xzfy_requset_retail?default('')}
  </td>
</tr>
<tr class="trcolor">
    <td class="tdFormText">是否听证：</td>
    <td class="tdFormInput">
    <#if xzfyInfo.istingzheng?exists && xzfyInfo.istingzheng=="是">
      是

      <#else>
      否
	  
      </#if>
    </td>
    <td class="tdFormText">是否行政赔偿：</td>
    <td  class="tdFormInput">
    <#if xzfyInfo.isMoney?exists && xzfyInfo.isMoney=="是">
      是
	<#else>
	  否
	</#if>
    </td>
</tr>
   
<#if xzfyInfo.isMoney?exists && xzfyInfo.isMoney=="是">
<tr class="trcolor" id="peichang_div">
	<td class="tdFormText">赔偿金额：</td>
	<td class="tdFormInput">
	  ${xzfyInfo.money_Detail?default('')}
	</td>
	<td class="tdFormText">受损证明材料：</td>
    <td  class="tdFormInput">
    ${xzfyInfo.money_file?default('')}
    </td>
</tr>
</#if>

<tr class="trcolor">
		<td class="tdFormText">复议前置：</td>
	    <td class="tdFormInput">
	    <#if xzfyInfo.isfront?exists && xzfyInfo.isfront=="是">是
	    <#else>否
	    </#if>
        </td>
        
        <td class="tdFormText">对规范性文件审查：</td>
	    <td class="tdFormInput">
	    <#if xzfyInfo.ischeck?exists && xzfyInfo.ischeck=="是">是
		  <span id="shencha">规范文件：${xzfyInfo.check_file?default('')}</span>
	    <#else>否
	    </#if>
	    </td>
</tr>
 
<tr class="trcolor">
  	<td class="tdFormText">是否愿意接受调解：</td>
    <td class="tdFormInput">
    <#if xzfyInfo.istiaojie?exists && xzfyInfo.istiaojie=="1">案前调解
    <#elseif xzfyInfo.istiaojie="2">调解
    <#elseif xzfyInfo.istiaojie="3">否
    </#if>
    </td>
    
	<td class="tdFormText">其他复议机关、法院&nbsp;&nbsp;&nbsp;&nbsp;<br>是否受理同一复议申请：</td>
    <td class="tdFormInput">
     <#if xzfyInfo.issame?exists && xzfyInfo.issame=="否">
     否
     <#else>
     是</br>${xzfyInfo.issame_detail?default('')}
     </#if>
    </td>
</tr>
<#if xzfyInfo.istiaojie?exists && xzfyInfo.istiaojie=="1">
<tbody id="otherDetail">	  
<tr class="trcolor" >
	    <td class="tdFormText" colspan=4>调解日期自：${xzfyInfo.tiaojie_from?default('')}
	    至：
	    ${xzfyInfo.tiaojie_to?default('')}
	    我们将于收到申请材料后${xzfyInfo.tiaojie_count?default('')}个工作日内尝试案前调解工作，调解期间不计入行政复议受理审查或者行政复议审理期限。
	    </td>
</tr>
</tbody>
</#if>
 <tr class="trcolor">
  <td class="tdFormText">接待情况：</td>
  <td class="tdFormInput" >
    <#if xzfyInfo.condition_type?exists && xzfyInfo.condition_type=="1">告知
    <#elseif xzfyInfo.condition_type=="2">补正
    <#elseif xzfyInfo.condition_type=="3">接收
    </#if>
    <#if xzfyInfo.condition_type?exists && xzfyInfo.condition_type=="3">
     ${xzfyInfo.jd_file_content?default('')}
    <#elseif xzfyInfo.condition_type=="1">
     ${xzfyInfo.jd_gz_content?default('')}
    <#elseif xzfyInfo.condition_type=="2">
	    ${xzfyInfo.jd_bz_content?default('')}
    </#if>
  </td>
  
  <td class="tdFormText">被接待人意见：</td>
  <td class="tdFormInput">
    <#if xzfyInfo.app_advice_type?exists && xzfyInfo.app_advice_type=="1">同意
    <#elseif xzfyInfo.app_advice_type=="2">坚持申请行政复议
    <#elseif xzfyInfo.app_advice_type=="3">其他
    <#elseif xzfyInfo.app_advice_type=="4">知道了
    </#if></br>
    ${xzfyInfo.app_advice_detail?default('')}
  </td>
</tr>
	 
<tr class="trcolor">
  <td class="tdFormText">笔录上传：</td>
	<td class="tdFormInput">&nbsp;</td>
	<td class="tdFormText">&nbsp;</td>
	<td class="tdFormInput">&nbsp;</td>
</tr>

<tbody id="youxing" style="display:none;">
      <tr class="trcolor">
	 <td class="tdFormText">是否游行示威：</td>
	 <td class="tdFormInput"> 
	 <#if xzfyInfo.TPoliceIsparade?exists && xzfyInfo.TPoliceIsparade == "1">
	  是
	 <#else>
	 否
	 </#if>
   </td>
		 <td class="tdFormText">&nbsp;</td>
	 <td class="tdFormText">&nbsp;</td>
</tr>
	 </tbody>
	 <tr class="trcolor">
		 <td class="tdFormText">统计关键词：</td>
	    <td class="tdFormInput" colspan=2>
	    <span id="countRs">${xzfyInfo.menu?default('')}</span>
	    </td>
    </tr>
<input name="xzfyInfo.menu" type="hidden" id="menuSave">

</table>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td> 
	   <input name="Button23" type="button" class="button" value="返 回"  onclick="back()">
	</td>
  </tr>
</table>

</form>
</body>

<script language="javascript">
function back(){
	history.back(-1);
}
</script>

</html>