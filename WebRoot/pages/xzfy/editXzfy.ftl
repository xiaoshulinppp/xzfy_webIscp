<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>立案审理</title>

<SCRIPT src="../css/01/setday.js"></SCRIPT>
<script type="text/javascript" src="../js/16B/function.js"></script>
<script type="text/javascript" src="../js/16B/prototype.js"></script>
<script type="text/javascript" src="../js/16B/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../js/16B/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="../js/calendar.js"></script>
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<link href="../css/style_form.css" rel="stylesheet" type="text/css">
<style>
</style>

</head>

<script type="text/javascript" src="../js/floder/prototype.js"></script>
<script type="text/javascript" src="../js/floder/effects.js"></script>
<script type="text/javascript" src="../js/floder/validation_cn_utf-8.js"></script>

<body>
<form action="''" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
<!--主体内容、列表显示区域-->

<input id="conutAppname" type=hidden name="conutAppname">

<!-- 被申请人部门id -->
<input name="xzfyRecieve.TApplicationDeptID" type="hidden" class="inputTextNormal" id="deptid" />
<!-- 状态 -->
<input type="hidden" name="sta" id="sta" value="11" />
<input id="xzfyId" name="xzfyRecieve.id" value="${xzfyRecieve.id}" type="hidden">
<input type="hidden" name="funcCode" value="${funcCode}" />
<input type="hidden" id="require_fy" name="xzfyRecieve.require_fy" value="">
   
 <div class="z_wrap_info">
<h2 class="z_title">查看接待信息</h2>
<div class="z_info">
  
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="z_info_table">

<#if xzfyRecieve.receive_type == "1">
<tr >
     <th  width="20%">接待日期：</th>
    <td  width="30%">
    ${xzfyRecieve.receive_date?default('')}
      </td>
    
    <th  width="20%">接待地点：</th>
	    <td  width="30%">${xzfyRecieve.receive_address?default('')}</td>
  </tr>

    <tr >
  	<th >接待人：</th>
    <td >${xzfyRecieve.admit1?default('')}   </td>
   <th >第二接待人：</th>
    <td >${xzfyRecieve.admit2?default('')}
   </td>   
    </tr>	
<tr >
    <th  >被接待人：</th>
    <td >${xzfyRecieve.jd_detail?default('')}
    </td>
    <th >接待人数：</th>
    <td >${xzfyRecieve.applicationsum?default('')}</td>  
  </tr>
     <tr  style="display:none">
   <th >多人复议：</th>
    <td >
<input name="xzfyRecieve.ismany" id="duoren_y" value="${xzfyRecieve.ismany?default('')}">
    </tr>
  <tr >

	 <th  >涉及安全：</th>
    <td  colspan=3>
    <#if xzfyRecieve.issafe?exists && xzfyRecieve.issafe == "是">
    &nbsp;&nbsp;是<br>
    <span id="aqspan"  style="display:block">${xzfyRecieve.safe_content?default('')}</span>
    <#else> &nbsp;&nbsp;否
    </#if>
    </td>
  </tr>
</#if>
<#if xzfyRecieve.receive_type =="2" || xzfyRecieve.receive_type=="3">
  <tr >
    <th  width="20%">来信人姓名：</th>
    <td  width="30%">${xzfyRecieve.laixin_name?default('')}</td>
    
    <th  width="20%">接收日期：</th>
    <td  width="30%">${xzfyRecieve.receive_date?default('')}</td>
  </tr>
  <tr class="trwhite">
    <th >来信人通信地址：</th>
	    <td >${xzfyRecieve.laixin_address?default('')}</td>
	    </td>
    <th >来信人邮编：</th>
    <td >${xzfyRecieve.laixin_post?default('')}</td>
    </tr>
  <tr class="trwhite">
    <th >来文编号：</th>
    <td >${xzfyRecieve.zhize?default('')}</td>
    <th >来信人电话：</th>
    <td >${xzfyRecieve.laixin_tel?default('')}</td>
  
  </tr>
