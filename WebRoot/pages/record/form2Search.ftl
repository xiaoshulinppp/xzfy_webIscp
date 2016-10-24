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
<input type="hidden" name="tongJiMoKuai" id="tongJiMoKuai" value="2" />				
		            

  <div id="countDiv" style="display:block">
     		<div class="dataListTitle1"><h1>统计模块二：接待与立案工作信息</h1>
              </div>
            <div class="dataList">
            <ul>
   			<li><a href="javascript:setCountType(1)" >表3：日接待统计列表</a></li>
   			<li><a href="javascript:setCountType(2)" >表4：接待工作统计（月、周）</a></li>
   			<li><a href="javascript:setCountType(4)" >表5：立案审查工作统计</a></li>
   			<li><a href="javascript:setCountType(5)" >表6：北京市人民政府告知处理案件原因统计</a></li>
   			<li><a href="javascript:setCountType(11)">表7：北京市人民政府不予受理案件原因统计</a></li>
   			<li><a href="javascript:setCountType(6)" >表8: 集体复议案件数量</a></li>
   			<li><a href="javascript:setCountType(7)" >表9：多人分别复议同一具体行政行为统计列表</a></li>
   			</ul>
   			</div>
   			<div class="dataListB"></div>
  
  </div>


	 <script>
	 function setCountType(type){
	 	if(type!=11)
	 		document.getElementById("tongJiType").value=type;
	 	else
	 		document.getElementById("tongJiType").value=5;
	 	document.getElementById("countDiv").style.display="none";
	 	document.getElementById("searchDiv").style.display="block";
	 	showSearchProperty(type);
	 	initTongJiSearchForm(type);
	 }
	 
	 function getDefaultDiv(){
	 	document.getElementById("countDiv").style.display="block";
	 	document.getElementById("searchDiv").style.display="none";	 
	 	document.getElementById("querycondition0").style.display="none";	 
	 	document.getElementById("querycondition1").style.display="none";
	 	document.getElementById("querycondition2").style.display="none";
	 	document.getElementById("userDiv").style.display="none";
		document.getElementById("m1").style.display="none";
		document.getElementById("m2").style.display="none";
		document.getElementById("m4").style.display="none";
		document.getElementById("m5").style.display="none";
		document.getElementById("m11").style.display="none";
		document.getElementById("m6").style.display="none";
		document.getElementById("m7").style.display="none";
	 }
	 
	function showSearchProperty(type){
		if (document.getElementById("tongJiType").value=="2"||document.getElementById("tongJiType").value=="4"||document.getElementById("tongJiType").value=="5"||document.getElementById("tongJiType").value=="6"){
			document.getElementById("querycondition0").style.display="none";
			document.getElementById("querycondition1").style.display="block";
			document.getElementById("querycondition2").style.display="none";
			document.getElementById("querycondition3").style.display="none";
			if(document.getElementById("tongJiType").value=="2"||document.getElementById("tongJiType").value=="4"){
				document.getElementById("userDiv").style.display="block";
			}else{
				document.getElementById("userDiv").style.display="none";
			}
			if(document.getElementById("tongJiType").value=="5"){
				if(type==5){
					document.getElementById("resultDiv").style.display="block";
					document.getElementById("handleResult").value=2;		
				}else{
					document.getElementById("resultDiv").style.display="block";
					document.getElementById("handleResult").value=3;
				}		
			}else{
				document.getElementById("resultDiv").style.display="none";
			}
			
			
		}else if(document.getElementById("tongJiType").value=="7"){
			document.getElementById("querycondition0").style.display="none";
			document.getElementById("querycondition1").style.display="none";
			document.getElementById("querycondition2").style.display="block";
			document.getElementById("querycondition3").style.display="none";
			document.getElementById("userDiv").style.display="none";
			document.getElementById("resultDiv").style.display="none";
		}else if(document.getElementById("tongJiType").value=="3"){
			document.getElementById("querycondition0").style.display="none";
			document.getElementById("querycondition1").style.display="none";
			document.getElementById("querycondition2").style.display="none";
			document.getElementById("querycondition3").style.display="block";
			document.getElementById("userDiv").style.display="none";
			document.getElementById("resultDiv").style.display="none";
		}
		else if(document.getElementById("tongJiType").value=="1"){
			document.getElementById("querycondition0").style.display="block";
			document.getElementById("querycondition1").style.display="none";
			document.getElementById("querycondition2").style.display="none";
			document.getElementById("querycondition3").style.display="none";
			document.getElementById("userDiv").style.display="none";
			document.getElementById("resultDiv").style.display="none";
		}
	}	 
	
	function initTongJiSearchForm(tongJiMoKuai){
		document.getElementById("m1").style.display="none";
		document.getElementById("m2").style.display="none";
		document.getElementById("m4").style.display="none";
		document.getElementById("m5").style.display="none";
		document.getElementById("m11").style.display="none";
		document.getElementById("m6").style.display="none";
		document.getElementById("m7").style.display="none";
		var mDiv='m'+tongJiMoKuai;
		document.getElementById(mDiv).style.display="block";
	}
	
	function showTongJiTable(){
		var form1=document.getElementById("form1");
		var tongJiType = document.getElementById("tongJiType").value;
		if(tongJiType==2 || tongJiType==4 ||tongJiType==5){
			form1.action="../tongJi/tongJi.action";
			form1.submit();
		}else if(tongJiType==6){
			if(document.getElementById("startDate").value==""||document.getElementById("endDate").value==""){
				alert("请选择起始日期！");
			}else{
				form1.action="../tongJi/jtfyajslTongji.action";
				form1.submit();
			}
		}
		else if(tongJiType==7){
			form1.action="../tongJi/searchDataList.action";
			form1.submit();
		}else if(tongJiType==3){
			form1.action="../jdquery/showSearchResult.action";
			form1.submit();
		}else if(tongJiType==1){
			form1.action="../banan/showRijiedaiList.action";
			form1.submit();
		}
		
	}	
	 </script>		
      <div class="searchForm" >
	 					     	
		                  <ul style="display:none">
		                    <li style="width:360px">
		                       <div class="name">统计方式:</div>
		                       <select name="tongJiType" id="tongJiType" onchange="showSearchProperty()">
			                       <option value="1">日接待统计</option>
			                       <option value="2">接待工作统计（月、周）</option>
			                       <!--<option value="3">接待信息高级检索</option>-->
			                       <option value="4">立案审查工作统计</option>
			                       <option value="5">未受理案件原因统计</option>
			                       <option value="6">集体复议案件数量</option>
			                       <option value="7">多人分别复议同一具体行政行为统计列表</option>
		                       </select>
		                       
		                   </li>
		                    <li style="width:1px">  
		                       
		                    </li>
		                   </ul>

		                   <div  style="display:none" style="font-size:20px;font-family:仿宋;line-height:28px" id="m1">
							<span style="font-size:22px;font-family:楷体;padding-left:260px;line-height:28px;"><strong>表3：日接待统计列表</strong></span><br><br>
		                      &nbsp;&nbsp; &nbsp;&nbsp;  说明：以每个行政复议机关为单位，统计该单位的日接待情况。来源包括：当面接待、接收复议申请来信、接收复议电子邮件。查询中，按日选择。在列表中显示接待工作的基础性内容（同现行系统之中的“日接待工作统计”），包括被接待人、接待人、接待时间、接待方式、是否接受行政复议申请、被接待人反映的主要把问题等。可以通过点击链接的方式查看每条接待情况的具体信息。

		                  </div>
		                  
		                   <div  style="display:none" style="font-size:20px;font-family:仿宋" id="m2">
							<span style="font-size:22px;font-family:楷体;padding-left:260px;line-height:28px;"><strong>表4：接待工作统计（月、周）</strong></span><br><br>
		                      &nbsp;&nbsp; &nbsp;&nbsp; 说明：特定行政复议机关当面接待行政复议申请人（当事人）工作统计表。其来源主要为：当面接收复议申请、当面协助案件审理、一般当面接待、接收复议申请来信、接收复议电子邮件。极端地说，如果统计起止时间仅为1天，也显示月、周次。此处的意思是指当天“属于几月份第几月、周”。 以下各表凡涉及“月、周”的，均相同。 支持查询本单位特定工作人员。

		                  </div>
		                  
		                   <div  style="display:none" style="font-size:16px;font-family:仿宋" id="m4">
							<span style="font-size:22px;font-family:楷体;padding-left:260px;line-height:28px;"><strong>表5：立案审查工作统计</strong></span><br><br>
		                      &nbsp;&nbsp;&nbsp;&nbsp;说明：以复议机关为单位（支持查询本单位特定工作人员），查询特定统计时间段相关立案审查工作情况。表内的统计数字侧重于结果，即按照受理、不予受理、告知、其他处理等结果来生成数字。从案件来源看，“本期新收”是指该统计时间段内（含起止日期）所有新接收案件（经过补正重新计算审限的，指审理期限开始日）；“上期结转”是指该统计时间段开始前一天，尚未立案审查的案件。从总数上看，表内当期案件总数为：“本期新收”  +“上期结转”。从数据平衡来看，已审查+未审查+通知补正待处理=当期案件总数。

		                  </div>
		                  
		                   <div  style="display:none" style="font-size:16px;font-family:仿宋" id="m5">
