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
<style>   

</style>

<SCRIPT language=JavaScript src="../pages/xzfy/js/function.js"></SCRIPT>
<!--javascript脚本添加位置。-->
<script>
	
	function getDoc(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
	function getCheckForm(type){
		window.open('../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&checkDocType='+type+'&isView=1&funcCode=${funcCode}');
	}
</script>
<!--javascript脚本添加位置结束。-->
</head>
<body>
<!--标题开始-->
<div class="ui-title fn-clear">
     <span class="ui-title-icon fn-left"><img src="../${Session['_USER_STYLE_'].imagePath}/icons/crumb.png"/></span>
      <h2 class="ui-title-cnt fn-left">立案审查</h2>    <input  type="button" class="ui-btn-sub fn-right" value="接待信息" onclick="getFacePage('${xzfyInfo.id}')"/ >
      </div>      
<span class="x-line fn-clear"><img src="../${Session['_USER_STYLE_'].imagePath}/pic_search_line.png"/></span><!--我是有箭头灰色的分割线-->

<div class="ui-flod-title fn-clear" >
		<a href="javascript:slideFlod(page1)" ><span class="fn-left"><img src=	"../${Session['_USER_STYLE_'].imagePath}/icons/panel_display.png"/></span><h2 class="fn-left">
立案审查信息</h2> </a>
       
</div>

<!--标题结束-->
<form action="''" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
 <table  id="bzDivTable" class="ui-table ui-table-form "  <#if xzfyInfo.isBuzheng=="1"> style="display:block" <#else>style="display:none"</#if>>
   <tr >
  	<th width="20%">通知补正日期：</th>
    <td width="30%">
 	  ${xzfyInfo.bzTongzhiriqi?default('')}
    </td>
    <th width="20%">补齐材料日期</th>
    <td width="30%">
    ${xzfyInfo.bzBuqiriqi?default('')}
    </td>
    </tr>
    <tr>
    <th >补正内容：</th>
    <td colspan=3>
    	${xzfyInfo.jdBzContent?default('')}
   </td>
    </tr>
    <tr>
    <th>立案审查人意见：</th>
    <td colspan=3>
    <#if xzfyInfo.bzAdvice?has_content>${xzfyInfo.bzAdvice}</#if>
    </td>
    </tr>
    
   <#assign checkUserId=xzfyInfo.check_id?default('0')>
    <tr>
	<th >补正审批人：</th>
    <td colspan="2"> 
    <#list userList as uList>
    	<#if uList.getId().toString()==checkUserId>${uList.getName()}</#if>
    </#list>
    </td>
    <td>
    当前状态：<br>
<#if checkSize gt 0 >
    	<#list xzfyCheckList as checkList>
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
<#if checkSize==0 >
	未审批
</#if>

    </td>

  </tr>
 
  
 
 <tr >
    <th>生成补正通知：</th>
    <td >
<#if (xzfyInfo.status=="1" && xzfyInfo.isBuzheng=="0") || xzfyInfo.status=="2">
    <#if isShowBtn=='0'>
	    <#assign isDoc=xzfyInfo.keyword2?default('0')>
	    <#if isDoc=='0'>
	    	<a href="#" class="btn-blue btn" onclick="javascript:savaToGetDoc('1')">生成</a>
	    <#else>
	    	文书已生成：
	    	<a href="#" class="btn-blue btn" onclick="javascript:savaToGetDoc('1')">编辑文书</a>
	    </#if>
	   <#else>
	   		审批中，无法执行此操作
	   </#if>
<#else>
	<a href="#" class="btn-blue btn" onclick="javascript:getDoc()">查看文书</a>
</#if>
      </td>
	<th>预览补正审批单：</th>
    <td>
    <a href="#" class="btn-blue btn" onclick="javascript:getCheckForm('2')">预览</a>
      </td>
  </tr>
  <#assign isBzSp=xzfyInfo.isBuzhengshenpi?default('0')>
  <tbody id="bzFast"  <#if isBzSp=='0' || (checkSize==0 && isShowBtn=='0') >style="display:block"<#else>style="display:none"</#if> >
<tr >
    <th>补证批准人：</td>
    <td ><input type="text" name="shenpiren" id="shenpiren">
    <br><span id="seshenpiren"></span>
      </td>
	<th></td>
    <td class="tdFormInput2">
    <!--<input type="text" name="shenpishijian" id="shenpishijian" onClick="WdatePicker()" class="inputTextNormal">-->
      </td>
  </tr>
  <tr >
    <th>批准意见：</th>
    <td colspan=3>
    <textarea  name="shenpiyijian" id="shenpiyijian"></textarea>
      </td>
  </tr>
</tbody>
<tr class="trcolor">
	<td colspan="4" align="center">
	 <#if (xzfyInfo.status=="1" && xzfyInfo.isBuzheng=="0") || xzfyInfo.status=="2">
		<#if isShowBtn=='0'>
	            <input class="ui-btn ui-btn-normal" type="button" id="noBz"  value="提交审批" onclick="subBuzheng()">
	            <input class="ui-btn ui-btn-normal" type="button" id="finishBz"  value="完成补正" onclick="finishBuzheng('${checkSize}')">
		<#else>
			 <input class="ui-btn ui-btn-normal" type="button" id="cancleBz"  value="取消审批" onclick="cancleBuzheng()">
		</#if>
	</#if>
    </td>

</tr>
</tbody>
 </table>
  
<table  id="shouli_tr1" class="ui-table ui-table-form "  
 	<#if xzfyInfo.status=='2'>style="display:none;"
  	<#elseif sdResult!='1'>style="display:none;"
  </#if>
  >
  <tr>
  <td colspan="4" align="center"><font color="red">立案审批 </font></td>
  </tr>
  <tr >
  <th width="20%">立案审查人意见:</th>
  <td width="30%">
  <textarea name="xzfyInfo.laAdvice">${xzfyInfo.laAdvice?default('')}</textarea>
  </td>
  <th width="20%">立案日期:</th>
  <td width="30%"><input type="text"  onClick="WdatePicker()"   name="xzfyInfo.lian_date" id="lian_date" value="${xzfyInfo.lian_date?default('')}"></td>
  </tr>
  <tr >
	<th >立案审批人：</th>
    <td colspan="2">
    <select name="Lian_check_id" id="Lian_check_id" onchange="checkBzConfirm_la()" <#if isShowBtn=='1'>disabled</#if>>
    <option value="0">未指定审批人</option>
    <#list userList as uList>
    <option value="${uList.getId()}" <#if uList.getId().toString()==checkUserId>selected</#if>>${uList.getName()}</option>
    </#list>
    </select>&nbsp;&nbsp;<font color="red">未指定审批人时，系统将不会执行审批操作</font>
    </td>
    <td>
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
<input name="xzfyInfo.tjzfzh"  value="${xzfyInfo.tjzfzh?default('复字[201]号')}"  id="tjzfzh" type="text" class="inputTextNormal"  >
</td>
<th>&nbsp;</td>
<td class="tdFormInput">
    &nbsp;
</td>
</tr> 
  <#assign isDoc_la=xzfyInfo.keyword3?default('0')>
  <tr >
    <th>查看受理通知：</th>
    <td >
 <#if xzfyStatus gt 2 || xzfyStatus==1>
    <#if isShowBtn=='0'>
	    <#if isDoc_la=='0'>
	    	<a href="#" class="btn-blue btn" onclick="javascript:savaToLaDoc()">生成</a>
	    <#else>
	    	文书已生成：
	    	<a href="#" class="btn-blue btn" onclick="javascript:savaToLaDoc()">编辑文书</a>
	    </#if>
	   <#else>
	   		审批中，无法执行此操作
	   </#if>   
</#if>
      </td>
	<th>预览立案审批单：</td>
    <td class="tdFormInput">
    <a href="#" class="btn-blue btn" onclick="javascript:getCheckForm('3')">预览</a>
      </td>
  </tr>
 <tbody id="laFast"  <#if xzfyInfo.status=='1' || (la_checkSize==0 && isShowBtn=='0') || (xzfyInfo.status=='3' && isShowBtn=='0')>style="display:block"<#else>style="display:none"</#if> >
  <tr >
    <th>立案批准人：</th>
    <td class="tdFormInput2"><input type="text" name="lashenpiren" id="lashenpiren">
      </td>
	<th>批准意见：</th>
    <td class="tdFormInput2"><textarea name="lashenpiyijian" id="lashenpiyijian"></textarea>
      </td>
  </tr>
</tbody>
  <tr >
   <td colspan="4" align="center">
	 <#if xzfyInfo.status=="1" || xzfyInfo.status=="3">
		<#if isShowBtn=='0'>
	            <input class="ui-btn ui-btn-normal" type="button"  value="提交审批" onclick="subLian()">
	            <input class="ui-btn ui-btn-normal" type="button"  value="完成立案" onclick="finishLian('${checkSize}')">
		<#else>
			 <input class="ui-btn ui-btn-normal" type="button" id="cancleBz"  value="取消审批" onclick="cancleLian()">
		</#if>
	</#if>
    </td> 
	
</tr>

</table>


<!--结案信息-->

  <table  id="jiean_div" class="ui-table ui-table-form "  
 	<#if xzfyInfo.status=='2'>style="display:none;"
  	<#elseif sdResult='1' || sdResult='0'>style="display:none;"
  </#if> >
   <tr>
  <td colspan="4" align="center"><font color="red">结案审批 </font></td>
  </tr>
 <#assign finish_type1=xzfyInfo.finish_type?default('0')>
 <#assign finish_type2=xzfyInfo.finishBreakType?default('0')>
    <tr class="trcolor">
     <th class="tdFormText" width="20%">结案方式：</td>
     <td class="tdFormInput" width="30%">
         <select name="xzfyInfo.finish_type" id="finishtype1" class="selectStyleNormal" onchange="setFT()">
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
	 <option value="5" <#if finish_type2=='2' || finish_type2=='3'|| finish_type2=='5' >selected</#if>>撤回申请</option>
	<#-- <option value="3" <#if finish_type2=='3'>selected</#if>>被申请人改变后撤回申请</option>-->
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
  <td width="30%"><input type="text"  onClick="WdatePicker()"   name="xzfyInfo.finish_date" id="finish_date" value="${xzfyInfo.finish_date?default('')}"></td>
  </tr>
  <tr >
	<th >结案审批人：</th>
    <td colspan="2">
    <select name="jiean_check_id" id="jiean_check_id" onchange="checkBzConfirm_ja()" <#if isShowBtn=='1'>disabled</#if>>
    <option value="0">未指定审批人</option>
    <#list userList as uList>
    <option value="${uList.getId()}" <#if uList.getId().toString()==checkUserId>selected</#if>>${uList.getName()}</option>
    </#list>
    </select>&nbsp;&nbsp;<font color="red">未指定审批人时，系统将不会执行审批操作</font>
    </td>
    <td>
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
    <th>生成不予受理通知：</th>
    <td >
 <#if xzfyStatus==11 || xzfyStatus==1>
    <#if isShowBtn=='0'>
	    <#if isDoc_ja=='0'>
	    	<a href="#" class="btn-blue btn" onclick="javascript:savaToJaDoc()">生成</a>
	    <#else>
	    	文书已生成：
	    	<a href="#" class="btn-blue btn" onclick="javascript:savaToJaDoc()">编辑文书</a>
	    </#if>
	   <#else>
	   		审批中，无法执行此操作
	   </#if>   
</#if>
      </td>
	<th>预览结案审批单：</td>
    <td class="tdFormInput">
    <a href="#" class="btn-blue btn" onclick="javascript:getCheckForm(11)">预览</a>
      </td>
  </tr>
 <tbody id="jaFast"  <#if (xzfyInfo.status=='11' && isShowBtn=='0') || (ja_checkSize==0 && isShowBtn=='0') >style="display:block"<#else>style="display:none"</#if> >
  <tr >
    <th>结案批准人：</th>
    <td class="tdFormInput2"><input type="text" name="jashenpiren" id="jashenpiren">
    <br><span id="lianSprShow2"></span>
      </td>
	<th>批准意见：</th>
    <td class="tdFormInput2"><textarea name="jashenpiyijian" id="jashenpiyijian"></textarea>
      </td>
  </tr>
</tbody>

  <tr >
   <td colspan="4" align="center">
	 <#if xzfyInfo.status=="1" || xzfyInfo.status=="11">
		<#if isShowBtn=='0'>
	            <input class="ui-btn ui-btn-normal" type="button"  value="提交审批" onclick="subJiean()">
	            <input class="ui-btn ui-btn-normal" type="button"  value="完成结案" onclick="finishJiean('${checkSize}')">
		<#else>
			 <input class="ui-btn ui-btn-normal" type="button" id="cancleBz"  value="取消审批" onclick="cancleJiean()">
		</#if>
	</#if>
    </td> 
	
</tr>
  </table>

<!--主体内容、列表显示区域-->
<input name="bzConfirm" id="bzConfirm" value='0' type="hidden"/ >
<input name="checkBzSpan" id="checkBzSpan"' type="hidden"/ >
<input name="checkJzfz" id="checkJzfz" type="hidden"/ >
<input name="xzfyInfo.isBuzheng" id="hasbz" type="hidden" value="${xzfyInfo.isBuzheng?default('0')}" / >
<input name="xzfyInfo.caseorg" type="hidden" value="${xzfyInfo.caseorg?default('')}">

<input id="xzfyId" name="xzfyInfo.id" value="${xzfyInfo.id}" type="hidden">
<input id="keyword" name="xzfyInfo.keyword" value="${xzfyInfo.keyword?default('0')}" type="hidden">
<input id="keyword2" name="xzfyInfo.keyword2" value="${xzfyInfo.keyword2?default('0')}" type="hidden">
<input id="keyword3" name="xzfyInfo.keyword3" value="${xzfyInfo.keyword3?default('0')}" type="hidden">
<input id="isBuzheng" name="xzfyInfo.isBuzhengshenpi" value="${xzfyInfo.isBuzhengshenpi?default('0')}" type="hidden">
<input id="xzfyStatus" name="xzfyInfo.status" value="${xzfyInfo.status}" type="hidden">
<input id="xzfyshow" name="xzfyInfo.app_show" value="${xzfyInfo.app_show}" type="hidden">
<input type="hidden" name="funcCode" value="${funcCode}" >

<input name="xzfyInfo.receive_type" id="appType" type="hidden" <#if xzfyInfo.receive_type=="1"> value="1"</#if>  
 <#if xzfyInfo.receive_type=="2"> value="2"</#if>
 <#if xzfyInfo.receive_type=="3"> value="3"</#if>
   />

<input type="hidden" id="isShenpi" >
<input type="hidden" id="checkStatus" name="xzfyInfo.check_status"  <#if xzfyInfo.check_status?has_content> 
value="${xzfyInfo.check_status}" <#else>value="0"</#if> />

<input name="isting" id="isting" type="hidden" 
<#if xzfyInfo.istingzheng?has_content>value="${xzfyInfo.istingzheng}"<#else>value="否"</#if> />

<input name="xzfyInfo.TApplicationDeptID" type="hidden" class="inputTextNormal" id="deptid" />
 <table  id="" class="ui-table ui-table-form "  ><!--表单填写项文字居右样式由 fn-text-right控制。td宽度在第一行标记 不要每行都标记-->

  



  <tr class="trcolor" id="handleCase" >

	<th>来件处理：</th>
	    <td class="tdFormInput">
	    	${xzfyInfo.stadardResult?default('')}</td>

<th></th>
<td></td>
  </tr>
   <tr >
    <th  width="20%">申请人：</td>
    <td width="30%">${xzfyInfo.appdetail?default('')}</td>
    <th  width="20%">收案日期：</td>
    <td width="30%">${xzfyInfo.receive_date?default('')}
      </td>
  </tr>

   <tr class="trwhite">
    <th>申请人总数：</td>
    <td>${xzfyInfo.renCount?default('')}</td>
	<th>&nbsp;</td>
    <td>&nbsp;</td>
   </tr>

   <tr class="trcolor">
    <th>申请人类别： </td>
    <td class="tdFormInput">
    	   <#if xzfyInfo.app_type=="1">公民
	   <#else>法人或其他组织
	   </#if>
     
    </td>
     <th>立案审查人姓名：</td>
    <td class="tdFormInput">
    	${xzfyInfo.user1_name?default('')}
    	</td>
  </tr>  
  
     <tr class="trwhite">
    <th>代表人名称：</td>
    <td class="tdFormInput">${xzfyInfo.deputy_show?default('')} </td>
   <th>第三人：</td>
    <td class="tdFormInput">${xzfyInfo.third?default('')} </td>
   </tr>   
   
   <tr class="trwhite">
    <th>代理人：</td>
    <td class="tdFormInput">${xzfyInfo.agent_name?default('')} </td>
   <th>第三人代理人：</td>
    <td class="tdFormInput">${xzfyInfo.third_agent?default('')} </td>    	
   </tr>

   <tr class="trwhite">
    <th>多人复议：</td>
    <td class="tdFormInput">${xzfyInfo.isMany?default('')}
    </td>
   <th>复议机关类型：</td>
    <td class="tdFormInput">
    	<#if xzfyInfo.xzfy_org=="2">县级政府
    <#elseif xzfyInfo.xzfy_org=="3">县级政府的部门
    <#elseif xzfyInfo.xzfy_org=="6">省部级行政机关
    <#elseif xzfyInfo.xzfy_org=="7">省级政府的部门
    </#if>
	</td>
   </tr>
  
  <tr class="trcolor">
  
   <th>被申请人种类：</th>
    <td >
       <#if xzfyInfo.defendant_type=="1">
						乡镇政府
						<#elseif xzfyInfo.defendant_type=="2">
						县级政府
						<#elseif xzfyInfo.defendant_type=="3">
						县级政府部门
						<#elseif xzfyInfo.defendant_type=="6">
						省部级行政机关
						<#elseif xzfyInfo.defendant_type=="7">
						省级政府部门
						<#elseif xzfyInfo.defendant_type=="8">
						其他
						<#elseif xzfyInfo.defendant_type=="9">
						市经济技术开发区管委会
						</#if></td>
        <th>复议前置：</th>
    <td >${xzfyInfo.isfront?default('')}
    </td>
 
    </tr>
    <tr >
      
    <th>被申请人名称：</th>   
     <td > 	     	     
	    ${xzfyInfo.defendant_name?default('')} 
    </td> 
	 
    <th>申请复议事项：</th>
    <td>
    	  ${xzfyInfo.casetype?default('')} &nbsp; ${xzfyInfo.casetype2?default('')} 
    </td>
  </tr>

     <tr class="trcolor">
 
     <th>行政复议请求：</th>
    <td >
    <#assign qingqiu=xzfyInfo.xzfy_requset?default('')>
    <#assign neirong=''>
    <#if qingqiu=="0">无
<#elseif qingqiu=="1">撤销该具体行政行为
	<#assign neirong='请求撤销该具体行政行为'>
<#elseif qingqiu=="2">变更该具体行政行为
	<#assign neirong='请求变更该具体行政行为'>
<#elseif qingqiu=="3">确认该具体行政行为违法
	<#assign neirong='请求确认该具体行政行为违法'>
<#elseif qingqiu=="4">责令被申请人履行法定职责
	<#assign neirong='请求责令被申请人履行法定职责'>
<#elseif qingqiu=="5">确认被申请人不履行法定职责违法
	<#assign neirong='请求确认被申请人不履行法定职责违法'>
<#else>${qingqiu}</#if></td>
    
    
    <th>行政管理类别：</td>
    <td class="tdFormInput">  
      <#if xzfyInfo.refer=="1">公安</#if>
      <#if xzfyInfo.refer=="2">国家安全</#if>
      <#if xzfyInfo.refer=="3">劳动和社会保障</#if>
      <#if xzfyInfo.refer=="4">司法行政</#if>
      <#if xzfyInfo.refer=="5">民政</#if>
      <#if xzfyInfo.refer=="6">农林环资</#if>
      <#if xzfyInfo.refer=="7">城建</#if>
      <#if xzfyInfo.refer=="8">工交商事</#if>
      <#if xzfyInfo.refer=="9">财政金融</#if>
       <#if xzfyInfo.refer=="10">教科文卫</#if>
       <#if xzfyInfo.refer=="11">其他</#if>
    nbsp;
    	<#if xzfyInfo.refer?has_content&&xzfyInfo.refer=="1">
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="1">治安</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="2">劳教</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="3">其他</#if>
      </#if>
      <#if xzfyInfo.refer?has_content&&xzfyInfo.refer=="6">
      	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="9">土地</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="10">地矿</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="11">环保</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="12">农业</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="13">水利</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="14">林业</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="15">其他</#if>
      </#if>
      <#if xzfyInfo.refer?has_content&&xzfyInfo.refer=="7">
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="17">规划</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="18">拆迁</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="19">房屋</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="20">其他</#if>
    	</#if>
    	<#if xzfyInfo.refer?has_content&&xzfyInfo.refer=="8">
    		<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="22">工商</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="23">质监</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="24">商务</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="25">物价</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="26">能源</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="27">交通</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="28">信息产业</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="29">邮政</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="30">烟草专买</#if>
    	</#if>	
    	<#if xzfyInfo.refer?has_content&&xzfyInfo.refer=="9">
    		<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="32">税务</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="33">人民银行</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="34">证监</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="35">保监</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="36">银监</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="37">外汇</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="38">财政</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="39">统计</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="40">审计</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="41">海关</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="42">商检</#if>

    	</#if>
    	<#if xzfyInfo.refer?has_content&&xzfyInfo.refer=="10">
      	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="44">药监</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="45">卫生</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="46">计划生育</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="47">教育</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="48">文化</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="49">专利</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="50">商标</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="51">版权</#if>
				<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="52">旅游</#if>
      </#if>
    
     <div   id="divxzgllbinput">
     <#if xzfyInfo.referother?has_content>
       ${xzfyInfo.referother}
     </#if>
    </div>
    </td>
 
    </tr>
      <tr class="trwhite">
 <th>被复议的具体行政行为名称：</td>
    <td class="tdFormInput">
	    <#if xzfyInfo.xwname?has_content>
	    ${xzfyInfo.xwname}
		 </#if>
    </td>
       <th>被复议的具体行政行为案号：</td>
    <td class="tdFormInput">
	    <#if xzfyInfo.xwnum?has_content>
	    ${xzfyInfo.xwnum}
		 </#if>
    </td>
    </tr> 
     <tr class="trcolor">
 		    <th>是否申请听证：</td>
		    <td class="tdFormInput">		    
			 <#if xzfyInfo.istingzheng?has_content>
			 	${xzfyInfo.istingzheng}
			 </#if>
		    </td>
		    <th>&nbsp;</td>
			 <td>&nbsp;</td>
		    </tr>
  
  <tr class="trcolor">
    <th>是否申请行政赔偿：</td>
    <td class="tdFormInput">
    	<#if xzfyInfo.ismoney?has_content>
    		${xzfyInfo.ismoney}
    	</#if>
    		</td>

    <th>对规范性文件审查：</td>
    <td class="tdFormInput">
    	<#if xzfyInfo.ischeck?has_content>
    		${xzfyInfo.ischeck}
    	</#if>
    	</td>
  </tr>
     <tr class="trcolor">
    <th>是否经过案前调解：</td>
    <td class="tdFormInput">    
    	<#if xzfyInfo.istiaojie?has_content>
				<#if xzfyInfo.istiaojie?has_content&&xzfyInfo.istiaojie=="1">案前调解</#if>
				<#if xzfyInfo.istiaojie?has_content&&xzfyInfo.istiaojie=="2">调解</#if>
				<#if xzfyInfo.istiaojie?has_content&&xzfyInfo.istiaojie=="3">否</#if>
		</#if>
   	  </td>
	<th>调解结果：</td>
    <td class="tdFormInput">
    	<#if xzfyInfo.tiaojie_result?has_content>
    			${xzfyInfo.tiaojie_result}
    	</#if>
      </td>
  </tr>
  
  
  <tr class="trcolor">
    <th>简要内容：<br>（限200字）</td>
    <td class="tdFormInput">
			<#if xzfyInfo.content_abstract?has_content>${xzfyInfo.content_abstract}
			<#elseif xzfyInfo.defendant_name?has_content>申请人不服被申请人${xzfyInfo.defendant_name}<#if xzfyInfo.xwnum?has_content>（${xzfyInfo.xwnum}）</#if>${neirong}。
			<#else>${xzfyInfo.xzfy_requset?default("")}
			</#if>
     </td>
	<th>备注：</th>
    <td class="tdFormInput">
    	<#if xzfyInfo.remark?has_content>
    		${xzfyInfo.remark}
    </#if>
      </td>
  </tr>

  </table>


 
</div>	 </div>

 <div>
<table  id=""class="ui-table  "   width="50%">
  <tfoot>
      <tr>
            <td>
            
            <input class="ui-btn ui-btn-normal" type="button"  value="返回" onClick="history.back()" class="button"></td>
      </tr>
    </tfoot></table>
  </div>


</div>
</form>
</body>

</html>
