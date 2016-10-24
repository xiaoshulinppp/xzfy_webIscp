<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
		<link href="../${Session['_USER_STYLE_'].cssPath}/base.css" rel="stylesheet" type="text/css" />
		<link href="../${Session['_USER_STYLE_'].cssPath}/main_style.css" rel="stylesheet" type="text/css" />
			<!--                       Javascripts 注意不要改变顺序                      -->
		<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
	</head>
	<body>
		<form id="form1" name="form1" action="''" method="post" ENCTYPE="multipart/form-data">
		<input type="hidden" name="locbm" value="${locbm}">
		<input type="hidden" name="funcCode" value="${funcCode}">
		<div align="left">
			<input type="checkbox" name="locbmwb" id="" value ="0000" >市&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    	<input type="checkbox" name="locbmwb" id="" value ="0100" >东城&nbsp;&nbsp;&nbsp;
	    	<input type="checkbox" name="locbmwb" id="" value ="0200" >西城&nbsp;&nbsp;&nbsp;
	    	<input type="checkbox" name="locbmwb" id="" value ="0500" >朝阳<br>
	    	<input type="checkbox" name="locbmwb" id="" value ="0600" >海淀&nbsp;&nbsp;&nbsp;
	    	<input type="checkbox" name="locbmwb" id="" value ="0700" >丰台&nbsp;&nbsp;&nbsp;
	    	<input type="checkbox" name="locbmwb" id="" value ="0800" >石景山
	    	<input type="checkbox" name="locbmwb" id="" value ="0900" >门头沟<br>
	    	<input type="checkbox" name="locbmwb" id="" value ="1000" >房山&nbsp;&nbsp;&nbsp;
	    	<input type="checkbox" name="locbmwb" id="" value ="1100" >通州&nbsp;&nbsp;&nbsp;
	    	<input type="checkbox" name="locbmwb" id="" value ="1200" >顺义&nbsp;&nbsp;&nbsp;
	    	<input type="checkbox" name="locbmwb" id="" value ="1300" >大兴<br>
	    	<input type="checkbox" name="locbmwb" id="" value ="1400" >昌平&nbsp;&nbsp;&nbsp;
	    	<input type="checkbox" name="locbmwb" id="" value ="1500" >平谷&nbsp;&nbsp;&nbsp;
	    	<input type="checkbox" name="locbmwb" id="" value ="1600" >怀柔&nbsp;&nbsp;&nbsp;
	    	<input type="checkbox" name="locbmwb" id="" value ="1700" >密云<br>
	    	<input type="checkbox" name="locbmwb" id="" value ="1800" >延庆<br>
			<input type="button" value="确认" class="ui-btn ui-btn-normal" onclick="saveweiban()">	
		</div>
		<div align="right">
			<table  width="60%" border="0"  cellpadding="3" cellspacing="0" class="ui-table  ui-table-list  list-fixed ">
			<tr>
				<th>委办单位名称</th>
			</tr>
			<#list weibanList as xzfyWeiban>
			<tr>
				<td><#if xzfyWeiban.orgname?has_content>${xzfyWeiban.orgname}</#if></td>
			</tr>
			</#list>
			</table>
		</div>
		</form>
		<br/><br/><br/><br/>
		<form name="form2" method="post" ENCTYPE="multipart/form-data">
			<input type="hidden" name="locbm" value="${locbm}">
			<input type="hidden" name="funcCode" value="${funcCode}">
			<div>
				<p>输入关键词：</p>
				<input type="text" name="xzfyKeyword.keyword" /><br/><br/>
				<input type="button" value="保存" onclick="savekeyword()" class="ui-btn ui-btn-normal" />
			</div>
			<div>
				<table  width="60%" border="0"  cellpadding="3" cellspacing="0" class="ui-table  ui-table-list  list-fixed ">
					<tr>
						<th>本单位关键词列表</th>
						<th>操作</th>
					</tr>
					<#list keywordList as xzfyKeyword>
					<tr>
						<td><#if xzfyKeyword.keyword?has_content>${xzfyKeyword.keyword}</#if></td>
						<td><a href="../banan/deletekeyword.action?keywordId=${xzfyKeyword.id}&funcCode=${funcCode}">删除</a></td>
					</tr>
					</#list>
				</table>
			</div>
		</form>
		<br/><br/><br/><br/>
		<script>
			function saveweiban(){
				if(confirm("确认提交？")){	
					window.form1.action="saveweiban.action";
					window.form1.submit();
					alert("操作已完成！");
				}
			}
			
			function savekeyword(){
					window.form2.action="savekeyword.action?xzfyKeyword.status=0";
					window.form2.submit();
			}
		</script>
		
		
		
		
		
	</body>
</html>