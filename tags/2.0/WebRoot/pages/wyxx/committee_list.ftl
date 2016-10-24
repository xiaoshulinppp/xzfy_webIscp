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
     <span class="ui-title-icon fn-left"><img src="../sys_theme/images/icons/crumb.png"/></span>
      <h2 class="ui-title-cnt fn-left">委员信息列表</h2>  
       <span class="ui-searchbar-btn" id="search-box-btn">
    <a href="javascript:slideToggle('#search-general')" id="searchbar-icon" class="show-search"  ></a></span></div>       
<!--标题结束-->
		<form name="searchForm" id="searchForm" action=  "">
		<input type="hidden" name="funcCode" value="${funcCode}">
			<div class="ui-search fn-clear" >
		    <div class="ui-search-general fn-clear  fn-hide" id="search-general">
		    <table id=""class="ui-table ui-table-search"  summary="这是一个1行4列的表格样式模板">
		        <tbody class="">
		        <tr>
		          <td >姓名</td>
		          <td><input class="ui-input-wdm" type="text" name="tempName" value="${tempName?default('')}"/></td>
		         <td >性别</td>
		          <td >
		         <#assign sex=sexy?default('')>
		          <select name="sexy">
		          <option value="" <#if sex=="">selected</#if>>选择</option>
		          <option value="1" <#if sex=="1">selected</#if>>男 </option>
		          <option value="2" <#if sex=="2">selected</#if>>女 </option>
		          </select>
		          </td>
		         
		        </tr>
		        
		        <tr>
		          <td >身份证号</td>
		          <td ><input class="ui-input-wdm" type="text" name="certification" value="${certification?default('')}"  /></td>
		          <td >出生日期</td>
		          <td  ><input class="ui-input-wdm" type="text"  name="born" value="${born?default('')}" /></td>
		         </tr>
		        
		        <tr>
		          <td >年龄</td>
		          <td ><input class="ui-input-wdm" type="text" name="age" value="${age?default('')}"  /></td>
		          <td >电话号码</td>
		          <td  ><input class="ui-input-wdm" type="text"  name="phone" value="${phone?default('')}" /></td>
		         </tr>
		        
		        <tr>
		          <td >学历</td>
		          <td >
		          <select name="education">
		          <option value="">选择</option>
		          <option value="小学">小学</option>
		          <option value="初中">初中</option>
		          <option value="高中">高中</option>
		          <option value="本科">本科</option>
		          <option value="硕士">硕士</option>
		          <option value="博士">博士</option>
		          </select>
		          <!--<input class="ui-input-wdm" type="text" name="education" value="${education?default('')}"  />-->
		          
		          </td>
		          <td >技术职称</td>
		          <td>
		          <select name="techType">
		          <option value="">选择</option>
		          <option value="初级">初级</option>
		          <option value="中级">中级</option>
		          <option value="副高">副高</option>
		          <option value="正高">正高</option>
		          <option value="硕导">硕导</option>
		          <option value="博导">博导</option>
		          </select>
		          </td>
		         </tr>
		        
		        <tr>
		          <td >工作单位</td>
		          <td ><input class="ui-input-wdm" type="text" name="corpName" value="${corpName?default('')}"  /></td>
		          <td >邮箱</td>
		          <td  ><input class="ui-input-wdm" type="text"  name="email" value="${email?default('')}" /></td>
		         </tr>
		          </tbody>
		         <tfoot><!--可以让按钮居中-->
		         </form>
		            <tr>
		           <td colspan="4"><input  class="ui-btn ui-btn-yellow" type="button" name="button" id=""  value="搜索"  title="搜索" onclick="search();"/><input class="ui-btn ui-btn-normal" type="reset" value="重置" title="重新填写"/></td>
		         </tr>
		        </tfoot>  		        
		    </table>
  		</div>  
	</div>
	<span class="x-line fn-clear"><img src="../sys_theme/images/pic_search_line.png"/></span>
		
		
		<form name="comtForm" id="comtForm" action="">
		<input type="hidden" name="funcCode" value="${funcCode}">
        <input type="hidden" id="comttId" name="comttId" value="">  
		<div class="" align="right" class="ui-title fn-clear">
		     <input type="button" value="新 增" class="button" onclick="gotoCreateApp();" />
		</div>
		</form>
		
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="ui-table  ui-table-list  list-fixed ">
			<tr>
			    <th class="" width="5%">序号</th>
				<th class="" width="5%">姓名</th>
				<th class="" width="5%">性别</th>	
				<th class="" width="15%">身份证号</th>
				<th class="" width="10%">出生日期</th>	
				<th class="" width="5%">年龄</th>	
				<th class="" width="10%">电话号码</th>
				<th class="" width="5%">学历</th>
				<th class="" width="5%">技术职称</th>
				<th class="" width="10%">工作单位</th>		
				<th class="" width="15%">邮箱</th>		
				<th class="" width="10%">操作</th>
				
			</tr>
			<#assign index = 1>
			<#list memberList as data>
			<tr class="trColor">
			    <td class="" >&nbsp;${data_index+1}</td>
				<td class="">
					<#if data.memName?has_content>
					${data.memName}
					</#if>
				</td>
				
				<td class="">
					<#if data.sexy?has_content>
					<#if data.sexy=='1'>
						男
					<#else>
						女
					</#if>
					<#else>
					         选择
					</#if>
				</td>
				
				<td class="">
					<#if data.certId?has_content>
					${data.certId}
					</#if>
				</td>
				
				<td class="">
					<#if data.born?has_content>
					${data.born}
					</#if>
				</td>
				
				<td class="">
					<#if data.age?has_content>
					${data.age}
					</#if>
				</td>
				
				<td class="">
					<#if data.phone?has_content>${data.phone}</#if>
				</td>	
				
				<td class="">
					<#if data.education?has_content>${data.education}</#if>
				</td>	
				
				<td class="">
					<#if data.techType?has_content>${data.techType}</#if>
				</td>	
				
				<td class="">
					<#if data.workName?has_content>${data.workName}</#if>
				</td>
				
				<td class="">
					<#if data.email?has_content>${data.email}</#if>
				</td>	
				
				<td class="">
					<a href="javascript:updateApp('${data.memId}')">修改</a>&nbsp;&nbsp;
					<a href="javascript:deleteApp('${data.memId}')">删除</a>
				</td>
				
			</tr>
			<#assign index = index + 1>
			</#list>
	
		</table>
		
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="ui-table  ui-table-list  list-fixed ">
  <tr >
    <td>
         第${pNum}/${totalPage}页   共${allMemList.size()}条 
         			<#assign upPage = pNum -1>
					<#if upPage lt 1 >
					<#assign upPage = 1>
					</#if>
					<#assign downPage = pNum +1>
					<#if (downPage gt totalPage)>
					<#assign downPage = totalPage>
					</#if>
		
        <a href ="../wyxx/${action}.action?pNum=1&funcCode=${funcCode}&tempName=${tempName?default('')}&phone=${phone?default('')}&sexy=${sexy?default('')}&corpName=${corpName?default('')}&certification=${certification?default('')}&born=${born?default('')}&age=${age?default('')}&education=${education?default('')}&techType=${techType?default('')}&email=${email?default('')}">首页</a>
        <a href ="../wyxx/${action}.action?pNum=${upPage}&funcCode=${funcCode}&tempName=${tempName?default('')}&phone=${phone?default('')}&sexy=${sexy?default('')}&corpName=${corpName?default('')}&certification=${certification?default('')}&born=${born?default('')}&age=${age?default('')}&education=${education?default('')}&techType=${techType?default('')}&email=${email?default('')}">上一页</a>	
        <a href ="../wyxx/${action}.action?pNum=${downPage}&funcCode=${funcCode}&tempName=${tempName?default('')}&phone=${phone?default('')}&sexy=${sexy?default('')}&corpName=${corpName?default('')}&certification=${certification?default('')}&born=${born?default('')}&age=${age?default('')}&education=${education?default('')}&techType=${techType?default('')}&email=${email?default('')}">下一页</a>
        <a href ="../wyxx/${action}.action?pNum=${totalPage}&funcCode=${funcCode}&tempName=${tempName?default('')}&phone=${phone?default('')}&sexy=${sexy?default('')}&corpName=${corpName?default('')}&certification=${certification?default('')}&born=${born?default('')}&age=${age?default('')}&education=${education?default('')}&techType=${techType?default('')}&email=${email?default('')}">末页</a>
        第
        <input name="gotoPageNum" id="gotoPageNum" type="text" class="inputTextSmall" maxlength="3">
        页
        <a href="#" onclick="gotoPage()">跳转</a>
     </td>
  </tr>
</table>
</body>
</html>

	<script>
		function gotoCreateApp(){
			document.comtForm.action="createNewComt.action";
			document.comtForm.submit();
		}
		
		function deleteApp(id){
			if(confirm("您确认要删除吗？")){
				document.getElementById("comttId").value=id;
				document.comtForm.action="deleteComt.action";
				document.comtForm.submit();
			}
		}
		
		function updateApp(id){
				document.getElementById("comttId").value=id;
				document.comtForm.action="updateComt.action";
				document.comtForm.submit();
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
					window.location = "../wyxx/showMemList.action?funcCode=${funcCode}&pNum=" + inputPage + "&tempName=${tempName?default('')}&phone=${phone?default('')}&sexy=${sexy?default('')}&corpName=${corpName?default('')}&certification=${certification?default('')}&born=${born?default('')}&age=${age?default('')}&education=${education?default('')}&techType=${techType?default('')}&email=${email?default('')}";
				}
				return;
			}
			function search(){
				document.searchForm.action="showMemList.action";
				document.searchForm.submit();
			}
	</script>
	