<span style="font-size:22px;font-family:楷体;padding-left:160px;line-height:28px;"><strong>表6：北京市人民政府告知处理案件原因统计</strong></span><br><br>
		                      &nbsp;&nbsp;&nbsp;&nbsp; 说明： 选定复议机关，或者全市行政复议机关特定统计时段新收案件中，对以告知处理的方式结案的原因统计。表内的统计数字侧重于结果，即：按照告知的结果来生成数字。

		                  </div>
		                  
		                   <div  style="display:none" style="font-size:16px;font-family:仿宋" id="m11">
<span style="font-size:22px;font-family:楷体;padding-left:160px;line-height:28px;"><strong>表7：北京市人民政府不予受理案件原因统计</strong></span><br><br>
		                      &nbsp;&nbsp; &nbsp;&nbsp; 说明： 选定复议机关，或者全市行政复议机关特定统计时段新收案件中，对以不予受理的方式结案的原因统计。表内的统计数字侧重于结果，即：按照告知的结果来生成数字。

		                  </div>	
		                  
		                   <div  style="display:none" style="font-size:16px;font-family:仿宋" id="m6">
<span style="font-size:22px;font-family:楷体;padding-left:220px;line-height:28px;"><strong>表8：集体复议案件数量</strong></span><br><br>
		                      &nbsp;&nbsp; &nbsp;&nbsp; 说明： 指本单位或者全市一个案件的申请人为3人（不含）以上的案件数。同时分为10人、20人、30人、50人、100人几个统计节点。最大值是该时段的最大申请人人数值。

		                  </div>	
		                  
		                   <div  style="display:none" style="font-size:16px;font-family:仿宋" id="m7">
