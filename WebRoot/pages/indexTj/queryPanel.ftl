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
      <div class="dataListTitle1">
          <h1>统计模块五：复议办案指标统计</h1>
      </div>
      <div class="dataList">
      <ul>
	  <li><a href="javascript:showSearchProperty(1)">表19：办案公正指标统计</a></li>
	  <li><a href="javascript:showSearchProperty(2)">表20：办案效率指标统计</a></li>
	  <li><a href="javascript:showSearchProperty(3)">表21：办案效果指标统计</a></li>
	  <li><a href="javascript:showSearchProperty(4)">表22：是否及时登记案件监控</a></li>
	  <li><a href="javascript:showSearchProperty(5)">表23：是否及时填写结案信息监控</a></li>	 	 
	  </ul>
	  </div>
	  <div class="dataListB"></div>	  
	</div>	
		            <input type="hidden" id="tongJiType" />
		            
		            <div class="searchForm">
		                  
		                  <div  style="display:none" style="font-size:16px;font-family:仿宋;line-height:28px" id="m1">
		                  <span style="font-size:22px;font-family:楷体;padding-left:260px;line-height:28px;"><strong>表19：办案公正指标统计</strong></span><br>

		                      &nbsp;&nbsp;&nbsp;说明：为行政复议监督、指导工作提供依据，我们设置了衡量办案公正性的基本考核指标。1、实地调查比率。开展实地调查案件数及比率。2、听证审理案件数及比率。3、阅卷率。4、专家委员参与程度：提交行政复议委员会案审会审议结案数量及比率。5、非常任委员参与实地调查、听证审理的案件数及比率。如果各单位的相关案件办理信息填写不及时、不完整，便会影响相应的指标。

		                  </div>
		                  
		                  <div  style="display:none" style="font-size:16px;font-family:仿宋;line-height:28px" id="m2">
		                  <span style="font-size:22px;font-family:楷体;padding-left:260px;line-height:28px;"><strong>表20：办案效率指标统计</strong></span><br>

		                      &nbsp;&nbsp;&nbsp;主要内容有：1、受理数量（本时段接收案件中，受理数量+上期结转案件中，受理的数量）及人均比例（占该机关在“基础信息维护”中所报送的专职、兼职复议人员人数的比例）。2、结案数量（本时段结案数量，含上期结转）及占人均比例。3、结案率（该单位、该时间段结案数量与受理数量之比）。3、办案效率：一般审限内（60日内）结案数及占结案总数的比例、延期数量及占结案总数的比例、平均办案时间。

		                  </div>
		                  
		                  <div  style="display:none" style="font-size:16px;font-family:仿宋;line-height:28px" id="m3">
		                  <span style="font-size:22px;font-family:楷体;padding-left:260px;line-height:28px;"><strong>表21：办案效果指标统计</strong></span><br>

		                      &nbsp;&nbsp;&nbsp;主要内容有：1、调解终止结案比率；2、直接纠错比率（撤销、变更、确认违法、责令屡责等）；3、综合纠错率（调解终止+直接纠错）；4、制发意见书数量、比率；5、制发建议书数量、比率。

		                  </div>
		                                   
		                  
		                  <ul id="xxx" style="display:none">
			                  <li style="width:180px">  
			                       <div class="name">复议机关种类：</div>
			                       <select name="fyjgType" id="">
				                       <option value="1">市政府</option>
				                       <option value="2">区县政府</option>
				                       <option value="3">市政府部门</option>
			                       </select>		                       
			                  </li>
	                       	                       
			                  <li style="width:170px">  
			                               <div class="name">年度：</div>                     
					                       <select name="justYear" id="justIndex"  style="display:block">						                   			                       
						                       <option value="2008">2008年</option>					                       
						                       <option value="2009">2009年</option>					                       
						                       <option value="2010">2010年</option>					                       
						                       <option value="2011">2011年</option>					                       
						                       <option value="2012">2012年</option>					                       
						                       <option value="2013">2013年</option>					                       
						                       <option value="2014">2014年</option>					                       
						                       <option value="2015">2015年</option>					                       
						                       <option value="2016">2016年</option>					                       
						                       <option value="2017">2017年</option>					                       
						                       <option value="2018">2018年</option>					                       
						                       <option value="2019">2019年</option>					                       
						                       <option value="2020">2020年</option>					                      
					                       </select>   
					                
					                       <select name="tjyear"  id="otherIndex" style="display:none">						                    						                       
						                       <option value="20080">2008全年</option>
						                       <option value="20081">2008上半年</option>
						                       <option value="20082">2008下半年</option>
						                       
						                       <option value="20090">2009全年</option>
						                       <option value="20091">2009上半年</option>
						                       <option value="20092">2009下半年</option>
						                       
						                       <option value="20100">2010全年</option>
						                       <option value="20101">2010上半年</option>
						                       <option value="20102">2010下半年</option>
						                       
						                       <option value="20110">2011全年</option>
						                       <option value="20111">2011上半年</option>
						                       <option value="20112">2011下半年</option>
						                       
						                       <option value="20120">2012全年</option>
						                       <option value="20121">2012上半年</option>
						                       <option value="20122">2012下半年</option>
						                       
						                       <option value="20130">2013全年</option>
						                       <option value="20131">2013上半年</option>
						                       <option value="20132">2013下半年</option>
						                       
						                       <option value="20140">2014全年</option>
						                       <option value="20141">2014上半年</option>
						                       <option value="20142">2014下半年</option>
						                       
						                       <option value="20150">2015全年</option>
						                       <option value="20151">2015上半年</option>
						                       <option value="20152">2015下半年</option>
						                       
						                       <option value="20160">2016全年</option>
						                       <option value="20161">2016上半年</option>
						                       <option value="20162">2016下半年</option>
						                       
						                       <option value="20170">2017全年</option>
						                       <option value="20171">2017上半年</option>
						                       <option value="20172">2017下半年</option>
						                       
						                       <option value="20180">2018全年</option>
						                       <option value="20181">2018上半年</option>
						                       <option value="20182">2018下半年</option>
						                       
						                       <option value="20190">2019全年</option>
						                       <option value="20191">2019上半年</option>
						                       <option value="20192">2019下半年</option>
						                       
						                       <option value="20200">2020全年</option>
						                       <option value="20201">2020上半年</option>
						                       <option value="20202">2020下半年</option>
					                       </select>					                    					            				            	                           			                                
			                  </li>	                 
		                  </ul>
		                  <ul id='sss' style="display:none">
		                  	<li style="width:250px">  
			                       <div class="name">监控方式：</div>
			                       <select name="jktype" onchange='jk(this.value)'>
				                       <!--<option value="">--请选择--</option>-->
				                       <option value="1">复议机关横向比较</option>
				                       <option value="2">指定复议机关情况</option>
			                       </select>		                       
			                  </li>
		                  </ul>
		                  <input type='hidden' id='wjk' value=''/><!-- '1':是否及时登记案件监控    '2':是否及时填写结案信息监控  -->
		                  <div id='ppp' style='display:none;'>
		                  <ul>
		                   <li style="width:545px">  
		                       <div class="name">当前单位:</div>
		                       <input name="orgName" id="orgName" value='${message}'>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:getOrgTree()">请选择复议机关</a>
		                       <input name="locbm" id="locbm" type='hidden' value='${fileId1}'>   
		                    </li>
		                  </ul>
		                  </div> 
		                  <div id='ppp1' style='display:none;'>   
		                  	<ul>
		                  		<li>  
		                  			<div class="name">横向比较范围：</div>
			                       <select name="hengxiangtype" >
				                       <!--<option value="">--请选择--</option>-->
				                       <option value="1">市、区县政府</option>
				                       <option value="2">市政府部门</option>
			                       </select>		                       
			                  </li>
	                  		</ul>
		                  </div> 
		                  <div id='ppp2' style='display:none;'>
		                  <ul>
		                  	<li style="width:180px">
		                       <div class="name">开始日期:</div>
		                       <input class="ui-input-wdm" onclick="WdatePicker()" readonly="readonly" name="startDate" id="startDate" value="${startDate}" type="text">
		                       
		                    </li>
		                    <li style="width:170px">  
		                       <div class="name">结束日期:</div>
		                       <input class="ui-input-wdm" onclick="WdatePicker()" readonly="readonly" name="endDate" id="endDate" value="${endDate}" type="text">
		                 	</li>
		                  </ul>
		                  </div>     
		                         		                  
		                  <span class="clear_f"></span>
		                  <div class="btnDiv" style="display:none" id="anniu">
		                      <input name="button" class="btn1" value="搜索" onclick="tongji()" type="button">
		                  </div>
		            </div>	
     
