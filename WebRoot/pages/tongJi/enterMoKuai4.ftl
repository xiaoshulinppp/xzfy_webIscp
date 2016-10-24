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
<form name="form" id="form" target="_blank" action="" method="post">
<input type="hidden" name="funcCode" value="${funcCode}">
<input type="hidden" name="locbm" id="locbm" value="${locbm}">
<input type="hidden" name="shixiang" id="shixiang" value="">
<input type="hidden" name="sljg" id="sljg" value="">
<input type="hidden" name="tongJiType" id="tongJiType" value="">
	<div id="countDiv">
		<div class="dataListTitle1"><h1>统计模块四：被申请人案件统计</h1></div>
        <div class="dataList">
        <ul>
		 	  <li><a href="javascript:setCountType(1)">表14：国务院部委受理本市行政机关复议案件</a></li>
		 	  <li><a href="javascript:setCountType(2)">表15：国务院部委受理本市复议案件统计</a></li>
		 	  <li><a href="javascript:setCountType(3)">表16：行政机关作为复议被申请人列表</a></li>
		 	  <li><a href="javascript:setCountType(4)">表17：行政机关作为行政复议被申请人案件统计</a></li>
		 	  <li><a href="javascript:setCountType(5)">表18：区县部门作为行政复议被申请人</a></li>
		 	</ul>

	 	</div>	
		<div class="dataListB"></div>
	</div>

	 <script>
	 function setCountType(type){
	 	document.getElementById("tongJiType").value=type;
	 	document.getElementById("countDiv").style.display="none";
	 	document.getElementById("searchDiv").style.display="block";
	 	changeul(type);
	 }
	 function getDefaultDiv(){
	 	document.getElementById("countDiv").style.display="block";
	 	document.getElementById("searchDiv").style.display="none";	 
	 }
	 </script>	
		<#--<div>
			<ul>
				<li style="width:360px">
		            <div class="name">统计方式:</div>
		            <select name="tongJiType" id="tongJiType" onchange="changeul(this.value);">
			            <option value="1">国务院部委受理本市行政机关复议案件</option>
			            <option value="2">国务院部委受理本市复议案件统计</option>
			            <option value="3">行政机关作为复议被申请人列表</option>
			            <option value="4">行政机关作为行政复议被申请人案件统计</option>
			            <option value="5">区县政府部门（全系统）作为行政复议被申请人案件统计</option>
		            </select>
		        </li>
		        
			</ul>-->
		<div class="searchForm" id="searchDiv" style="display:none">
			<ul id="ul1" style="display:none">
				<div  style="font-size:16px;font-family:仿宋" id="m1">
				<span style="font-size:22px;font-family:楷体;padding-left:260px;line-height:28px;"><strong>表14：国务院部委受理本市行政机关复议案件</strong></span><br>
		        说明：国务院部委受理本市行政机关复议案件的基本情况。使用时，首先选择被申请人名称，其范围为市政府所有委、办、局（并且在自己的“基础信息维护”栏填写了“上级国务院部委名称”的行政机关）。市政府委、办、局用户使用本统计时，被申请人名称默认为本机关。当然，该机关也可以点击选择其他机关，查询其他机关的情况。
