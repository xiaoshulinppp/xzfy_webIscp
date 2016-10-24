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
                                单位信息维护
        </h2>  
    </div>       
<!--标题结束-->
<div class="ui-title fn-clear">
   <h2 class="ui-title-cnt fn-left"><font color="red">请于固定统计时间节点或按市法制办要求的时间更新单位信息（单位信息无变化也要进行更新）</font></h2>
</div>

<form name="updateForm" id="updateForm" action="../wyxx/gotoSaveInfo.action" method="post" ENCTYPE="multipart/form-data">
   <input type="hidden" name="funcCode" value="${funcCode}">
   <input type="hidden" name="xzfyCom.id" value="${id}">
   <div class="ui-list-nobtnbar fn-clear ">
   <table width="98%" class="ui-table  ui-table-list  list-fixed ">
   <tbody class="discolor">
      <tr>       
         <th width="17%">
                                   行政复议机关名称：
         </td>
         <td width="21%">
             <!--该字段直接从数据库中读取-->
             <input class="ui-input-wdm" type="text" name="xzfyCom.workName" value="<#if xzfyCom.workName?has_content>${xzfyCom.workName}</#if>" readonly/>
         </td>
         <td width="8%">
                                   地址：
         </td>
         <td width="15%">
             <input class="ui-input-wdm" type="text" name="xzfyCom.address" value="<#if xzfyCom.address?has_content>${xzfyCom.address}<#else></#if>"/>
         </td>
         <td width="8%">
                                   联系人：
         </td>
         <td width="12%">
             <input class="ui-input-wdm" type="text" name="xzfyCom.contact" value="<#if xzfyCom.contact?has_content>${xzfyCom.contact}<#else></#if>"/>
         </td>
         <td width="7%">
                                   传真：
         </td>
         <td width="13%">
             <input class="ui-input-wdm" type="text" name="xzfyCom.fax" value="<#if xzfyCom.fax?has_content>${xzfyCom.fax}<#else></#if>"/>
         </td>
      </tr>
      
      <tr>
         <td>
                                   法定代表人姓名：
         </td>
         <td>
             <input class="ui-input-wdm" type="text" name="xzfyCom.representInLaw" value="<#if xzfyCom.representInLaw?has_content>${xzfyCom.representInLaw}<#else></#if>"/>
         </td>
      
         <td width="20%">
                                   职务：
         </td>
         <td>
             <input class="ui-input-wdm" type="text" name="xzfyCom.position_Repnt" value="<#if xzfyCom.position_Repnt?has_content>${xzfyCom.position_Repnt}<#else></#if>"/>
         </td>
         
         <td>
                                  电话（可选）：
         </td>
         <td>
             <input class="ui-input-wdm" type="text" name="xzfyCom.telephone_Repnt" value="<#if xzfyCom.telephone_Repnt?has_content>${xzfyCom.telephone_Repnt}<#else></#if>"/>
         </td>
         <td></td>
         <td></td>
      </tr>
      
      <tr>
         <td width="15%">
                                   法制机构名称：
         </td>
         <td width="20%">
             <input class="ui-input-wdm" type="text" name="xzfyCom.name_LegalInstitude" value="<#if xzfyCom.name_LegalInstitude?has_content>${xzfyCom.name_LegalInstitude}<#else></#if>"/>
         </td>
         
         <td>
                                    性质：
         </td>
         <td>
             <select name="xzfyCom.property_LegalInstitude" class="">
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
             <input class="ui-input-wdm" type="text" name="xzfyCom.quantity_Xzfy" value="<#if xzfyCom.quantity_Xzfy?has_content>${xzfyCom.quantity_Xzfy}<#else></#if>"/>
         </td>
         
         <td>
                                    名称：
         </td>
         <td>
             <input class="ui-input-wdm" type="text" name="xzfyCom.name_Xzfy" value="<#if xzfyCom.name_Xzfy?has_content>${xzfyCom.name_Xzfy}<#else></#if>"/>
         </td>
         
         <td>
                                   人员编制：
         </td>
         <td>
             <input class="ui-input-wdm" type="text" name="xzfyCom.staffing_Xzfy" value="<#if xzfyCom.staffing_Xzfy?has_content>${xzfyCom.staffing_Xzfy}<#else></#if>"/>
         </td>
         <td></td>
         <td></td>
      </tr>
      
      <tr>
         <td>
                                  行政复议机构法定代表人姓名：
         </td>
         <td>
             <input class="ui-input-wdm" type="text" name="xzfyCom.represent_Xzfy" value="<#if xzfyCom.represent_Xzfy?has_content>${xzfyCom.represent_Xzfy}<#else></#if>"/>
         </td>
         <td>
                                   职务：
         </td>
         <td>
             <input class="ui-input-wdm" type="text" name="xzfyCom.position_Xzfy" value="<#if xzfyCom.position_Xzfy?has_content>${xzfyCom.position_Xzfy}<#else></#if>"/>
         </td>
         <td>
                                   办公电话（必）：
         </td>
         <td>
             <input class="ui-input-wdm" type="text" name="xzfyCom.phone_Xzfy" value="<#if xzfyCom.phone_Xzfy?has_content>${xzfyCom.phone_Xzfy}<#else></#if>"/>
         </td>
         <td>
                                   手机（可选）：
         </td>
         <td>
             <input class="ui-input-wdm" type="text" name="xzfyCom.mobile_Xzfy" value="<#if xzfyCom.mobile_Xzfy?has_content>${xzfyCom.mobile_Xzfy}<#else></#if>"/>
         </td>
      </tr>
      
      <tr>
         <td width="15%">
                                复议机关有行政复议资格人数：
         </td>
         <td width="20%">
             <input class="ui-input-wdm" type="text" name="xzfyCom.countOfFyCertAll" value="<#if xzfyCom.countOfFyCertAll?has_content>${xzfyCom.countOfFyCertAll}<#else></#if>"/>
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
             <input class="ui-input-wdm" type="text" name="xzfyCom.numFull_XzfyStaff" value="<#if xzfyCom.numFull_XzfyStaff?has_content>${xzfyCom.numFull_XzfyStaff}<#else></#if>"/>
         </td>
         
         <td>
        	 有复议资格人数：
         </td>
         <td>
         	<input class="ui-input-wdm" type="text" name="xzfyCom.countOfFyCertFull" value="<#if xzfyCom.countOfFyCertFull?has_content>${xzfyCom.countOfFyCertFull}<#else></#if>"/>
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
             <input class="ui-input-wdm" type="text" name="xzfyCom.numPart_XzfyStaff" value="<#if xzfyCom.numPart_XzfyStaff?has_content>${xzfyCom.numPart_XzfyStaff}<#else></#if>"/>
         </td>
         
         <td>
                                    有复议资格人数：
         </td>
         <td>
             <input class="ui-input-wdm" type="text" name="xzfyCom.countOfFyCertPart" value="<#if xzfyCom.countOfFyCertPart?has_content>${xzfyCom.countOfFyCertPart}<#else></#if>"/>
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
             <input class="ui-input-wdm" type="text" name="xzfyCom.countOfAdminAided" value="<#if xzfyCom.countOfAdminAided?has_content>${xzfyCom.countOfAdminAided}<#else></#if>"/>
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
			<select id="ysFirmYon" name="xzfyCom.ysFirmExistsOrNot" onchange="checkYsFirm()">
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
      
      <tr id="ysYes" <#if yonYsFirm !='1'>style="display:none"</#if>>        
	         <td>
	         	应诉机构名称：
	         </td>
	         
	         <td>
             		<input class="ui-input-wdm" id="ysFirmName" type="text" name="xzfyCom.ysFirmName" value="<#if xzfyCom.ysFirmName?has_content>${xzfyCom.ysFirmName}<#else></#if>"/>
	         </td>
	         
	         <td>
	         	人员编制：
	         </td>
	         
         	 <td>
             		<input class="ui-input-wdm" id="staffAuthorized" type="text" name="xzfyCom.staffAuthorized" value="<#if xzfyCom.staffAuthorized?has_content>${xzfyCom.staffAuthorized}<#else></#if>"/>
         	 </td>
        
        	 <td></td>
         	 <td></td>  
         	 <td></td>
         	 <td></td>     
      </tr>
      
      <tr>
         <td width="15%">
                                  行政应诉人员人数（专职）：
         </td>
         <td width="20%">
             <input class="ui-input-wdm" type="text" name="xzfyCom.ysCountFull" value="<#if xzfyCom.ysCountFull?has_content>${xzfyCom.ysCountFull}<#else></#if>"/>
         </td>
         
         <td>
         	 行政应诉人员人数（兼职）：
         </td>
         <td>
             <input class="ui-input-wdm" type="text" name="xzfyCom.ysCountPart" value="<#if xzfyCom.ysCountPart?has_content>${xzfyCom.ysCountPart}<#else></#if>"/>
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
             <input class="ui-input-wdm" type="text" name="xzfyCom.quantity_Hearing" value="<#if xzfyCom.quantity_Hearing?has_content>${xzfyCom.quantity_Hearing}<#else></#if>"/>
         </td>
         <td>
                                    阅览室数量：
         </td>
         <td>
             <input class="ui-input-wdm" type="text" name="xzfyCom.quantity_Reading" value="<#if xzfyCom.quantity_Reading?has_content>${xzfyCom.quantity_Reading}<#else></#if>"/>
         </td>
         <td>
                                    接待室数量：
         </td>
         <td>
              <input class="ui-input-wdm" type="text" name="xzfyCom.quantity_Receiving" value="<#if xzfyCom.quantity_Receiving?has_content>${xzfyCom.quantity_Receiving}<#else></#if>"/>
         </td>
         <td>
                                   办案车辆配备：
         </td>
         <td>
             <select id="clyon" name="xzfyCom.car_Casing" onchange="checkclpb()">
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
             <input class="ui-input-wdm" type="text" name="xzfyCom.quantity_Casing" value="<#if xzfyCom.quantity_Casing?has_content>${xzfyCom.quantity_Casing}<#else></#if>"/>
         </td>
      </tr>
      
      
      <tr>
         <td>
                                   行政复议经费列入部门预算：
         </td>
         <td>
             <select name="xzfyCom.budgetInclude">
             <#assign budgetInclude="${xzfyCom.budgetInclude?default('')}">
                <option value="" <#if budgetInclude=="">selected</#if>>--请选择--</option>
                <option value="1" <#if budgetInclude=="1">selected</#if>>是</option>
                <option value="0" <#if budgetInclude=="0">selected</#if>>否</option>
             </select>
         </td>
         <td>案号抬头：</td>
         <td>
             <input class="ui-input-wdm" type="text" name="xzfyCom.caseNum" value="<#if xzfyCom.caseNum?has_content>${xzfyCom.caseNum}<#else></#if>"/>
         </td>
         <td>应诉号：</td>
         <td>
         	<input class="ui-input-wdm" type="text" name="xzfyCom.yingSuNum" value="<#if xzfyCom.yingSuNum?has_content>${xzfyCom.yingSuNum}<#else></#if>"/>
         </td>
         <td></td>
         <td></td>
      </tr>
      
      <tr>
         <td>
                                   行政复议决定审批模式：
         </td>
         <td>
            <select name="xzfyCom.shenPiMode">
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
             <select id="csyon" name="xzfyCom.placeSetUp" onchange="checkjdcs()">
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
             <input class="ui-input-wdm" type="text" name="xzfyCom.fullNameRect" value="<#if xzfyCom.fullNameRect?has_content>${xzfyCom.fullNameRect}<#else></#if>"/>
         </td>
         <td>详细地址：</td>
         <td>
             <input class="ui-input-wdm" type="text" name="xzfyCom.detailAddressRect" value="<#if xzfyCom.detailAddressRect?has_content>${xzfyCom.detailAddressRect}<#else></#if>"/>
         </td>
         <td>对外电话：</td>
         <td>
             <input class="ui-input-wdm" type="text" name="xzfyCom.foreignPhoneRect" value="<#if xzfyCom.foreignPhoneRect?has_content>${xzfyCom.foreignPhoneRect}<#else></#if>"/>
         </td>
         <td></td>
         <td></td>
       </tr>
       </tbody>
   </table>

   </div>
   <!-- 

   

   <table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table  ui-table-list  list-fixed ">
      <tr>
         <th> 	   
	                      委办单位修改
	     </th>  
      </tr>
   </table>
   -->
        <input type="hidden" name="locbm" value="${locbm}"><!--暂时隐藏
		<div align="left">
			<input type="checkbox" name="locbmwb" id="" value ="0000" <#list weibanList as w><#if w.locbmwb=="0000">checked</#if></#list>>市&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    	<input type="checkbox" name="locbmwb" id="" value ="0100" <#list weibanList as w><#if w.locbmwb=="0100">checked</#if></#list>>东城&nbsp;&nbsp;&nbsp;
	    	<input type="checkbox" name="locbmwb" id="" value ="0200" <#list weibanList as w><#if w.locbmwb=="0200">checked</#if></#list>>西城&nbsp;&nbsp;&nbsp;
	    	<input type="checkbox" name="locbmwb" id="" value ="0500" <#list weibanList as w><#if w.locbmwb=="0500">checked</#if></#list>>朝阳<br>
	    	<input type="checkbox" name="locbmwb" id="" value ="0600" <#list weibanList as w><#if w.locbmwb=="0600">checked</#if></#list>>海淀&nbsp;&nbsp;&nbsp;
	    	<input type="checkbox" name="locbmwb" id="" value ="0700" <#list weibanList as w><#if w.locbmwb=="0700">checked</#if></#list>>丰台&nbsp;&nbsp;&nbsp;
	    	<input type="checkbox" name="locbmwb" id="" value ="0800" <#list weibanList as w><#if w.locbmwb=="0800">checked</#if></#list>>石景山
	    	<input type="checkbox" name="locbmwb" id="" value ="0900" <#list weibanList as w><#if w.locbmwb=="0900">checked</#if></#list>>门头沟<br>
	    	<input type="checkbox" name="locbmwb" id="" value ="1000" <#list weibanList as w><#if w.locbmwb=="1000">checked</#if></#list>>房山&nbsp;&nbsp;&nbsp;
	    	<input type="checkbox" name="locbmwb" id="" value ="1100" <#list weibanList as w><#if w.locbmwb=="1100">checked</#if></#list>>通州&nbsp;&nbsp;&nbsp;
	    	<input type="checkbox" name="locbmwb" id="" value ="1200" <#list weibanList as w><#if w.locbmwb=="1200">checked</#if></#list>>顺义&nbsp;&nbsp;&nbsp;
	    	<input type="checkbox" name="locbmwb" id="" value ="1300" <#list weibanList as w><#if w.locbmwb=="1300">checked</#if></#list>>大兴<br>
	    	<input type="checkbox" name="locbmwb" id="" value ="1400" <#list weibanList as w><#if w.locbmwb=="1400">checked</#if></#list>>昌平&nbsp;&nbsp;&nbsp;
	    	<input type="checkbox" name="locbmwb" id="" value ="1500" <#list weibanList as w><#if w.locbmwb=="1500">checked</#if></#list>>平谷&nbsp;&nbsp;&nbsp;
	    	<input type="checkbox" name="locbmwb" id="" value ="1600" <#list weibanList as w><#if w.locbmwb=="1600">checked</#if></#list>>怀柔&nbsp;&nbsp;&nbsp;
	    	<input type="checkbox" name="locbmwb" id="" value ="1700" <#list weibanList as w><#if w.locbmwb=="1700">checked</#if></#list>>密云<br>
	    	<input type="checkbox" name="locbmwb" id="" value ="1800" <#list weibanList as w><#if w.locbmwb=="1800">checked</#if></#list>>延庆<br>
		</div>
		-->
		</form>
   
   
    
   <table width="98%"  cellspacing="0" class="ui-table  ui-table-list  list-fixed ">   
      <tr>
         <th> 	   
	                      本单位关键词新增/删除
	     </th>
      </tr>
      
       
   </table>
        <form name="form2" id="form2" method="post" action="" ENCTYPE="multipart/form-data">
			<input type="hidden" name="locbm" value="${locbm}">
			<input type="hidden" name="funcCode" value="${funcCode}">
				 <table  id="" class="ui-table ui-table-form "  >
				<th>请输入新关键词：</th>
				<td><input type="text" id="inputKey" name="xzfyKeyword.keyword" /></td>
				<td>
				<input type="button" value="新增" onclick="saveKeyword()" class="ui-btn ui-btn-normal" />
				</td>
				</table>
	
