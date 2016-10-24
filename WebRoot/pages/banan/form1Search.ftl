<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

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
				
		            <div class="searchForm" >
		            <div style="display:block">
		            	 <div  style="font-size:20px;font-family:仿宋;line-height:28px" id="m1">
		                 	<span style="font-size:22px;font-family:楷体;padding-left:160px;line-height:28px;" ><strong>表1：国务院法制办《行政复议案件统计报表》</strong></span><br>                 
		                 </div><br>
		                  <ul>
		                    <li style="width:180px">
		                       <div class="name">统计方式:</div>
		                       <select name="tongJiType" id="tongJiType">
			                       <option value="1">行政复议案件统计报表</option>
			                       <!--<option value="2">行政应诉案件统计报表</option>-->
		                       </select>
		                       
		                   </li>
		             
		                    <li style="width:170px">  
		                       
		                    </li>
		                   </ul>
		                   <ul style="display:block" id="datePeriod">
		                   <li style="width:180px">  
		                       <div class="name">开始日期:</div>
		                       <input class="ui-input-wdm" onclick="WdatePicker()" readonly="readonly" name="startDate" id="startDate" value="${startDate}" type="text">
		                       
		                    </li>
		                    <li style="width:170px">  
		                       <div class="name">结束日期:</div>
		                       <input class="ui-input-wdm" onclick="WdatePicker()" readonly="readonly" name="endDate" id="endDate" value="${endDate}" type="text">
		                       
		                    </li>
		                   
		                  </ul>
		                  
		                   <ul >
		                   <li style="width:545px">  
		                       <div class="name">统计类型:</div> 
		                       <select name='finish_type' id="count_type" onchange="getFyOrg()">
		                       
		                       <option value='1' >全市案件</option>
		                       <option value='2' >所有区县政府案件</option>
		                       <option value='4' >所有市政府部门案件</option>
		                       <option value='3' selected>指定复议机关</option>
		                       </select>
		                     
		                      
		                    </li>
		                 
		                   
		                  </ul>	  		                  
		                   <ul id="getFyOrg" style="display:block">
		                   <li style="width:545px">  
		                       <div class="name">当前单位:</div>
		                       <input name="orgName" id="orgName" value='${message}'>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:getOrgTree()">请选择复议机关</a>
		                       <input name="locbm" id="locbm" type='hidden' value='${fileId1}'>

		                      
		                    </li>
		                 
		                   
		                  </ul>	  	
		                  </div>	
						<script>
							function getFyOrg(){
								if(document.getElementById("count_type").value==3){
									document.getElementById("getFyOrg").style.display="block";
								}else{
									document.getElementById("getFyOrg").style.display="none";
								}
							}
						</script>             
		                 
		                  <span class="clear_f"></span>
		                  <div class="btnDiv">
		                      <input name="button" class="btn1" value="搜索" onclick="showform()"  type="button">
		                  </div>
		            </div>
		     

</form>
</body>
</html>
<script>
function showform(){
	if(document.getElementById("tongJiType").value=="1")
		window.form1.action="gfbtongJi.action";
	if(document.getElementById("startDate").value==""){
		alert("请输入开始日期!")
		return;
	}
	if(document.getElementById("endDate").value==""){
		alert("请输入结束日期!")
		return;
	}	
	window.form1.submit();
	
}

function getOrgTree(){
	window.open('../xzfy/getOrgTree.action?funcCode=${funcCode}','mainwindow3','location=no,resizable=yes,scrollbars=yes');
}


</script>