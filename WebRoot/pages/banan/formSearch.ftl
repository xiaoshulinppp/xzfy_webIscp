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
<form id="form1" action="" method="post" target="_blank" ENCTYPE="multipart/form-data">
<input type="hidden" name="funcCode" value="${funcCode}" />
				
				
					<div id="countDiv" style="display:block">
						<div class="dataListTitle1"><h1>统计模块三：行政复议机关案件统计</h1></div>
						<div class="dataList">
							<ul>
						 	  <li><a href="javascript:showSearchProperty(1)" >表11：行政复议案件登记表</a></li>
						 	  <li><a href="javascript:showSearchProperty(2)" >表12：结案情况统计</a></li>
						 	  <li><a href="javascript:showSearchProperty(3)" >表13：高级检索（全市案件）</a></li>
						 	  <li><a href="javascript:showSearchProperty(4)" >表13：高级检索（本单位）</a></li>					 	  
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
			                         <option value="1">行政复议案件登记表</option>
			                         <option value="2">结案情况统计</option>
			                         <option value="3">高级检索（全市案件）</option>
			                         <option value="4">高级检索（本单位）</option>
		                          </select>		                       
		                      </li>
		                      <li style="width:170px">  		                       
		                      </li>
		                 </ul>
		                 
		                 <div  style="display:none" style="font-size:16px;font-family:仿宋;line-height:22px" id="m1">
		                 	<span style="font-size:22px;font-family:楷体;padding-left:180px;line-height:28px;" ><strong>表11：北京市人民政府行政复议案件登记表</strong></span><br>
		                 &nbsp;&nbsp;&nbsp;说明：本单位特定统计时段内，每一件新接收的案件总体情况。默认是当年度的案件，即从当年1月1日起计算，至检索日新收的所有案件。同时提供按照以往年度统计时段检索功能。显示为列表形式，点击查看，可以看到案件的详细信息。办理状态根据不同情况自动显示：“新收案待分配”、“立案审查中”、“已立案待分配”、“案件审理中”、“已结案”、“中止”。
		                 </div>
		                 <div  style="display:none" style="font-size:16px;font-family:仿宋;line-height:22px" id="m2">
		                 <span style="font-size:22px;font-family:楷体;padding-left:180px;line-height:28px;"><strong>表12：北京市人民政府行政复议结案情况统计</strong></span><br>
		                      &nbsp;&nbsp;&nbsp;说明：以复议机关为单位，查询特定统计时间段结案情况。检索时，默认为本复议机关案件情况，同时支持对全市以及其他复议机关案件情况进行检索。
		                 </div>
		                 <div  style="display:none" style="font-size:16px;font-family:仿宋;line-height:22px" id="m3">
		                 <span style="font-size:22px;font-family:楷体;padding-left:260px;line-height:28px;"><strong>表13：高级检索</strong></span><br>
		                     &nbsp;&nbsp;&nbsp;说明：选择高级查询，可以按照条件组合对本单位，或者选定范围的行政复议机关承办的案件信息进行查询，以列表的方式显示。点击列表中具体项目，可以查看到具体的案件信息。
		                 </div>
		               
		                 
		                 <ul style="display:none" id="datePeriod">
		                      <li style="width:180px">  
		                          <div class="name">开始日期:</div>
		                          <input class="ui-input-wdm" onclick="WdatePicker()" readonly="readonly" name="startDate" id="startDate" value="${startDate}" type="text">		                       
		                      </li>
		                      <li style="width:170px">  
		                          <div class="name">结束日期:</div>
		                          <input class="ui-input-wdm" onclick="WdatePicker()" readonly="readonly" name="endDate" id="endDate" value="${endDate}" type="text">		                       
		                      </li>		                   
		                 </ul>
		                 <ul style="display:none" id="datePeriod0">
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
		                 <ul style="display:none" id="datePeriod1">
		                       <li style="width:545px">  
		                       <div class="name">当前单位:</div>
		                       <input name="orgName" id="orgName" value='${message}'>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:getOrgTree()">请选择复议机关</a>
		                       <input name="locbm" id="locbm" type='hidden' value='${fileId1}'>
		                    </li>	                   
		                 </ul>
		                <script>
							function getFyOrg(){
								if(document.getElementById("count_type").value==3){
									document.getElementById("datePeriod1").style.display="block";
								}else{
									document.getElementById("datePeriod1").style.display="none";
								}
							}
							
							function getFyOrg1(){
								if(document.getElementById("count_type1").value==3){
									document.getElementById("datePeriod1").style.display="block";
								}else{
									document.getElementById("datePeriod1").style.display="none";
								}
							}							
						</script>  
		                 
		                 
		                 
		                
	  <div class="" style="display:none" id="gjjs" >	                 

       <ul id="caseorg">

		                   <li style="width:545px">  
		                       <div class="name">统计类型:</div> 
		                       <select name='count_type1' id="count_type1" onchange="getFyOrg1()">
		                       
		                       <option value='1' selected>全市案件</option>
		                       <option value='2' >所有区县政府案件</option>
		                       <option value='4' >所有市政府部门案件</option>
		                       <option value='3' >指定复议机关</option>
		                       </select>
		                     
		                      
		                    </li>
		                 
		                   
		                  </ul>	  		                    
      
      <ul> 
         <li style="width:180px">
             <div class="name">被申请人名称：</div>
             <input type="text" name="respondent" value="">
         </li>
         
         <li style="width:170px">
             <div class="name">申请人：</div>
             <input type="text" name="applicant" value="">
         </li>
      </ul>        
      <ul> 
         <li style="width:550px">
             <div class="name">收案日期：</div>
                              从  <input class="ui-input-wdm" type="text" readonly="readonly" name="receiveCaseDate1" value="" onClick="WdatePicker()">                               
             到 <input class="ui-input-wdm" type="text" readonly="readonly" name="receiveCaseDate2" value="" onClick="WdatePicker()">
         </li>
         

      </ul>
      
      <ul> 
         <li style="width:550px">
             <div class="name">结案日期：</div>
                              从  <input type="text" class="ui-input-wdm" readonly="readonly" name="finishCaseDate1" value="" onClick="WdatePicker()"> 
        
                              到  <input type="text" class="ui-input-wdm" readonly="readonly" name="finishCaseDate2" value="" onClick="WdatePicker()">                     
         </li>
      </ul>  
      
      <ul> 
         <li style="width:180px">
             <div class="name">承办人姓名：</div>
             <input type="text" name="undertaker" value="">
         </li>
         
         <li style="width:170px">
             <div class="name">第二承办人姓名：</div>
             <input type="text" name="undertakerSecond" value="">                         
         </li>
      </ul>
      
      <ul> 
         <li style="width:180px">
             <div class="name">案件号：</div>
             <input type="text" name="caseNo" value="">
         </li>
         
         <li style="width:170px">
             <div class="name">代表人名称：</div> 
             <input type="text" name="representative" value="">                       
         </li>
      </ul>
      
      <ul> 
         <li style="width:180px">
             <div class="name">文号：</div>
             <input type="text" name="caseNumBFY" value=""> 
         </li>
         
         <li style="width:170px">
             <div class="name">被复议的具体行为-名称：</div>
             <input type="text" name="caseNameBFY" value="">                         
         </li>
      </ul>
      

      
      <ul> 
         <li style="width:180px">
             <div class="name">申请人类别：</div>
             <select name="applicantType">
                  <option value="">请选择</option>
                  <option value="1">公民</option>
                  <option value="2">法人或其它组织</option>
             </select>
         </li>
         
         <li style="width:170px">
             <div class="name">多人复议：</div>   
             <select name="fyByMultis">
                  <option value="">请选择</option>
                  <option value="是">是</option>
                  <option value="否">否</option>
             </select>                     
         </li>
      </ul>
      <ul> 
         <li style="width:180px">
             <div class="name">申请复议事项：</div>
             <select id="fysx" name="fysx" onchange="checkFysx();">
                  <option value="">请选择</option>
                  <option value="1">行政处罚</option>
                  <option value="2">行政强制措施</option>
                  <option value="3">行政征收</option>
                  <option value="4">行政许可</option>
                  <option value="5">行政确权</option>
                  
                  <option value="10">行政确认</option>  
                  
                  <option value="7">信息公开</option>
                  <option value="11">举报投诉处理</option>
                  <option value="8">行政不作为</option>
                  <option value="9">其它</option>
             </select>
         </li>
         
         <li style="width:170px">
             <div class="name">代理人：</div>   
             <input type="text" name="agent" value="">                      
         </li>
      </ul>
