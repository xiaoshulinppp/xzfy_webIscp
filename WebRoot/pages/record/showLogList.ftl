<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>已办理案件列表</title>


<link href="../sys_theme/css/base.css" rel="stylesheet" type="text/css" />
<link href="../sys_theme/css/main_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../sys_theme/js/jquery-1.8.2.min.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../sys_theme/js/tpl.base.js"></script>



</head>
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<body>
<div class="ui-title fn-clear">
     <span class="ui-title-icon fn-left"><img src="../sys_theme/images/icons/crumb.png"/></span>
      <h2 class="ui-title-cnt fn-left">修改日志 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        -- 共${totalCount1}条</h2>  
 

<span class="x-line fn-clear"><img src="../sys_theme/images/pic_search_line.png"/></span><!--我是有箭头灰色的分割线-->

<!--主体内容、列表显示区域。注意上边的区域定义必须保持-->
<div class="ui-list-nobtnbar fn-clear ">
	<table class="ui-table  ui-table-list  list-fixed " >
	<thead class=""  id="" name="" >
	<#assign yudesj=xzfyInfo2.yuedusj?default('')>
	
	<#assign anjianbaoc=xzfyInfo2.receive_real_date?default('')>
	
	<#assign querensj=xzfyInfo2.zl_time?default('')>

<div style="padding-top:15px;
padding-right:15px;

padding-left:0px;">	
	
 <font style="color:black;font-size:12px" >&nbsp;外网信息跟踪：</font>
</div>




<div >
<font style="font-size:12px">
  &nbsp; &nbsp; &nbsp; 申请人于  &nbsp;<font style="color:red" size="2">${yudesj} &nbsp;</font> 点击已阅读 《北京市人民政府法制办公室
行政复议信息服务平台须知》  申请人于<font style="color:red" size="2">&nbsp;${anjianbaoc}&nbsp;</font> 保存申请信息。
<br/>
&nbsp; &nbsp; &nbsp; 申请人通过${xzfyInfo.receive_type}<#if xzfyInfo.receive_type?has_content> 
<#if xzfyInfo.receive_type=='1'>当面申请
<#elseif xzfyInfo.receive_type=='2'>
邮寄
</#if>
</#if>的方式向行政复议机关提交申请，行政复议机构于<font style="color:red " size="2">&nbsp;${querensj}&nbsp;</font>收到该申请。

</font>
</div>	
	
	<div style="padding-top:15px;
padding-right:15px;

padding-left:0px;">	
	
 <font style="color:black ;font-size:12px">&nbsp;案件信息跟踪：</font>
</div>
	<tr>  
	<th width="10%">序号</th>
	<th width="20%">修改日期</th>
	<th width="20%">修改人</th>
	<th width="45%">修改内容</th>
	</tr>
	</thead>
	<#assign info_index=0>
	<tbody class="discolor">
	<#list totalList1 as info>
	<tr>
		<td>&nbsp;${info_index+1}</td>
    	<td>&nbsp;<#if info.getLog_time()?has_content>${info.getLog_time()}</#if></td>
		<td>&nbsp;<#if info.getUpdate_name()?has_content>${info.getUpdate_name()}</#if></td>
		<td>&nbsp;<#if info.getLog_info()?has_content>${info.getLog_info()}</#if></td>
	</tr>
</#list>
</tbody>

</table>

</div>

<div class="ui-page">
		
		<span class="ui-page-item ui-item-link">
		<!--
		 <a href ="javascript:history.back()" class="ui-page-item ui-page-item-prev">返回</a>	
		 -->
		 </span>

</div>

</form>
</body>
</html>
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
			function search(pNum){
				document.getElementById("pNum").value=pNum;
				document.form.action="showList1.action"
				document.form.submit();
			}
			function clear(){
				document.getElementById("liAnDate").value="";
				document.getElementById("appName").value="";
				document.getElementById("defendant").value="";
				document.getElementById("tjzfzh").value="";
				document.getElementById("admit").value="";
			}
</script>