经过选择单位、生成列表后，在该列表上边，有检索功能。用户可以通过“申请人”、“行政复议事项”（下拉菜单选项）、“具体行政行为名称”“自定义统计关键词”（下拉菜单选项）、“受理年度”(只选择年度，如2012、2013等。不选择年度，默认为全部时间案件)、“案件状态”等项进行检索，在选定单位的案件中，生成相应的列表。其中，案件状态分为：办理中、中止、已办结、未办结（办理中+中止）、全部5选项，默认为全部。
如果特定机关用户希望看到本单位当前未办结案件列表，则可以选择当前年度，在案件状态中选择未办结（办理中+中止），点击查询即可。

		        </div>
				<li style="width:360px">
					<div class="name">被申请人</div>
					<input  class="ui-input-wdm" type="text" name="locbm1" id="locbm1" value="">
				</li>
			</ul>
			<ul id="ul2" style="display:none">
				<span style="font-size:22px;font-family:楷体;padding-left:160px;line-height:28px;"><strong>表15：国务院部委受理本市复议案件统计</strong></span><br>
				<div  style="font-size:16px;font-family:仿宋" id="m1">
		        &nbsp;&nbsp;&nbsp;说明： 使用本表，可以查询在特定统计时段下，国务院部委受理本机关行政复议案件的基本情况。使用时，首先选择被申请人名称，其范围为市政府所有委、办、局（并且在自己的“基础信息维护”栏填写了“上级国务院部委名称”的行政机关）。选择其中一个单位，则其国务院部委复议机关与其填写的“上级国务院部委名称”一致。市政府委、办、局用户使用本统计时，被申请人名称默认为本机关。当然，该机关也可以点击选择其他机关，查询其他机关的情况。其次选择“统计类别”，有两项：行政复议事项类别、自定义统计关键词。如果该单位没有设置自定义统计关键词，则默认为行政复议事项类别。选择后，统计表左侧列表显示相应的项目。
		        </div>
				<li style="width:360px">
					<div class="name">被申请人名称:</div>
					<input class="ui-input-wdm" type="text" name="locbm2" value="${localName}" id="locbm2">
				</li>
				<li style="width:360px">
					<div class="name">统计类别</div>
					<select name="shixiang2" id="shixiang2">
						<option value="行政复议事项">按照行政复议事项统计</option>
						<option value="自定义统计关键词">按照自定义统计关键词统计</option>
					</select>
				</li>
				<li style="width:360px">
					<div class="name">受理机关:</div>
					<select name="sljg2" id="sljg2">
						<option value="">--请选择--</option>
						<#list allList as list>
						<option value="${list[1]}" <#if list[1]==locbm>selected</#if>>${list[0]}</option>
						</#list>
						<option value="">全部（仅行政复议事项统计）</option>
					</select>
				</li>
			</ul>
			<ul id="ul3" style="display:none">
				<div  style="font-size:16px;font-family:仿宋" id="m1">
				<span style="font-size:22px;font-family:楷体;padding-left:160px;line-height:28px;"><strong>表16：行政机关作为复议被申请人列表</strong></span><br>
		        &nbsp;&nbsp;&nbsp;说明：本市行政机关作为复议案件被申请人的案件统计表。本市所有复议机关用户，以及市规划委、市国土局等纯被申请人用户，均可以使用该统计列表功能。使用时，首先选择“被申请人名称”（默认为本机关。当然，该机关用户也可以点击选择其他机关，查询其他机关的情况）；其次选择“统计类别”，有两项：行政复议事项类别、自定义统计关键词。如果该单位没有设置自定义统计关键词，则默认为行政复议事项类别。选择后，统计表左侧列表显示相应的项目；第三选择“复议机关”，可以单选上一级政府、上一级政府部门，也可以选择全部。如果该复议被申请人的上一级政府、上一级政府部门能够确定，则显示确定的名称。例如：当前行政机关为市国土资源局，则复议机关选项包括3部分：“市政府”、“国土资源部”、“全部”（市政府+国土资源部）。另外，区、县政府作为被申请人的，其复议机关只能是市政府；市政府作为被申请人的，其复议机关也只能是市政府自己。区、县政府部门的派出机构（如地税所、工商所）作为被申请人的，其复议机关可以是区、县政府部门，也可以是区、县政府。
		        </div>
				<li style="width:360px">
					<div class="name">请输入被申请人名称:</div>
					<#--<select name="locbm3" id="locbm3">
						<option value="0000">--请选择--</option>
						<#list b2List as b>
						<option value="${b.value}" <#if locbm==b.value>selected</#if>>${b.name}</option>
						</#list>
						<#list b1List as b>
						<option value="${b.value}" <#if locbm==b.value>selected</#if>>${b.name}</option>
						</#list>
						<#list bList as b>
						<option value="${b.value}" <#if locbm==b.value>selected</#if>>${b.name}</option>
						</#list>
					</select>-->
					<input class="ui-input-wdm" type="text" name="locbm3" id="locbm3" value="">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:getOrgTree1('locbm3')">选择被申请人</a>
				</li>
				<#--<li style="width:360px">
  					<div class="name">受理机关：</div>
    				<select name="sljg3" id="sljg3" >
	   				<option value="${localBm}" selected>${localName}</option>
	   				<#if localBm != "0000" && localBm[0..1]?number<19 >
	    			<option value="${upBm}">${upName}</option>
	   				</#if>
    				</select>
				</li>-->
			</ul>
			<ul id="ul4" style="display:none">
				<div  style="font-size:16px;font-family:仿宋" id="m1">
				<span style="font-size:22px;font-family:楷体;padding-left:160px;line-height:28px;"><strong>表17：行政机关作为行政复议被申请人案件统计</strong></span><br>
		        &nbsp;&nbsp;&nbsp;说明：是本市行政机关作为复议案件被申请人的案件统计表。本市所有复议机关用户，以及市规划委、市国土局等纯被申请人用户，均可以使用该统计列表功能。使用时，首先填写“被申请人名称”（默认为本机关。当然，该机关用户也可以查询其他机关的情况）；其次选择“统计类别”，有两项：行政复议事项类别、自定义统计关键词。默认为行政复议事项类别。选择后，统计表左侧列表显示相应的项目；第三选择“复议机关”，选项包括本市所有具有复议职能的机关名称。
		        </div>
		        <li style="width:360px">
					<div class="name">统计时间段</div>
					自<input class="ui-input-wdm" type="text" name="startDate1" id="startDate1" onclick="WdatePicker()" readonly="readonly" value="">
					至<input class="ui-input-wdm" type="text" name="endDate1" id="endDate1" onclick="WdatePicker()" readonly="readonly" value=""> 
				</li>
				<li style="width:360px">
					<div class="name">被申请人名称:</div>
					<input class="ui-input-wdm" type="text" name="locbm4" id="locbm4" value="${localName}">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:getOrgTree2('locbm4')">选择被申请人</a>
				</li>
				<li style="width:360px">
					<div class="name">统计类别:</div>
					<select name="shixiang4" id="shixiang4">
						<option value="行政复议事项">按照行政复议事项统计</option>
						<option value="自定义统计关键词">按照自定义统计关键词统计</option>
					</select>
				</li>
		                   <li style="width:545px">  
		                       <div class="name">复议机关:</div>
		                       <input name="orgName" id="orgName" value="全部">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:getOrgTree2('orgName')">选择复议机关</a>

		                      
		                    </li>
			</ul>
			<ul id="ul5" style="display:none">
				<div  style="font-size:16px;font-family:仿宋" id="m1">
				<span style="font-size:22px;font-family:楷体;padding-left:200px;line-height:28px;"><strong>表18：区县部门作为行政复议被申请人</strong></span><br>
		        &nbsp;&nbsp;&nbsp;说明：16个区县特定的政府部门系统，作为复议案件被申请人的整体案件统计表。本表是为了帮助市政府各委、办、局开展业务指导工作而设计。使用时，首先选择“行政管理系统名称”（即：全部有复议职能的市级政府部门。例如：选择市住建委，则统计的范围则是16个区、县的住建委的数据）。市级政府部门用户登录，“行政管理系统名称”默认为本系统。当然，该机关用户也可以点击选择其他系统，查询其他机关的情况。） 其次选择“行政复议事项”。如：选择“信息公开”，则是信息公开类案件情况。如果选全部，则是全部案件情况。默认为全部。
		        </div>
				<li style="width:360px">
					<div class="name">起始日期</div>
					自<input class="ui-input-wdm" type="text" name="startDate" id="startDate" onclick="WdatePicker()" readonly="readonly" value="">
					至<input class="ui-input-wdm" type="text" name="endDate" id="endDate" onclick="WdatePicker()" readonly="readonly" value=""> 
				</li>
				<li style="width:360px">
					<div class="name">行政管理系统名称:</div>
					<input name="orgName1" id="orgName1" value="${localName}">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:getOrgTree1('orgName1')">选择复议机关</a>
				</li>
				<li style="width:360px">
					<div class="name">行政复议事项</div>
					<select name="shixiang1" id="shixiang1">
						<option value="">全部</option>
						<option value="1">行政处罚</option>
						<option value="2">行政强制措施</option>
						<option value="3">行政征收</option>
						<option value="4">行政许可</option>
						<option value="5">行政确权</option>
						<option value="6">干预经营自主权</option>
						<option value="7">信息公开</option>
						<option value="8">行政不作为</option>
						<option value="9">其他</option>
					</select>
				</li>
			</ul>
		<span class="clear_f"></span>
		<div class="btnDiv" id="btnDiv">
			<input type="button" class="btn1" value="统计" onclick="tongji()">

		</div>
	</div>
