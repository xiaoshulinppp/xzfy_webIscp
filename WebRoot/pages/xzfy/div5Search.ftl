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
<script language="javascript" type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>

<!--[if lte IE 6]>
<script src="script/png.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div, ul, img, li, input , a');
    </script>
<![endif]--> 
</head>

<body>
<form id="form1" action="" method="post" target="_blank" ENCTYPE="multipart/form-data" >
<input type="hidden" name="funcCode" value="${funcCode}" />
	<div id="countDiv" style="display:block">
    	<div class="dataListTitle1"><h1>统计模块六：其他</h1></div>
        <div class="dataList">
      
	    <ul>
			<li><a href="javascript:setCountType(1)">表22：个人案件办理工作统计</a></li>
		    <#if localBm='0000'>
		    <li><a href="javascript:setCountType(2)">表23：处室工作管理</a></li>
		    </#if>
		</ul>
	    <input id="div5Type" value="1" type="hidden">
	    </div>
	    <div class="dataListB"></div>
	</div>
	<script>
	 function setCountType(type){
	 	document.getElementById("div5Type").value=type;
	 	document.getElementById("countDiv").style.display="none";
	 	document.getElementById("searchDiv").style.display="block";
	 	div5TypeSelect(type);
	 }
	 function getDefaultDiv(){
	 	document.getElementById("countDiv").style.display="block";
	 	document.getElementById("searchDiv").style.display="none";	 
	 }
	 </script>	
	<div class="searchForm" id="searchDiv" style="display:none">
	<ul id="geren">
		<div style="font-size:16px;font-family:仿宋" id="m1">
		 <span style="font-size:22px;font-family:楷体;padding-left:220px;line-height:28px;"><strong>表22：个人案件办理工作统计 </strong></span><br>
		&nbsp;&nbsp;&nbsp;说明：以个人用户为单位，统计特定时间段内工作情况。默认为当前用户，可以选择本单位其他用户，了解其他用户情况。市政府法制办用户，除可以选择个人用户外，还可以“复议案件办理一处”、“复议案件办理二处”
		</div>
		<li style="width:180px">
			<div class="name">用户选择:</div>
		    <select name="us" id="us"> 
			    <#if localBm='0000'>
			                       	   <option value="224">行政复议案件办理一处</option>
			                       	   <option value="1613">行政复议案件办理二处</option>
			    </#if>
			    <#list users as u>
			    <option value="${u.id}">${u.name}</option>
			    </#list>
		    </select>
		 </li>
		 <li style="width:170px">  
		                       
		 </li>
	</ul>
	<ul  id="datePeriod1">
		<li style="width:180px">  
			<div class="name">开始日期:</div>
		    <input class="ui-input-wdm" onclick="WdatePicker()" readonly="readonly" name="startDate" id="startDate" value="${startDate}" type="text">
		</li>
		<li style="width:170px">  
		    <div class="name">结束日期:</div>
			<input class="ui-input-wdm" onclick="WdatePicker()" readonly="readonly" name="endDate" id="endDate" value="${endDate}" type="text">
		</li>
	</ul>
	<ul id="chushi" style="display:none">
		<div style="font-size:16px;font-family:仿宋" id="m1">
		<span style="font-size:22px;font-family:楷体;padding-left:260px;line-height:28px;"><strong>表23：处室工作管理 </strong></span><br>
		&nbsp;&nbsp;&nbsp;说明：复议案件办理一处、二处专用统计表。是特定统计时段内，每一件新接收的案件总体情况。默认是当年度的案件，即从当年1月1日起计算，至检索日新收的所有案件。同时提供按照年度检索功能。显示为列表形式，点击查看，可以看到案件的详细信息。办理状态根据不同情况自动显示：“新收案待分配”、“立案审查中”、“已立案待分配”、“案件审理中”、“已结案”、“中止”。
		</div>
		<li style="width:180px">
		    <div class="name">用户选择:</div>
		         <select name="us2" id="us2"> 
		         	<option value="224">行政复议案件办理一处</option>
		         	<option value="1613">行政复议案件办理二处</option>
		         </select>
		</li>
		<li style="width:170px">  
		                       
		</li>
	</ul>
	<ul id="datePeriod2" style="display:none">
		<li style="width:180px">  
		    <div class="name">开始日期:</div>
		    <input class="ui-input-wdm" onclick="WdatePicker()" readonly="readonly" name="startDate2" id="startDate2" value="${startDate}" type="text">
		</li>
		<li style="width:170px">  
		    <div class="name">结束日期:</div>
		    <input class="ui-input-wdm" onclick="WdatePicker()" readonly="readonly" name="endDate2" id="endDate2" value="${endDate}" type="text">
		</li>
	</ul>
	<span class="clear_f"></span>
	<div class="btnDiv">
		 <input name="button" class="btn1" value="搜索" onclick="showform()"  type="button">
	</div>
	</div>
		     

</form>
</body>
</html>
<script>
function div5TypeSelect(a){
	if(a==1){
		document.getElementById("chushi").style.display="none";
		document.getElementById("datePeriod2").style.display="none";
		document.getElementById("geren").style.display="block";
		document.getElementById("datePeriod1").style.display="block";
	} else {
		document.getElementById("geren").style.display="none";
		document.getElementById("chushi").style.display="block";
		document.getElementById("datePeriod1").style.display="none";
		document.getElementById("datePeriod2").style.display="block";
	}
}
function showform(){
	if (document.getElementById("div5Type").value=="1"){
		window.form1.action="div51Result.action";
	} else {
		window.form1.action="div52Result_2.action";
	}
	window.form1.submit();
}
</script>