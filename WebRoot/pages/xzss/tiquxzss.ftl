
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
<style>
#link a:link {color: green}     /* 未访问的链接 */
#link a:visited {color: #B3EE3A;}  /* 已访问的链接 */
#link a:hover {color: #FF8C00;text-decoration:underline;font-size: 18px;}    /* 当有鼠标悬停在链接上 */
#link a:active {color: #0000FF}   /* 被选择的链接 */
</style>
</head>
<body   onload="startTime()">
<form name="Form1" id="Form1" action="../xzss/tiquxzss.action" method="post" onreset  >
<#include "../website/header.ftl">

<div class="wal pageNow2">
      <div class="fl">当前位置：<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a>>
      <a href="../xzss/showUndertakerList.action?funcCode=${funcCode}">行政诉讼案件列表</a> >关联诉讼案件列表</div>
      <div class="fr"></div>
</div>
<div class="pageBg1">
<div class="wal">
      <div id="searchForm">
      <div class="pageBox">
            <div class="searchForm">
                  <ul>
                    <li>
                       <div class="name">案号:</div>
                       <input class="ui-input-wdm" type="text" 
							<#if xzssInfo.case_num?has_content>value="${xzssInfo.case_num}"</#if> name="xzssInfo.case_num"/>
                   </li>
                    <li>
                       <div class="name">原告:</div>
                       <input class="ui-input-wdm" type="text" 
						<#if xzssInfo.app_name?has_content>value="${xzssInfo.app_name}"</#if>  name="xzssInfo.app_name"/>
                     </li>
                     <li>
                       <div class="name">被告:</div>
                       <input class="ui-input-wdm" type="text" 
						<#if xzssInfo.defendant?has_content>value="${xzssInfo.defendant}"</#if>  name="xzssInfo.defendant"/>
                    </li>
                    <!--
                    <li>
                       <div class="name">行政行为名称:</div>
                       <input class="ui-input-wdm" type="text" 
						<#if xzssInfo.action_name?has_content>value="${xzssInfo.action_name}"</#if>  name="xzssInfo.action_name"/>
                    </li>
                    <li>
                       <div class="name">行政行为文号:</div>
                       <input class="ui-input-wdm" type="text" 
						<#if xzssInfo.action_id?has_content>value="${xzssInfo.action_id}"</#if>  name="xzssInfo.action_id"/>
                    </li>-->
                  </ul>
                  <span class="clear_f"></span>
                  <div class="btnDiv">
                      <input type="submit" name="button" class="btn1" value="搜索" onclick="" />
                     
                      <input type="reset" class="btn1 btn2" value="重置" />
                  </div>
            </div>
      </div>
      <div class="pageBoxBg"></div>
      </div>
      <input type="hidden" name="funcCode" value="${funcCode}">
	  <input type="hidden" name="pNum" value="${pNum}" id="pageNum">
	  <input type="hidden" name="shenji" value="${shenji}" id="shenji"/>
	  <input type="hidden" name="fuyi" value="${fuyi}" id="fuyi"/>
	  <input type="hidden" name="shenhe1" value="${shenhe1}" id="shenhe1"/>
	  <input type="hidden" name="shenhe2" value="${shenhe2}" id="shenhe2"/>
	  <div class="pageBox">
         <div class="searchList">
         <table width="100%" border="0" cellpadding="0" cellspacing="0">
         <tr>  
			<th width="3%" rowspan="2">序号</th>
			<!--
			<th width="8%">收案日期</th>
			<th>承办人</th>
			<th>原告类别</th>
			<th>被告类别</th>
			<th>原告姓名</th>
			<th>被告姓名</th>
			<th>应诉机关</th>
			
			<th width="" >答辩日期</th>-->
			<th width="10%" rowspan="2">案号</th>
			<th width="4%" rowspan="2">审级</th>
			<th width="10%" rowspan="2">审理法院</th>
			<th width="9%" rowspan="2">原告</th>
			<th width="9%" rowspan="2">被告</th>
			<th width="7%" rowspan="2">应诉承办人</th>
			<th width="7%" rowspan="2">应诉日期</th>
			<th width="8%" rowspan="2">答辩截止日期</th>
			<th width="7%" rowspan="2">结案日期</th>
			<th width="7%" colspan="3" style="height:20px">结案方式</th>
			<th width="4%" rowspan="2">查看</th>
			<th width="4%" rowspan="2">操作</th>
			</tr>
			<tr>
			<th width="6%" style="height:20px">判决</th>
			<th width="8%" style="height:20px">裁定</th>
			<th width="5%" style="height:20px;">调解</th>
			</tr>
         <#assign account=pNum*pageSize-pageSize+1>
		 <#list xzssList as xzssInfo>
         <tr>
         <td>${account}</td>
         <td >&nbsp;<#if xzssInfo.case_num?has_content>${xzssInfo.case_num}</#if></td>
         <td>
         <#if xzssInfo.shen_level?has_content>
         <#if xzssInfo.shen_level=="1">一审
         <#elseif xzssInfo.shen_level=="2">二审
         <#elseif xzssInfo.shen_level=="3">再审
         </#if>
         </#if>
         </td>
         <td>&nbsp;
			<#if xzssInfo.court?has_content>
			<#if xzssInfo.court=="1">北京市高级人民法院
			<#elseif xzssInfo.court=="2">北京市第一中级人民法院
			<#elseif xzssInfo.court=="3">北京市第二中级人民法院
			<#elseif xzssInfo.court=="4">北京市第三中级人民法院
			<#elseif xzssInfo.court=="5">北京市第四中级人民法院（铁中院）
			<#elseif xzssInfo.court=="6">北京市东城区法院
			<#elseif xzssInfo.court=="7">北京市西城区法院
			<#elseif xzssInfo.court=="8">北京市朝阳区法院
			<#elseif xzssInfo.court=="9">北京市海淀区法院
			<#elseif xzssInfo.court=="10">北京市平谷区法院
			<#elseif xzssInfo.court=="11">北京市石景山区法院
			<#elseif xzssInfo.court=="12">北京市门头沟区法院
			<#elseif xzssInfo.court=="13">北京市房山区法院
			<#elseif xzssInfo.court=="14">北京市大兴区法院
			<#elseif xzssInfo.court=="15">北京市通州区法院
			<#elseif xzssInfo.court=="16">北京市昌平区法院
			<#elseif xzssInfo.court=="17">北京市顺义区法院
			<#elseif xzssInfo.court=="18">北京市怀柔区法院
			<#elseif xzssInfo.court=="19">北京市平谷区法院
			<#elseif xzssInfo.court=="20">北京市密云县法院
			<#elseif xzssInfo.court=="21">北京市延庆县法院
			<#elseif xzssInfo.court=="22">北京市铁路运输法院
			</#if>
			</#if>
			</td>
         <td>&nbsp;<#if xzssInfo.app_name?has_content>${xzssInfo.app_name}</#if></td>
         <td>&nbsp;<#if xzssInfo.defendant?has_content>${xzssInfo.defendant}</#if></td>
         <!--
         <td>&nbsp;<#if xzssInfo.action_name?has_content>${xzssInfo.action_name}</#if></td>
         <td>&nbsp;<#if xzssInfo.action_id?has_content>${xzssInfo.action_id}</#if></td>
         -->
         <td>&nbsp;<#if xzssInfo.ysundertaker_name?has_content>${xzssInfo.ysundertaker_name}</#if></td>
		 <td>&nbsp;<#if xzssInfo.notice_receiptDate?has_content>${xzssInfo.notice_receiptDate}</#if></td>
		 <td>&nbsp;<#if xzssInfo.dabian_endDate?has_content>${xzssInfo.dabian_endDate}</#if></td>
		 <td>&nbsp;<#if xzssInfo.jieandate?has_content>${xzssInfo.jieandate}</#if></td>
		 <td>
			<#if xzssInfo.panjue?has_content>
			<#if xzssInfo.panjue=="1">
			<#elseif xzssInfo.panjue=="1">驳回上诉，维持原判决
			<#elseif xzssInfo.panjue=="2">驳回诉讼请求
			<#elseif xzssInfo.panjue=="3">全部撤销
			<#elseif xzssInfo.panjue=="4">全部撤销并重作
			<#elseif xzssInfo.panjue=="5">部分撤销
			<#elseif xzssInfo.panjue=="6">部分撤销并重作
			<#elseif xzssInfo.panjue=="7">履行法定职责
			<#elseif xzssInfo.panjue=="8">履行给付义务
			<#elseif xzssInfo.panjue=="9">确认违法
			<#elseif xzssInfo.panjue=="10">确认无效
			<#elseif xzssInfo.panjue=="11">变更
			<#elseif xzssInfo.panjue=="12">行政协议履行
			<#elseif xzssInfo.panjue=="13">行政协议补偿
			</#if>
			</#if>
			&nbsp;
			</td>
			<td>
			<#if xzssInfo.caiding?has_content>
			<#if xzssInfo.caiding=="1">驳回上诉，维持原裁定
			<#elseif xzssInfo.caiding=="2">撤销原判，发回重审
			<#elseif xzssInfo.caiding=="3">驳回起诉
			<#elseif xzssInfo.caiding=="4">准许原告主动撤诉
			<#elseif xzssInfo.caiding=="5">准许原告因被告改变原行政行为撤诉
			<#elseif xzssInfo.caiding=="6">终结诉讼
			<#elseif xzssInfo.caiding=="7">其他
			</#if>
			</#if>
			&nbsp;
			</td>
			<td>
			<#if xzssInfo.tiaojie?has_content>
			<#if xzssInfo.tiaojie=="1">调解
			<#elseif xzssInfo.tiaojie=="2">其他
			</#if>
			</#if>
			&nbsp;
			</td>
         <td>
		 <a href="../xzss/xzssguanli.action?xzssId=${xzssInfo.id}&funcCode=${funcCode}&isxinzeng=0" target="_blank">查看</a>&nbsp;
         </td>
         <td>
         <a href="javascript:tiquXzss('${xzssInfo.id}')" title="将使新增应诉案件与该条应诉案件信息关联">关联</a>
         </td>
         </tr>
         <#assign account=account+1>
         </#list>
         </table>
         <div class="pageNum">
               第${pNum}/${totalPage}页   共${totalCount}条
					<#assign upPage = pNum -1>
					<#if upPage lt 1 >
					<#assign upPage = 1>
					</#if>
					<#assign downPage = pNum +1>
					<#if (downPage gt totalPage)>
					<#assign downPage = totalPage>
					</#if>　
				<a href="javascript:goThePage(1)" class="ui-page-item ui-page-item-first">首页</a>
			    <a href="javascript:goThePage(${upPage})" class="ui-page-item ui-page-item-prev">上一页</a>
		     	<a href="javascript:goThePage(${downPage})" class="ui-page-item ui-page-next">下一页</a>
			    <a href="javascript:goThePage(${totalPage})" class="ui-page-item ui-page-last">尾页</a>
				<span>到<input class="input1"  name="gotoPageNum" id="gotoPageNum" />页</span>　<a href="#" onclick="gotoPage()" class="ui-button ui-button-go">Go</a>
            </div>
            
         </div>
      </div>
      <div style="text-align:center;">
      <input  type="button" class="btn5" value="跳过此步" onclick="gotoIsfuyi()" />
      <div>
