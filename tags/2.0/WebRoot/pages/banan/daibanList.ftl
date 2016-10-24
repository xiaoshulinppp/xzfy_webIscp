<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/base.css" rel="stylesheet" type="text/css" />
		<link href="../${Session['_USER_STYLE_'].cssPath}/main_style.css" rel="stylesheet" type="text/css" />
			<!--                       Javascripts 注意不要改变顺序                      -->
		<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
	</head>
	<body>

		<!--标题开始-->
	<div class="ui-title fn-clear">
		<span class="ui-title-icon fn-left"><img src="../${Session['_USER_STYLE_'].imagePath}/icons/crumb.png"/></span>
	  	<h2 class="ui-title-cnt fn-left">办理案件</h2>  
	   	<span class="ui-searchbar-btn" id="search-box-btn">
	    <a href="javascript:slideToggle('#search-general')" id="searchbar-icon" class="show-search"  ></a></span></div>       
		<!--标题结束-->
					
		<form name="Form1" id="Form1" action="">
		<!--search start 搜索面板开始-->
		<div class="ui-search fn-clear" >
		    <div class="ui-search-general fn-clear  fn-hide" id="search-general">
		    <table id=""class="ui-table ui-table-search  "  summary="这是一个1行4列的表格样式模板">
		        <tbody class="">
		        <tr>
		          <td >姓名</td>
		          <td><input class="ui-input-wdm" type="text"   /></td>
		         <td >工作单位</td>
		          <td ><input class="ui-input-wdm" type="text"   /></td>
		         
		        </tr>
		        <tr>
		          <td >单位隶属</td>
		          <td ><select name="zhfl">
		           <option>不限</option>
		           <option>市直</option>
		         </select></td>
		          <td >身份证号</td>
		          <td  ><input class="ui-input-wdm" type="text"   /></td>
		         </tr>
		          <tr>
		          <td >技术职称级别</td>
		          <td ><select name="zhfl">
		           <option>不限</option>
		           <option>副高</option>
		         </select></td>
		          <td >所从事专业</td>
		          <td  ><select name="zhfl">
		           <option>不限</option>
		           <option>农业</option>
		         </select></td>
		         </tr></tbody>
		         <tfoot><!--可以让按钮居中-->
		            <tr>
		           <td colspan="4"><input  class="ui-btn ui-btn-yellow" type="button" name="button" id=""  value="搜索"  title="搜索" onclick=""/><input class="ui-btn ui-btn-normal" type="reset" value="重置" title="重新填写"/></td>
		         </tr>
		        </tfoot>  		        
		    </table>
  		</div>  
	</div>
	<!--search box end-->
	<span class="x-line fn-clear"><img src="../${Session['_USER_STYLE_'].imagePath}/pic_search_line.png"/></span><!--我是有箭头灰色的分割线-->
	
	<input type="hidden" name="funcCode" value="${funcCode}" />
	<!--列表开始-->
	 <div class="ui-list-nobtnbar fn-clear ">
	    <table class="ui-table  ui-table-list  list-fixed "  >
	       <thead class=""  id="" name="" >
	 	   <tr>
			<th width="15%">案号</th>
			<th width="10%">收案日期</th>
			<th width="15%">申请人名称</th>
			<th width="10%">被申请人类别</th>
			<th width="15%">被申请人名称</th>
			<th width="10%">立案审查人</th>
			<th width="10%">承办人</th>
			<th width="10%">案件状态</th>
			<th width="5%">办理</th>
 	     	</tr>
	      	</thead>
      	 	<tbody class="discolor">
			<#list bananList as xzfyInfo>
				<tr >
					<td  >&nbsp;<#if xzfyInfo.tjzfzh?has_content>${xzfyInfo.tjzfzh}</#if></td>				
					<td  >&nbsp;<#if xzfyInfo.receive_date?has_content>${xzfyInfo.receive_date}</#if></td>
					<td  >&nbsp;<#if xzfyInfo.app_show?has_content>${xzfyInfo.app_show}</#if></td>
					<td  >&nbsp;
						<#if xzfyInfo.defendant_type?has_content>
						<#if xzfyInfo.defendant_type=='1'>
							乡镇政府
						<#elseif xzfyInfo.defendant_type=='2'>
							县级政府
						<#elseif xzfyInfo.defendant_type=='3'>
							县级政府部门
						<#elseif xzfyInfo.defendant_type=='6'>
							省部级行政机关
						<#elseif xzfyInfo.defendant_type=='7'>
							省级政府部门
						<#elseif xzfyInfo.defendant_type=='8'>
							其他
						<#elseif xzfyInfo.defendant_type=='9'>
							市经济技术开发区管委会
						</#if>
						<#else>
						&nbsp;
						</#if>		
					</td>
					<td  >&nbsp;<#if xzfyInfo.defendant_name?has_content>${xzfyInfo.defendant_name}</#if></td>	
					<td  >&nbsp;<#if xzfyInfo.user1_name?has_content>${xzfyInfo.user1_name}</#if></td>
					<td  >&nbsp;<#if xzfyInfo.user2_name?has_content>${xzfyInfo.user2_name}</#if></td>
					<td  >
						<#if xzfyInfo.status=="4">
							案件办理
						<#elseif xzfyInfo.status=="5">
							延期审批
						<#elseif xzfyInfo.status=="6">
							案件延期
						<#elseif xzfyInfo.status=="7">
							中止审批
						<#elseif xzfyInfo.status=="8">
							案件中止
						<#elseif xzfyInfo.status=="9">
							恢复审理审批
						<#elseif xzfyInfo.status=="10">
							恢复审理
						<#elseif xzfyInfo.status=="11">
							结案审批
						<#elseif xzfyInfo.status=="12">
							结案
						</#if>
					</td>
					<td  id="cxs" style="display:block" >
						<a href="../banan/banan.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}">办理</a>&nbsp;		
					</td>
				</tr>
			</#list> 
	     	</tbody>
     	</table>
	</div>	

	<div class="ui-page">
	    <span class="ui-page-item ui-page-item-info"> 第${pNum}/${totalPage}页   共8条</span>
			<#assign upPage = pNum -1>
			<#if upPage lt 1 >
			<#assign upPage = 1>
			</#if>
			<#assign downPage = pNum +1>
			<#if (downPage gt totalPage)>
			<#assign downPage = totalPage>
			</#if>													
	    <span class="ui-page-item ui-page-item-go"> <h4>到</h4><input class="input-page"   name="gotoPageNum" id="gotoPageNum" /><a href="#" onclick="gotoPage()" class="ui-button ui-button-go">Go</a></span>
	    <span class="ui-page-item ui-item-link">
	    <a href="../banan/showDaibanList.action?pNum=1&funcCode=${funcCode}" class="ui-page-item ui-page-item-first">首页</a>
	    <a href="../banan/showDaibanList.action?pNum=${upPage}&funcCode=${funcCode}" class="ui-page-item ui-page-item-prev">上一页</a>
     	<a href="../banan/showDaibanList.action?pNum=${downPage}&funcCode=${funcCode}" class="ui-page-item ui-page-next">下一页</a>
	    <a href="../banan/showDaibanList.action?pNum=${totalPage}&funcCode=${funcCode}" class="ui-page-item ui-page-last">尾页</a></span>	    
	</div> 
		
	</form>
		
	</body>
</html>
		
	
	<script>
		function contactPeople(peopleId){
			parent.document.getElementById("shen1").value=peopleId;
		}
			function updatexzss(id){
				//document.getElementById("tempid").value=id;
				tempid = id;
				document.Form1.action="updatexzss.action";
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
					window.location = "../banan/showDaibanList.action?funcCode=${funcCode}&pNum=" + inputPage + "";
				}
				return;
			}
	
	</script>
	