<!-------------------------------------------------------申请复议事项子选项------------------------------------------------------------>
<!--      
      <ul id="subOfFysx1" style="display:none"> 
         <li style="width:180px">
             <div class="name"></div>   
             <select name="">
                  <option value="">请选择子项</option>
                  <option value="拘留">拘留</option>
                  <option value="没收">没收</option>
                  <option value="罚款">罚款</option>
                  <option value="其它">其它</option>
             </select>
         </li>
         
         <li style="width:170px">
                                     
         </li>
      </ul>
      
      <ul id="subOfFysx2" style="display:none"> 
         <li style="width:180px">
             <div class="name"></div>
             <select name="">
                  <option value="">请选择子项</option>
                  <option value="对人身的强制措施">对人身的强制措施</option>
                  <option value="对不动产的强制措施">对不动产的强制措施</option>
                  <option value="对其它财产的强制措施">对其它财产的强制措施</option>
             </select>
         </li>
         
         <li style="width:170px">
                                     
         </li>
      </ul>
      
      <ul id="subOfFysx3" style="display:none"> 
         <li style="width:180px">
             <div class="name"></div>
             <select name="">
                  <option value="">请选择子项</option>
                  <option value="征收土地">征收土地</option>
                  <option value="版税">版税</option>
                  <option value="收费">收费</option>
                  <option value="要求履行其它义务">要求履行其它义务</option>
             </select>
         </li>
         
         <li style="width:170px">
                                     
         </li>
      </ul>
