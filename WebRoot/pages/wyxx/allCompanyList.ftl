<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		 
		<title></title>
		<link href="../sys_theme/css/base.css" rel="stylesheet" type="text/css" />
		<link href="../sys_theme/css/main_style.css" rel="stylesheet" type="text/css" />
	</head>
	<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
		<!--                       Javascripts 注意不要改变顺序                      -->
<script type="text/javascript" src="../sys_theme/js/jquery-1.8.2.min.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../sys_theme/js/tpl.base.js"></script>

	<body>

<!--标题开始-->
<div class="ui-title fn-clear">
     <span class="ui-title-icon fn-left">
         <img src="../sys_theme/images/icons/crumb.png"/>
     </span>
     <h2 class="ui-title-cnt fn-left">
                        系统维护跟踪列表
     </h2>  
     <span class="ui-searchbar-btn" id="search-box-btn">
         <a href="javascript:slideToggle('#search-general')" id="searchbar-icon" class="show-search">
         </a>
     </span>
</div>       
<!--标题结束-->

<div class="ui-search fn-clear" >
    <div class="ui-search-general fn-clear  fn-hide" id="search-general">
	  <form name="searchForm" id="searchForm" action="" method="post">
		  <input type="hidden" name="funcCode" value="${funcCode}">
		  
		  <input id="pNum" type="hidden" name="pNum" value=""/>
		  
		  <table id="" class="ui-table ui-table-search"  summary="这是一个1行4列的表格样式模板">
		     <tbody class="">
		        <tr>
		           <td >
		                                      单位名称
		           </td>
		           <td>
		              <input class="ui-input-wdm" type="text" name="xzfyCom.workName" <#if xzfyCom?exists>value="${xzfyCom.workName?default('')}"</#if>/>
		           </td>
		           
		           <td >
		                                     联系人
		           </td>
		           
		           <td>
		              <input class="ui-input-wdm" type="text" name="xzfyCom.contact" <#if xzfyCom?exists>value="${xzfyCom.contact?default('')}"</#if>/>
		           </td>
		        </tr>
		      
		        <tr>
		          <td >
		                                    传真
		          </td>
		          <td >
		              <input class="ui-input-wdm" type="text" name="xzfyCom.fax" <#if xzfyCom?exists>value="${xzfyCom.fax?default('')}"</#if>/>
		          </td>
		          
		          <td>
		                                     
		          </td>
		          <td>
		              
		          </td>
		        </tr>
		        		        
		       </tbody>
		          
		       <tfoot><!--可以让按钮居中-->
		          <tr>
		            <td colspan="4">
		               <input  class="ui-btn ui-btn-yellow" type="button" name="button" id=""  value="搜索"  title="搜索" onclick="skipPage('1')"/>
		               <input  class="ui-btn ui-btn-normal" type="button" value="重置" title="重新填写" onclick="reset1()"/>
		            </td>
		          </tr>
		       </tfoot>  		        
		   </table>
		</form>
    </div>  
</div>
	
	<span class="x-line fn-clear">
	    <img src="../sys_theme/images/pic_search_line.png"/>
	</span>
		
		
		<form name="comtForm" id="comtForm" action="" method="post">
		<input type="hidden" name="funcCode" value="${funcCode}">
        <input type="hidden" id="comttId" name="comttId" value="">  
		</form>
		
		 <div class="ui-list-nobtnbar fn-clear ">
 <table class="ui-table  ui-table-list  list-fixed  ">
       <thead class=""  id="" name="" >
			<tr>
			    <th class="" width="5%">序号</th>
				<th class="" width="40%">单位名称</th>
				<th class="" width="30%">联系人</th>
				<th class="" width="15%">传真</th>				
			
				<th class="" width="10%">操作</th>
				
			</tr>
			<#assign index = 1>
			<#list companyList as data>
			<tr class="trColor">
			    <td class="" >&nbsp;${data_index+1}</td>
				<td class="">
					<#if data.workName?has_content>
					${data.workName}
					</#if>
				</td>
				
				<td class="">
					<#if data.contact?has_content>
					${data.contact}
					<#else>
					-
					</#if>
				</td>
				
				<td class="">
					<#if data.fax?has_content>
					${data.fax}
					<#else>
					-
					</#if>
				</td>							
				
				<td class="">
					<a <#if data.updateDateFlag?exists>title="最近更新时间：${data.updateDateFlag}"</#if> href="javascript:viewCompanyDetail('${data.id}','${data.corpCode}')">查看</a>&nbsp;
				</td>
				
			</tr>
			<#assign index = index + 1>
			</#list>
	
		</table>
		
<div class="ui-page">
         第${pNum}/${totalPage}页   共${pageList.getTotalCount()}条 
         			<#assign upPage = pNum -1>
					<#if upPage lt 1 >
					<#assign upPage = 1>
					</#if>
					<#assign downPage = pNum +1>
					<#if (downPage gt totalPage)>
					<#assign downPage = totalPage>
					</#if>

        
   <span class="ui-page-item ui-page-item-go"> <h4>到</h4><input name="gotoPageNum" id="gotoPageNum" type="text" class="input-page" /><a href="javascript:gotoPage()" class="ui-button ui-button-go">Go</a></span>
    <span class="ui-page-item ui-item-link">
    <a href="javascript:skipPage('1')" class="ui-page-item ui-page-item-first">首页</a>
    <a href="javascript:skipPage('${upPage}')" class="ui-page-item ui-page-item-prev">上一页</a>
     <a href="javascript:skipPage('${downPage}')" class="ui-page-item ui-page-next">下一页</a>
    <a href="javascript:skipPage('${totalPage}')" class="ui-page-item ui-page-last">尾页</a></span>
</div>
</body>
</html>

	<script>
		function gotoCreateApp(){
			window.location="createNewComt.action?funcCode=${funcCode}";
			//document.comtForm.action="createNewComt.action";
			//document.comtForm.submit();
		}
		
		function gotoShow(){
			document.comtForm.action="showCorpInfo.action";
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
					skipPage(inputPage);
				}
				return;
			}
			function search(){
				document.searchForm.action="gotoAllCompanyList.action";
				document.searchForm.submit();
			}
			
			function skipPage(pNum){
//				alert(pNum);
				$("#pNum").val(pNum);
				document.searchForm.action="gotoAllCompanyList.action";
				document.searchForm.submit();			
			}
			
			function reset1(){
				$('#searchForm').find(':text').val('');
				$('#searchForm').find('select').val('');
			}
			
			function viewCompanyDetail(id,code){
				window.location="../wyxx/viewCompanyDetail.action?specialFlag='1'&id="+id+"&locbm="+code+"&funcCode=${funcCode}";
			}
	</script>
	