</#if>
  
   <tr >
	   <th >申请人类别：</th>
	   <td >
	   <#if xzfyRecieve.app_type=="1">公民
	   <#else>法人或其他组织
	   </#if>
	   </td>
	   <th >申请人人数：</th>
    <td >${xzfyRecieve.renCount?default('')}</td>
   </tr>
    <tr  id="shenqingren1">
  	<th >申请人：</th>
    <td  colspan=3>
    <#if xzfyRecieve.app_type=="1">${xzfyRecieve.appdetail?default('')}
    </#if>
    <#if xzfyRecieve.app_type=="2">${xzfyRecieve.agentDetail?default('')}
    </#if>
   
    </td>
   </tr>
   <#if xzfyRecieve.dbrDetail?exists && xzfyRecieve.dbrDetail?has_content>
	<tbody id="daibiaorendiv">
	    <tr > 
		    <th >代表人：</th>
		    <td  colspan=3>
    		${xzfyRecieve.dbrDetail?default('')}
		    </td>
	    </tr>
   	</tbody> 
   </#if>
   
<#if xzfyRecieve.receive_type =="1">
  
  <tr >
   <th >是否有代理人：</th>
    <td >
    <#if xzfyRecieve.agent=="1">有
    <#else>无
    </#if>
  </td>
   <th >&nbsp;</th>
	<td >&nbsp;</td>
  </tr>	
  <#if xzfyRecieve.agent?exists && xzfyRecieve.agent == "1">
  <tr class="trwhite" id="jddlr" >
    <th >委托代理人姓名：</th>
    <td >${xzfyRecieve.agent_name?default('')}
    </td>
    <th >是否有授权委托书：</th>
    <td >
    	<#if xzfyRecieve.proxy==1>无委托
    	<#elseif xzfyRecieve.proxy==2>口头委托
    	<#elseif xzfyRecieve.proxy==3>特殊情况口头委托
    	<#elseif xzfyRecieve.proxy==4>书面委托
    	</#if>
    </td>
  </tr>
  </#if>
  <#if xzfyRecieve.proxy?exists && xzfyRecieve.proxy=="3">
  <tr class="trwhite" id="jddlr1">
    <th >委托时间：</th>
    <td >${xzfyRecieve.agent_date?default('')}</td>
		
    <th >地点：</th>
    <td >${xzfyRecieve.agent_address?default('')}</td>
  </tr>
   </#if> 
</#if>
<#if xzfyRecieve.receive_type =="2" || xzfyRecieve.receive_type=="3">
 <tr >
    <th >代理人：</th>
	<td >${xzfyRecieve.agent_name?default('')}
	<th >&nbsp;</th>
	<td >&nbsp;</td>
   </tr>	
   <tr  id="jddlr2">
    <th >第三人：</th>
    <td >${xzfyRecieve.third?default('')}</td>
	<th >第三人代理人：</th>
	<td >${xzfyRecieve.third_agent?default('')}</td>
   </tr>
  
  <tr >
   <th >多人复议：</th>
   <td > ${xzfyRecieve.isMany?default('')}</td>
   
   <th >复议机关：</th>
 
    <td >
    <#if xzfyRecieve.xzfy_org=="2">县级政府
    <#elseif xzfyRecieve.xzfy_org=="3">县级政府的部门
    <#elseif xzfyRecieve.xzfy_org=="6">省部级行政机关
    <#elseif xzfyRecieve.xzfy_org=="7">省级政府的部门
    </#if>
    </td>
  </tr>
</#if>


<tr >
   <th >被申请人种类：</th>
   <td  >
   <#if xzfyRecieve.defendant_type=="1">
						乡镇政府
						<#elseif xzfyRecieve.defendant_type=="2">
						县级政府
						<#elseif xzfyRecieve.defendant_type=="3">
						县级政府部门
						<#elseif xzfyRecieve.defendant_type=="6">
						省部级行政机关
						<#elseif xzfyRecieve.defendant_type=="7">
						省级政府部门
						<#elseif xzfyRecieve.defendant_type=="8">
						其他
						<#elseif xzfyRecieve.defendant_type=="9">
						市经济技术开发区管委会
						</#if>
   
   </td>
   <th>被申请人名称：</th>
   <td>   ${xzfyRecieve.defendant_name?default('')} </td>
    
