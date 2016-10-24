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

<body   onload="startTime()">
<#include "../website/header.ftl">

<div class="wal pageNow2">
      <div class="fl">当前位置：<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a>--<a href="../website/showColumn.action?funcCode=${funcCode}&column=5">统计查询</a></div>
      <div class="fr"></div>
</div>
<form name="form" id="form" action="../tongJi/tongJiMoKuai4.action" method="post">
<div class="pageBg1">
	<div class="wal">
	<input type="hidden" name="funcCode" value="${funcCode}">
	<input type="hidden" name="tongJiType" value="${tongJiType}" id="tongJiType">
	<input type="hidden" name="pageNum" value="${pageNum}" id="pageNum">
	<input type="hidden" name="locbm" value="${locbm}" id="locbm">
		<div id="searchForm">
    		<div class="pageBox">
            	<div class="searchForm">
            		<ul>
                    	<li>
            				<div class="name">申请人:</div>
            				<input type="text" name="appName" value="${appName?default('')}" id="appName">
            			</li>
            			<li>
            				<div class="name">行政复议事项:</div>
							<select name="shixiang">
								<option value="">---------请选择---------</option>
								<option value="1" <#if shixiang=="1">selected</#if>>行政处罚</option>
								<option value="2" <#if shixiang=="2">selected</#if>>行政强制措施</option>
								<option value="3" <#if shixiang=="3">selected</#if>>行政征收</option>
								<option value="4" <#if shixiang=="4">selected</#if>>行政许可</option>
								<option value="5" <#if shixiang=="5">selected</#if>>行政确权</option>
								<option value="6" <#if shixiang=="6">selected</#if>>干预经营自主权</option>
								<option value="7" <#if shixiang=="7">selected</#if>>信息公开</option>
								<option value="8" <#if shixiang=="8">selected</#if>>行政不作为</option>
								<option value="9" <#if shixiang=="9">selected</#if>>其他</option>
							</select>
						</li>
						<li>
            				<div class="name">复议行为名称:</div>
							<input type="text" name="xwname" value="${xwname?default('')}" id="xwname">
						</li>
						<li>
            				<div class="name">统计关键词:</div>
							<select name="keyword">
								<option value="" <#if keyword=="">selected</#if>>--请选择--</option>
								<#list keywordList as k>
								<option value="${k.keyword}" <#if keyword==k.keyword>selected</#if>>${k.keyword}</option>
								</#list>
							</select>
						</li>
						<li>
            				<div class="name">受理年度:</div>
							<select name="receiveYear" id="receiveYear">
								<option value="" <#if receiveYear=="">selected</#if>>全部年份</option>
								<option value="2008" <#if receiveYear=="2008">selected</#if>>2008</option>
								<option value="2009" <#if receiveYear=="2009">selected</#if>>2009</option>
								<option value="2010" <#if receiveYear=="2010">selected</#if>>2010</option>
								<option value="2011" <#if receiveYear=="2011">selected</#if>>2011</option>
								<option value="2012" <#if receiveYear=="2012">selected</#if>>2012</option>
								<option value="2013" <#if receiveYear=="2013">selected</#if>>2013</option>
								<option value="2014" <#if receiveYear=="2014">selected</#if>>2014</option>
								<option value="2015" <#if receiveYear=="2015">selected</#if>>2015</option>
								<option value="2016" <#if receiveYear=="2016">selected</#if>>2016</option>
								<option value="2017" <#if receiveYear=="2017">selected</#if>>2017</option>
								<option value="2018" <#if receiveYear=="2018">selected</#if>>2018</option>
								<option value="2019" <#if receiveYear=="2019">selected</#if>>2019</option>
								<option value="2020" <#if receiveYear=="2020">selected</#if>>2020</option>
							</select>
						</li>
						<li>
            				<div class="name">案件状态:</div>
							<select name="status">
								<option value="" <#if status=="">selected</#if>>全部</option>
								<option value="1" <#if status=="1">selected</#if>>办理中</option>
								<option value="2" <#if status=="2">selected</#if>>中止</option>
								<option value="3" <#if status=="3">selected</#if>>已办结</option>
								<option value="4" <#if status=="4">selected</#if>>未办结</option>
							</select>
						</li>
					</ul>
					<span class="clear_f"></span>
                    <div class="btnDiv">
                      <input type="button" name="button" class="btn1" value="搜索" onclick="search(1)" />
                      <input type="reset" class="btn1 btn2" value="重置" />
                  	</div>
					
				</div>
      		</div>
      		<div class="pageBoxBg"></div>
		</div>
				
    <div class="pageBox">
    	<div class="searchList">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
            	<tr>
                	<th width="5%">序号</th>
                    <th width="5%">收案日期</th>
                    <th width="20%">申请人名称</th>
                    <th width="10%">被申请人名称</th>
                    <th width="10%">具体行政行为名称</th>
                    <th width="10%">具体行政行为文号</th>
                    <th width="5%">统计关键词</th>
                    <th width="5%">行政复议事项</th>
                    <th width="5%">案件状态</th>
                    <th width="5%">结案日期</th>
                    <th width="5%">结案种类</th>
                    <th width="5%">复议意见书</th>
                    <th width="5%">复议建议书</th>
                    <th width="5%">查看</th>
                </tr>
				<#assign account=1>
				<#list dataList as list>
				<tr>
					<#assign isstop = "${list[13]?default('0')}">
					<#assign breakTo = "${list[14]?default('')}">
					<td>&nbsp;${account}</td><#assign account= account+1>
					<td>&nbsp;${list[0]?default('')}</td>
					<td>&nbsp;<#if list[1]?has_content&&list[1].length() gt 25>${list[1][0..24]}...<#else>${list[1]?default('')}</#if></td>
					<td>&nbsp;${list[2]?default('')}</td>
					<td>&nbsp;<#if list[3]?has_content&&list[3].length() gt 25>${list[3][0..24]}...<#else>${list[3]?default('')}</#if></td>
					<td>&nbsp;${list[4]?default('')}</td>
					<td>&nbsp;${list[5]?default('无')}</td>
					<#assign xzfy_shixiang = "${list[6]?default('9')}">
					<td><#if xzfy_shixiang=='1'>行政处罚<#elseif xzfy_shixiang=='2'>行政强制措施<#elseif xzfy_shixiang=='3'>行政征收<#elseif xzfy_shixiang=='4'>行政许可
					<#elseif xzfy_shixiang=='5'>行政确权<#elseif xzfy_shixiang=='6'>干预经营自主权<#elseif xzfy_shixiang=='7'>信息公开<#elseif xzfy_shixiang=='8'>行政不作为<#else>其他</#if></td>
					<td>&nbsp;<#if list[7]=='12'>已办结<#elseif list[7]!='12'&&isstop=='0'>办理中<#else>中止</#if></td>
					<td>&nbsp;${list[8]?default('')}</td>
					<#assign jieanType = "${list[9]?default('')}">
					<td>&nbsp;<#if jieanType =='1'>驳回<#elseif jieanType =='2'>维持<#elseif jieanType =='3'>确认违法<#elseif jieanType =='1'>撤销<#elseif jieanType =='1'>变更<#elseif jieanType =='1'>责令履行<#elseif jieanType =='1'>调解<#elseif jieanType =='1'>终止<#elseif jieanType =='1'>其他<#else>未结案</#if></td>
					<td>&nbsp;<#if list[10]?has_content>有<#else>无</#if></td>
					<td>&nbsp;<#if list[11]?has_content>有<#else>无</#if></td>
					<td><a href="../xzfy/viewCase.action?funcCode=${funcCode}&xzfyId=${list[12]}" target="_blank">查看</a></td>
				</tr>
				</#list>
			</table>
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
<script language="javascript">
			function search(pageNum){
				document.getElementById("pageNum").value=pageNum;
				document.form.submit();
			}
</script>
</html>