</form>
</body>
</html>
<script>
	function tongji(){
		if(document.getElementById("tongJiType").value=="1"){
			if(document.getElementById("locbm1").value==""){
				alert("请输入被申请人名称！");
				document.getElementById("locbm1").focus();
			}else{
				document.getElementById("locbm").value=document.getElementById("locbm1").value;
				document.form.action="tongJiMoKuai4.action";
				document.form.submit();
			}
		}else if(document.getElementById("tongJiType").value=="2"){
				document.form.action="../meet/tongji18_3.action";
				document.form.submit();
		}else if(document.getElementById("tongJiType").value=="3"){
			if(document.getElementById("locbm3").value==""){
				alert("请输入被申请人名称！");
				document.getElementById("locbm3").focus();
			}else{
				document.getElementById("locbm").value=document.getElementById("locbm3").value;
				//document.getElementById("sljg").value=document.getElementById("sljg3").value;
				document.form.action="tongJiMoKuai4.action";
				document.form.submit();
			}
		}else if(document.getElementById("tongJiType").value=="4"){
			if(document.getElementById("startDate1").value==""){
				alert("请输入起始日期！");

			}else if(document.getElementById("endDate1").value==""){
				alert("请输入终止日期！");
			}else{
			if(document.getElementById("shixiang4").value=="行政复议事项")
			{
				//document.getElementById("locbm").value=document.getElementById("orgName").value;
				document.getElementById("sljg").value=document.getElementById("locbm4").value;
				document.form.action="../meet/tongji18.action";
				document.form.submit();
			}
			if(document.getElementById("shixiang4").value=="自定义统计关键词")
			{
				if(document.getElementById("orgName").value=="全部")
				{
					alert('按照自定义统计关键词进行统计，必须选择行政复议机关，请您重新选择');
				}else{
				//document.getElementById("locbm").value=document.getElementById("orgName").value;
				document.getElementById("sljg").value=document.getElementById("locbm4").value;
				document.form.action="../meet/tongji18_2.action";
				document.form.submit();
				}
			}
		}
		}else{
			if(document.getElementById("startDate").value==""||document.getElementById("endDate").value==""){
				alert("请输入起始日期！");
				<#--if(document.getElementById("startDate").value=="")
					document.getElementById("startDate").focus();
				else
					document.getElementById("endDate").focus();	-->
			}else{
				//document.getElementById("locbm").value=document.getElementById("locbm5").value;
				document.getElementById("shixiang").value=document.getElementById("shixiang1").value;
				document.form.action="tongJiMoKuai4.action";
				document.form.submit();
			}
		}
	}
	function changeul(value){
		if(value==1){
			document.getElementById("ul1").style.display="block";
			document.getElementById("ul2").style.display="none";
			document.getElementById("ul3").style.display="none";
			document.getElementById("ul4").style.display="none";
			document.getElementById("ul5").style.display="none";
		}else if(value==2){
			document.getElementById("ul1").style.display="none";
			document.getElementById("ul2").style.display="block";
			document.getElementById("ul3").style.display="none";
			document.getElementById("ul4").style.display="none";
			document.getElementById("ul5").style.display="none";
		}else if(value==3){
			document.getElementById("ul1").style.display="none";
			document.getElementById("ul2").style.display="none";
			document.getElementById("ul3").style.display="block";
			document.getElementById("ul4").style.display="none";
			document.getElementById("ul5").style.display="none";
		}else if(value==4){
			document.getElementById("ul1").style.display="none";
			document.getElementById("ul2").style.display="none";
			document.getElementById("ul3").style.display="none";
			document.getElementById("ul4").style.display="block";
			document.getElementById("ul5").style.display="none";
		}else{
			document.getElementById("ul1").style.display="none";
			document.getElementById("ul2").style.display="none";
			document.getElementById("ul3").style.display="none";
			document.getElementById("ul4").style.display="none";
			document.getElementById("ul5").style.display="block";
		}
	}
	function getOrgTree(){
		window.open('../xzfy/getOrgTree.action?funcCode=${funcCode}','mainwindow3','location=no,resizable=yes,scrollbars=yes');
	}
	function getOrgTree1(id){
		window.open('../xzfy/getOrgTree1.action?funcCode=${funcCode}&elementId='+id,'mainwindow3','location=no,resizable=yes,scrollbars=yes');
	}
	function getOrgTree2(id){
		window.open('../xzfy/getOrgTree2.action?funcCode=${funcCode}&elementId='+id,'mainwindow3','location=no,resizable=yes,scrollbars=yes');
	}
	function getOrgTree3(id){
		window.open('../xzfy/getOrgTree3.action?funcCode=${funcCode}&elementId='+id,'mainwindow3','location=no,resizable=yes,scrollbars=yes');
	}
</script>