<div class="ui-list-nobtnbar fn-clear ">
				<table  width="60%"  class="ui-table  ui-table-list  list-fixed ">
					<tr>
						<th></th>
						<th></th>
						<th>已有关键词</th><th></th><th></th>
					</tr>
					
					<tr>
					<#list keywordList as data>
						<td><#if data.keyword?has_content>${data.keyword}</#if><a href="../wyxx/deleteKeyword.action?keywordId=${data.id}&funcCode=${funcCode}&id=${id}" onclick="if(confirm('确定删除吗？')==false)return false;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;删除</td>
						<#if data_index%5=4><tr></tr></#if>
					</#list>
					</tr>
					
				</table>
			</div>
        </form>
</div>
    <table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table  ui-table-list  list-fixed ">
    <tr>
       <td> 	   
	        <input type="button" class="ui-btn ui-btn-yellow" value="提交" onclick="gotoCommit()" />
	        <input type="button" class="ui-btn ui-btn-normal" value="返回" onclick="gotoBack()" />
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
		
	    function gotoCommit(){
            if(confirm("确认提交吗？")){
	            window.document.getElementById("updateForm").submit();
	            alert("修改成功！");
	            window.location="../wyxx/showCorpInfo.action?funcCode=${funcCode}";
            }
	    }
	    
	    function saveKeyword(){
	         if(document.getElementById("inputKey").value==""){
	             alert("请输入新关键词！");
	         }
	         else{
			     window.form2.action="saveKeyword.action?xzfyKeyword.status=0&id=${id}";
				 window.form2.submit();
				 alert("新增成功！");
			 }
		}
	    
	    function gotoBack(){
		     window.location="../wyxx/showCorpInfo.action?funcCode=${funcCode}";
	    }
	    
	    function checkYsFirm(){
	    	if($('#ysFirmYon').val()=='1'){
//	    		alert(1);
//	    		document.getElementById("ysFirmYes").style.display="block";
//	    		document.getElementById("ysFirmNO").style.display="none";
	    		$("#ysYes").show();
	    	}
	    	else{
	    		$('#ysFirmName').val('');
	    		$('#staffAuthorized').val('');
	    		
	    		$("#ysYes").hide();
	    	}
	    }
	</script>