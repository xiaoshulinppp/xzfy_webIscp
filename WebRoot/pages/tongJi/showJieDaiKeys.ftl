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
<script type="text/javascript" src="../sys_theme/js/jquery.form.js"></script> 
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../sys_theme/js/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
<!--[if lte IE 6]>
<script src="script/png.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div, ul, img, li, input , a');
    </script>
<![endif]--> 
</head>

<body>

<div class="pageBg1">
<div class="wal">



	<div class="pageNow">当前位置：接待信息高级检索</div>

		  <form name="form1" id="form1" target="_blank" action="" method="post">
		      <input type="hidden" name="funcCode" value="${funcCode}" />
		      <div class="pageBox">
		            <div class="searchForm">
		                  <ul>
			                    <li style="width:180px">
			                       <div class="name">申请人类别：</div>
			                       <select name="appType" id="appType" onchange="gotoChange()">
				                       <option value="">请选择</option>
				                       <option value="1">公民</option>
				                       <option value="2">法人</option>
			                       </select>  
			                   </li>   
			                   
			                   <li style="width:180px">  
			                   </li>
			                    
			                    
		                  </ul>
		                  
		                  <ul style="display:none" id="civil">
			                    <li style="width:180px">  
			                       <div class="name">公民关键字：</div>
			                       <input class="ui-input-wdm" name="civilKeyword" id="civilKeyword" type="text" value="">
			                    </li>
			                  
			                    <li style="width:180px">             
			                    </li>
			                    
		                  </ul>
		                  
		                  <ul style="display:none" id="legal">
			                    <li style="width:180px">  
			                       <div class="name">法人关键字：</div>
			                       <input class="ui-input-wdm" name="legalKeyword" id="legalKeyword" type="text" value="">
			                    </li>
			                  
			                    <li style="width:180px">             
			                    </li>
			                    
		                  </ul>
		                  
		                  <ul>
			                    <li style="width:180px">  
			                       <div class="name">被复议的具体行为-名称：</div>
			                       <input class="ui-input-wdm" name="behaviorName" id="behaviorName" type="text" value="">
			                    </li>
			                    <!--
			                    <div class="name">接待事项</div>
			                    -->
			                    <li style="width:180px">  
			                       <div class="name">被复议的具体行为-案号：</div>
			                       <input class="ui-input-wdm" name="behaviorNum" id="behaviorNum" type="text" value="">
			                    </li>
		                  </ul>
		                  
		                  <ul>
			                    <li style="width:180px">  
			                       <div class="name">复议机关名称：</div>			                       
			                       <select name="fyjgName" id="fyjgName">
				                       <option value="">请选择</option>
				                       <option value="2">县级政府</option>
				                       <option value="3">县级政府的部门</option>
				                       <option value="6">省部级行政机关</option>
				                       <option value="7">省级政府的部门</option>
			                       </select>
			                    </li>
			                    
			                    <li style="width:180px">  
			                       <div class="name">被申请人名称：</div>			                     
			                       <input class="ui-input-wdm" name="respondent" id="respondent" type="text" value="">
			                    </li>
		                  </ul>
		                    
		                  <ul style="display:block" id="datePeriod">
			                   <li style="width:180px">  
			                       <div class="name">接待日期：</div>
			                                                        从<input class="ui-input-wdm" onclick="WdatePicker()" readonly="readonly" name="startJieDaiDate" id="startJieDaiDate" type="text" value="">  
			                   </li>
			                   
			                   <li style="width:180px">  
			                                                        到<input class="ui-input-wdm" onclick="WdatePicker()" readonly="readonly" name="endJieDaiDate" id="endJieDaiDate" type="text" value="">           
			                   </li>         
		                  </ul>
		                  
		                  <span class="clear_f"></span>
		                  
		                  <div class="btnDiv">
		                      <input name="button" class="btn1" value="搜索" onclick="showSearchResult()" type="button">
		                      <input class="btn1 btn2" value="重置" type="reset">
		                  </div>
		            </div>
		      </div>
	      <form>
	  


<span class="clear_f"></span>
<div class="h50"></div>
<!--walEnd-->
</div>
</div>
<!--
<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>
-->
</body>
<script>
	function gotoChange(){
	    if(document.getElementById("appType").value=="1"){
	        document.getElementById("civil").style.display="block";
	        document.getElementById("legal").style.display="none";
	    }
	    else if(document.getElementById("appType").value=="2"){
	        document.getElementById("legal").style.display="block";
	        document.getElementById("civil").style.display="none";
	    }
	    else{
	        document.getElementById("legal").style.display="none";
	        document.getElementById("civil").style.display="none";
	    }
	}
	
	function showSearchResult(){
	    document.form1.action="showSearchResult.action";
	    document.form1.submit();
	}
	
</script>
</html>