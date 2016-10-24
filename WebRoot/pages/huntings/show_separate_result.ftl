
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=7">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行政复议信息管理系统</title>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
<!--[if lte IE 6]>
<script src="script/png.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div, ul, img, li, input , a');
    </script>
<![endif]--> 
</head>
	<body  onload="startTime()">
	   <#include "../website/header.ftl">
	   
<#assign user_id=Session['_USER_LOGIN_'].id>

<div class="wal pageNow2">
      <div class="fl">当前位置：<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页 </a>->统计查询->行政复议机关案件统计->高级检索（本单位案件）</div>
      <div class="fr"></div>
</div>
<form name="checkForm" id="checkForm"  action="" method="post" ENCTYPE="multipart/form-data">
<div class="pageBg1">
<div class="wal">

           <div class="pageBox">
            <div class="searchList">
               <table width="100%" border="0" cellpadding="0" cellspacing="0">
                   <tr>
	                  <th width="3%">序号</th>
					  <th width="12%">案件编号</th>
					  <th width="13%">申请人名称</th>
					  <th width="12%">具体行政行为</th>
					  <th width="13%">被申请人名称</th>
					  <th width="7%">收案日期</th>
					  <th width="8%">审查人</th>	
					  <th width="8%">承办人</th>	
					  <th width="7%">案件状态</th>
					  <th width="7%">操作</th>
					  <th width="3%" id="deleteCase0" style="display:none">删除</th>
				   </tr>  
                 <#assign index = 1>           
                 <#assign idCount = 0>         
   			     <#list currentSearchList as data>
   			     <#assign handlType=''>
   			         <#if data[1]=="1">
   			            <#assign handlType='立案审查'>
   			         <#elseif data[1]=="2">
   			            <#if  data[2]=='1'>
   			                <#assign handlType='补正审批'>
   			            <#else>
   			                <#assign handlType='补正已审批'>
   			            </#if>
   			         <#elseif data[1]=="3">
   			            <#if  data[2]=='1'>
   			                <#assign handlType='立案审批'>
   			            <#else>
   			                <#assign handlType='立案已审批'>
   			            </#if>
   			         <#elseif data[1]=="4">
   			            <#assign handlType='案件办理'>
   			         <#elseif data[1]=="5">
   			            <#if  data[2]=='1'>
   			                <#assign handlType='延期审批'>
   			            <#else>
   			                <#assign handlType='延期已审批'>
   			            </#if>
   			         <#elseif data[1]=="6">
   			            <#assign handlType='案件延期'>
   			         <#elseif data[1]=="7">
   			            <#if  data[2]=='1'>
   			                <#assign handlType='中止审批'>
   			            <#else>
   			                <#assign handlType='中止已审批'>
   			            </#if>
   			         <#elseif data[1]=="8">
   			            <#assign handlType='案件中止'>
   			         <#elseif data[1]=="9">
   			            <#if  data[2]=='1'>
   			                <#assign handlType='恢复审理审批'>
   			            <#else>
   			                <#assign handlType='待恢复'>
   			            </#if>
   			         <#elseif data[1]=="10">
   			            <#assign handlType='恢复审理'>
   			         <#elseif data[1]=="11">
   			            <#if  data[2]=='1'>
   			                <#assign handlType='结案审批'>
   			            <#else>
   			                <#if data[3]=='1'>
   			               		 <#assign handlType='结案已审批'>
   			                <#else>
   			                     <#assign handlType='结案已审批'>
   			                </#if>
   			            </#if>
   			          <#elseif data[1]=="12">
   			          		 <#assign handlType='已结案'>
   			         </#if>
   			          <#assign idCount = idCount+1>    
   			       <tr>
   			          <td>${data_index+1}</td>
   			          
   			          <td>&nbsp;
					    <#if data[4]?has_content>
					       ${data[4]}
					    </#if>
				      </td>
				      <#assign shenqingren=data[6]?default('')>
				      <td title='${shenqingren}'>&nbsp;
					    <#if shenqingren?has_content && shenqingren.length() gt 25>
					      ${shenqingren[0..25]}..
					    <#else>
					    	${shenqingren}
					    </#if>
				      </td>
				      
				       <#assign xwname=data[7]?default('')>
				      <td title='${xwname}'>&nbsp;
					    <#if xwname?has_content && xwname.length() gt 25>
					      ${xwname[0..25]}..
					    <#else>
					    	${xwname}
					    </#if>
				      </td>
				      
				      <td>&nbsp;
					    <#if data[8]?has_content>
					       ${data[8]}
					    </#if>
				      </td>
				      
				      <td>&nbsp;
					    <#if data[9]?has_content>
					       ${data[9]}
					    </#if>
				      </td>
				      <td>&nbsp;
					    <#if data[10]?has_content>
					       ${data[10]}
					    </#if>
					    <#if data[11]?has_content>
					       、${data[11]}
					    </#if>					    
				      </td>				      
				      <td>&nbsp;
					    <#if data[12]?has_content>
					       ${data[12]}
					    </#if>
					    <#if data[13]?has_content>
					       、${data[13]}
					    </#if>					    
				      </td>

				      <td>&nbsp;
					    <#if data[1]?has_content>
					       ${handlType}
					    </#if>
				      </td>
				      
				      <td>
					    <a href="../xzfy/viewCase.action?funcCode=${funcCode}&xzfyId=${data[0]}" target="_blank" ><font color="green">查看</font></a>
					    <a href="../banan/bananform.action?funcCode=${funcCode}&tempid=${data[0]}&isView=1" target="_blank" ><font color="green">修改</font></a>
				      <!--../xzfy/editlian.action?funcCode=${funcCode}&xzfyId=${data[0]}&isView=0 
				      ../xzfy/updatelianFrame.action?funcCode=${funcCode}&xzfyId=${data[0]}&isView=1
				      ../banan/bananform.action?tempid=${data[0]}&funcCode=${funcCode}
				      -->
				      </td>
				      <td id="deleteCase${idCount}" style="display:none">
					   		<a href="javascript:gotoDelete('${data[0]}')" ><font color="green">删除</font></a>
				      </td>				      
   			       </tr> 
   			     <#assign index = index + 1>
   			     </#list>
   			   </table>

    <input type="hidden"  id="id" name="id"  value="">
    
 	<input type="hidden"  name="funcCode"  value="${funcCode}">
    <input type="hidden" id="applicant" name="applicant" value="${applicant?default('')}">
    
    <input type="hidden" id="receiveCaseDate1" name="receiveCaseDate1" value="${receiveCaseDate1?default('')}">
    <input type="hidden" id="receiveCaseDate2" name="receiveCaseDate2" value="${receiveCaseDate2?default('')}">
    
    <input type="hidden" id="finishCaseDate1" name="finishCaseDate1" value="${finishCaseDate1?default('')}">
    <input type="hidden" id="finishCaseDate2" name="finishCaseDate2" value="${finishCaseDate2?default('')}">
    
    <input type="hidden" id="pNum"   name="pNum"  value="">
    <input type="hidden" id="undertaker"  name="undertaker" value="${undertaker?default('')}">
    <input type="hidden" id="undertakerSecond"  name="undertakerSecond" value="${undertakerSecond?default('')}">
    <input type="hidden" id="caseNo"  name="caseNo" value="${caseNo?default('')}">
    <input type="hidden" id="representative"  name="representative" value="${representative?default('')}">
    
    <input type="hidden" id="caseNumBFY"  name="caseNumBFY" value="${caseNumBFY?default('')}">
    <input type="hidden" id="caseNameBFY"  name="caseNameBFY" value="${caseNameBFY?default('')}">
    <input type="hidden" id="respondent"  name="respondent" value="${respondent?default('')}">
    <input type="hidden" id="applicantType"  name="applicantType" value="${applicantType?default('')}">
    <input type="hidden" id="fyByMultis"  name="fyByMultis" value="${fyByMultis?default('')}">
    <input type="hidden" id="fysx"  name="fysx" value="${fysx?default('')}">
    
    <input type="hidden" id="agent"  name="agent" value="${agent?default('')}">
    <input type="hidden" id="xzgl"  name="xzgl" value="${xzgl?default('')}">	
    <input type="hidden" id="fyPrepose"  name="fyPrepose" value="${fyPrepose?default('')}">
    
    <input type="hidden" id="adminCompen"  name="adminCompen" value="${adminCompen?default('')}">
    <input type="hidden" id="complement"  name="complement" value="${complement?default('')}">
    <input type="hidden" id="checkFile"  name="checkFile" value="${checkFile?default('')}">
    <input type="hidden" id="dealWithFile"  name="dealWithFile" value="${dealWithFile?default('')}">
    <input type="hidden" id="delay"  name="delay" value="${delay?default('')}">
    
    <input type="hidden" id="terminate"  name="terminate" value="${terminate?default('')}">
    <input type="hidden" id="wayOfTrial"  name="wayOfTrial" value="${wayOfTrial?default('')}">
    <input type="hidden" id="wayOfFinish"  name="wayOfFinish" value="${wayOfFinish?default('')}">
    <input type="hidden" id="opinionOfXzfy"  name="opinionOfXzfy" value="${opinionOfXzfy?default('')}">
    <input type="hidden" id="adviceOfXzfy"  name="adviceOfXzfy" value="${adviceOfXzfy?default('')}">
    
    
     <div align="right">
	            <input type="button" value="删除案件" onclick="setAnjian()" style="color:white;background:green"/>
	            </div>
    
    <div class="pageNum">
             第${pNum}/${totalPage}页  共有${pageList.getTotalCount()}条
