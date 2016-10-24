
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

<body>

<form name="Form1" id="Form1" action="../xzfy/tiquFaceList.action" method="post">
<#include "../website/header.ftl">

<div class="wal pageNow2">
	 <div class="fl">当前位置：&nbsp;&nbsp;<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a> >&nbsp;&nbsp;  <a href="../xzfy/openReceive.action?funcCode=${funcCode}">接收/新增案件</a>  >&nbsp;&nbsp; 待提取案件</div>
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
							<#if xzfyInfo.tjzfzh?has_content>value="${xzfyInfo.tjzfzh}"</#if> name="xzfyInfo.tjzfzh"/>
                   </li>
                   <li>  
                       <div class="name">收案日期:</div>
                      <input class="ui-input-wdm" type="text" onClick="WdatePicker()" 
						<#if xzfyInfo.receive_date?has_content>value="${xzfyInfo.receive_date}"</#if>  name="xzfyInfo.receive_date"/>
                    </li>
                    <li>
                       <div class="name">被申请人名称:</div>
                       <input class="ui-input-wdm" type="text" 
						<#if xzfyInfo.defendant_name?has_content>value="${xzfyInfo.defendant_name}"</#if>  name="xzfyInfo.defendant_name"/>
                    </li>
                     <li>
                       <div class="name">申请人名称:</div>
                      <input class="ui-input-wdm" type="text" 
						<#if xzfyInfo.app_show?has_content>value="${xzfyInfo.app_show}"</#if>  name="xzfyInfo.app_show"/>
                   </li>
                   <li>
                       <div class="name">接待人名称:</div>
                      <input class="ui-input-wdm" type="text" 
						<#if xzfyInfo.admit1?has_content>value="${xzfyInfo.admit1}"</#if>  name="xzfyInfo.admit1"/>
                   </li>
                   <li>
                       
                   </li>
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
		<input type="hidden" name="pageNum" value="${pageNum}" id="pageNum">
	  
      <div class="pageBox">
            <div class="searchList">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <th width="5%">序号</th>
                    <th width="8%">接收日期</th>
                    <th width="15%">申请人</th>
                    <th width="15%">被接待人</th>
                    <th width="10%">接待人</th>
                    <th width="15%">被申请人</th>
                    <!--<th width="8%">被申请人种类</th>-->
                    <th width="14%">行政复议请求</th>
                    <th width="6%">接收方式</th>
                    <th width="6%">查看</th>
                    <th width="6%">提取</th>
                  </tr>
				  <#assign account=pageNum*50-50+1>
				<#list xzfyList as xr>
					<tr>
						<td>${account}</td>
						<td>&nbsp;${xr.receive_date?default('')}</td>
						<#assign app_show=xr.app_show?default('')>
						<td title='${app_show}'>&nbsp;<#if app_show.length() gt 26>${xr.app_show[0..25]}..<#else>${app_show?default('')}</#if></td>
						<#assign jddetail=xr.jddetail?default('')>
						<td title='${jddetail}'>&nbsp;
						
						<#if jddetail?has_content && jddetail.length() gt 26>
							${jddetail[0..25]}..
						<#else>
							${jddetail}
						</#if>
						</td>

						<td>&nbsp;${xr.admit1?default('')}<#if xr.admit2?has_content>、${xr.admit2?default('')}</#if></td>
						<td>&nbsp;${xr.defendant_name?default('')}</td>
						<!--
						<td>&nbsp;<#if xr.defendant_type=="3">
							县级政府
							<#elseif xr.defendant_type=="4">
							区县政府部门
							<#elseif xr.defendant_type=="5">
							区县政府
							<#elseif xr.defendant_type=="6">
							省级行政机关
							<#elseif xr.defendant_type=="7">
							省级政府部门
							<#elseif xr.defendant_type=="8">
							其他
							<#elseif xr.defendant_type=="9">
							区县政府部门派出机构
							</#if>
   						</td>
   						-->
   						<#assign fydetail=xr.xzfy_requset_retail?default('')>
						<td title='${fydetail}'>&nbsp;
						
						<#if fydetail?has_content && fydetail.length() gt 26>
							${fydetail[0..18]}..
						<#else>
							${fydetail}
						</#if>
						</td>
						<td><#if xr.receive_type?exists && xr.receive_type=="1">当面接待</#if>
						<#if  xr.receive_type?exists && xr.receive_type=="2">复议来信</#if></td>
						<td><a href="../xzfy/viewCase.action?funcCode=${funcCode}&xzfyId=${xr.id}" target="blank">查看</a></td>
						<td>
							<a href="javascript:tiqu('${xr.id}')">
							提取</a>
						</td>
					</tr>
					<#assign account=account+1>
				</#list>
             
            </table>
            <div class="pageNum">
               第${pageNum}/${totalPage}页   共${list.getTotalCount()}条
					<#assign upPage = pageNum -1>
					<#if upPage lt 1 >
					<#assign upPage = 1>
					</#if>
					<#assign downPage = pageNum +1>
					<#if (downPage gt totalPage)>
					<#assign downPage = totalPage>
					</#if>　
				<a href="../xzfy/tiquFaceList.action?pageNum=1&funcCode=${funcCode}" class="ui-page-item ui-page-item-first">首页</a>
			    <a href="../xzfy/tiquFaceList.action?pageNum=${upPage}&funcCode=${funcCode}" class="ui-page-item ui-page-item-prev">上一页</a>
		     	<a href="../xzfy/tiquFaceList.action?pageNum=${downPage}&funcCode=${funcCode}" class="ui-page-item ui-page-next">下一页</a>
			    <a href="../xzfy/tiquFaceList.action?pageNum=${totalPage}&funcCode=${funcCode}" class="ui-page-item ui-page-last">尾页</a>　
				<span>到<input class="input1"   name="gotoPageNum" id="gotoPageNum" />页</span>　<a href="#" onclick="gotoPage()" class="ui-button ui-button-go">Go</a>
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
		function tiqu(id) {
		window.location = "../xzfy/tiquFace1.action?funcCode=${funcCode}&xzfyId="+id;
		}
		
		function goPage(pageNum){		
			document.getElementById("pageNum").value=pageNum;
			document.Form1.submit();
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
					window.location = "../xzfy/tiquFaceList.action?funcCode=${funcCode}&pageNum=" + inputPage;
				}
				return;
			}
	
	</script>