-->
<!------------------------------------------------------------------------------------------------------------------->            
    
      <ul> 
         <li style="width:180px">
             <div class="name">行政管理类别：</div>
     <select id="xzgl" name="xzgl"       >
        
	<option value="">----请选择----</option>
	<option value="1" >公安</option>
	<option value="2" >国家安全</option>
	<option value="3" >劳动和社会保障</option>
	<option value="4" >司法行政</option>
	<option value="5" >民政</option>
	<option value="6" >土地</option>
	<option value="7" >地矿</option>
	<option value="8" >环保</option>
	<option value="9" >农业</option>
	<option value="10" >水利</option>
	<option value="11" v>林业</option>
	
	<option value="12" >城乡规划</option>
	<option value="13" >房屋征补(拆迁)</option>
	<option value="14" >不动产登记</option>
	
	<option value="15" >工商</option>
	
	<option value="45" >安监</option>
	
	<option value="17" >商务</option>
	<option value="18" >物价</option>
	<option value="19" >能源</option>
	<option value="20" >交通运输</option>
	<option value="21" >信息产业</option>
	<option value="22" >邮政</option>
	<option value="23" >烟草专卖</option>
	<option value="24" >税务</option>
	<option value="25" >人民银行</option>
	<option value="26" >证监</option>
	<option value="27" >保监</option>
	<option value="28" >银监</option>
	<option value="29" >外汇</option>
	<option value="30" >财政</option>
	<option value="31" >统计</option>
	<option value="32" >审计</option>
	<option value="33" >海关</option>
	
	
	
	<option value="34" >质检</option>  <#--特殊处理 16,34,46-->
	<option value="35" >食品安全</option>
	
	<option value="36" >卫生计生</option><#--特殊处理 36,37,47-->
	<#--<option value="37" >计划生育</option>-->
	
	<option value="38" >教育</option>
	<option value="39" >文化</option>
	<option value="40" >专利</option>
	<option value="41" >商标</option>
	<option value="42" >版权</option>	
	<option value="43" >旅游</option>	
	
	<option value="48" >新闻出版广电</option>
	<option value="49" >发展改革</option>
	<option value="50" >科技</option>
	
	
	<option value="44" >其他</option>			
  </select>    

         </li>
         
         <li style="width:170px">
             <div class="name">复议前置：</div>
             <select name="fyPrepose">
                  <option value="">请选择</option>
                  <option value="是">是</option>
                  <option value="否">否</option>
             </select>                        
         </li>
      </ul>