</form>
</body>
<script>
//alert("shenji="+${shenji}+";shenhe1="+${shenhe1}+";shenhe2="+${shenhe2}+";fuyi="+${fuyi});

function goThePage(pNums){
	document.getElementById("pageNum").value=pNums;
	document.Form1.action="../xzss/tiquxzss.action";
	document.Form1.submit();
}
function gotoIsfuyi(){
	opendg("../xzss/chooseIsfuyi.action?funcCode=${funcCode}&shenji="+${shenji},300,150);
}
function opendg(dgurl,dgw,dgh){
	//alert(1111);
	$.dialog({ 
	title:'',
	width: dgw,
	height: dgh,
	content:'url:'+ dgurl});
}
function gotoPage(){
				var inputPage = window.document.getElementById("gotoPageNum").value;
				if(!inputPage.match("[\\d+]+")){
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
					document.getElementById("pageNum").value=inputPage;
				    document.Form1.action="../xzss/tiquxzss.action";
					document.Form1.submit();
				}
				return;
}
function tiquXzss(xzssId){
	//document.getElementById("pageNum").value=pNums;
	if(confirm("确认关联该案件？")){
	window.location="../xzss/xzssguanli.action?funcCode=${funcCode}&shenji=${shenji}&fuyi=${fuyi}&shenhe1=${shenhe1}&shenhe2=${shenhe2}&isxinzeng=1&xzssId="+xzssId;
	}
}
</script>