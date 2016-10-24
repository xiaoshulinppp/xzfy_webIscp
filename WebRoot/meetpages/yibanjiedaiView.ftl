<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>接待记录查看</title>

<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />

<SCRIPT src="../css/01/setday.js"></SCRIPT>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/function.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/prototype.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>

<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>

<script type="text/javascript" src="../js/calendar.js"></script>
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>

<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>

<style type="text/css">img,formDiv,.formDiv{behavior: url(../webstyle/style/ie-css3.htc);} </style> 
<#--
<script type="text/javascript" src="../js/effects.js"></script>
<script type="text/javascript" src="../js/validation_cn_utf-8.js"></script>
-->
<style>
</style>

</head>
<script type="text/javascript" src="../js/floder/prototype.js"></script>
<script type="text/javascript" src="../js/floder/effects.js"></script>
<script type="text/javascript" src="../js/floder/validation_cn_utf-8.js"></script>

<body>
<#include "../pages/website/header.ftl">
<form action="''" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
<!--主体内容、列表显示区域-->

<input id="conutAppname" type=hidden name="conutAppname">

<!-- 被申请人部门id -->
<input name="meet.caseOrg" type="hidden" class="inputTextNormal" id="deptid" />
<!-- 状态 -->
<input type="hidden" name="sta" id="sta" value="11" />
<input id="main_id" name="meet.main_id" value="${meet.main_id}" type="hidden">
<input type="hidden" name="funcCode" value="${funcCode}" />

<div class="" style="padding-top:0px;">


<!--wal-->

      <div class="formDiv">
      <div class="bg">

        <table width="100%">
             

<tr >
     <th  width="20%">接待日期：</th>
    <td  width="30%">
    ${meet.face_date?default('')}
      </td>
    
    <th  width="22%">接待地点：</th>
	    <td  width="28%">${meet.face_address?default('')}</td>
  </tr>

    <tr >
  	<th >第一接待人：</th>
    <td >${meet.admit1?default('')}   </td>
   <th >第二接待人：</th>
    <td >${meet.admit2?default('')}
   </td>   
    </tr>	
<tr >
    <th  >被接待人：</th>
    <td >${meet.client_content?default('')}
    </td>
    <th >接待人数：</th>
    <td >${meet.face_allnumber?default('')}</td>  
  </tr>
<#if meet.meet_type =="送达" >
  <tr >
    <th  width="25%">送达笔录内容</th>
    <td  width="25%">
     <textarea name="meet.Send_content" class="textarea" id="answerValue" type="text"  ondblclick="getValue(this)">
${meet.send_content?default('')}
    </textarea>
    </td>
  </tr>
</#if>
<#if meet.meet_type =="阅卷" >
  <tr >
    <th  width="25%">阅卷笔录内容</th>
    <td  width="25%">
    <textarea name="meet.face_content" class="textarea" id="answerValue" type="text"  ondblclick="getValue(this)">
${meet.face_content?default('')}
    </textarea>
    </td>
  </tr>
</#if>
 <#if meet.meet_type =="转交材料" >
  <tr >
    <th  width="25%">转交材料笔录内容</th>
    <td  width="25%">
    <textarea name="meet.transfer_content" class="textarea" id="answerValue" type="text"  ondblclick="getValue(this)">
${meet.transfer_content?default('')}
    </textarea>
    </td>
  </tr>
</#if>
 <#if meet.meet_type =="一般接待" >
  <tr >
    <th  width="25%">一般接待笔录内容</th>
    <td  width="25%">
    <textarea name="meet.title" class="textarea" id="answerValue" type="text"  ondblclick="getValue(this)">
${meet.title?default('')}
    </textarea>
    </td>
  </tr>
</#if>
 
</table>

                   <br>
  <div align="center" border="0">
 <div class="btn">
                       <div class="fl">

                       </div>
                  </div>
      </div>
      </div>
 
</div>


</form>
</body>

<script language="javascript">
 function back(){
 	history.back(-1);
 }

</script>
</html>