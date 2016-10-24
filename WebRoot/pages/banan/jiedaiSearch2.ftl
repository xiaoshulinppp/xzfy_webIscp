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
			     		<div class="dataListTitle1"><h1>统计模块：接待统计</h1></div>
			            <div class="dataList">
				            <ul>
					   	<!--<li><a href="javascript:showform(1)" ><font size="2">数据同步情况查询</font></a></li>-->
					   	<li><a href="javascript:showform(2)" ><font size="2">案件信息查询</font></a></li>
					   			
				   			</ul>
			   			</div>
			   			<div class="dataListB"></div>
			  
			 	</div>
				
		            <div class="searchForm">

						 	<input type="hidden" id="tongJiType" />
		                  <ul style="display:none">
		                    <li style="width:180px">
		                       <div class="name">统计方式:</div>
		                       <select name="tongJiType" id="" onchange="showSearchProperty()">
			                       <option value="1">当面接待</option>
			                       <option value="2">一般接待</option>
			                       <option value="3">阅卷查询</option>
			                       <option value="4">送达查询</option>
			                       <option value="5">转交材料</option>
		                       </select>		                       
		                   </li>
		                    <li style="width:170px">  	</li>
		                  </ul>
		                   
		                   
		                   <ul style="display:none" id="dm1">
		                   <li style="width:180px">  
		                       <div class="name">申请人:</div>
		                       <input class="ui-input-wdm"  name="xzfyRecieve.app_show" id=""  type="text">
		                       
		                    </li>
		                    <li style="width:170px">  
		                       <div class="name">被申请人:</div>
		                       <input class="ui-input-wdm"  name="xzfyRecieve.defendant_name" id=""  type="text">
		                       
		                    </li>
		                   
		                  </ul>
		                   <ul style="display:none" id="dm2">
		                   <li style="width:180px">  
		                       <div class="name">接待日期:</div>
		                       <input class="ui-input-wdm" onclick="WdatePicker()" readonly="readonly" name="xzfyRecieve.receive_date" id=""  type="text">
		                       
		                    </li>
		                    <li style="width:170px">  
		                       <div class="name">复议机关:</div>
		                       <input class="ui-input-wdm" name="xzfyRecieve.break_right" id=""  type="text">
		                       
		                    </li>
		                   
		                  </ul>
		                  <ul style="display:none" id="dm3">
		                   <li style="width:545px">  
		                       <div class="name">请选择复议机关:</div>
		                       <input name="orgName" id="orgName" value='请选择复议机关'>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:getOrgTree()">选择复议机关</a>
		                       <input name="locbm" id="locbm" type='hidden' value='${fileId1}'>

		                    </li>
		                   
		                  </ul>
		                  
		                  
		                  <ul style="display:none" id="yiban1">
		                    <li style="width:180px">  
		                       <div class="name">接待日期:</div>
		                       <input class="ui-input-wdm" onclick="WdatePicker()" readonly="readonly" name="meet.face_date" id=""  type="text">
		                       
		                    </li>
		                    <li style="width:170px">  
		                       <div class="name">被接待人:</div>
		                       <input class="ui-input-wdm" name="meet.client_content" id=""  type="text">
		                       
		                    </li>
		                   
		                  </ul>
		                  <ul style="display:none" id="yiban2">
		                    <li style="width:180px">  
		                       <div class="name">收件单位:</div>
		                       <input class="ui-input-wdm" name="meet.caseOrg_name" id=""  type="text">		                       
		                    </li>
		                    <li style="width:170px">  
		                     
		                       
		                    </li>		                   
		                  </ul>
		                  <span class="clear_f"></span>
		                  <div class="btnDiv" style="display:none" id="anniu">
		                      <input name="button" class="btn1" value="搜索" onclick="showform()"  type="button">
		                      <input class="btn1 btn2" value="返回" type="reset" onclick="getDefaultDiv()">
		                  </div>
		            </div>
		     

</form>
</body>
</html>
<script>
function getOrgTree(){
	window.open('../xzfy/getOrgTree.action?funcCode=${funcCode}','mainwindow3','location=no,resizable=yes,scrollbars=yes');
}
function getDefaultDiv(){
	document.getElementById("dm1").style.display="none";
	document.getElementById("dm2").style.display="none";
	document.getElementById("dm3").style.display="none";
	document.getElementById("yiban1").style.display="none";
	document.getElementById("yiban2").style.display="none";
	document.getElementById("countDiv").style.display="block"; 
	document.getElementById("anniu").style.display="none";
}

function showSearchProperty(type){
	document.getElementById("tongJiType").value=type;
	if(type=="1"){
		document.getElementById("dm1").style.display="block";
		document.getElementById("dm2").style.display="block";
		document.getElementById("dm3").style.display="block";
		document.getElementById("yiban1").style.display="none";
		document.getElementById("yiban2").style.display="none";
		document.getElementById("countDiv").style.display="none";
		document.getElementById("anniu").style.display="block";
	}
	else{
		document.getElementById("dm1").style.display="none";
		document.getElementById("dm2").style.display="none";
		document.getElementById("dm3").style.display="none";
		document.getElementById("yiban1").style.display="block";
		document.getElementById("yiban2").style.display="block";
		document.getElementById("countDiv").style.display="none";
		document.getElementById("anniu").style.display="block";
	}
}

function showform(id){


	if(id=="1"){

		window.form1.action="showDmjiedaiList2.action";
	}
	if(id=="2"){
		window.form1.action="../gjcx/anjiancx_gao.action";
	}
	if(document.getElementById("tongJiType").value=="4"){

		window.form1.action="../meet/showSongDaList.action";
	}
	if(document.getElementById("tongJiType").value=="5"){

		window.form1.action="../meet/showZhuanJiaoCaiLiaoList.action";
	}
	if(document.getElementById("tongJiType").value=="2"){

		window.form1.action="../meet/showYiBanJieDaiList.action";
	}
	
	window.form1.submit();
	
}
</script>