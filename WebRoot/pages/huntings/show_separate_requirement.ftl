<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=7">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>行政复议信息管理系统</title>
		<link href="../sys_theme/css/base.css" rel="stylesheet" type="text/css" />
		<link href="../sys_theme/css/main_style.css" rel="stylesheet" type="text/css" />
		<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
        <link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
	
	<!--                       Javascripts 注意不要改变顺序                      -->
<script type="text/javascript" src="../sys_theme/js/jquery-1.8.2.min.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../sys_theme/js/tpl.base.js"></script>

<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
	</head>
	<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
	<body onload="startTime()">
	   <#include "../website/header.ftl">

<div class="wal">
<div class="pageBg2">

<div class="fl w198">
      <div class="sideNav">
            <div class="title">请选择栏目</div>
            <ul>
                 <li><a href="../gjcx/showQueryRequirement.action?funcCode=${funcCode}" class="aNow">高级查询</a></li>
                 <!--<li><a href="#">待分配</a></li>-->
            </ul>
      </div>
</div>

<div class="fr w771">
	<div class="pageNow">当前位置：高级查询</div>
  
    <div id="totallist" style="display:block">

           <div class="dataListTitle"><h1>高级查询</h1></div>

          <div class="dataList">

<form name="updateForm" id="checkForm" action="" method="post" ENCTYPE="multipart/form-data">
            <input type="hidden" name="funcCode" value="${funcCode}">
   <table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table  ui-table-list  list-fixed ">
      <tr>
         <td>
                                     选择单位：
         </td>
              
         <td>
              <input type="text" name="" value="">
         </td>
         
         <td>
         </td>
         
         <td>
                                      申请人：
         </td>
         
         <td>
              <input type="text" name="applicant" value=""> 
         </td>
      </tr>
      
      <tr>
         <td>
                                    收案日期：
         </td>
         
         <td>
                                   从<input type="text" name="receiveCaseDate1" value="" onClick="WdatePicker()"> 
         </td>
         
         <td>
                                   到<input type="text" name="receiveCaseDate2" value="" onClick="WdatePicker()"> 
         </td>
         
         <td>
         </td>
         
         <td>
         </td>
      </tr>
      
      <tr>
         <td>
                                    结案日期：
         </td>
         
         <td>
                                   从<input type="text" name="finishCaseDate1" value="" onClick="WdatePicker()"> 
         </td>
         
         <td>
                                   到<input type="text" name="finishCaseDate2" value="" onClick="WdatePicker()"> 
         </td>
         
         <td>
         </td>
         
         <td>
         </td>
      </tr>
      
      <tr>
         <td>
                                    承办人姓名：
         </td>
         
         <td>
             <input type="text" name="undertaker" value=""> 
         </td>
         
         <td>
         </td>
         
         <td>
                                    第二承办人姓名：
         </td>
         
         <td>
             <input type="text" name="undertakerSecond" value=""> 
         </td>
      </tr>
      
      <tr>
         <td>
                                   案件号：
         
         </td>
            
         <td>
             <input type="text" name="caseNo" value=""> 
         </td>
         
         <td>
         </td>
         
         <td>
                                    代表人名称：
         </td>
         
         <td>
             <input type="text" name="representative" value=""> 
         </td>
      </tr>
      
      <tr>
         <td>
                                  被复议的具体行为-案号：
         
         </td>
         
         <td>
             <input type="text" name="caseNumBFY" value=""> 
         </td>
         
         <td>
         </td>
         
         <td>
                                  被复议的具体行为-名称：
         </td>
         
         <td>
             <input type="text" name="caseNameBFY" value=""> 
         </td>
      </tr>
      
      <tr>
         <td>
                                  被申请人名称：
         
         </td>
         
         <td>
             <input type="text" name="respondent" value=""> 
         </td>
         
         <td>
         </td>
         
         <td>
         </td>
         
         <td>
         </td>
      </tr>
      
      <tr>
         <td>
                                   申请人类别: 
         
         </td>
         
         <td>
             <select name="applicantType">
                  <option value="">请选择</option>
                  <option value="1">公民</option>
                  <option value="2">法人或其它组织</option>
             </select>
         </td>
         
         <td>
         </td>
         
         <td>
                                  多人复议：
         </td>
         
         <td>
             <select name="fyByMultis">
                  <option value="">请选择</option>
                  <option value="1">是</option>
                  <option value="0">否</option>
             </select>
         </td>
      </tr>
      
      <tr>
         <td>
                                   申请复议事项：
         
         </td>
         
         <td>
             <select id="fysx" name="" onchange="checkFysx();">
                  <option value="">请选择</option>
                  <option value="行政处罚">行政处罚</option>
                  <option value="行政强制措施">行政强制措施</option>
                  <option value="行政征收">行政征收</option>
                  <option value="行政许可">行政许可</option>
                  <option value="行政确权">行政确权</option>
                  <option value="干预经营自主权">干预经营自主权</option>
                  <option value="信息公开">信息公开</option>
                  <option value="行政不作为">行政不作为</option>
                  <option value="其它">其它</option>
             </select>
         </td>
         
         <td>
            
         </td>
         
         <td>
                                  代理人：
         </td>
         
         <td>
             <input type="text" name="agent" value=""> 
         </td>
      </tr>
      
      
