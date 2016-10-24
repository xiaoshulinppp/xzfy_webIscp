
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

<div class="wal pageNow2">
      <div class="fl">当前位置：<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页 </a>->统计查询->接待与立案工作信息->接待信息高级检索</div>
      <div class="fr"></div>
</div>

<div class="pageBg1">
<div class="wal">
	
 <div class="pageBox">
   <div class="searchList">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			    <th class="" width="5%">京政复字号</th>
				<th class="" width="5%">申请人关键字</th>
             	<th class="" width="15%">被复议的具体行为-名称（案号）</th>	
				<th class="" width="5%">复议机关名称</th>			
				<th class="" width="5%">被申请人名称</th>	
				<th class="" width="5%">接待日期</th>
				<th class="" width="3%">查看</th>
			</tr>
			<#assign index = 1>
			<#list currentList as c>
			<tr class="trColor">
			    <td class="">&nbsp;${c.tjzfzh?default('')}</td>
			    
				<td>&nbsp;
					<#if c.app_type?has_content>
					   <#if c.app_type=='1'>
					         <span style="background:yellow">${civilKeyword?default('')}</span>
					   <#elseif c.app_type=='2'>
					         <span style="background:yellow">${legalKeyword?default('')}</span>	   
					   </#if>
					</#if>
				</td>
				
				<td class="">&nbsp;
				    <#if behaviorName?has_content || behaviorNum?has_content>
					<span style="background:yellow">${c.xwname?default('')}（${c.xwnum?default('')}）</span>
					<#else>
					    ${c.xwname?default('')}（${c.xwnum?default('')}）
					</#if>
				</td>
				
				<td class="">&nbsp;
					<#if c.xzfy_org?has_content>
					     <#if fyjgName?has_content>
						    <#if c.xzfy_org=='2'><span style="background:yellow">县级政府</span>
						    <#elseif c.xzfy_org=='3'><span style="background:yellow">县级政府的部门</span>
						    <#elseif c.xzfy_org=='6'><span style="background:yellow">省部级行政机关</span>
						    <#elseif c.xzfy_org=='7'><span style="background:yellow">省级政府的部门</span>
						    </#if>
						 <#else>
						    <#if c.xzfy_org=='2'>县级政府
						    <#elseif c.xzfy_org=='3'>县级政府的部门
						    <#elseif c.xzfy_org=='6'>省部级行政机关
						    <#elseif c.xzfy_org=='7'>省级政府的部门
						    </#if>  
						 </#if>
					</#if>
				</td>
				
				<td class="">&nbsp;
					<#if c.defendant_real_name?has_content>
					${c.defendant_real_name}
					</#if>
				</td>
				
	            <td class="">&nbsp;
					<#if c.receive_date?has_content>
					     <#if startJieDaiDate?has_content||endJieDaiDate?has_content>
					        <span style="background:yellow">${c.receive_date}</span>
					     <#else>
							${c.receive_date}
						 </#if>
					</#if>
				</td>
	
				<td class="">
					<a href="../xzfy/viewXzfyInfo.action?funcCode=${funcCode}&xzfyId=${c.id}" target="_blank"><font color="green">查看</font></a>
				</td>
				
			</tr>
			</#list>
	
		</table>
		
	<form name="checkForm" id="checkForm"  action="" method="post" ENCTYPE="multipart/form-data">
	 	<input type="hidden"  name="funcCode"  value="${funcCode}">
	    <input type="hidden" id="behaviorName"   name="behaviorName"  value="${behaviorName?default('')}">
	    <input type="hidden" id="pNum"   name="pNum"  value="">
	    <input type="hidden" id="behaviorNum"  name="behaviorNum" value="${behaviorNum?default('')}">
	    <input type="hidden" id="appType"  name="appType" value="${appType?default('')}">
	    <input type="hidden" id="civilKeyword"  name="civilKeyword" value="${civilKeyword?default('')}">
	    <input type="hidden" id="legalKeyword"  name="legalKeyword" value="${legalKeyword?default('')}">
	    <input type="hidden" id="fyjgName"  name="fyjgName" value="${fyjgName?default('')}">
	    <input type="hidden" id="respondent"  name="respondent" value="${respondent?default('')}">
	    <input type="hidden" id="startJieDaiDate"  name="startJieDaiDate" value="${startJieDaiDate?default('')}">
	    <input type="hidden" id="endJieDaiDate"  name="endJieDaiDate" value="${endJieDaiDate?default('')}">
    </form>		
		
  <div class="pageNum">
             第${pNum}/${totalPage}页  共${pageList.getTotalCount()}条
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
        <a href="javascript:gotoPage()" class="ui-button ui-button-go">Go</a>
    </div>

   </div>
   </div>
   <div class="pageBoxBg"></div>
</div>
</div>

<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>
</body>
</html>

<script>
         function gotoSearch(v){
         	document.getElementById("pNum").value=v;
         	document.checkForm.action="showSearchResult.action";
	        document.checkForm.submit();
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
</script>