　                                                <#assign upPage = pNum -1>
					<#if upPage lt 1 >
					<#assign upPage = 1>
					</#if>
					<#assign downPage = pNum +1>
					<#if (downPage gt totalPage)>
					<#assign downPage = totalPage>
					</#if>
	    <a href ="javascript:gotoSearch(1)" class="ui-page-item ui-page-item-first">首页</a>
        <a href ="javascript:gotoSearch(${upPage})" class="ui-page-item ui-page-item-prev">上一页</a>	
        <a href ="javascript:gotoSearch(${downPage})" class="ui-page-item ui-page-next">下一页</a>
        <a href ="javascript:gotoSearch(${totalPage})" class="ui-page-item ui-page-last">尾页</a>
        <span>到
        <input class="input1" name="gotoPageNum" id="gotoPageNum" type="text" maxlength="3">
                      页
        </span>
        <a href="javascript:gotoPage()" class="ui-button ui-button-go">跳转</a>
     </div>
      
      </div>
   </div>
   <div class="pageBoxBg"></div>
</div>
</div>
</form>
<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>

</body>
</html>
<script>
         function gotoSearch(v){
         	document.getElementById("pNum").value=v;
         	document.checkForm.action="showSeparateQueryResult.action";
	        document.checkForm.submit();
         }
         
         function setAnjian(){
         	if(confirm("您确认要使用删除案件功能吗?")){
         		for(var i=0;i<16;i++){
         			var deleteId="deleteCase"+i;
         			document.getElementById(deleteId).style.display="block";
         		}
         		
         	}
         }
         
         function gotoPage(){
				var inputPage = window.document.getElementById("gotoPageNum").value;
				if(!
("[\\d+]+")){
					alert("页数必须为整数！");  
					return;
				}else{
					for(var i=0;i<inputPage.length;i++){
						if(inputPage.charCodeAt(i)>57 || inputPage.charCodeAt(i)<48){
							alert("页数必须为整数！");
							return;
						}
					}
				}
				if(inputPage > ${totalPage}){
					alert("输入的页数不能超过总页数！");
				}else if(inputPage < 1){
					alert("输入的页数不能少于1页！");
				}else{
					gotoSearch(inputPage);
				}
				    return;
			}
			
			function gotoDelete(id){
			    if(confirm("确定删除吗？")){
			         document.getElementById("id").value=id;
			         document.getElementById("pNum").value=1;
			         document.checkForm.action="../gjcx/deleteInfo.action";
			         document.checkForm.submit();
			         alert("删除成功！");
			    }
			}
</script>
