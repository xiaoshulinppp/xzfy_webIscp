<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		 
		<title></title>
		<link href="../sys_theme/css/base.css" rel="stylesheet" type="text/css" />
		<link href="../sys_theme/css/main_style.css" rel="stylesheet" type="text/css" />
	
	<!--                       Javascripts 注意不要改变顺序                      -->
<script type="text/javascript" src="../sys_theme/js/jquery-1.8.2.min.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../sys_theme/js/tpl.base.js"></script>
	</head>
	
	<body>

<!--标题开始-->
<div class="ui-title fn-clear">
     <span class="ui-title-icon fn-left">
        <img src="../sys_theme/images/icons/crumb.png"/>
     </span>
     <h2 class="ui-title-cnt fn-left">
           <#if specialFlag?exists>${xzfyCom.workName}<#else>当前用户所属单位信息</#if>
     </h2>  

</div>       
<!--标题结束-->
<#if !specialFlag?exists>
<div class="ui-title fn-clear">
   <h2 class="ui-title-cnt fn-left"><font color="red">请于固定统计时间节点或按市法制办要求的时间更新单位信息（单位信息无变化也要进行更新）</font></h2>
</div>
</#if>

<form name="checkForm" id="checkForm" action="" method="post" ENCTYPE="multipart/form-data">
            <input type="hidden" name="funcCode" value="${funcCode}">
            <input type="hidden" name="id" value="${xzfyCom.id}">
   <table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table  ui-table-list  list-fixed ">
   <!--<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">-->     
      <tr>       
         <td width="17%">
                                   行政复议机关名称：
         </td>
         <td width="21%">
             <!--该字段直接从数据库中读取-->        
       
             <input style="width:90%"  type="text" name="" value="<#if xzfyCom.workName?has_content>${xzfyCom.workName}<#else><空></#if>" disabled/>
         </td>
         
         <td width="8%">
                                   地址：
         </td>
         <td width="15%">
             <input style="width:90%" type="text" name="" value="<#if xzfyCom.address?has_content>${xzfyCom.address}<#else><空></#if>" disabled/>
         </td>
         <td width="8%">
                                   联系人：
         </td>
         <td width="12%">
             <input class="ui-input-wdm" type="text" name="" value="<#if xzfyCom.contact?has_content>${xzfyCom.contact}<#else><空></#if>" disabled/>
         </td>
         <td width="7%">
                                   传真：
         </td>
         <td width="13%">
             <input class="ui-input-wdm" type="text" name="" value="<#if xzfyCom.fax?has_content>${xzfyCom.fax}<#else><空></#if>" disabled/>
         </td>
      </tr>
      
      <tr>
         <td>
                                   法定代表人姓名：
         </td>
         <td>
             <input style="width:90%" type="text" name="" value="<#if xzfyCom.representInLaw?has_content>${xzfyCom.representInLaw}<#else><空></#if>" disabled/>
         </td>
      
         <td width="20%">
                                   职务：
         </td>
         <td>
             <input style="width:90%" type="text" name="" value="<#if xzfyCom.position_Repnt?has_content>${xzfyCom.position_Repnt}<#else><空></#if>" disabled/>
         </td>
         
         <td>
                                  电话（可选）：
         </td>
         <td>
             <input class="ui-input-wdm" type="text" name="" value="<#if xzfyCom.telephone_Repnt?has_content>${xzfyCom.telephone_Repnt}<#else><空></#if>" disabled/>
         </td>
         <td></td>
         <td></td>
      </tr>
      
      <tr>
         <td width="15%">
                                   法制机构名称：
         </td>
         <td width="20%">
             <input style="width:90%" type="text" name="" value="<#if xzfyCom.name_LegalInstitude?has_content>${xzfyCom.name_LegalInstitude}<#else><空></#if>" disabled/>
         </td>
         
         <td>
                                    性质：
         </td>
         <td>
             <select name="" class="" disabled>
             <#assign property_LegalInstitude="${xzfyCom.property_LegalInstitude?default('')}">
             <option value="" <#if property_LegalInstitude=="">selected</#if>>--请选择--</option>
             <option value="1" <#if property_LegalInstitude=="1">selected</#if>>单列</option>
             <option value="2" <#if property_LegalInstitude=="2">selected</#if>>不单列,但有专门编制</option>
             <option value="3" <#if property_LegalInstitude=="3">selected</#if>>加挂牌子,无专门编制</option>
             </select>
         </td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
      </tr>
      
      <tr>
         <td width="15%">
                                   行政复议机构数量：
         </td>
         <td width="20%">
             <input style="width:90%" type="text" name="" value="<#if xzfyCom.quantity_Xzfy?has_content>${xzfyCom.quantity_Xzfy}<#else><空></#if>" disabled/>
         </td>
         
         <td>
                                    名称：
         </td>
         <td>
             <input style="width:90%" type="text" name="" value="<#if xzfyCom.name_Xzfy?has_content>${xzfyCom.name_Xzfy}<#else><空></#if>" disabled/>
         </td>
         
         <td>
                                   人员编制：
         </td>
         <td>
             <input class="ui-input-wdm" type="text" name="" value="<#if xzfyCom.staffing_Xzfy?has_content>${xzfyCom.staffing_Xzfy}<#else><空></#if>" disabled/>
         </td>
         <td></td>
         <td></td>
      </tr>
      
      <tr>
         <td>
                                  行政复议机构法定代表人姓名：
         </td>
         <td>
             <input style="width:90%" type="text" name="" value="<#if xzfyCom.represent_Xzfy?has_content>${xzfyCom.represent_Xzfy}<#else><空></#if>" disabled/>
         </td>
         <td>
                                   职务：
         </td>
         <td>
             <input style="width:90%" type="text" name="" value="<#if xzfyCom.position_Xzfy?has_content>${xzfyCom.position_Xzfy}<#else><空></#if>" disabled/>
         </td>
         <td>
                                   办公电话（必）：
         </td>
         <td>
             <input class="ui-input-wdm" type="text" name="" value="<#if xzfyCom.phone_Xzfy?has_content>${xzfyCom.phone_Xzfy}<#else><空></#if>" disabled/>
         </td>
         <td>
                                   手机（可选）：
         </td>
         <td>
             <input class="ui-input-wdm" type="text" name="" value="<#if xzfyCom.mobile_Xzfy?has_content>${xzfyCom.mobile_Xzfy}<#else><空></#if>" disabled/>
         </td>
      </tr>
      
      <tr>
         <td width="15%">
                                   复议机关有行政复议资格人数：
         </td>
         <td width="20%">
             <input style="width:90%" type="text" name="" value="<#if xzfyCom.countOfFyCertAll?has_content>${xzfyCom.countOfFyCertAll}<#else><空></#if>" disabled/>
         </td>
         
         <td>
         </td>
         <td>
         </td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
      </tr>
      
       <tr>
         <td width="15%">
                                   行政复议人员人数（专职）：
         </td>
         <td width="20%">
             <input style="width:90%" type="text" name="" value="<#if xzfyCom.numFull_XzfyStaff?has_content>${xzfyCom.numFull_XzfyStaff}<#else><空></#if>" disabled/>
         </td>
         
         <td>
         	有复议资格人数：
         </td>
         <td>
         	<input style="width:90%" type="text" name="" value="<#if xzfyCom.countOfFyCertFull?has_content>${xzfyCom.countOfFyCertFull}<#else><空></#if>" disabled/>
         </td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
      </tr>
      
      <tr>
         <td width="15%">
                                 行政复议人员人数（兼职）：
         </td>
         <td width="20%">
             <input style="width:90%" type="text" name="" value="<#if xzfyCom.numPart_XzfyStaff?has_content>${xzfyCom.numPart_XzfyStaff}<#else><空></#if>" disabled/>
         </td>
         
         <td>
         	有复议资格人数：
         </td>
         <td>
         	<input style="width:90%" type="text" name="" value="<#if xzfyCom.countOfFyCertPart?has_content>${xzfyCom.countOfFyCertPart}<#else><空></#if>" disabled/>
         </td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
      </tr>
      
      <tr>
         <td width="15%">
                                   行政辅助人员人数：
         </td>
         <td width="20%">
             <input style="width:90%" type="text" name="" value="<#if xzfyCom.countOfAdminAided?has_content>${xzfyCom.countOfAdminAided}<#else><空></#if>" disabled/>
         </td>
         
         <td>
         </td>
         <td>
         </td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
      </tr>
      
      <tr>
         <td width="15%">
                                  是否有行政应诉机构：
         </td>
         
         <td width="20%">
			<select id="ysFirmYon" name="" onchange="checkYsFirm()" disabled>
             <#assign yonYsFirm=xzfyCom.ysFirmExistsOrNot?default('')>
                <option value=""<#if yonYsFirm=="">selected</#if>>--请选择--</option>
                <option value="1"<#if yonYsFirm=="1">selected</#if>>是</option>
                <option value="0"<#if yonYsFirm=="0">selected</#if>>否</option>
             </select>         
         </td>
         
         <td>
         </td>
         <td>
         </td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>        
    </tr>
         
         <#if yonYsFirm=='1'>
         <tr>
	         <td>
	         	应诉机构名称：
	         </td>
	         
	         <td>
	         	  <input style="width:90%" type="text" name="" value="<#if xzfyCom.ysFirmName?has_content>${xzfyCom.ysFirmName}<#else><空></#if>" disabled/>         	
	         </td>
	         
	         <td>
	         	人员编制：
	         </td>
	         
         	 <td>
         	 	   <input style="width:90%" type="text" name="" value="<#if xzfyCom.staffAuthorized?has_content>${xzfyCom.staffAuthorized}<#else><空></#if>" disabled/>         	
         	 </td>
        
        	 <td></td>
         	 <td></td>  
         	 <td></td>
         	 <td></td>               
      </tr>
      </#if>
      
      <tr>
         <td width="15%">
                                  行政应诉人员人数（专职）：
         </td>
         <td width="20%">
             <input style="width:90%" type="text" name="" value="<#if xzfyCom.ysCountFull?has_content>${xzfyCom.ysCountFull}<#else><空></#if>" disabled/>
         </td>
         
         <td>
         	 行政应诉人员人数（兼职）：
         </td>
         <td>
         	<input style="width:90%" type="text" name="" value="<#if xzfyCom.ysCountPart?has_content>${xzfyCom.ysCountPart}<#else><空></#if>" disabled/>
         </td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
      </tr>
      
      <tr>
         <td>
                                    听证室数量：
         </td>
         <td>
             <input style="width:90%" type="text" name="" value="<#if xzfyCom.quantity_Hearing?has_content>${xzfyCom.quantity_Hearing}<#else><空></#if>" disabled/>
         </td>
         <td>
                                    阅览室数量：
         </td>
         <td>
             <input style="width:90%" type="text" name="" value="<#if xzfyCom.quantity_Reading?has_content>${xzfyCom.quantity_Reading}<#else><空></#if>" disabled/>
         </td>
         <td>
                                    接待室数量：
         </td>
         <td>
              <input class="ui-input-wdm" type="text" name="" value="<#if xzfyCom.quantity_Receiving?has_content>${xzfyCom.quantity_Receiving}<#else><空></#if>" disabled/>
         </td>
         <td>
                                   办案车辆配备：
         </td>
         <td>
             <select id="clyon" name="" onchange="checkclpb()" disabled>
             <#assign car_Casing="${xzfyCom.car_Casing?default('')}">
                <option value=""<#if car_Casing=="">selected</#if>>--请选择--</option>
                <option value="1"<#if car_Casing=="1">selected</#if>>是</option>
                <option value="0"<#if car_Casing=="0">selected</#if>>否</option>
             </select>
         
         </td>
      </tr>
      <tr id="clpb" <#if car_Casing=="1">style="display:block"<#else>style="display:none"</#if>>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
         <td>
                                    配备数量/台：
         </td>
         <td>
             <input class="ui-input-wdm" type="text" name="" value="<#if xzfyCom.quantity_Casing?has_content>${xzfyCom.quantity_Casing}<#else><空></#if>" disabled/>
         </td>
      </tr>
      
      
      <tr>
         <td>
                                   行政复议经费列入部门预算：
         </td>
         <td>
             <select name="" disabled>
             <#assign budgetInclude="${xzfyCom.budgetInclude?default('')}">
                <option value="" <#if budgetInclude=="">selected</#if>>--请选择--</option>
                <option value="1" <#if budgetInclude=="1">selected</#if>>是</option>
                <option value="0" <#if budgetInclude=="0">selected</#if>>否</option>
             </select>
         </td>
         <td>案号：</td>
         <td>
             <input style="width:90%" type="text" name="" value="<#if xzfyCom.caseNum?has_content>${xzfyCom.caseNum}<#else><空></#if>" disabled>
         </td>
         <td>应诉号：</td>
         <td>
         	<input class="ui-input-wdm" type="text" name="" value="<#if xzfyCom.yingSuNum?has_content>${xzfyCom.yingSuNum}<#else><空></#if>" disabled>
         </td>
         <td></td>
         <td></td>
      </tr>
      
      <tr>
         <td>
                                   行政复议决定审批模式：
         </td>
         <td>
             <select name="" disabled>
             <#assign shenPiMode="${xzfyCom.shenPiMode?default('')}">
                <option value="" <#if shenPiMode=="">selected</#if>>--请选择--</option>
                <option value="1" <#if shenPiMode=="1">selected</#if>>全部由行政复议机关领导签发</option>
                <option value="2" <#if shenPiMode=="2">selected</#if>>部分委托行政复议机构领导签发</option>
             </select>
         </td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
      </tr>
      
      <tr>
         <td>
                                   是否设置接待场所：
         </td>
         <td>
             <select id="csyon" name="" onchange="checkjdcs()" disabled>
             <#assign placeSetUp="${xzfyCom.placeSetUp?default('')}">
                <option value="" <#if placeSetUp=="">selected</#if>>--请选择--</option>
                <option value="1" <#if placeSetUp=="1">selected</#if>>是</option>
                <option value="0" <#if placeSetUp=="0">selected</#if>>否</option>
             </select>
         </td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
       </tr>
       <tr id="jdcs" <#if placeSetUp=="1">style="display:block"<#else>style="display:none"</#if>>
         <td>接待室全称：</td>
         <td>
             <input style="width:90%" type="text" name="" value="<#if xzfyCom.fullNameRect?has_content>${xzfyCom.fullNameRect}<#else><空></#if>" disabled/>
         </td>
         <td>详细地址：</td>
         <td>
             <input style="width:90%" type="text" name="" value="<#if xzfyCom.detailAddressRect?has_content>${xzfyCom.detailAddressRect}<#else><空></#if>" disabled/>
         </td>
         <td>对外电话：</td>
         <td>
             <input class="ui-input-wdm" type="text" name="" value="<#if xzfyCom.foreignPhoneRect?has_content>${xzfyCom.foreignPhoneRect}<#else><空></#if>" disabled/>
         </td>
         <td></td>
         <td></td>
       </tr>
   </table>
    
    <!--暂时隐藏
    <div class="ui-title fn-clear"></div>
   <!-- 
   <table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table  ui-table-list  list-fixed ">
      <tr>
         <th> 	   
	                     
	     </th> <th></th><th>委办单位一览</th><th></th><th></th> 
      </tr>
      <tr>
      <#list weibanList as data>
      
          <td>${data.orgname}</td>
         <#if data_index%5=4><tr></tr></#if>
      </#list>
     </tr>
   </table>

    -->

   <div class="ui-title fn-clear"></div>
    

   <table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table  ui-table-list  list-fixed ">   
      <tr>
         <th> 	   
	                      
	     </th>
	     <th></th><th>本单位关键词汇总</th><th></th><th></th>
      </tr>
      
       
      <tr>
      <#list keywordList as data>
          <td>${data.keyword}</td>
          <#if data_index%5=4><tr></tr></#if>
      </#list>
      </tr>
      
   </table>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table  ui-table-list  list-fixed ">
    <tr>
       <td>    
	        <#if !specialFlag?exists>
	        <input type="button" class="ui-btn ui-btn-yellow" value="修改" onClick="gotoUpdate()" />
	        <input type="button" class="ui-btn ui-btn-normal" value="返回" onClick="gotoBack()" />
	        <#else>
	        <input type="button" class="ui-btn ui-btn-normal" value="返回" onClick="history.back(-1)" />
	        </#if>
	        
	   </td>
    </tr>
   </table>
    
  </form>
</body> 
	<script type="text/javascript">
	    function checkjdcs(){
	        if(document.getElementById("csyon").value==1){
		        document.getElementById("jdcs").style.display="block";
	        }
	        else{
		        document.getElementById("jdcs").style.display="none";
	        }
        }
        
        function checkclpb(){
	        if(document.getElementById("clyon").value==1){
		        document.getElementById("clpb").style.display="block";
	        }
	        else{
		        document.getElementById("clpb").style.display="none";
	        }
        }
	
		function gotoUpdate(){
			 document.checkForm.action="showImprovment.action";
			 document.checkForm.submit();	
	    }
	    
	    function gotoBack(){
	         parent.window.location="../xzfy/gotoIndex.action?funcCode=${funcCode}";		     
	    }
     </script>