<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>信息采集报送平台</title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<table border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" style="width:98%;">
			<tr>
				<td height="20">信息采集报送平台 > 新闻管理 > 新闻管理</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
			<tr>
				<td>新闻列表</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
			<tr>
				<#if release == 0>
				<td width="100" class="cardActive">未发布</td>
				<td width="100" class="cardNormal"><a href="#" class="cardLink" onclick="showReleaseList('1');">已发布</a></td>
				<#else>
				<td width="100" class="cardNormal"><a href="#" class="cardLink" onclick="showReleaseList('0');">未发布</a></td>
				<td width="100" class="cardActive">已发布</td>
				</#if>
				<td class="cardThZf">&nbsp;</td>
				<#if release == 0>
				<td align="right">
					<input type="button" value="新 增" class="button" onclick="gotoCreateSimpleNews();" />
				</td>
				</#if>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabout">
			<tr>
				<th class="thListNormal">编号</th>
				<th class="thListNormal">新闻名称</th>
				<th class="thListNormal">新闻编辑</th>
				<th class="thListNormal">新闻日期</th>
				<th class="thListNormal">新闻状态</th>
				<th class="thListNormal">查看</th>
				<#if release == 0>
				<th class="thListNormal">修改</th>
				<th class="thListNormal">删除</th>
				<th class="thListNormal">发布</th>
				<#else>
				<th class="thListNormal">取消发布</th>
				</#if>
			</tr>
			<#assign index = 1>
			<#list newsList as data>
			<tr class="trColor">
				<td class="tdlistCenter">${index}</td>
				<td class="tdlistCenter">${data.title}</td>
				<td class="tdlistCenter">${data.editor}</td>
				<td class="tdlistCenter">${data.date}</td>
				<#if data.release == 0>
				<td class="tdlistCenter">未发布</td>
				<#else>
				<td class="tdlistCenter">已发布</td>
				</#if>
				<td class="tdlistCenter">
					<a href="#" onclick="showSimpleNews('${data.id}');">
						<img src="../${Session['_USER_STYLE_'].imagePath}/sicons/view.gif" alt="查看" width="16" height="16" border="0" />
					</a>
				</td>
				<#if release == 0>
				<td class="tdlistCenter">
					<a href="#" onclick="updateSimpleNews('${data.id}');">
						<img src="../${Session['_USER_STYLE_'].imagePath}/sicons/file_modf.gif" alt="修改" width="16" height="16" border="0" />
					</a>
				</td>
				<td class="tdlistCenter">
					<a href="#" onclick="deleteSimpleNews('${data.id}');">
						<img src="../${Session['_USER_STYLE_'].imagePath}/sicons/file_del.gif" alt="删除" width="16" height="16" border="0" />
					</a>
				</td>
				<td class="tdlistCenter">
					<a href="#" onclick="releaseSimpleNews('${data.id}');">
						<img src="../${Session['_USER_STYLE_'].imagePath}/sicons/ok.gif" alt="发布" width="16" height="16" border="0" />
					</a>
				</td>
				<#else>
				<td class="tdlistCenter">
					<a href="#" onclick="cancelReleaseSimpleNews('${data.id}');">
						<img src="../${Session['_USER_STYLE_'].imagePath}/sicons/disable.gif" alt="取消发布" width="16" height="16" border="0" />
					</a>
				</td>
				</#if>
			</tr>
			<#assign index = index + 1>
			</#list>
			<#assign countNum = 16>
			<#if index lt countNum>
			<#assign temp = countNum - index>
			<#list 1..temp as x>
			<tr class="trColor">
				<td align="center" class="tdlistCenter">&nbsp;</td>
				<td align="center" class="tdlistCenter">&nbsp;</td>
				<td align="center" class="tdlistCenter">&nbsp;</td>
				<td align="center" class="tdlistCenter">&nbsp;</td>
				<td align="center" class="tdlistCenter">&nbsp;</td>
				<td align="center" class="tdlistCenter">&nbsp;</td>
				<td align="center" class="tdlistCenter">&nbsp;</td>
				<#if release == 0>
				<td align="center" class="tdlistCenter">&nbsp;</td>
				<td align="center" class="tdlistCenter">&nbsp;</td>
				</#if>
				
			</tr>
			</#list>
			</#if>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr align="center">
				<td>第${pageNum}/${totalPage}页 
					<a onclick="gopage('1')"  href ="#">首页</a>
					<#assign upPage = pageNum -1>
					<#if upPage lt 1 >
					<#assign upPage = 1>
					</#if>
					<a onclick="gopage('${upPage}')"  href ="#">上一页</a>
					<#assign downPage = pageNum +1>
					<#if (downPage gt totalPage)>
					<#assign downPage = totalPage>
					</#if>
					<a onclick="gopage('${downPage}')"  href ="#">下一页</a>
					<a onclick="gopage('${totalPage}')" href ="#">末页</a>
					第 <input id="gotoPageNum" name="gotoPageNum" type="text" class="inputTextSmall" maxlength="4" onkeypress="keyUpFunc(event);"> 页
					<a href="#" onclick="gotoPage()">跳转</a>
				</td>
			</tr>
		</table>
		<script type="text/javascript">
			function gopage(mpage){
				window.location = "../webTemplate/showSimpleNewsList.action?funcCode=${funcCode}&pageNum=" + mpage  + "&classifyId=${classifyId}&release=${release}";
			}
			
			function keyUpFunc(oEvent){
				if(oEvent.keyCode == 13 || oEvent.keyCode == 108){
					oEvent.keyCode=0;
					gotoPage();
				}
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
					window.location = "../webTemplate/showSimpleNewsList.action?funcCode=${funcCode}&pageNum=" + inputPage + "&classifyId=${classifyId}&release=${release}";
				}
				return;
			}
		</script>
		<form id="deleteForm" action="../appNewsTemplate/deleteSimpleNews.action" method="post">
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="classifyId" value="${classifyId}" />
			<input type="hidden" id="deleteId" name="entityId" value="" />
		</form>
		<form id="updateForm" action="../appNewsTemplate/gotoUpdateSimpleNews.action" method="post">
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="classifyId" value="${classifyId}" />
			<input type="hidden" id="updateId" name="entityId" value="" />
		</form>
		<form id="releaseForm" action="../appNewsTemplate/releaseSimpleNews.action" method="post">
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="classifyId" value="${classifyId}" />
			<input type="hidden" id="releaseId" name="entityId" value="" />
		</form>
		<form id="cancelReleaseForm" action="../appNewsTemplate/cancelReleaseSimpleNews.action" method="post">
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="classifyId" value="${classifyId}" />
			<input type="hidden" id="cancelId" name="entityId" value="" />
		</form>
		<form id="showForm" action="../appNewsTemplate/showSimpleNewsInfo.action" method="post">
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="classifyId" value="${classifyId}" />
			<input type="hidden" id="showId" name="entityId" value="" />
		</form>
	</body>
