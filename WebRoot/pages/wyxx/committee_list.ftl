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
                        复议委员会管理
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
		  <table id="" class="ui-table ui-table-search"  summary="这是一个1行4列的表格样式模板">
		     <tbody class="">
		        <tr>
		           <td >
		                                      姓名
		           </td>
		           <td>
		              <input class="ui-input-wdm" type="text" name="tempName" value="${tempName?default('')}"/>
		           </td>
		           
		           <td >
		                                     性别
		           </td>
		           
		           <td>
		              <#assign sex=sexy?default("")>	
		              <select name="sexy">
		                <option value="" <#if sex=="">selected</#if>>选择</option>
		                <option value="1" <#if sex=="1">selected</#if>>男 </option>
		                <option value="2" <#if sex=="2">selected</#if>>女 </option>
		              </select>
		           </td>
		        </tr>
		      
		        <tr>
		          <td >
		                                    工作单位
		          </td>
		          <td >
		              <input class="ui-input-wdm" type="text" name="work" value="${work?default('')}"/>
		          </td>
		          
		          <td>
		                                     学历
		          </td>
		          <td>
		              <#assign edu=education?default("")>
		              <select name="education">
		                  <option value=""<#if edu=="">selected</#if>>选择</option>
		                  <option value="小学"<#if edu=="小学">selected</#if>>小学</option>
		                  <option value="初中"<#if edu=="初中">selected</#if>>初中</option>
		                  <option value="高中"<#if edu=="高中">selected</#if>>高中</option>
		                  <option value="本科"<#if edu=="本科">selected</#if>>本科</option>
		                  <option value="硕士"<#if edu=="硕士">selected</#if>>硕士</option>
		                  <option value="博士"<#if edu=="博士">selected</#if>>博士</option>
		              </select>
		          </td>
		        </tr>
		        
		        <tr>
		          <td >
		                                   类别
		          </td>
		          <td >		              
		              <#assign type=tempType?default("")>
		              <select name="tempType">
		                  <option value=""<#if type=="">selected</#if>>选择</option>
		                  <option value="1"<#if type=="1">selected</#if>>主任委员</option>
		                  <option value="2"<#if type=="2">selected</#if>>常务副主任委员</option>
		                  <option value="3"<#if type=="3">selected</#if>>副主任委员</option>
		                  <option value="4"<#if type=="4">selected</#if>>常任委员</option>
		                  <option value="5"<#if type=="5">selected</#if>>非常任委员</option>
		              </select>
		          </td>
		          
		          <td >
		                                     职务
		          </td>
		          <td>
		              <input class="ui-input-wdm" type="text" name="tempPosition" value="${tempPosition?default('')}"/>
		          </td>
		        </tr>
		        
		        <tr>  
		          <td >
		                                     电话号码
		          </td>
		          <td>
		              <input class="ui-input-wdm" type="text"  name="phone" value="${phone?default('')}"/>
		          </td>
		          
		          <td >
		                                     填写日期
		          </td>
		          <td>
		              <input class="ui-input-wdm" type="text"  name="tempRecordDate" value="${tempRecordDate?default('')}" onClick="WdatePicker()"/>
		          </td>
		        </tr>
		       </tbody>
		          
		       <tfoot><!--可以让按钮居中-->
		          <tr>
		            <td colspan="4">
		               <input  class="ui-btn ui-btn-yellow" type="button" name="button" id=""  value="搜索"  title="搜索" onclick="search();"/>
		               <input  class="ui-btn ui-btn-normal" type="reset" value="重置" title="重新填写"/>
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
		<div class="" align="right" class="ui-title fn-clear">
		     <input type="button" value="系统维护" class="ui-btn ui-btn-normal" onclick="gotoShow();" />
		     &nbsp;&nbsp;&nbsp;&nbsp;
		      <input  class="ui-btn ui-btn-yellow" type="button" name="button" id=""  value="新 增"  onclick="gotoCreateApp();"/>
		</div>
		</form>
		 <div class="ui-list-nobtnbar fn-clear ">
 <table class="ui-table  ui-table-list  list-fixed  ">
       <thead class=""  id="" name="" >
			<tr>
			    <th class="" width="5%">序号</th>
				<th class="" width="5%">姓名</th>
				<th class="" width="5%">性别</th>
				<th class="" width="5%">工作单位</th>
				<th class="" width="5%">学历</th>
				<th class="" width="5%">类别</th>
				<th class="" width="10%">职务</th>	
				<th class="" width="5%">电话号码</th>
				<th class="" width="5%">填写日期</th>	
			
				<th class="" width="5%">操作</th>
				
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
					<#if data.sexy=="1">
						男
					<#else>
						女
					</#if>
					</#if>
				</td>
				
				<td class="">
					<#if data.workName?has_content>
					${data.workName}
					</#if>
				</td>
				
				
				<td class="">
					<#if data.education?has_content>${data.education}</#if>
				</td>	
				
				<td class="">					
					<#if data.type?has_content>
					  <#if data.type=="1">
						主任委员
					  <#elseif data.type=="2">
						常务副主任委员
					  <#elseif data.type=="3">
						副主任委员
					  <#elseif data.type=="4">
						常任委员
					  <#elseif data.type=="5">
						非常任委员
					  </#if>
					</#if>
				</td>
				
				
				<td class="">
					<#if data.position?has_content>${data.position}</#if>
				</td>
				
				<td class="">
					<#if data.phone?has_content>
					${data.phone}
					</#if>
				</td>
				
				<td class="">
					<#if data.recordDate?has_content>
					${data.recordDate}
					</#if>
				</td>
				
				<td class="">
					<a href="javascript:updateApp('${data.memId}')">修改</a>&nbsp;&nbsp;
					<a href="javascript:deleteApp('${data.memId}')">删除</a>
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
    <a href="../wyxx/showMemList.action?pNum=1&funcCode=${funcCode}&tempName=${tempName?default('')}&phone=${phone?default('')}&sexy=${sexy?default('')}&tempPosition=${tempPosition?default('')}&tempType=${tempType?default('')}&tempRecordDate=${tempRecordDate?default('')}&age=${age?default('')}&education=${education?default('')}" class="ui-page-item ui-page-item-first">首页</a>
    <a href="../wyxx/showMemList.action?pNum=${upPage}&funcCode=${funcCode}&tempName=${tempName?default('')}&phone=${phone?default('')}&sexy=${sexy?default('')}&tempPosition=${tempPosition?default('')}&tempType=${tempType?default('')}&tempRecordDate=${tempRecordDate?default('')}&age=${age?default('')}&education=${education?default('')}" class="ui-page-item ui-page-item-prev">上一页</a>
     <a href="../wyxx/showMemList.action?pNum=${downPage}&funcCode=${funcCode}&tempName=${tempName?default('')}&phone=${phone?default('')}&sexy=${sexy?default('')}&tempPosition=${tempPosition?default('')}&tempType=${tempType?default('')}&tempRecordDate=${tempRecordDate?default('')}&age=${age?default('')}&education=${education?default('')}" class="ui-page-item ui-page-next">下一页</a>
    <a href="../wyxx/showMemList.action?pNum=${totalPage}&funcCode=${funcCode}&tempName=${tempName?default('')}&phone=${phone?default('')}&sexy=${sexy?default('')}&tempPosition=${tempPosition?default('')}&tempType=${tempType?default('')}&tempRecordDate=${tempRecordDate?default('')}&age=${age?default('')}&education=${education?default('')}" class="ui-page-item ui-page-last">尾页</a></span>
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
					window.location = "../wyxx/showMemList.action?funcCode=${funcCode}&pNum=" + inputPage + "&tempName=${tempName?default('')}&phone=${phone?default('')}&sexy=${sexy?default('')}&tempPosition=${tempPosition?default('')}&tempType=${tempType?default('')}&tempRecordDate=${tempRecordDate?default('')}&age=${age?default('')}&education=${education?default('')}";
				}
				return;
			}
			function search(){
				document.searchForm.action="showMemList.action";
				document.searchForm.submit();
			}
	</script>
	