<span style="font-size:22px;font-family:楷体;padding-left:160px;line-height:28px;"><strong>表9：多人分别复议同一具体行政行为统计列表</strong></span><br><br>
		                      &nbsp;&nbsp; &nbsp;&nbsp; 说明： 在全市范围内，对同一具体行政行为提出行政复议申请的总体情况。可以以列表形式显示。点击可以查看具体案件情况。

		                  </div>			                  	                  	                  		                  		                  		                  

		                   <div style="display:none" id="querycondition0">
		                   <ul >
		                   <li style="width:550px">  
		                       <div class="name">查询日期:</div>
		                       <input class="ui-input-wdm" onclick="WdatePicker()" readonly value="${year}" name="searchDate" id="searchDate" type="text"> 
		                    </li>
		                  </ul>
		                  <ul id="datePeriod0">
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
		                 <ul id="datePeriod1">
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
									document.getElementById("datePeriod1").style.display="block";
								}else{
									document.getElementById("datePeriod1").style.display="none";
								}
							}		
							function getOrgTree(){
	window.open('../xzfy/getOrgTree.action?funcCode=${funcCode}','mainwindow3','location=no,resizable=yes,scrollbars=yes');
}				
						</script> 
		                  
		                   <div style="display:none" id="querycondition1">
		                   <ul >
		                   <li style="width:180px">  
		                       <div class="name">开始日期:</div>
		                       <input class="ui-input-wdm" onclick="WdatePicker()" readonly="readonly" name="startDate" value="${firstDay}" id="startDate" type="text">
		                       
		                    </li>
		                    <li style="width:180px">  
		                       <div class="name">结束日期:</div>
		                       <input class="ui-input-wdm" onclick="WdatePicker()" readonly="readonly" name="endDate" value=${year} id="endDate" type="text"> 
		                    </li>
		                  <!--  <li style="width:545px">  
		                       <div class="name">统计类型:</div> 
		                       <select name='finish_type' id="count_type" onchange="getFyOrg()">		                       
		                       <option value='1' >全市案件</option>
		                       <option value='2' >所有区县政府案件</option>
		                       <option value='4' >所有市政府部门案件</option>
		                       <option value='3' selected>指定复议机关</option>
		                       </select>		                      
		                    </li> -->
		                    
		                  </ul>
		                  
		                   <ul id="userDiv" style="display:none">
		                   <li style="width:180px">  
		                       <div class="name">请选择承办人：</div>
		                       <select name="handleId">
		                       <option value='0'>请选择</option>
		                       <#list userList as ulist>
		                        <option value='${ulist.id}'>${ulist.name}</option>
		                       </#list>
		                       </select>
		                       
		                    </li>
		                    <li style="width:180px">  
		                       <div class="name">&nbsp;</div>
		                       &nbsp;
		                    </li>
		                  </ul>	
		                   <ul id="resultDiv" style="display:none">
		                   <li style="width:180px">  
		                       <div class="name">请选立案审查意见：</div>
		                       <select name="handleResult" id="handleResult">
		                       <option value='2'>告知处理</option>	
		                       <option value='3'>不予受理</option>						
		                       </select>
		                       
		                    </li>
		                    <li style="width:180px">  
		                       <div class="name">&nbsp;</div>
		                       &nbsp;
		                    </li>
		                  </ul>			                  
		                  	                  
		                  </div>
		                  <div style="display:none" id="querycondition2"> 
		                  <ul>
		                  <!--<li style="width:180px">  
		                       <div class="name">申请人名称:</div>
		                       <input class="ui-input-wdm" name="appName" id="appName" type="text">
		                       
		                    </li>-->
		                    
		                    <li style="width:180px">  
		                       <div class="name">具体行政行为名称:</div>
		                       <input class="ui-input-wdm" name="xwName" id="xwName" type="text">
		                       
		                    </li>
		                    <li style="width:180px">  
		                       <div class="name">具体行政行为文号:</div>
		                       <input class="ui-input-wdm" name="xwNum" id="xwNum"  type="text"> 
		                    </li>
		                    <li style="width:180px">  
		                       <div class="name">被申请人名称:</div>
		                       <input class="ui-input-wdm" name="defendantName" id="defendantName"  type="text"> 
		                    </li>
		                  </ul>
		                  </div>
		                   <div style="display:none" id="querycondition3">
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
			                                                        从<input class="ui-input-wdm" onclick="WdatePicker()" readonly="readonly" name="startJieDaiDate" id="startJieDaiDate" type="text" value="${year}">  
			                   </li>
			                   
			                   <li style="width:180px">  
			                                                        到<input class="ui-input-wdm" onclick="WdatePicker()" readonly="readonly" name="endJieDaiDate" id="endJieDaiDate" type="text" value="${firstDay}">           
			                   </li>         
		                  </ul>
		                   </div>
		                    <span class="clear_f"></span>
		                  <div class="btnDiv" id="searchDiv" style="display:none">
		                      <input name="button" class="btn1" value="搜索" onclick="showTongJiTable()" type="button">
		                      <!--<input class="btn1 btn2" type="button" value="返回" onclick="getDefaultDiv()" >-->
		                  </div>
		           
		            </div>
		     

</form>
</body>
</html>
<script>

</script>