<!--------------------------------------------------------行政管理类别子选项----------------------------------------------------------->      
<!--      
      <ul id="subOfXzgl1" style="display:none"> 
         <li style="width:180px">
             <div class="name"></div>
             <select name="">
                  <option value="">请选择子项</option>
                  <option value="治安">治安</option>
                  <option value="劳教">劳教</option>
                  <option value="其它">其它</option>
             </select>
         </li>
         
         <li style="width:170px">
                                     
         </li>
      </ul>
      
      <ul id="subOfXzgl2" style="display:none"> 
         <li style="width:180px">
             <div class="name"></div>
             <select name="">
                  <option value="">请选择子项</option>
                  <option value="土地">土地</option>
                  <option value="地矿">地矿</option>
                  <option value="环保">环保</option>
                  <option value="农业">农业</option>
                  <option value="水利">水利</option>
                  <option value="林业">林业</option>
                  <option value="其它">其它</option>
             </select>
         </li>
         
         <li style="width:170px">
                                     
         </li>
      </ul>  
      
      <ul id="subOfXzgl3" style="display:none"> 
         <li style="width:180px">
             <div class="name"></div>
             <select name="">
                  <option value="">请选择子项</option>
                  <option value="规划">规划</option>
                  <option value="拆迁">拆迁</option>
                  <option value="房屋登记">房屋登记</option>
                  <option value="其它">其它</option>
             </select>
         </li>
         
         <li style="width:170px">
                                     
         </li>
      </ul> 
      
      <ul id="subOfXzgl4" style="display:none"> 
         <li style="width:180px">
             <div class="name"></div>
             <select name="">
                  <option value="">请选择子项</option>
                  <option value="工商">工商</option>
                  <option value="质监">质监</option>
                  <option value="商务">商务</option>
                  <option value="物价">物价</option>
                  <option value="能源">能源</option>
                  <option value="交通">交通</option>
                  <option value="信息产业">信息产业</option>
                  <option value="邮政">邮政</option>
                  <option value="烟草专买">烟草专买</option>
             </select>
         </li>
         
         <li style="width:170px">
                                     
         </li>
      </ul> 
      
      <ul id="subOfXzgl5" style="display:none"> 
         <li style="width:180px">
             <div class="name"></div>
             <select name="">
                  <option value="">请选择子项</option>
                  <option value="税务">税务</option>
                  <option value="人民银行">人民银行</option>
                  <option value="证监">证监</option>
                  <option value="保监">保监</option>
                  <option value="银监">银监</option>
                  <option value="外汇">外汇</option>
                  <option value="财政">财政</option>
                  <option value="统计">统计</option>
                  <option value="审计">审计</option>
                  <option value="海关">海关</option>
                  <option value="商检">商检</option>
             </select>
         </li>
         
         <li style="width:170px">
                                     
         </li>
      </ul> 
      
      <ul id="subOfXzgl6" style="display:none"> 
         <li style="width:180px">
             <div class="name"></div>
             <select name="">
                  <option value="">请选择子项</option>
                  <option value="药监">药监</option>
                  <option value="卫生">卫生</option>
                  <option value="计划生育">计划生育</option>
                  <option value="教育">教育</option>
                  <option value="文化">文化</option>
                  <option value="专利">专利</option>
                  <option value="商标">商标</option>
                  <option value="版权">版权</option>
                  <option value="旅游">旅游</option>
             </select>
         </li>
         
         <li style="width:170px">
                                     
         </li>
      </ul> 
