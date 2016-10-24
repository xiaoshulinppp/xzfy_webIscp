
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
      <div class="fl">当前位置：<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a>--统计查询</div>
      <div class="fr"></div>
</div>
<form name="form" id="form" action="searchDataList.action" method="post" />
	<input type="hidden" name="funcCode" value="${funcCode}">
	<input type="hidden" name="pageNum" value="${pageNum}" id="pageNum">
	<#--<input type="hidden" name="appName" value="${appName}" id="appName">-->
	<input type="hidden" name="xwName" value="${xwName}" id="xwName">
	<input type="hidden" name="xwNum" value="${xwNum}" id="xwNum">
	<input type="hidden" name="defendantName" value="${defendantName}" id="defendantName">
	<div class="pageBg1">
		<div class="wal">	    
	    	<div class="pageBox">
	        	<div class="searchList">
	            	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	                	<tr>
		                  	<th>具体行政行为名称</th>
		                    <th>文号</th>
		                    <th>被申请人</th>
		                    <th>案件总数（个）</th>
	                	</tr>
	                	<#assign count=0>
					    <#list dataList1 as l>
					    <#if l[3] gt 1>
					    <#assign count=count+1>
					    <tr>
					    	<td>&nbsp;${l[0]?default('')}</td>
					    	<td>&nbsp;${l[1]?default('')}</td>
					    	<td>&nbsp;${l[2]?default('')}</td>
					    	<td>&nbsp;<a href="../tongJi/xzfyInfoList.action?funcCode=${funcCode}&xwName=${l[0]?default('')}&xwNum=${l[1]?default('')}&defendantName=${l[2]?default('')}">${l[3]}</a></td>
					    </tr>
					    </#if>
	             		</#list>
	            	</table>
	            	<div class="pageNum">
	               		   共${count}条
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
<script language="javascript">
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
					search(inputPage);
				}
				return;
			}
			function search(pageNum){
				document.getElementById("pageNum").value=pageNum;
				document.form.submit();
			}
</script>
</html>