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
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
<!--[if lte IE 6]>
<script src="script/png.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div, ul, img, li, input , a');
    </script>
<![endif]--> 
</head>
<body  onload="startTime()">
<#include "../website/header.ftl">


<div class="wal">
<div class="pageBg2">
<!--wal-->


<div class="fl w198">
      <div class="sideNav">
            <div class="title">请选择栏目</div>
            <ul>
                 <li><a href="../wyxx/showQustnPage.action?funcCode=${funcCode}" class="aNow">调查问卷</a></li>
                 <li><a href="../wyxx/showOtherStatis.action?funcCode=${funcCode}">意见汇总</a></li>
            </ul>
      </div>
</div>

<div class="fr w771">
      <div class="pageNow">当前位置：调查问卷</div>
       
      <div class="dataListTitle"><h1>调查问卷</h1></div>
            <div class="Questionnaire">
            <form name="createForm" id="createForm" method="post" ENCTYPE="multipart/form-data" >
                <input type="hidden" name="funcCode" value="${funcCode}">
                <input type="hidden" name="xzfyQuestionnaire.commitDate" value="${tempDate}">
                  <div class="form">
                       <div class="name">您对网站改版的意见</div>
                       <div class="bg">
                             <div class="form1">
                             <ul >
                               <li><input type="radio" name="xzfyQuestionnaire.selectValue" class="radio" value="1"/>非常满意</li>
                               <li><input type="radio" name="xzfyQuestionnaire.selectValue" class="radio" value="2"/>满意</li>
                               <li><input type="radio" name="xzfyQuestionnaire.selectValue" class="radio" value="3"/>一般</li>
                               <li><input type="radio" name="xzfyQuestionnaire.selectValue" class="radio" value="4"/>不满意</li>   
                             </ul>
                             </div>
                             <div class="btnDiv">
                                  <input type="button" id="sb1" class="btn1" value="提交" onclick="submitForm();" />
                                  <input type="button" id="sb2" class="btn2" value="查看结果" onclick="viewResult();"/>
                             </div>
                       </div>
                  </div>
            </form>
            <form name="otrsgtForm" id="otrsgtForm" method="post" ENCTYPE="multipart/form-data" >
                <input type="hidden" name="funcCode" value="${funcCode}">
                <input type="hidden" name="xzfyOtherSuggest.submitTime" value="${tempDate0}">
                  <div class="form">
                       <div class="name">您对网站的其他意见</div>
                       <div class="bg">
                             <div class="form2">
                                  <textarea id="detlopn" name="xzfyOtherSuggest.opinion" cols="" rows="" maxlength="30"></textarea>
                             </div>
                             <div class="btnDiv">
                                  <input type="button" id="sb3" class="btn1" value="提交" onclick="submitSuggest();"/>
                                  <input type="button" id="sb4" class="btn2" value="查看结果" onclick="seeResult();"/>
                             </div>
                       </div>
                  </div>
             </form>
                  <span class="clear_f"></span>
            </div>
            <div class="dataListB"></div>
      
</div>

<span class="clear_f"></span>
<div class="h50"></div>
<!--walEnd-->
</div>
</div>


<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>
</body>
</html>

<script>

      function submitForm(){
           if(!isSelected()){
               alert("请选择！");
           }
           else{
               document.getElementById("sb1").disabled="true";
               document.createForm.action="saveQustnResult.action";
		       document.createForm.submit(); 
		   }
      }
      function isSelected(){
        	var radio = document.getElementsByName("xzfyQuestionnaire.selectValue");
        	for(var i=0;i<radio.length;i++){
      		   if(radio[i].checked==true){
      			    return true;
      		   }
      	    }
      	    return false;
      }
      function viewResult(){
            window.location="showPieChart.action?funcCode=${funcCode}";
      }
      
      
      function submitSuggest(){
           if(document.getElementById("detlopn").value==""){
               alert("意见不能为空！");
           }
           else{
               if(confirm("确定提交吗？")){
	               document.otrsgtForm.action="saveOtherSuggResult.action";
			       document.otrsgtForm.submit();
			   } 
		   }
      }
      
      function seeResult(){
           window.location="showOtherStatis.action?funcCode=${funcCode}";     
      }
</script>