<!-------------------------------------------------------申请复议事项子选项------------------------------------------------------------>      
      <tr id="subOfFysx1" style="display:none">
         <td>
                            
         
         </td>
           
         <td>
             <select name="">
                  <option value="">请选择子项</option>
                  <option value="拘留">拘留</option>
                  <option value="没收">没收</option>
                  <option value="罚款">罚款</option>
                  <option value="其它">其它</option>
             </select>
         </td>
         
         <td>
         </td>
         
         <td>
         </td>
         
         <td>
         </td>
      </tr>
      
      <tr id="subOfFysx2" style="display:none">
         <td>
                            
         
         </td>
           
         <td>
             <select name="">
                  <option value="">请选择子项</option>
                  <option value="对人身的强制措施">对人身的强制措施</option>
                  <option value="对不动产的强制措施">对不动产的强制措施</option>
                  <option value="对其它财产的强制措施">对其它财产的强制措施</option>
             </select>
         </td>
         
         <td>
         </td>
         
         <td>
         </td>
         
         <td>
         </td>
      </tr>
      
      <tr id="subOfFysx3" style="display:none">
         <td>
                            
         
         </td>
           
         <td>
             <select name="">
                  <option value="">请选择子项</option>
                  <option value="征收土地">征收土地</option>
                  <option value="版税">版税</option>
                  <option value="收费">收费</option>
                  <option value="要求履行其它义务">要求履行其它义务</option>
             </select>
         </td>
         
         <td>
         </td>
         
         <td>
         </td>
         
         <td>
         </td>
      </tr>
<!------------------------------------------------------------------------------------------------------------------->      
      
      
      <tr>
         <td>
                                 行政管理类别：
         
         </td>
         
         <td>
            <select id="xzgl" name="" onchange="checkXzgl();">
                  <option value="">请选择</option>
                  <option value="公安">公安</option>
                  <option value="国家安全">国家安全</option>
                  <option value="劳动和社会保障">劳动和社会保障</option>
                  <option value="司法行政">司法行政</option>
                  <option value="民政">民政</option>
                  <option value="农林环资">农林环资</option>
                  <option value="城建">城建</option>
                  <option value="工交商事">工交商事</option>
                  <option value="财政金融">财政金融</option>
                  <option value="教科文卫">教科文卫</option>
                  <option value="其它">其它</option>
             </select>
         </td>
         
         <td>
             
         </td>
         
         <td>
                                  复议前置：
         </td>
         
         <td>
             <select name="fyPrepose">
                  <option value="">请选择</option>
                  <option value="1">是</option>
                  <option value="0">否</option>
             </select>
         </td>
      </tr>
      
<!--------------------------------------------------------行政管理类别子选项----------------------------------------------------------->      
      <tr id="subOfXzgl1" style="display:none">
         <td>
                                  
         
         </td>
         
         <td>
             <select name="">
                  <option value="">请选择子项</option>
                  <option value="治安">治安</option>
                  <option value="劳教">劳教</option>
                  <option value="其它">其它</option>
             </select>
         </td>
         
         <td>
         </td>
         
         <td>
         </td>
         
         <td>
         </td>
      </tr>
      
      <tr id="subOfXzgl2" style="display:none">
         <td>
                                  
         
         </td>
         
         <td>
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
         </td>
         
         <td>
         </td>
         
         <td>
         </td>
         
         <td>
         </td>
      </tr>
      
      <tr id="subOfXzgl3" style="display:none">
         <td>
                                  
         
         </td>
         
         <td>
             <select name="">
                  <option value="">请选择子项</option>
                  <option value="规划">规划</option>
                  <option value="拆迁">拆迁</option>
                  <option value="房屋登记">房屋登记</option>
                  <option value="其它">其它</option>
             </select>
         </td>
         
         <td>
         </td>
         
         <td>
         </td>
         
         <td>
         </td>
      </tr>
      
      <tr id="subOfXzgl4" style="display:none">
         <td>
                                  
         
         </td>
         
         <td>
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
         </td>
         
         <td>
         </td>
         
         <td>
         </td>
         
         <td>
         </td>
      </tr>
      
      <tr id="subOfXzgl5" style="display:none">
         <td>
                                  
         
         </td>
         
         <td>
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
         </td>
         
         <td>
         </td>
         
         <td>
         </td>
         
         <td>
         </td>
      </tr>
      
       <tr id="subOfXzgl6" style="display:none">
         <td>
                                  
         
         </td>
         
         <td>
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
         </td>
         
         <td>
         </td>
         
         <td>
         </td>
         
         <td>
         </td>
      </tr>