</form>
</body>
</html>
<script>
	function getDefaultDiv(){
			document.getElementById("justIndex").style.display="none";
           document.getElementById("otherIndex").style.display="none";
           document.getElementById("countDiv").style.display="block";
			document.getElementById("anniu").style.display="none";
			document.getElementById("xxx").style.display="none";
			document.getElementById("m1").style.display="none";
			document.getElementById("m2").style.display="none";
			document.getElementById("m3").style.display="none";
}
	function tongji(){
		tongJiType=document.getElementById("tongJiType").value;
		if(tongJiType=="1")
			window.form1.action="../zbtj/getJustIndexTj.action";
		else if(tongJiType=="2")
			window.form1.action="../zbtj/getEftIndexTj.action";
		else if(tongJiType=="3")
			window.form1.action="../banan/getBananxgTj.action";
		else if(tongJiType=="4"){
			window.form1.action="../banan/jishidengji.action";
		}else{
			window.form1.action="../tongJi/form23sfjstxjaxxjk.action";
		}
		window.form1.submit();
	}
	
	function showSearchProperty(type){
		document.getElementById("tongJiType").value=type;
        if(type=="1"){
           document.getElementById("justIndex").style.display="block";
           document.getElementById("otherIndex").style.display="none";
           document.getElementById("countDiv").style.display="none";
			document.getElementById("anniu").style.display="block";
			document.getElementById("xxx").style.display="block";			
			document.getElementById("m1").style.display="block";
			document.getElementById("m2").style.display="none";
			document.getElementById("m3").style.display="none";
        }else if(type=="2"){
           document.getElementById("justIndex").style.display="none";
           document.getElementById("otherIndex").style.display="block";
           document.getElementById("countDiv").style.display="none";
		   document.getElementById("anniu").style.display="block";
		   document.getElementById("xxx").style.display="block";
		   document.getElementById("m1").style.display="none";
			document.getElementById("m2").style.display="block";
			document.getElementById("m3").style.display="none";
        }else if(type=="3"){
           document.getElementById("justIndex").style.display="none";
           document.getElementById("otherIndex").style.display="block";
           document.getElementById("countDiv").style.display="none";
		   document.getElementById("anniu").style.display="block";
		   document.getElementById("xxx").style.display="block";   
		   document.getElementById("m1").style.display="none";
			document.getElementById("m2").style.display="none";
			document.getElementById("m3").style.display="block";
        }else{
        	document.getElementById('ppp1').style.display='block';
        	document.getElementById('ppp2').style.display='block';
        	if(type=='4')
        		document.getElementById("wjk").value="1";
        	else
        		document.getElementById("wjk").value="2";
        	document.getElementById("countDiv").style.display="none";
        	document.getElementById('sss').style.display='block';
        	document.getElementById("anniu").style.display="block";
        }
    
    }
    function jk(value){
    	if(value=='1'){
    		document.getElementById('ppp').style.display='none';
    		document.getElementById('ppp1').style.display='block';
    		document.getElementById('ppp2').style.display='block';
    	}
    	if(value=='2'){
    		document.getElementById('ppp').style.display='block';
    		document.getElementById('ppp1').style.display='none';
    		document.getElementById('ppp2').style.display='block';
    	}
    }
    function getOrgTree(){
		window.open('../xzfy/getOrgTree.action?funcCode=${funcCode}','mainwindow3','location=no,resizable=yes,scrollbars=yes');
	}
</script>

