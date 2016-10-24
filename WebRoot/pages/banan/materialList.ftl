
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

<body >



<form name="Form1" id="Form1" action="../material/showMaterialList.action" method="post">



	<div id="searchForm">
		<div class="pageBox">
			<div class="searchForm">
				<!--
				<ul>
					<li>
					   <div class="name">案号:</div>
					   <input class="ui-input-wdm" type="text" />
					</li>
					<li>  
						<div class="name">收案日期:</div>
						<input class="ui-input-wdm" type="text" onClick="WdatePicker()" />
					</li>
					<li>
						<div class="name">被申请人名称:</div>
						<input class="ui-input-wdm" type="text" />
					</li>
					<li>
						<div class="name">申请人名称:</div>
						<input class="ui-input-wdm" type="text" />
					</li>
				</ul>
				-->
				<span class="clear_f"></span>
				<div class="btnDiv">
				<!--
					<input type="submit" name="button" class="btn1" value="搜索" onclick="" />
					<input type="reset" class="btn1 btn2" value="重置" />
					-->
					<input type="button" value="我的文件" class="btn1" onclick="openMyMaterial()" />
				</div>
			</div>
		</div>
		<div class="pageBoxBg"></div>
	</div>
	  
	<input type="hidden" name="funcCode" value="${funcCode}">
	<input type="hidden" name="pNum" value="${pNum}" id="pNum">
	<input type="hidden" name="tempid" value="${materialSharing.id}" >
	
				

	<div class="pageBox">
		<div class="searchList">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<th width="5%">序号</th>
				<th width="40%">文章名</th>
				<!--<th>关键词</th>
				<th>分类</th> -->                  
				<th width="5%">上传人</th>                  
				<th width="20%">部门</th>
				<th width="10%">上传日期</th>
				<th width="5%">人气</th>
				<th width="5%">操作</th>
			</tr>
			<#assign account=pNum*pageSize-pageSize+1>
			<#list materialList as materialSharing>
			<tr>
				<td>${account}</td>
				<td>&nbsp;<#if materialSharing.name?has_content>${materialSharing.name}</#if></td>
				<!--<td>&nbsp;<#if materialSharing.keyword?has_content>${materialSharing.keyword}</#if></td>-->
				<!--<td>&nbsp;<#if materialSharing.category1?has_content>${materialSharing.category1}</#if>
							<#if materialSharing.category2?has_content>${materialSharing.category2}</#if>
				</td>-->
				<td>&nbsp;<#if materialSharing.username?has_content>${materialSharing.username}</#if></td>
				<td>&nbsp;<#if materialSharing.superdepartment?has_content>${materialSharing.superdepartment}</#if></td>
				<td>&nbsp;<#if materialSharing.uploadingdate?has_content>${materialSharing.uploadingdate}</#if></td>
				<td>&nbsp;<#if materialSharing.count?has_content>${materialSharing.count}</#if></td>
				<td>&nbsp;<a href="javascript:opendg('../material/showMaterial.action?ViewOrModify=0&funcCode=${funcCode}&tempid=${materialSharing.id}',800,370)">查看</a></td>				
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
				<a href="../material/showMaterialList.action?pNum=1&funcCode=${funcCode}" class="ui-page-item ui-page-item-first">首页</a>
			    <a href="../material/showMaterialList.action?pNum=${upPage}&funcCode=${funcCode}" class="ui-page-item ui-page-item-prev">上一页</a>
		     	<a href="../material/showMaterialList.action?pNum=${downPage}&funcCode=${funcCode}" class="ui-page-item ui-page-next">下一页</a>
			    <a href="../material/showMaterialList.action?pNum=${totalPage}&funcCode=${funcCode}" class="ui-page-item ui-page-last">尾页</a>　
				<span>到&nbsp;<input class="input-page"   name="gotoPageNum" id="gotoPageNum" style="width:30px;"/>&nbsp;页</span>　<a href="#" onclick="gotoPage()" class="ui-button ui-button-go">Go</a>
            </div>
		</div>
	</div>
	<div class="pageBoxBg"></div>


</form>
</body>
</html>

<script>
	
	function openMyMaterial(){
		window.Form1.action="showMyMaterialList.action";
		window.Form1.submit();
	}
		function opendg(dgurl,dgw,dgh)
			{
			  $.dialog({ 
			    title:'',
			    width: dgw,
			    height: dgh,
			    content:'url:'+ dgurl});
			}
			

		
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
					window.location = "../material/showMaterialList.action?funcCode=${funcCode}&pNum=" + inputPage + "";
				}
				return;
			}
	
	</script>