<!------------------------------------------------------------------------------------------------------------------->

      
      <tr>
         <td>
                                  是否行政赔偿：
         
         </td>
         
         <td>
             <select name="adminCompen">
                  <option value="">请选择</option>
                  <option value="1">是</option>
                  <option value="0">否</option>
             </select>
         </td>
         
         <td>
             
         </td>
         
         <td>
                                   是否补证：
         </td>
         
         <td>
             <select name="complement">
                  <option value="">请选择</option>
                  <option value="1">是</option>
                  <option value="0">否</option>
             </select>
         </td>
      </tr>
      
      <tr>
         <td>
                                 对规范性文件审查：
         
         </td>
         
         <td>
             <select name="checkFile">
                  <option value="">请选择</option>
                  <option value="1">是</option>
                  <option value="0">否</option>
             </select>
         </td>
         
         <td>
         </td>
         
         <td>
                                   来件处理：
         </td>
         
         <td>
             <select name="dealWithFile">
                  <option value="">请选择</option>
                  <option value="1">受理</option>
                  <option value="2">告知</option>
                  <option value="3">不予受理</option>
                  <option value="4">转送</option>
                  <option value="5">其它</option>
             </select>
         </td>
      </tr>
      
      <tr>
         <td>
                                    是否延期：
         
         </td>
         
         <td>
             <select name="delay">
                  <option value="">请选择</option>
                  <option value="1">是</option>
                  <option value="0">否</option>
             </select>
         </td>
         
         <td>
         </td>
         
         <td>
                                  是否中止：
         </td>
         
         <td>
             <select name="terminate">
                  <option value="">请选择</option>
                  <option value="1">是</option>
                  <option value="0">否</option>
             </select>
         </td>
      </tr>
      
      <tr>
         <td>
                                  审理方式：
         
         </td>
         
         <td>
             <select name="wayOfTrial">
                  <option value="">无</option>
                  <option value="1">设置听证</option>
                  <option value="2">会商</option>
                  <option value="3">会审</option>
                  <option value="4">专家论证会</option>
                  <option value="5">协调会</option>
                  <option value="6">其它审理方式</option>
             </select>
         </td>
         
         <td>
         </td>
         
         <td>
                                   结案方式：
         </td>
         
         <td>
             <select name="wayOfFinish">
                  <option value="">请选择</option>
                  <option value="1">驳回</option>
                  <option value="2">维持</option>
                  <option value="3">确认违法</option>
                  <option value="4">撤销</option>
                  <option value="5">变更</option>
                  <option value="6">责令履行</option>
                  <option value="7">调解</option>
                  <option value="8">终止</option>
                  <option value="9">其它</option>
             </select>
         </td>
      </tr>
      
      <tr>
         <td>
                                  行政复议意见书：
         
         </td>
         
         <td>
             <select name="opinionOfXzfy">
                  <option value="">请选择</option>
                  <option value="1">有</option>
                  <option value="0">无</option>
             </select>
         </td>
         
         <td>
         </td>
         
         <td>
                                    行政复议建议书：
         </td>
         
         <td>
             <select name="adviceOfXzfy">
                  <option value="">请选择</option>
                  <option value="1">有</option>
                  <option value="0">无</option>
             </select>
         </td>
      </tr>
      
   </table>
   
   <table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table  ui-table-list  list-fixed ">
    <tr>
       <td> 	   
	        <input type="button" class="ui-btn ui-btn-yellow" value="执行查询" onClick="gotoSearch()" />
	   </td>
    </tr>
   </table>
    
</form>
</div>
</div>
</div>

</div>
</div>
<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>
</body> 

<script>
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
         
         function gotoSearch(){
             document.checkForm.action="showSeparateQueryResult.action";
             document.checkForm.submit();
         
         }
         
</script>