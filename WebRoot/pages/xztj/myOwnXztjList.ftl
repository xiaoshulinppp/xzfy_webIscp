
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

<form name="Form1" id="Form1" action="../xztj/gotoOwnStatList.action" method="post" onreset>

<#include "../website/header.ftl">

<div class="wal pageNow2">
      <div class="fl">当前位置：<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a>> 待办理案件查询</div>
      <div class="fr"></div>
</div>

<div class="pageBg1">
<div class="wal">
      <div id="searchForm">
      <div class="pageBox">
            <div class="searchForm">
                  <ul> 
                    <li>  
                       <div class="name">统计年度:</div>
						
						<#assign xztjY = xztjYear?default('')>
						<select name="xztjYear">
							<option value="">-请选择-</option>
							<#list yearList as year>
							<option value="${year}" <#if xztjY == year>selected</#if>>${year}</option>
							</#list>
						</select>
                    </li>
                                                                      
                     <li>
                       <div class="name">统计季度:</div>
                       <select name="fillQuarter">
                       <#assign fQ = fillQuarter?default('')>
                       		<option value="" <#if fQ==''>selected</#if>>-请选择-</option>
                       		<option value="1" <#if fQ=='1'>selected</#if>>第一季度</option>
                       		<option value="2" <#if fQ=='2'>selected</#if>>第二季度</option>
                       		<option value="3" <#if fQ=='3'>selected</#if>>第三季度</option>
                       		<option value="4" <#if fQ=='4'>selected</#if>>第四季度</option>
                       		<option value="5" <#if fQ=='5'>selected</#if>>全年</option>
                       </select>
                    </li>
                    
                    <li>  
                       <div class="name">填报人:</div>
                       <input class="ui-input-wdm" type="text"
						<#if fillPerson?has_content>value="${fillPerson}"</#if>  name="fillPerson"/>
                    </li>
                    
                    <li>  
                       <div class="name">填报日期:</div>
                       <input class="ui-input-wdm" type="text" onClick="WdatePicker()" 
						<#if fillDate?has_content>value="${fillDate}"</#if>  name="fillDate"/>
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
		<input type="hidden" name="pNum" value="${pNum}" id="pageNum">
		
	<div class="btnDiv" style="text-align:right;border:0px">
		<input class="btn1" type="button" value="新建" title="新建" onclick="addNewApp()" target="_blank"/>
	</div>
	
      <div class="pageBox">
            <div class="searchList">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">            	 
            		 
                  <tr>
                    <th width="10%">序号</th>
                    <th width="15%">统计年度</th>
                    <th width="20%">统计季度</th>
                    
                    <th width="15%">填报人</th>
                    
                  
                    <th width="15%">填报日期</th>
                    
                    <th width="10%">状态</th>

                    <th width="15%">操作</th>

                  </tr>
				  <#assign account=pNum*pageSize-pageSize+1>
				<#list xztjList as xztj>					
					<tr>
						<!--序号-->
						<td>${account}</td>
						<!--统计年度-->
						<td>&nbsp;${xztj.statYear?default('')}</td>
						<!--统计季度-->
						<td>&nbsp;
						<#if xztj.quarterOfYear?has_content>
							<#if xztj.quarterOfYear == '1'>
								第一季度
							<#elseif xztj.quarterOfYear == '2'>
								第二季度
							<#elseif xztj.quarterOfYear == '3'>
								第三季度
							<#elseif xztj.quarterOfYear == '4'>
								第四季度
							<#else>
							           全年     
							</#if>
						</#if>
						</td>						
						<!--填报人-->
						<td>&nbsp;${xztj.appPerson?default('')}</td>
						<!--填报日期-->
						<td>&nbsp;${xztj.appDate?default('')}</td>
						<!--审核状态-->
						<td>&nbsp;
						<#if xztj.status?exists>
							<#if xztj.status == '0'>
								待审
							<#elseif xztj.status == '1'>
								审核通过
							<#else>
								审核退回
							</#if>
						</#if>
						</td>
						<!--审核or查看-->
						<td>
						<#if xztj.status?has_content>
							<#if xztj.status != '2'>
								<div id="link">
								<a href="../xztj/viewXztjAuditRlt.action?funcCode=${funcCode}&id=${xztj.id}" target="_blank">查看</a>&nbsp;&nbsp;
								<#if xztj.status =='0' && xztj.appId == userId>
								<a href="javascript:deleteXztjRecord('${xztj.id}')">删除</a>
								</#if>
								</div>
							<#else>
								<#if xztj.appId == userId>
									<div id="link"><a href="../xztj/reviseSrcData.action?funcCode=${funcCode}&id=${xztj.id}">修改</a></div>						
								<#else>
									<a href="../xztj/viewXztjAuditRlt.action?funcCode=${funcCode}&id=${xztj.id}" target="_blank">查看</a>&nbsp;&nbsp;
								</#if>
							</#if>
						</#if>
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
				<a href="../xztj/gotoOwnStatList.action?pNum=1&funcCode=${funcCode}" class="ui-page-item ui-page-item-first">首页</a>
			    <a href="../xztj/gotoOwnStatList.action?pNum=${upPage}&funcCode=${funcCode}" class="ui-page-item ui-page-item-prev">上一页</a>
		     	<a href="../xztj/gotoOwnStatList.action?pNum=${downPage}&funcCode=${funcCode}" class="ui-page-item ui-page-next">下一页</a>
			    <a href="../xztj/gotoOwnStatList.action?pNum=${totalPage}&funcCode=${funcCode}" class="ui-page-item ui-page-last">尾页</a>　
				<span>到<input class="input1"  name="gotoPageNum" id="gotoPageNum" />页</span>　<a href="#" onclick="gotoPage()" class="ui-button ui-button-go">Go</a>
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
	function goPage(pNum){		
			document.getElementById("pageNum").value=pNum;
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
					window.location = "../xztj/gotoOwnStatList.action?funcCode=${funcCode}&pNum=" + inputPage;
				}
				return;
			}	
	function addNewApp(){
		window.location = "../xztj/gotoFillNewRecord.action?funcCode=${funcCode}";
	}
	
	function deleteXztjRecord(id){
		if(confirm("确定删除吗？")){
			window.location="../xztj/deleteMyXztjRecord.action?funcCode=${funcCode}&id="+id;
			alert("删除成功！");
		}
	}
	</script>