</html>
<script type="text/javascript">
	/*
	 * 进入创建新闻页面
	 */
	function gotoCreateSimpleNews(){
		window.location.href = "../appNewsTemplate/gotoCreateSimpleNews.action?funcCode=${funcCode}&classifyId=${classifyId}";
	}
	
	/*
	 * 删除简单新闻
	 */
	function deleteSimpleNews(dataId){
		if(confirm("确认删除？")){
			window.document.getElementById("deleteId").value = dataId;
			window.document.getElementById("deleteForm").submit();
		}
	}
	
	/*
	 * 进入修改简单新闻页面
	 */
	function updateSimpleNews(dataId){
		window.document.getElementById("updateId").value = dataId;
		window.document.getElementById("updateForm").submit();
	}
	
	/*
	 * 进入简单新闻列表
	 */
	function showReleaseList(release){
		window.location.href = "../appNewsTemplate/showSimpleNewsList.action?funcCode=${funcCode}&classifyId=${classifyId}&release=" + release;
	}
	
	/*
	 * 发布新闻
	 */
	function releaseSimpleNews(dataId){
		if(confirm("是否发布？")){
			window.document.getElementById("releaseId").value = dataId;
			window.document.getElementById("releaseForm").submit();
		}
	}
	
	/*
	 * 取消发布新闻
	 */
	function cancelReleaseSimpleNews(dataId){
		if(confirm("是否取消发布？")){
			window.document.getElementById("cancelId").value = dataId;
			window.document.getElementById("cancelReleaseForm").submit();
		}
	}
	
	/*
	 * 显示简单新闻信息
	 */
	function showSimpleNews(dataId){
		window.document.getElementById("showId").value = dataId;
		window.document.getElementById("showForm").submit();
	}
</script>