
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

<form name="Form1" id="Form1" action="../xzfy/buweiList.action" method="post">
<#include "../website/header.ftl">

<div class="wal pageNow2">
       <div class="fl">当前位置：&nbsp;&nbsp;<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a> >&nbsp;&nbsp;  <a href="../xzfy/openReceive.action?funcCode=${funcCode}">接收/新增案件</a>  ></div>
</div>
<div class="pageBg1">
<div class="wal">

      <div id="searchForm">
      <div class="pageBox">
            <div class="searchForm">
                  <ul>
                    <li>
                       <div class="name">受理机关:</div>
                       <input class="ui-input-wdm" type="text" 
							<#if xzfyBuwei.shouLiJiGuan?has_content>value="${xzfyBuwei.shouLiJiGuan}"</#if> name="xzfyBuwei.shouLiJiGuan"/>
                   </li>
                   <li>  
                       <div class="name">收案日期:</div>
                      <input class="ui-input-wdm" type="text" onClick="WdatePicker()" 
						<#if xzfyBuwei.receiveDate?has_content>value="${xzfyBuwei.receiveDate}"</#if>  name="xzfyBuwei.receiveDate"/>
                    </li>
                  </ul>
                  <span class="clear_f"></span>
                  <div class="btnDiv">
                      <input type="submit" name="button" class="btn1" value="查询" onclick="" />
                      <span><input type="button" name="button" class="btn1 btn2" value="案件登记" onclick="add()" /></span>
                      <span><input type="button" name="button" class="btn1 btn2" value="承办案件" onclick="now()" /></span>
                      <span><input type="button" name="button" class="btn1 btn2" value="已办结" onclick="view()" /></span>
                      <span><input type="button" name="button" class="btn1 btn2" value="全部案件" onclick="allCase()" /></span>
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
                    <th width="9%">接收日期</th>
                    <th width="15%">受理机关</th>
                    <th width="34%">申请人</th>
                    <th width="15%">行政复议事项</th>
                    <th width="10%">行政管理类别</th>
                    <th width="6%">受理人</th>
                    <th width="6%">提取</th>
                  </tr>
				  <#assign account=pageNum*pageSize-pageSize+1>
				<#list xzfyBuweiList as buwei>
					<tr>
						<td>${account}</td>
						<td>&nbsp;${buwei.receiveDate?default('')}</td>
						<td>&nbsp;${buwei.shouLiJiGuan?default('')}</td>
						
						<#if buwei.appType=="1">
						<#assign app_show=buwei.appDetail?default('')>
						<td title='${app_show}'>&nbsp;<#if app_show.length() gt 26>${app_show[0..25]}..<#else>${app_show?default('')}</#if></td>
						<#else>
						<#assign app_show=buwei.agentDetail?default('')>
						<td title='${app_show}'>&nbsp;<#if app_show.length() gt 26>${app_show[0..25]}..<#else>${app_show?default('')}</#if></td>
						</#if>
						<td>&nbsp;${buwei.xzfyRequest?default('')}</td>
						
						<td> <#if buwei.refer=="1"> 公安</#if>
							<#if buwei.refer=="2"> 国家安全</#if>
							<#if buwei.refer=="3"> 劳动和社会保障</#if>
							<#if buwei.refer=="4"> 司法行政</#if>
							<#if buwei.refer=="5"> 民政</#if>
							<#if buwei.refer=="6"> 土地</#if>
							<#if buwei.refer=="7"> 地矿</#if>
							<#if buwei.refer=="8"> 环保</#if>
							<#if buwei.refer=="9"> 农业</#if>
							<#if buwei.refer=="10"> 水利</#if>
							<#if buwei.refer=="11"> 林业</#if>
							<#if buwei.refer=="12"> 城市规划</#if>
							<#if buwei.refer=="13"> 房屋拆迁</#if>
							<#if buwei.refer=="14"> 房屋登记</#if>
							<#if buwei.refer=="15"> 工商</#if>
							<#if buwei.refer=="16"> 质监</#if>
							<#if buwei.refer=="17"> 商务</#if>
							<#if buwei.refer=="18"> 物价</#if>
							<#if buwei.refer=="19"> 能源</#if>
							<#if buwei.refer=="20"> 交通</#if>
							<#if buwei.refer=="21"> 信息产业</#if>
							<#if buwei.refer=="22"> 邮政</#if>
							<#if buwei.refer=="23"> 烟草专卖</#if>
							<#if buwei.refer=="24"> 税务</#if>
							<#if buwei.refer=="25"> 人民银行</#if>
							<#if buwei.refer=="26"> 证监</#if>
							<#if buwei.refer=="27"> 保监</#if>
							<#if buwei.refer=="28"> 银监</#if>
							<#if buwei.refer=="29"> 外汇</#if>
							<#if buwei.refer=="30"> 财政</#if>
							<#if buwei.refer=="31"> 统计</#if>
							<#if buwei.refer=="32"> 审计</#if>
							<#if buwei.refer=="33"> 海关</#if>
							<#if buwei.refer=="34"> 商检</#if>
							<#if buwei.refer=="35"> 药监</#if>
							<#if buwei.refer=="36"> 卫生</#if>
							<#if buwei.refer=="37"> 计划生育</#if>
							<#if buwei.refer=="38"> 教育</#if>
							<#if buwei.refer=="39"> 文化</#if>
							<#if buwei.refer=="40"> 专利</#if>
							<#if buwei.refer=="41"> 商标</#if>
							<#if buwei.refer=="42"> 版权</#if>	
							<#if buwei.refer=="43"> 旅游</#if>	
							<#if buwei.refer=="44"> 其他</#if>		
						</td>
						<td>${buwei.userName?default('')}
						</td>
						<td>
							<a href="javascript:tiqu('${buwei.id}')">
							办理</a>
						</td>
					</tr>
					<#assign account=account+1>
				</#list>
             
            </table>
            <div class="pageNum">
               第${pageNum}/${totalPage}页   共${xzfyBuweiList.size()}条
					<#assign upPage = pageNum -1>
					<#if upPage lt 1 >
					<#assign upPage = 1>
					</#if>
					<#assign downPage = pageNum +1>
					<#if (downPage gt totalPage)>
					<#assign downPage = totalPage>
					</#if>　
				<a href="../xzfy/buweiList.action?pageNum=1&funcCode=${funcCode}" class="ui-page-item ui-page-item-first">首页</a>
			    <a href="../xzfy/buweiList.action?pageNum=${upPage}&funcCode=${funcCode}" class="ui-page-item ui-page-item-prev">上一页</a>
		     	<a href="../xzfy/buweiList.action?pageNum=${downPage}&funcCode=${funcCode}" class="ui-page-item ui-page-next">下一页</a>
			    <a href="../xzfy/buweiList.action?pageNum=${totalPage}&funcCode=${funcCode}" class="ui-page-item ui-page-last">尾页</a>　
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
		function now(){
			window.location = "../xzfy/buweiListByName.action?funcCode=${funcCode}";
		}
		function view() {
			window.location = "../xzfy/buweiEnd.action?funcCode=${funcCode}";
		}

		function add() {
			window.location = "../xzfy/appBuweiInsert.action?funcCode=${funcCode}";
		}
		
		function allCase() {
			window.location = "../xzfy/buweiList.action?funcCode=${funcCode}";
		}
		function tiqu(id) {
			window.location = "../xzfy/tiquBuwei.action?funcCode=${funcCode}&xzfyId="+id;
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
					window.location = "../xzfy/buweiList.action?funcCode=${funcCode}&pageNum=" + inputPage;
				}
				return;
			}
	
	</script>