-->
<!------------------------------------------------------------------------------------------------------------------->
      
      <ul> 
         <li style="width:180px">
             <div class="name">是否行政赔偿：</div>
             <select name="adminCompen">
                  <option value="">请选择</option>
                  <option value="1">是</option>
                  <option value="0">否</option>
             </select>
         </li>
         
         <li style="width:170px">
             <div class="name">是否补证：</div>
             <select name="complement">
                  <option value="">请选择</option>
                  <option value="1">是</option>
                  <option value="0">否</option>
             </select>                         
         </li>
      </ul> 
      
      <ul> 
         <li style="width:180px">
             <div class="name">对规范性文件审查：</div>
             <select name="checkFile">
                  <option value="">请选择</option>
                  <option value="是">是</option>
                  <option value="否">否</option>
             </select>
         </li>
         
         <li style="width:170px">
             <div class="name">来件处理：</div>    
             <select name="dealWithFile">
                  <option value="">请选择</option>
                  <option value="1">受理</option>
                  <option value="2">告知</option>
                  <option value="3">不予受理</option>
                  <option value="4">转送</option>
                  <option value="5">其它</option>
             </select>                  
         </li>
      </ul> 
      
      <ul> 
         <li style="width:180px">
             <div class="name">是否延期：</div>
             <select name="delay">
                  <option value="">请选择</option>
                  <option value="1">是</option>
                  <option value="0">否</option>
             </select>
         </li>
         
         <li style="width:170px">
             <div class="name">是否中止：</div>
             <select name="terminate">
                  <option value="">请选择</option>
                  <option value="1">是</option>
                  <option value="0">否</option>
             </select>                      
         </li>
      </ul> 
      
      <ul> 
         <li style="width:550px">    
             <div class="name">结案方式：</div> 
             <input type="checkbox" name='wayOfFinish' value='1'>驳回</input> 
             <input type="checkbox" name='wayOfFinish' value='2'>维持</input> 
             <input type="checkbox" name='wayOfFinish' value='3'>确认违法</input> 
             <input type="checkbox" name='wayOfFinish' value='4'>撤销</input> 
             <input type="checkbox" name='wayOfFinish' value='5'>变更</input> 
             <input type="checkbox" name='wayOfFinish' value='6'>责令履行</input> 
             <input type="checkbox" name='wayOfFinish' value='7'>调解</input> 
             <input type="checkbox" name='wayOfFinish' value='8'>终止</input> 
             <input type="checkbox" name='wayOfFinish' value='9'>其他</input>             
         </li>
 
      </ul> 
      
      <ul  > 
         <li style="width:180px">
             <div class="name">行政复议意见书：</div>
             <select name="opinionOfXzfy">
                  <option value="">请选择</option>
                  <option value="1">有</option>
                  <option value="0">无</option>
             </select>
         </li>
         
         <li style="width:170px">
             <div class="name">行政复议建议书：</div>    
             <select name="adviceOfXzfy">
                  <option value="">请选择</option>
                  <option value="1">有</option>
                  <option value="0">无</option>
             </select>                     
         </li>
      </ul> 
      <ul  > 
         <li style="width:350px">
             <div class="name">结案文书内容检索：</div>
             <input type="text" name="queryStr" value=""><br/>仅显示前100条搜索结果，请尽量细化搜索条件
         </li>
         
                              
         </li>
      </ul> 
   </div>          
		                 <span class="clear_f"></span>
		                 <div class="btnDiv" id="anniu" style="display:none" >
		                      <input name="button" class="btn1" value="搜索" onclick="showform()"  type="button">
		                      
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
				document.getElementById("anniu").style.display="none";
                document.getElementById("datePeriod").style.display="none";
                document.getElementById("datePeriod0").style.display="none";
                document.getElementById("datePeriod1").style.display="none";
                document.getElementById("gjjs").style.display="none"; 
                document.getElementById("countDiv").style.display="block"; 
                document.getElementById("m1").style.display="none";
                document.getElementById("m2").style.display="none";
                document.getElementById("m3").style.display="none";
			}
		    function showform(){
				if(document.getElementById("tongJiType").value=="1")
					window.form1.action="showForm10.action";
				else if(document.getElementById("tongJiType").value=="2"){
					window.form1.action="tongJi.action";
				}
				else if(document.getElementById("tongJiType").value=="3")
					window.form1.action="../gjcx/showQueryResult.action";
				else if(document.getElementById("tongJiType").value=="4")
					window.form1.action="../gjcx/showSeparateQueryResult.action";
				window.form1.submit();	
			}

            function showSearchProperty(type){
            	document.getElementById("tongJiType").value=type; 
                if(type=="1"){
                	document.getElementById("anniu").style.display="block";
                    document.getElementById("datePeriod").style.display="block";
                    document.getElementById("datePeriod0").style.display="block";
                    document.getElementById("datePeriod1").style.display="block";
                    document.getElementById("gjjs").style.display="none"; 
                    document.getElementById("countDiv").style.display="none"; 
                    document.getElementById("m1").style.display="block";
	                document.getElementById("m2").style.display="none";
	                document.getElementById("m3").style.display="none";                                 
                }
                else if(type=="2"){
                	document.getElementById("anniu").style.display="block";
                    document.getElementById("datePeriod").style.display="block";
                    document.getElementById("datePeriod0").style.display="block";
                    document.getElementById("datePeriod1").style.display="block";
                    document.getElementById("gjjs").style.display="none"; 
                    document.getElementById("countDiv").style.display="none";
                    document.getElementById("m1").style.display="none";
	                document.getElementById("m2").style.display="block";
	                document.getElementById("m3").style.display="none";                  
                }
                else if(type=="3"){
                	document.getElementById("anniu").style.display="block";
                	document.getElementById("caseorg").style.display="block";
                    document.getElementById("gjjs").style.display="block";
                    document.getElementById("datePeriod").style.display="none";  
                    document.getElementById("datePeriod0").style.display="none";
                    document.getElementById("datePeriod1").style.display="none";
                    document.getElementById("countDiv").style.display="none"; 
                    document.getElementById("m1").style.display="none";
	                document.getElementById("m2").style.display="none";
	                document.getElementById("m3").style.display="block";                
                }
                else if(type=="4"){
                	document.getElementById("anniu").style.display="block";
                	document.getElementById("caseorg").style.display="none";
                    document.getElementById("gjjs").style.display="block";
                    document.getElementById("datePeriod").style.display="none";  
                    document.getElementById("datePeriod0").style.display="none";
                    document.getElementById("datePeriod1").style.display="none"; 
                    document.getElementById("countDiv").style.display="none";
                    document.getElementById("m1").style.display="none";
	                document.getElementById("m2").style.display="none";
	                document.getElementById("m3").style.display="block";                
                }
            }