<#if xzfyRecieve.receive_type == "1">
  <tr  id="mingan">
    <th >是否行政不作为：</th>
    <td >
    <#if xzfyRecieve.ismanage=="0">否
    <#else>是
    </#if>
	</td>
     <th >要求复议的具体行政行为情况：</th>
	    <td >
		    ${xzfyRecieve.require_fy?default('')}
	    </td>
  </tr>
</#if>
<#if xzfyRecieve.receive_type =="2" || xzfyRecieve.receive_type=="3">
	<tr>
    <th>被复议的具体行为-名称：</th>
    <td>${xzfyRecieve.xwname?default('')}</td>
     <th>被复议的具体行为-案号：</th>
    <td>${xzfyRecieve.xwnum?default('')}</td>
  </tr>
   
     <tr >
     <th >行政复议请求：</th>
    <td   colspan=3>${xzfyRecieve.xzfy_requset_retail?default('')}
    </tr>
</#if>
<#if xzfyRecieve.receive_type == "1">
<tr >
    <th>该具体行政行为侵害&nbsp;&nbsp;&nbsp;&nbsp;<br>申请人何种合法权益：</th>
	    <td >${xzfyRecieve.break_right?default('')}</td>   
   <th  >行政复议请求：
  </th>
   <td  >${xzfyRecieve.xzfy_requset_retail?default('')}
  </td>
  </tr>
</#if>  
  <tr >
    <th >是否申请听证：</th>
    <td >${xzfyRecieve.istingzheng?default('')}
    </td>
    <th >是否申请行政赔偿：</th>
    <td  >${xzfyRecieve.isMoney?default('')}
    </td>
   </tr>
   
  <#if xzfyRecieve.isMoney?exists && xzfyRecieve.isMoney=="是">
  <tr  id="peichang_div">
	<th >赔偿金额：</th>
	<td >${xzfyRecieve.money_Detail?default('')}
	</td>
	<th>受损证明材料：</th>
    <td>${xzfyRecieve.money_file?default('')}
    </td>
  </tr>
  </#if>

	<tr >
		<th >复议前置：</th>
	    <td >${xzfyRecieve.isfront?default('')}
        </td>
        <th >是否申请对规范性文件审查：</th>
	    <td >${xzfyRecieve.ischeck?default('')}
	    <#if xzfyRecieve.ischeck?exists && xzfyRecieve.ischeck=="是">
	    <br>
		  <span id="shencha">规范文件：
	     &nbsp;${xzfyRecieve.check_file?default('')}</span>
	     </#if>
	    </td>
		
	</tr>
  </tr>
 <#if xzfyRecieve.receive_type == "1">
  <tr >
  
  		<th >是否愿意接受调解：</th>
    <td >
    <#if xzfyRecieve.istiaojie=="1">案前调解
    <#elseif xzfyRecieve.istiaojie=="2">调解
    <#elseif xzfyRecieve.istiaojie=="3">否
    </#if>
    </td>
    
	<th >其他复议机关、法院&nbsp;&nbsp;&nbsp;&nbsp;<br>是否受理同一复议申请：</th>
    <td >${xzfyRecieve.issame?default('')}<br>
    ${xzfyRecieve.issame_detail?default('')}
    </td>
</tr>
<#if xzfyRecieve.istiaojie?exists && xzfyRecieve.istiaojie=="1">
	  <tr  >
	    <td  colspan=4>调解日期自：${xzfyRecieve.tiaojie_from?default('')}
	    至：
	    ${xzfyRecieve.tiaojie_to?default('')}
	    我们将于收到申请材料后${xzfyRecieve.tiaojie_count?default('')}个工作日内尝试案前调解工作，调解期间不计入行政复议受理审查或者行政复议审理期限。
	      </td>
	   
 	 </tr>
</#if>
 <tr>
  <th >接待情况：</th>
  <td>${xzfyRecieve.jd_file_content?default('')}</td>
 <th >被接待人意见：</th>
    <td >
    ${xzfyRecieve.app_advice_detail?default('')}
    </td>
 </tr>
 	
</#if>	 
	
</table>

<br>
<div class="align-center">
	<a href="#" title="返回" class="btn-blue btn" onclick="javascript:back()">返回</a>
</div>

</form>
</body>

<script language="javascript">
 function back(){
 	history.back(-1);
 }

</script>
</html>