<#--
             function checkFysx(){
	             if(document.getElementById("fysx").value=="行政处罚"){
	                  document.getElementById("subOfFysx1").style.display="block";
	                  document.getElementById("subOfFysx2").style.display="none";
	                  document.getElementById("subOfFysx3").style.display="none";
	             }
	             else if(document.getElementById("fysx").value=="行政强制措施"){
	                  document.getElementById("subOfFysx2").style.display="block";
	                  document.getElementById("subOfFysx1").style.display="none";
	                  document.getElementById("subOfFysx3").style.display="none";
	             }
	             else if(document.getElementById("fysx").value=="行政征收"){
	                  document.getElementById("subOfFysx3").style.display="block";
	                  document.getElementById("subOfFysx1").style.display="none";
	                  document.getElementById("subOfFysx2").style.display="none";
	             }
	             else{
	                  document.getElementById("subOfFysx1").style.display="none";
	                  document.getElementById("subOfFysx2").style.display="none";
	                  document.getElementById("subOfFysx3").style.display="none";
	             }
	         }

             function checkXzgl(){
	             if(document.getElementById("xzgl").value=="公安"){
	                  document.getElementById("subOfXzgl1").style.display="block";
	                  document.getElementById("subOfXzgl2").style.display="none";
	                  document.getElementById("subOfXzgl3").style.display="none";
	                  document.getElementById("subOfXzgl4").style.display="none";
	                  document.getElementById("subOfXzgl5").style.display="none";
	                  document.getElementById("subOfXzgl6").style.display="none";
	             }
	             else if(document.getElementById("xzgl").value=="农林环资"){
	                  document.getElementById("subOfXzgl2").style.display="block";
	                  document.getElementById("subOfXzgl1").style.display="none";
	                  document.getElementById("subOfXzgl3").style.display="none";
	                  document.getElementById("subOfXzgl4").style.display="none";
	                  document.getElementById("subOfXzgl5").style.display="none";
	                  document.getElementById("subOfXzgl6").style.display="none";
	             }
	             else if(document.getElementById("xzgl").value=="城建"){
	                  document.getElementById("subOfXzgl3").style.display="block";
	                  document.getElementById("subOfXzgl1").style.display="none";
	                  document.getElementById("subOfXzgl2").style.display="none";
	                  document.getElementById("subOfXzgl4").style.display="none";
	                  document.getElementById("subOfXzgl5").style.display="none";
	                  document.getElementById("subOfXzgl6").style.display="none";
	             }
	             else if(document.getElementById("xzgl").value=="工交商事"){
	                  document.getElementById("subOfXzgl4").style.display="block";
	                  document.getElementById("subOfXzgl1").style.display="none";
	                  document.getElementById("subOfXzgl2").style.display="none";
	                  document.getElementById("subOfXzgl3").style.display="none";
	                  document.getElementById("subOfXzgl5").style.display="none";
	                  document.getElementById("subOfXzgl6").style.display="none";
	             }
	             else if(document.getElementById("xzgl").value=="财政金融"){
	                  document.getElementById("subOfXzgl5").style.display="block";
	                  document.getElementById("subOfXzgl1").style.display="none";
	                  document.getElementById("subOfXzgl2").style.display="none";
	                  document.getElementById("subOfXzgl3").style.display="none";
	                  document.getElementById("subOfXzgl4").style.display="none";
	                  document.getElementById("subOfXzgl6").style.display="none";
	             }
	             else if(document.getElementById("xzgl").value=="教科文卫"){
	                  document.getElementById("subOfXzgl6").style.display="block";
	                  document.getElementById("subOfXzgl1").style.display="none";
	                  document.getElementById("subOfXzgl2").style.display="none";
	                  document.getElementById("subOfXzgl3").style.display="none";
	                  document.getElementById("subOfXzgl4").style.display="none";
	                  document.getElementById("subOfXzgl5").style.display="none";
	             }
	             else{
	                  document.getElementById("subOfXzgl1").style.display="none";
	                  document.getElementById("subOfXzgl2").style.display="none";
	                  document.getElementById("subOfXzgl3").style.display="none";
	                  document.getElementById("subOfXzgl4").style.display="none";
	                  document.getElementById("subOfXzgl5").style.display="none";
	                  document.getElementById("subOfXzgl6").style.display="none";
	             }
	         }
-->	         
</script>