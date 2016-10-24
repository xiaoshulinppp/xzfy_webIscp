<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv=”X-UA-Compatible” content=”IE=EmulateIE7″ >
<link href="../css/16B/style_print_view.css" rel="stylesheet" type="text/css">
<link href="../css/16B/aj/document_css.css" rel="stylesheet" type="text/css">
<link href="../css/16B/aj/style.css" rel="stylesheet" type="text/css">
<title>安监执法管理系统</title>
<script language="JavaScript" src="../js/publics.js"></script>
<script language="JavaScript" src="../js/function.js"></script>
<script src="../js/functionforcheck.js"></script>
<script type="text/javascript" src="../js/jqueryjs/jquery-1.10.2.min.js"></script>
<script language="JavaScript" src="../js/aj/calendar.js"></script>
<script src="../js/aj/functionforcheck.js"></script>
<script language="JavaScript" src="../js/textAreaAutoLine.js"></script>
<script language="JavaScript" src="../js/common.js"></script>
<script language = "javascript" src = "../js/Lprint.js"></script>
<script language="javascript" src="../js/LodopFuncs.js"></script>
<link rel="stylesheet" type="text/css" href="../themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../themes/icon.css">
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<object id="LODOP" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
 <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0 pluginspage="../js/install_lodop.exe"></embed>
</object> 
</script>
</head>
<!--提示框样式表，清除原来写在标签上的样式，统一调用样式表。此处样式表可以加到整个样式文件里。 -->
<style> 
#tipswarp{
 left:30px;
 POSITION:absolute;
 top:230px; 
 width:165px; 
 z-index:99;
 }
#tipstop{
 height:30px;   
 border-bottom:#ccc 1px solid;
 width:165px;
 }
#tipstop strong{
 text-indent:8px;
 color:#c51704; 
 font-size:14px;
 float:left;
 font-weight:bold;
 line-height:30px;
 text-align:left;
 }
#tipstop span{
 float:right; 
 padding-right:3px; 
 font-size:12px; 
 color:#9a9a9a; 
 cursor:pointer;
 line-height:30px; 
 }
#tipsbody{
 padding:8px;
 line-height:23px; 
 color:#555; 
 font-size:12px; 
 height:300px; 
 clear:both;
 text-indent:2em;
 overflow:auto;
 }
.breakline{
 background-color:#ccc; 
 height:1px; 
 margin:5px 0; 
 line-height:1px; 
 font-size:1px;
 }
</style>
<style type="text/css"> 
#floatlayer{position:absolute;width:165px;height:300px;}
.ctbox{ position:absolute;width:165px;height:300px;border:1px #888 solid;-moz-opacity:0.7;opacity:0.7;filter:alpha(opacity=70);display:block;}
.ctbox div{width:165px;height:300px;background:#dcebfc;}
.a_ct{position:absolute;width:165px;height:264px;overflow:scroll; overflow-x: hidden; color:#000;text-decoration:none; line-height:18px; display:block;}
</style>
<!--样式表结束-->
<!--脚本开始-->
<script type="text/javascript"> 
alert("本系统将于17：30进行更新维护，届时系统将暂时关闭，特此通知");
/*$(document).bind('click',function(e){ 
var e = e || window.event; //浏览器兼容性 
var elem = e.target || e.srcElement; 
while (elem) { //循环判断至跟节点，防止点击的是div子元素 
if (elem.id && elem.id=='win') { 
return; 
} 
elem = elem.parentNode; 
} 

$('#win').css('display','none'); //点击的不是div或其子元素 
}); */
</script> 
<script language="javascript"> 
/*套打预览*/
 var LODOP; //声明为全局变量
 function CreateDataBill(iftaoda){
 document.getElementById("_fieldvalue_sp_f250").value=document.getElementById("spF250").value;
document.getElementById("_fieldvalue_comaddress").value=document.getElementById("dizhi1").value+document.getElementById("dizhi2").value+document.getElementById("dizhi3").value;
document.getElementById("_fieldvalue_name").value=document.getElementById("farenname").value;
  /*获取变量*/
 var _fieldvalue_sp_f250Value=document.myform_sp_t49._fieldvalue_sp_f250.value;
    var _fieldvalue_comaddressValue=document.myform_sp_t49._fieldvalue_comaddress.value;
    var _fieldvalue_nameValue=document.myform_sp_t49._fieldvalue_name.value;
    var _fieldvalue_zhiwuValue=document.getElementById("_fieldvalue_zhiwu").value;
    var _fieldvalue_phoneValue=document.getElementById("_fieldvalue_phone").value;
    var _fieldvalue_changsuoValue=document.getElementById("_fieldvalue_changsuo").value;
    var cdyYearValue=document.myform_sp_t49.cdyYear.value;
    var cdyMonthValue=document.myform_sp_t49.cdyMonth.value;
    var cdyDayValue=document.myform_sp_t49.cdyDay.value;
    var cdyHour01Value=document.myform_sp_t49.cdyHour01.value;
    var cdyMinute01Value=document.myform_sp_t49.cdyMinute01.value;
    var cdyDay02Value=document.myform_sp_t49.cdyDay02.value;
    var cdyHour02Value=document.myform_sp_t49.cdyHour02.value;
    var cdyMinute02Value=document.myform_sp_t49.cdyMinute02.value;

    var _fieldvalue_jcneirongValue=document.getElementById("_fieldvalue_jcneirong").value; 
	_fieldvalue_jcneirongValue=_fieldvalue_jcneirongValue.replace(/（企业资质类）/g,"");
	_fieldvalue_jcneirongValue=_fieldvalue_jcneirongValue.replace(/（人员资质类）/g,"");
	_fieldvalue_jcneirongValue=_fieldvalue_jcneirongValue.replace(/（制度类）/g,"");
	_fieldvalue_jcneirongValue=_fieldvalue_jcneirongValue.replace(/（电气类）/g,"");
	_fieldvalue_jcneirongValue=_fieldvalue_jcneirongValue.replace(/（燃气类）/g,"");
	_fieldvalue_jcneirongValue=_fieldvalue_jcneirongValue.replace(/（应急疏散类）/g,"");
	_fieldvalue_jcneirongValue=_fieldvalue_jcneirongValue.replace(/（消防类）/g,"");
	_fieldvalue_jcneirongValue=_fieldvalue_jcneirongValue.replace(/（特种设备类）/g,"");
	_fieldvalue_jcneirongValue=_fieldvalue_jcneirongValue.replace(/（作业防护类）/g,"");
	_fieldvalue_jcneirongValue=_fieldvalue_jcneirongValue.replace(/（个人防护类）/g,"");
	_fieldvalue_jcneirongValue=_fieldvalue_jcneirongValue.replace(/（机械设备类）/g,"");
	_fieldvalue_jcneirongValue=_fieldvalue_jcneirongValue.replace(/（危险化学品类）/g,"");
	_fieldvalue_jcneirongValue=_fieldvalue_jcneirongValue.replace(/（矿山类）/g,"");
	_fieldvalue_jcneirongValue=_fieldvalue_jcneirongValue.replace(/（应急预案类）/g,"");
	_fieldvalue_jcneirongValue=_fieldvalue_jcneirongValue.replace(/（其它类）/g,"");
    var yearValue=document.myform_sp_t49.year.value;
    var monthValue=document.myform_sp_t49.month.value;
    var dayValue=document.myform_sp_t49.day.value;
 var len=document.getElementById("_fieldvalue_jcneirong").createTextRange().getClientRects();//获取存在问题行数
  
  /***************var变量**************/
  var app_name = document.getElementById("app_name").value;
  var mail_address = document.getElementById("mail_address").value;
  var telephone = document.getElementById("telephone").value;
  var postcode1 = document.getElementById("postcode").value.substring(0,1);
  var postcode2 = document.getElementById("postcode").value.substring(1,2);
  var postcode3 = document.getElementById("postcode").value.substring(2,3);
  var postcode4 = document.getElementById("postcode").value.substring(3,4);
  var postcode5 = document.getElementById("postcode").value.substring(4,5);
  var postcode6 = document.getElementById("postcode").value.substring(5,6);
  
  /****************结束***************/
  /*打印预览*/
  LODOP=getLodop(document.getElementById('LODOP'),document.getElementById('LODOP_EM'));
//  LODOP.PRINT_INITA(0,0,800,1107,"");
	LODOP.PRINT_INITA(0,0,1700,1000,"");
    LODOP.ADD_PRINT_SETUP_BKIMG("<img border='0' src='../images/ems-img1.png'>");
//  LODOP.SET_SHOW_MODE("BKIMG_WIDTH",753);
//  LODOP.SET_SHOW_MODE("BKIMG_HEIGHT",1030);
	LODOP.SET_SHOW_MODE("BKIMG_WIDTH",1873);
	LODOP.SET_SHOW_MODE("BKIMG_HEIGHT",1030);
  if(iftaoda==1){
	
  }else{
    LODOP.SET_SHOW_MODE("BKIMG_IN_PREVIEW",true);
  LODOP.SET_SHOW_MODE("BKIMG_PRINT",true);
  }

  //LODOP.ADD_PRINT_IMAGE(1,1,753,1092,"<img border='0' src='../images/16B/16B/xcjc.png'>");
  //LODOP.SET_PRINT_STYLEA(0,"Stretch",2);//按原图比例(不变形)缩放模式
  LODOP.ADD_PRINT_TEXT(271,269,355,32,"北京市人民政府法制办公室");
LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
LODOP.ADD_PRINT_TEXT(313,228,590,34,"北京市西城区槐柏树街2号");
LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
LODOP.ADD_PRINT_TEXT(218,591,216,30,"010-12345678");
LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
LODOP.ADD_PRINT_TEXT(390,715,20,30,"1");
LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
LODOP.ADD_PRINT_TEXT(390,757,20,30,"0");
LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
LODOP.ADD_PRINT_TEXT(389,801,18,31,"0");
LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
LODOP.ADD_PRINT_TEXT(392,844,21,31,"1");
LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
LODOP.ADD_PRINT_TEXT(393,883,20,29,"0");
LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
LODOP.ADD_PRINT_TEXT(394,927,20,28,"0");
LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
LODOP.ADD_PRINT_TEXT(471,247,142,30,app_name);
LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
LODOP.ADD_PRINT_TEXT(222,248,131,30,"庞雷");
LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
LODOP.ADD_PRINT_TEXT(466,592,190,30,telephone);
LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
LODOP.ADD_PRINT_TEXT(521,274,357,35,"太极计算机股份有限公司");
LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
LODOP.ADD_PRINT_TEXT(567,226,706,35,mail_address);
LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
LODOP.ADD_PRINT_TEXT(694,717,22,30,postcode1);
LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
LODOP.ADD_PRINT_TEXT(693,762,19,31,postcode2);
LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
LODOP.ADD_PRINT_TEXT(693,801,21,31,postcode3);
LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
LODOP.ADD_PRINT_TEXT(691,886,23,31,postcode5);
LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
LODOP.ADD_PRINT_TEXT(692,846,21,30,postcode4);
LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
LODOP.ADD_PRINT_TEXT(694,929,22,30,postcode6);
LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
 /*判断是否有续页*/
 if(len.length>8){
  alert("文书内容过长，已产生续页，点击续页可打印续页");
  var wtstr=newtext(1,8,"_fieldvalue_jcneirong");
wtstr="              "+wtstr;
  var wtstrxy=newtext(9,len.length,"_fieldvalue_jcneirong");
  LODOP.ADD_PRINT_TEXT(365,95,553,397,wtstr);
  LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
  LODOP.SET_PRINT_STYLEA(0,"FontSize",11);
  LODOP.SET_PRINT_STYLEA(0,"LineSpacing",10);
 /*第一页页码*/
 LODOP.ADD_PRINT_TEXT(903,525,23,20,"2");
 LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
 //LODOP.SET_PRINT_STYLEA(0,"ItemType",3);
 LODOP.ADD_PRINT_TEXT(904,590,23,20,"1");
 LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
 //LODOP.SET_PRINT_STYLEA(0,"ItemType",2);
 }
  else{
//   LODOP.ADD_PRINT_TEXT(365,95,553,397,"              "+_fieldvalue_jcneirongValue);
   LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
   LODOP.SET_PRINT_STYLEA(0,"FontSize",11);
   LODOP.SET_PRINT_STYLEA(0,"LineSpacing",10);
   LODOP.ADD_PRINT_TEXT(903,525,23,20,"1");
   LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
   LODOP.ADD_PRINT_TEXT(904,590,23,20,"1");
   LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
  
  }
};
/*续页调用方法*/
function CreateDataBillxy(){
  var yearValue=document.myform_sp_t49.year.value;
  
  var monthValue=document.myform_sp_t49.month.value;
  var dayValue=document.myform_sp_t49.day.value;
 var len=document.getElementById("_fieldvalue_jcneirong").createTextRange().getClientRects();
 var wtstrxy=newtext(9,len.length,"_fieldvalue_jcneirong");
 
 LODOP=getLodop(document.getElementById('LODOP'),document.getElementById('LODOP_EM'));
 LODOP.PRINT_INITA(0,0,800,1107,"");
 LODOP.ADD_PRINT_SETUP_BKIMG("<img border='0' src='../images/16B/wsxy.png'>");
 LODOP.SET_SHOW_MODE("BKIMG_WIDTH",753);
 LODOP.SET_SHOW_MODE("BKIMG_HEIGHT",1092);
	LODOP.SET_SHOW_MODE("BKIMG_IN_PREVIEW",true);
 LODOP.SET_SHOW_MODE("BKIMG_PRINT",true);
 
 
 //LODOP.ADD_PRINT_IMAGE(1,1,753,1092,"<img border='0' src='../images/16B/wsxy.png'>");
 //LODOP.SET_PRINT_STYLEA(0,"Stretch",2);//按原图比例(不变形)缩放模式
 LODOP.ADD_PRINT_TEXT(125,104,570,727,wtstrxy);
   LODOP.SET_PRINT_STYLEA(0,"FontName","仿宋");
 LODOP.SET_PRINT_STYLEA(0,"FontSize",11);
 LODOP.SET_PRINT_STYLEA(0,"LineSpacing",11);
 LODOP.ADD_PRINT_TEXT(943,474,34,20,yearValue);
  LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
  LODOP.ADD_PRINT_TEXT(943,522,32,20,monthValue);
  LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
  LODOP.ADD_PRINT_TEXT(943,565,25,20,dayValue);
  LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
 LODOP.ADD_PRINT_TEXT(978,575,23,20,"2");
 LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
 LODOP.ADD_PRINT_TEXT(978,625,23,20,"2");
 LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
}
/*打印无续页*/
 function Preview() {
  CreateDataBill(1);
  //LODOP.PRINT();
  
  //LODOP.PREVIEW();
  
  LODOP.PRINT_DESIGN();
 };
 
 /*打印续页*/
 function Previewxy() {
  CreateDataBillxy();
  //LODOP.PREVIEW();
  LODOP.PRINT_DESIGN();
 //LODOP.PRINT();
 };
 
</script>
<script language="javascript"> 
function showTips()
 {
  if (document.getElementById("beijingCeng").style.display == "block" || document.getElementById("beijingCeng").style.display == ""){
   document.getElementById("beijingCeng").style.display ="none";
   document.getElementById("wenziCeng").style.display ="none";
   document.getElementById("btncls").innerText="展开";   
   }else
   {
 document.getElementById("beijingCeng").style.display ="block";
    document.getElementById("wenziCeng").style.display ="block";
    document.getElementById("btncls").innerText="收起";
   }
 }
  var tmp_sp_f58="";
 	 function changeDanweidizhi(){
		 if (document.getElementById("dizhi2")==null){
			 return;	
		  }
	      if (tmp_sp_f58==""){
	      	tmp_sp_f58=document.getElementById("dizhi2").outerHTML;
	      }  
	      document.getElementById("dizhi2").outerHTML=tmp_sp_f58; 
	      var str1=document.getElementById("dizhi1").options(document.getElementById("dizhi1").selectedIndex).title;
	      for(i=0;i<document.getElementById("dizhi2").length;){
	       	   str2=document.getElementById("dizhi2").options(i).title;
		       if (str2.indexOf(str1,0)!=0){
		         document.getElementById("dizhi2").remove(i);
		       }else{
		         i++;
		       }
	       }
	 }

function Preview1() {
  CreateDataBill(0);
  //LODOP.PRINT();
  //LODOP.PREVIEW();
  LODOP.PRINT_DESIGN();
 }
 function changeyue(){
	 var form=document.myform_sp_t49;
	form.month.value=form.cdyMonth.value;
 }
  function changeri(){
	  var form=document.myform_sp_t49;
	 form.day.value=form.cdyDay01.value
 }
  function Open_Dialog(id) { 
//document.getElementById('button1').onclick=function(){
   //delayCaoan1(id);
//}
$('#win').show(); 
$('#win').dialog({ 



}); 
$("#win").parent().appendTo("#dialog_target"); 

} 
function addXgzl(count){
	
	var id="divid"+count;
	//alert(id);
	//var obj = $("#"+id ); 
	$("#"+id).after("<div id='xgzl"+count+"'><input type ='hidden' name ='xgzluploadshunxu' value='"+count+"'/><input type ='file' name ='xgzlupload'/>"+
	"<a href='javascript:deleteLine(\"xgzl"+count+"\")'>删除</a></div>");
	
	
}
/*function addXgzl(){
	alert("11");
	var count=1;
	$("#xgzl").after("<input type ='hidden' name ='xgzluploadshunxu' value='"+count+"'/><input type ='file' name ='xgzlupload'/>");
}*/
function deleteLine(id){
	$("#"+id).remove();
}
</script>
<!--脚本结束-->
<body>

<form name="myform_sp_t49" enctype="multipart/form-data"  method="post"  >

<input name="app_name" id="app_name" type="hidden" value="${xzfyApp.app_name?default('')}" >
<input name="mail_address" id="mail_address" type="hidden" value="${xzfyApp.mail_address?default('')}" >
<input name="telephone" id="telephone" type="hidden" value="${xzfyApp.telephone?default('')}" >
<input name="postcode" id="postcode" type="hidden" value="${xzfyApp.postcode?default('')}" >


<textarea name=dotip_start style='display:none'>
<table border=0 cellpadding=0 cellspacing=0 width="100%%" height="100%%" bgcolor="#f1f1f1">
<tr> 

</tr>
</table>
</textarea>
<textarea name=dotip_end style='display:none'>&nbsp;</textarea>
 <!--提示框起始，此处以下ID不能变更，脚本在前面。-->

  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" id="control">   
   <tr>   
     <td class="yp_l">&nbsp;</td>
       <td class="yp_m"><span class="yp_home">您的位置</span><span>：</span><span class="yp_active"> 新增检查记录</span></td>
     <td class="yp_r">&nbsp;</td>
      </tr> 
    </table>  
    <!--您的位置表格结束-->
    <!--主体内容、列表显示区域。注意上边的区域定义必须保持-->
    <!--标题表格开始-->
  <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
    	<td align="center" ><img src="../${Session["_USER_STYLE_"].imagePath}/1-1.png"/></td>
    </tr>
  </table>
    <br>
	<div id="dialog_target"></div>
    <div id="xuyaoxiedeDIV">

    <table width="600" border="0" align="center" cellpadding="0"  cellspacing="0">
   <tr>
    <td height="50" align="center" class="word">安全生产现场检查记录</td>
   </tr>
   <tr>
    <td height="8" align="center">
     <table width="100%" align=center border="0" cellspacing="0" cellpadding="0">
      <tr>
       <td height="1" bgcolor="#000000"></td>
      </tr>
      <tr>
       <td height="2"></td>
      </tr>
      <tr>
       <td height="1" bgcolor="#000000"></td>
      </tr>
     </table>
    </td>
   </tr>
   <tr>
    <td height="37" align="center" class="word">
    </td>
   </tr>
   <tr>
    <td height="30">&nbsp;
     
    </td>
   </tr>
   <tr>
    <input name="ifxinzeng" id="ifxinzeng" type="hidden" value="${ifxinzeng?default('1')}" >
	<input name="_fieldvalue_sp_f250" id="_fieldvalue_sp_f250" type="hidden" value="${_fieldvalue_sp_f250?default("")}" >
	<input name="_fieldvalue_comaddress" id="_fieldvalue_comaddress" type="hidden" value="${_fieldvalue_comaddress?default("")}" >
	<input name="_fieldvalue_name" id="_fieldvalue_name" type="hidden" value="${_fieldvalue_name?default("")}"  >
 <input name="qiyeId" id="qiyeId" type="hidden" value="${qiyeId?default("")}" >
    <td height="30">
     被检查单位（<a href="../xzjc/xinzengJianchaListnew1.action?funcCode=${funcCode}&searchFlag=true&searchFlag1=1" target=_blank>点击添加</a>）：
     <input name="spF250" id="spF250"  type="text" class="input16-1" size="61" maxlength="100"  value="${spF250?default("")}"  value="" style="width:315px" Onchange="xiazaiajax();">
    <input  name="panduan_qiye" type="hidden"  id="panduan_qiye" value=""/>
</td>
   </tr>

   <tr>
   
    <td height="30">
     地 址：
    	 <select id="dizhi1" name="dizhi1" onchange="changeDanweidizhi();" style="width:100px" value="${dizhi1?default("")}">
        	<option value="" >请选择</option>
        	
        </select>
         <select id="dizhi2" name="dizhi2" style="width:150px" value="${dizhi2?default("")}">
        	<option value="" >请选择</option>
        	
        </select>
	 <input name="dizhi3" id="dizhi3" type="text" class="input16-1" size="61" maxlength="100"     style="width:200px" value="${dizhi3?default("")}">
	 <input  name="panduan_dizhi" type="hidden"   id="panduan_dizhi" value=""/>
    
    </td>
   </tr>
    <tr>
    <td height="30">
     法定代表人(负责人)：<input name="farenname" id="farenname" type="text" class="input16-1" size="61" maxlength="100"   value="${farenname?default("")}" style="width:300px" ><br>
     职务：<input name="spT49.zhiwu" type="text" class="input16-1" size="10" maxlength="50" id="_fieldvalue_zhiwu" style="width:100px" value="${_fieldvalue_zhiwu?default("")}" >联系电话：<input name="spT49.phone" id="_fieldvalue_phone" type="text" class="input16-1" maxLength="30" size=10    value="${_fieldvalue_phone?default("")}" >

    </td>
   </tr>
   <tr><!--<td>
					<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout" id="xgzl" is="1">
						<tr  class="trcolor">
						<td class="tdFormText" colspan="2" style="text-align:left;" >
						相关资料上传&nbsp;&nbsp;&nbsp;<input type="button"  class="button" value="添加一行" onClick="addXgzl()">
						</td>
						</tr>

					</table>
										</td>-->
</tr>
<tr style="display:none">
	<td style="display:none" >所属分类：<select id="spF837"  name='spF837' onchange="changeSuoshufenleiBig();"  style="display:none" >
			<option value='1'  title='quanbu'>全部</option>
			
		</select>
		

</tr>
<tr >
	<td>国民经济行业分类</td></tr>
<tr ><td>1、<select id="guominmen"  name="guominmen" onchange="getguominmen();" style="width:200">
		    <option value="" >未选择</option>
       		<option value="A"  >农、林、牧、渔业</option>
       		<option value="B"  >采矿业</option>
       		<option value="C"  >制造业</option>
       		<option value="D"  >电力、热力、燃气及水生产和供应业</option>
       		<option value="E"  >建筑业</option>
       		<option value="F"  >批发和零售业</option>
       		<option value="G"  >交通运输、仓储和邮政业</option>
       		<option value="H"  >住宿和餐饮业</option>
       		<option value="I"  >信息传输、软件和信息技术服务业</option>
       		<option value="J"  >金融业</option>
       		<option value="K"  >房地产业</option>
       		<option value="L"  >租赁和商务服务业</option>
       		<option value="M"  >科学研究和技术服务业</option>
       		<option value="N"  >水利、环境和公共设施管理业</option>
       		<option value="O"  >居民服务、修理和其他服务业</option>
       		<option value="P"  >教育</option>
       		<option value="Q"  >卫生和社会工作</option>
			<option value="R"  >文化、体育和娱乐业</option>
			<option value="S"  >公共管理、社会保障和社会组织</option>
			<option value="T"  >国际组织</option>
	</select>
	    2、<select name='guominda' id='guominda' onchange="getguominda();" style="width:200">

		<option value="" >请选择</option>

	    </select>
		</td>
		</tr>
		<tr>
		<td >
		3、<select name='guominzhong' id='guominzhong' onchange="getguominzhong();" style="width:200">

		<option value="" >请选择</option>

	    </select>
	    4、<select name='guominxiao' id='guominxiao' onchange="" style="width:200">

		<option value="" >请选择</option>

	    </select>
	</td>


</tr>
   <tr>
    <td height="30">
     检查场所：
     <input name="spT49.changsuo" id="_fieldvalue_changsuo" type="text" class="input16-1" size="58" maxlength="50" value="" style="width:500px">
    </td>
   </tr>
  <tr>
  <td>
		选择检查人员（点击横线空白处选择）
	<input name="lawerid1" id="lawerid1" type="text" class="input16-1" size="61" maxlength="100"  readonly="readonly"  value="" style="width:50px" onclick="window.open('../xzjc/zhifarenyuanSelectListnew2.action?funcCode=${funcCode}&type=1','newwindow')" >
 <input name="_fieldvalue_zhengjianid1" id="_fieldvalue_zhengjianid1" type="hidden" value="" >
 <input name="_fieldvalue_zhengjianhaoma1" id="_fieldvalue_zhengjianhaoma1" type="hidden" value="" >
     、<input name="lawerid2" id="lawerid2" type="text" class="input16-1" size="61" maxlength="100"  readonly="readonly"  value="" style="width:50px" onclick="window.open('../xzjc/zhifarenyuanSelectListnew2.action?funcCode=${funcCode}&type=2','newwindow')">
 <input name="_fieldvalue_zhengjianid2" id="_fieldvalue_zhengjianid2" type="hidden" value="" >
 <input name="_fieldvalue_zhengjianhaoma2" id="_fieldvalue_zhengjianhaoma2" type="hidden" value="" >
  </td>
  </tr>
   <tr>
    <td height="30">
     检查时间：
     <input name="cdyYear" id="cdyYear" type="text" class="input16-1" id="cdn1" value="" size="4" maxlength=4 style="width:40px" >年
     <input name="cdyMonth" id="cdyMonth" type="text" class="input16-1" id="cdy1" value="" size="2" maxlength=2 style="width:30px" onBlur="addZero1(this)" onchange="javascript:changeyue();">月
     <input name="cdyDay" id="cdyDay01" type="text" class="input16-1" id="cdr1" value="" size="2" maxlength=2 style="width:30px" onBlur="addZero1(this)" onchange="javascript:changeri();">日
     <input id="cdyHour01" name="cdyHour01" type="text" class="input16-1" size="2" maxlength=2 style="width:30px" onBlur="addZero1(this)" value="${cdyHour01?default('')}">时
     <input id="cdyMinute01" name="cdyMinute01" type="text" class="input16-1" size="2" maxlength=2 style="width:30px" onBlur="addZero1(this)" value="${cdyMinute01?default('')}">分至
     <input id="cdy2" name="cdy" type="hidden" class="input16-1" size="2" maxlength=2 >
     <input id="cdyDay02" name="cdyDay02" type="text" class="input16-1" size="2" maxlength=2 style="width:30px" onBlur="addZero1(this)">日
     <input id="cdyHour02" name="cdyHour02" type="text" class="input16-1" size="2" maxlength=2 style="width:30px" onBlur="addZero1(this)">时
     <input id="cdyMinute02" name="cdyMinute02" type="text" class="input16-1" size="2" maxlength=2 style="width:30px" onBlur="addZero1(this)">分
     
    </td>
   </tr>

   
  <tr>
    <td height="30">
      　　检查情况：<a href="javascript:Open_Dialog('2');">添加隐患</a>
    </td>
   </tr>
   <tr>
<div id="dialog_target"></div>

    <input name="yinhuanshu" id="yinhuanshu" type="hidden" value="0" >
	<input name="paixu" id="paixu" type="hidden" value="0" >
	<input name="yinhuan" id="yinhuan" type="hidden" value="" >
	<input name="yinhuanzhenggai" id="yinhuanzhenggai" type="hidden" value="" >
   <div id="win" style="display:none;padding:5px;width:500px;height:800px;" title="添加隐患">
<input id="txRoleID" type="hidden" runat="server" value="0" /> 
	请填写隐患描述：<br>
	<input name="yinhuanneirong" id="yinhuanneirong" value="请填写检查情况" style="width:300px;" onclick="clearthis();"><br>请选择隐患类别：<br>
	
	<br><font color="red" size="4">安全管理类</font><br>
	<input type="radio" name="yinhuanleixing" value="1" checked="checked"/>生产经营单位资质证照类<br>
	<input type="radio" name="yinhuanleixing" value="2" />安全组织机构及安全管理人员配置类<br>
	<input type="radio" name="yinhuanleixing" value="3" />安全生产责任制类<br>
	<input type="radio" name="yinhuanleixing" value="4" />安全管理制度类<br>
	<input type="radio" name="yinhuanleixing" value="5" />操作规程类<br>
	<input type="radio" name="yinhuanleixing" value="6" />安全生产记录档案类<br>
	<input type="radio" name="yinhuanleixing" value="7" />应急救援预案与实施类<br>
	<input type="radio" name="yinhuanleixing" value="8" />相关方管理类<br>
	<input type="radio" name="yinhuanleixing" value="9" />其他安全管理类<br>
	<br>
	<font color="red" size="4">设备设施类</font><br>
	<input type="radio" name="yinhuanleixing" value="10" />物料类<br>
	<input type="radio" name="yinhuanleixing" value="11" />平面布置类<br>
	<input type="radio" name="yinhuanleixing" value="12" />建（构）筑物类<br>
	<input type="radio" name="yinhuanleixing" value="13" />工艺及生产工具类<br>
	<input type="radio" name="yinhuanleixing" value="14" />安全设备设施类<br>
	<input type="radio" name="yinhuanleixing" value="15" />辅助系统设备设施类<br>
	<input type="radio" name="yinhuanleixing" value="16" />个人防护用品使用类<br>
	<input type="radio" name="yinhuanleixing" value="17" />其他设备设施类<br>
	<br>
	<font color="red" size="4">从业人员类</font><br>
	<input type="radio" name="yinhuanleixing" value="18" />从业人员资格资质类<br>
	<input type="radio" name="yinhuanleixing" value="19" />从业人员教育培训类<br>
	<input type="radio" name="yinhuanleixing" value="20" />从业人员操作行为类<br>
	<input type="radio" name="yinhuanleixing" value="21" />其他从业人员类<br>
	<br>
	<font color="red" size="4">场所环境类</font><br>
	<input type="radio" name="yinhuanleixing" value="22" />作业环境类<br>
	<input type="radio" name="yinhuanleixing" value="23" />安全出口及疏散通道类<br>
	<input type="radio" name="yinhuanleixing" value="24" />安全标志及标识类<br>
	<input type="radio" name="yinhuanleixing" value="25" />周边环境类<br>
	<input type="radio" name="yinhuanleixing" value="26" />其他场所环境类<br>	
	
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:closeLogin();">添加</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:guanbi();">提交</a>（隐患类型不可修改）
	<br><textarea class="text-style" style="height:270px;width:420px;"  name="jcneirongxin" id="jcneirongxin" style="display:none" >检查当日，未发现明显安全问题隐患。</textarea>




   </div>
<script>
function openLogin(){
 document.getElementById('win').style.left = (document.body.offsetWidth - 540) / 2; 
 document.getElementById('win').style.top = (document.body.offsetHeight - 170) / 2 + document.body.scrollTop;
 if(document.getElementById("paixu").value=="0"){
  document.getElementById("_fieldvalue_jcneirong").value="经过本次检查，发现如下安全隐患：";
 }

   document.getElementById("win").style.display="";
}

function closeLogin(){


	var pai=document.getElementById("paixu").value;
	var paipai=parseInt(pai);
	paipai+=1;
	document.getElementById("paixu").value=paipai.toString();
	pai=document.getElementById("paixu").value;
	
	var shu=document.getElementById("yinhuanshu").value;
	var shushu=parseInt(shu);
	shushu+=1;
	document.getElementById("yinhuanshu").value=shushu.toString();
	var bb=document.getElementById("yinhuanneirong").value;
	var leixing="";	
	var radios = document.getElementsByName("yinhuanleixing");
	for (var x=0; x<radios.length; x++) {
		if(radios[x].checked==true){
			if(radios[x].value=="1"){
				leixing="生产经营单位资质证照类";
			}
			if(radios[x].value=="2"){
				leixing="安全组织机构及安全管理人员配置类";
			}
			if(radios[x].value=="3"){
				leixing="安全生产责任制类";
			}
			if(radios[x].value=="4"){
				leixing="安全管理制度类";
			}
			if(radios[x].value=="5"){
				leixing="操作规程类";
			}
			if(radios[x].value=="6"){
				leixing="安全生产记录档案类";
			}
			if(radios[x].value=="7"){
				leixing="应急救援预案与实施类";
			}
			if(radios[x].value=="8"){
				leixing="相关方管理类";
			}
			if(radios[x].value=="9"){
				leixing="其他安全管理类";
			}
			if(radios[x].value=="10"){
				leixing="物料类";
			}
			if(radios[x].value=="11"){
				leixing="平面布置类";
			}
			if(radios[x].value=="12"){
				leixing="建（构）筑物类";
			}
			if(radios[x].value=="13"){
				leixing="工艺及生产工具类";
			}
			if(radios[x].value=="14"){
				leixing="安全设备设施类";
			}
			if(radios[x].value=="15"){
				leixing="辅助系统设备设施类";
			}
			if(radios[x].value=="16"){
				leixing="个人防护用品使用类";
			}
			if(radios[x].value=="17"){
				leixing="其他设备设施类";
			}
			if(radios[x].value=="18"){
				leixing="从业人员资格资质类";
			}
			if(radios[x].value=="19"){
				leixing="从业人员教育培训类";
			}
			if(radios[x].value=="20"){
				leixing="从业人员操作行为类";
			}
			if(radios[x].value=="21"){
				leixing="其他从业人员类";
			}
			if(radios[x].value=="22"){
				leixing="作业环境类";
			}
			if(radios[x].value=="23"){
				leixing="安全出口及疏散通道类";
			}
			if(radios[x].value=="24"){
				leixing="安全标志及标识类";
			}
			if(radios[x].value=="25"){
				leixing="周边环境类";
			}
			if(radios[x].value=="26"){
				leixing="其他场所环境类";
			}

		}
	}
	var zuhe="\r\n"+pai+"、"+bb+"（"+leixing+"）。";
	var zuhe1=bb+"（"+leixing+"）。";
	var neirong;
	if(document.getElementById("yinhuanshu").value=="1"){
		neirong=zuhe1;
	}else{
		neirong=document.getElementById("yinhuan").value;
		neirong=neirong+"==";
		neirong=neirong+zuhe1;
	}
	document.getElementById("yinhuan").value=neirong;
	document.getElementById("yinhuanzhenggai").value=neirong;
	var aa=document.getElementById("_fieldvalue_jcneirong").value;
	aa=aa+zuhe;
	document.getElementById("_fieldvalue_jcneirong").value=aa;

	var pp="<div  id='divid"+document.getElementById("paixu").value+"' ><br><input  style='width:150px' name='neirong11' id='neirong11"+document.getElementById("paixu").value+"' type='text' class='' value='"+bb+"' > <input name='leixing11' id='leixing11"+document.getElementById("paixu").value+"' type='text' class='' value='（"+leixing+"）' onclick=''  readonly='readonly'> <a  id='shanchu11"+document.getElementById("paixu").value+"' href=javascript:shanchu(\'neirong11"+document.getElementById("paixu").value+"\',\'leixing11"+document.getElementById("paixu").value+"\',\'shanchu11"+document.getElementById("paixu").value+"\',\'divid"+document.getElementById("paixu").value+"\');>删除</a><input type='button'   value='上传证据' onclick=addXgzl('"+document.getElementById("paixu").value+"')></div>";
	
	$('#win').after(pp); 
	var neirongxiugai = document.getElementsByName("neirong11");
	var leixingxiugai = document.getElementsByName("leixing11");
	var neirongxiugai1;
	var neirongshiji=document.getElementById("jcneirongxin").value;
	for (var x=0; x<neirongxiugai.length; x++) {
	var zuhexin=neirongxiugai[x].value+leixingxiugai[x].value;
	var xuhao=x+1;
	var zuhe1xin="\r\n"+xuhao.toString()+"、"+neirongxiugai[x].value+leixingxiugai[x].value;
		if(x==0){
			neirongxiugai1=zuhexin;
			
			neirongshiji="经过本次检查，发现如下安全隐患：";
		}else{
			neirongxiugai1=neirongxiugai1+"==";
			neirongxiugai1=neirongxiugai1+zuhexin;
		}
		neirongshiji+=zuhe1xin;
		
	}
	document.getElementById("yinhuan").value=neirongxiugai1;
	document.getElementById("yinhuanzhenggai").value=neirongxiugai1;
	document.getElementById("jcneirongxin").value=neirongshiji;
   //document.getElementById("win").style.display="none";
}
function xiugaineirong(){
	var neirongxiugai = document.getElementsByName("neirong11");
	var leixingxiugai = document.getElementsByName("leixing11");
	var neirongxiugai1;
	var neirongshiji=document.getElementById("jcneirongxin").value;
	for (var x=0; x<neirongxiugai.length; x++) {
	var zuhexin=neirongxiugai[x].value+leixingxiugai[x].value;
	var xuhao=x+1;
	var zuhe1xin="\r\n"+xuhao.toString()+"、"+neirongxiugai[x].value+leixingxiugai[x].value;
		if(x==0){
			neirongxiugai1=zuhexin;
			
			neirongshiji="经过本次检查，发现如下安全隐患：";
		}else{
			neirongxiugai1=neirongxiugai1+"==";
			neirongxiugai1=neirongxiugai1+zuhexin;
		}
		neirongshiji+=zuhe1xin;
		
	}
	document.getElementById("yinhuan").value=neirongxiugai1;
	document.getElementById("yinhuanzhenggai").value=neirongxiugai1;
	document.getElementById("_fieldvalue_jcneirong").value=neirongshiji;
}
function guanbi(){
	xiugaineirong();	//document.getElementById("_fieldvalue_jcneirong").value=document.getElementById("jcneirongxin").value;
	//document.getElementById("win").style.display="none";
	$('#win').dialog('close');
}
function shanchu(id1,id2,id3,id4){
	document.getElementById(id4).removeChild(document.getElementById(id1));
	document.getElementById(id4).removeChild(document.getElementById(id2));
	document.getElementById(id4).removeChild(document.getElementById(id3));
	document.getElementById("win").removeChild(document.getElementById(id4));
}
</script>
    <td height="19" >
	    <div style="position:absolute; width:595px;">
	          <textarea class="text-style" style="height:470px;width:595px;"  name="spT49.jcneirong" id="_fieldvalue_jcneirong" cols="45" rows="5" >检查当日，未发现明显安全问题隐患。</textarea>
	          <div style="position:absolute; width:100%; border-bottom:1px solid #000; left: 1px; top: 0px;"></div>
			  <div style="position:absolute; width:100%; border-bottom:1px solid #000; left: 1px; top: 432px;"></div>
			  <div style="position:absolute; width:100%; border-bottom:1px solid #000; left: 1px; top: 393px;"></div>
			  <div style="position:absolute; width:100%; border-bottom:1px solid #000; left: 1px; top: 354px;"></div>
			  <div style="position:absolute; width:100%; border-bottom:1px solid #000; left: 1px; top: 315px;"></div>
	          <div style="position:absolute; width:100%; border-bottom:1px solid #000; left:1px; top: 276px;"></div>
	          <div style="position:absolute; width:100%; border-bottom:1px solid #000; left:2px; top: 237px;"></div>
	          <div style="position:absolute; width:100%; border-bottom:1px solid #000; left:2px; top: 198px;"></div>
	          <div style="position:absolute; width:100%; border-bottom:1px solid #000; left:2px; top: 159px;"></div>
	          <div style="position:absolute; width:100%; border-bottom:1px solid #000; left:2px; top: 120px;"></div>
	          <div style="position:absolute; width:100%; border-bottom:1px solid #000; left:3px; top: 80px;"></div>
	          <div style="position:absolute; width:100%; border-bottom:1px solid #000; left:2px; top: 40px;"></div>
	     </div>
	</td>
       
    <td></td>
   </tr>
   <tr>
    <td height="470">&nbsp;
    </td>
   </tr>
   
   <!--检查列表-->
   <tr> 
    <td height="30" nowrap>　　检查人员（签名）：<input name="qm1" type="text" readonly class="input16-1" size="14"> 证号：<input name="qm2" type="text" readonly class="input16-1" size="14"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="qm3" type="text" readonly class="input16-1" size="14"> 证号：<input name="qm4" type="text" readonly class="input16-1" size="14">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red"><div id=idControls class="noprint">　　（不需填写，请打印后手签）</div></font>
    </td>
 
   </tr>
   <tr>
    <td height="30">
     　　被检查单位负责人（签名）：
     <input name="responsibleName" type="text" readonly class="input16-1" value=""    size="18">
    </td>
   </tr>
   <tr>
    <td align="right">
     <input name="year" id="year" type="text" class="margin-0"  style="border:0px;width:40px;text-align:center;"  value=2012  size="3">
     年
      <input name="month" id="month" type="text" class="margin-0" style="border:0px;width:40px;text-align:center;"  value=1  size="3" onBlur="addZero1(this)">
     月
      <input name="day" id="day" type="text" class="margin-0" style="border:0px;width:40px;text-align:center;" value=1 size="3" onBlur="addZero1(this)">
     日
    </td>
   </tr>
   <tr>
        <td height="15" align="left" valign="middle" class="word-fs  line-height-30"><img src="../images/16B/line-2.gif" width="100%" height="3" /></td>
      </tr>
      <tr>
        <td align="right" valign="bottom" class=" word-fs-13" >共
	        <span class="word-fs">
				<input name="count" class="margin-0" readonly style="border:0px;width:20px;" value="1" />
			</span>
			页 第
			<span class="word-fs">
				<input name="num" class="margin-0" readonly style="border:0px;width:20px;" value="1" />
			</span>页
		</td>
      </tr>
	  <tr>
	  <td align="right" valign="bottom" class=" word-fs-13" >
	  <a href="javascript:Previewxy()">续页</a>
	  </td>
	  </tr>
    <tr>
       <td align="center">
    
      </td> 
  </tr>
    <br>
   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0"  style="border-top:1px solid #b9d6f9;border-left:1px solid #b9d6f9;border-right:1px solid #b9d6f9; height:5px;">
     <tr>
     <td></td>
    </tr>
</table></div>
  <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
      <tr>
        <td align="center">
			<a href="javascript:Preview1()"><img src="../images/16B/btn_ico_print.png" alt="打印" width="60" height="22" border="0" /> </a> 
			<a href="javascript:Preview()"><img src="../images/16B/btn_ico_taoprint.png" alt="套打" width="60" height="22" border="0" /> </a>		
			<!--<img src="../images/16B/btn_ico_save.png" alt="保存" width="60" height="22" border="0" onclick="javascript:formCheck_submit1()" />-->
			<img src="../images/16B/btn_ico_submit.png" alt="提交"  width="60" height="22" border="0" onclick="javascript:formCheck_submit()" />   
		</td>
      </tr>
   <tr>
   </tr>
   
    </table>

<input type="hidden" name="ifqigaibian" id="ifqigaibian" />
<input type="hidden" name="jcStartDate" id="jcStartDate" />
<input type="hidden" name="jcEndDate" id="jcEndDate" />
<input type="hidden" name="xcjcjlwsDate" id="xcjcjlwsDate" />
<input type="hidden" name="jianchawenshu" id="jianchawenshu" />
<input type="hidden" name="xcjcStart" id="xcjcStart" />
<input type="hidden" name="_fieldvalue_changsuo" id="_fieldvalue_changsuo1" />
<input type="hidden" name="_fieldvalue_zhiwu" id="_fieldvalue_zhiwu1" />
<input type="hidden" name="_fieldvalue_phone" id="_fieldvalue_phone1" />
<input type="hidden" name="_fieldvalue_jcneirong1" id="_fieldvalue_jcneirong1" />
</form>
 <script language=javascript>
 


	
 </script>

<script language=javascript> 
function getCurrentDateStr()
{
var myDate = new Date();
var year = myDate.getFullYear();    //获取完整的年份(4位,1970-????)
var month = myDate.getMonth()+1;   //获取当前月份(0-11,0代表1月) 
if(month<10) 
{
 month='0'+month;
}  
var day = myDate.getDate();        //获取当前日(1-31)
if(day<10) 
{
 day='0'+day;
}  
myDate.getDay();         //获取当前星期X(0-6,0代表星期天)
myDate.getTime();        //获取当前时间(从1970.1.1开始的毫秒数)
var hour = myDate.getHours();       //获取当前小时数(0-23)
if(hour<10) 
{
 hour='0'+hour;
}  
var minute = myDate.getMinutes();     //获取当前分钟数(0-59)
if(minute<10) 
{
 minute='0'+minute;
}  
var second = myDate.getSeconds();     //获取当前秒数(0-59)
if(second<10) 
{
 second='0'+second;
}  
myDate.getMilliseconds();    //获取当前毫秒数(0-999)
myDate.toLocaleDateString();     //获取当前日期
var mytime=myDate.toLocaleTimeString();     //获取当前时间
myDate.toLocaleString( );        //获取日期与时间
var dateStr =year+'-'+month+'-'+day+'  '+hour+':'+minute+':'+second;
return dateStr;
}
function Validate_sp_t49(obj,canshu)
{
	var form=document.myform_sp_t49;
	var flag=ifchange();
	if(flag==1){
		document.getElementById("ifqigaibian").value=flag;
	}
	//检查开始时间
	var jcStartDate=form.cdyYear.value+'-'+form.cdyMonth.value+'-'+form.cdyDay01.value+'-'+form.cdyHour01.value+'-'+form.cdyMinute01.value;
	document.getElementById("jcStartDate").value=jcStartDate;
	//检查结束时间
	var jcEndDate=form.cdyYear.value+'-'+form.cdyMonth.value+'-'+form.cdyDay02.value+'-'+form.cdyHour02.value+'-'+form.cdyMinute02.value;
	document.getElementById("jcEndDate").value=jcEndDate;
	//现场检查记录文书时间
	var xcjcjlwsDate=form.year.value+'-'+form.month.value+'-'+form.day.value;
	//var xcjcjlwsDate=form.cdyYear.value+'-'+form.cdyMonth.value+'-'+form.cdyDay01.value;
	document.getElementById("xcjcjlwsDate").value=xcjcjlwsDate;
	//检查文书
	var jianchawenshu=document.getElementById('xuyaoxiedeDIV').innerHTML;
	document.getElementById("jianchawenshu").value=jianchawenshu;
	var xcjcStart=form.cdyYear.value+'年'+form.cdyMonth.value+'月'+form.cdyDay01.value+'日'+form.cdyHour01.value+'时'+form.cdyMinute01.value+"分";
	document.getElementById("xcjcStart").value=xcjcStart;
	document.getElementById("_fieldvalue_changsuo1").value=document.getElementById("_fieldvalue_changsuo").value;
	document.getElementById("_fieldvalue_zhiwu1").value=document.getElementById("_fieldvalue_zhiwu").value;
	document.getElementById("_fieldvalue_phone1").value=document.getElementById("_fieldvalue_phone").value;
	document.getElementById("_fieldvalue_jcneirong1").value=document.getElementById("_fieldvalue_jcneirong").value;
	/*var qq=document.getElementsByName("xgzluploadshunxu1");
	var mm=document.getElementsByName("xgzlupload1");
	var id="myform_sp_t49";
	for(var pp=0;pp<qq.length;pp++){
			alert(qq[pp].value);

	var TemO=document.getElementById("myform_sp_t49");
var newInput = document.createElement("input");       
newInput.name="xgzluploadshunxu"; 
newInput.value=qq[pp].value;
TemO.appendChild(newInput);   
	}
		for(var pp=0;pp<qq.length;pp++){
		alert(mm[pp].value);
			var TemO1=document.getElementById("myform_sp_t49");
var newInput1 = document.createElement("input");       
newInput1.name="xgzlupload"; 
newInput1.type="file";
newInput1.value=mm[pp].value;
alert(newInput1.value);
TemO1.appendChild(newInput1); 
	}*/
	if(canshu=='tijiao'){
			window.myform_sp_t49.action="../xzjc/xcjcWenshuCreatenew1.action?funcCode=${funcCode}";
			window.myform_sp_t49.submit();
	}else{
		alert("保存成功");
					window.myform_sp_t49.action="../xzjc/xcjcWenshuSavenew.action?funcCode=${funcCode}";
			window.myform_sp_t49.submit();
	}
}
function Validate_sp_t491(obj,canshu)
{
	var form=document.myform_sp_t49;
	//检查开始时间
	var jcStartDate=form.cdyYear.value+'-'+form.cdyMonth.value+'-'+form.cdyDay01.value+'-'+form.cdyHour01.value+'-'+form.cdyMinute01.value;
	document.getElementById("jcStartDate").value=jcStartDate;
	//检查结束时间
	var jcEndDate=form.cdyYear.value+'-'+form.cdyMonth.value+'-'+form.cdyDay02.value+'-'+form.cdyHour02.value+'-'+form.cdyMinute02.value;
	document.getElementById("jcEndDate").value=jcEndDate;
	//现场检查记录文书时间
	var xcjcjlwsDate=form.year.value+'-'+form.month.value+'-'+form.day.value;
	//var xcjcjlwsDate=form.cdyYear.value+'-'+form.cdyMonth.value+'-'+form.cdyDay01.value;
	document.getElementById("xcjcjlwsDate").value=xcjcjlwsDate;
	//检查文书
	var jianchawenshu=document.getElementById('xuyaoxiedeDIV').innerHTML;
	document.getElementById("jianchawenshu").value=jianchawenshu;
	var xcjcStart=form.cdyYear.value+'年'+form.cdyMonth.value+'月'+form.cdyDay01.value+'日'+form.cdyHour01.value+'时'+form.cdyMinute01.value+"分";
	document.getElementById("xcjcStart").value=xcjcStart;
	document.getElementById("_fieldvalue_changsuo1").value=document.getElementById("_fieldvalue_changsuo").value;
	document.getElementById("_fieldvalue_zhiwu1").value=document.getElementById("_fieldvalue_zhiwu").value;
	document.getElementById("_fieldvalue_phone1").value=document.getElementById("_fieldvalue_phone").value;
	document.getElementById("_fieldvalue_jcneirong1").value=document.getElementById("_fieldvalue_jcneirong").value;

	if(canshu=='tijiao'){
			window.myform_sp_t49.action="../xzjc/xcjcWenshuCreatenew1.action?funcCode=${funcCode}";
			window.myform_sp_t49.submit();
	}else{
		alert("保存成功");
	  $.ajax({
   url:'../xzjc/xcjcWenshuSavenew.action?funcCode=${funcCode}'
   ,type:'POST'
   ,data:$(document.myform_sp_t49).serialize()
   ,success:function(data){
       ////不知道java，到底执行完action后返回什么。。自己根据action的返回值判断下data看是否正确执行了
   }
   ,error:function(){alert('发生错误');}
});
	}
}
function testDae(){
  var year11= document.getElementById("cdyYear").value;
  var month11 = document.getElementById("cdyMonth").value;
  var day11 = document.getElementById("cdyDay").value;  
  var hour11= document.getElementById("cdyHour01").value;
  var minute11= document.getElementById("cdyMinute01").value;
  var year12 = document.getElementById("cdy").value;
  var day12 = document.getElementById("cdyDay02").value;
  var month12 = document.getElementById("cdyHour02").value;
}
</script>
<script> 
function formCheck_submit(){
var check=checktime();
if(check==false)
return false;
 if(checkForm())
  {
      if(confirm("确定要提交吗？"))
     {
          Validate_sp_t49('P','tijiao');
     }
  }
}
function formCheck_submit1(){

          Validate_sp_t491('I','baocun');

}
//时间顺序校验
function checktime(){
var form=document.myform_sp_t49;
var date1= form.cdyYear.value+'-'+form.cdyMonth.value+'-'+form.cdyDay01.value+' '+form.cdyHour01.value+':'+form.cdyMinute01.value;
var date2=form.cdyYear.value+'-'+form.cdyMonth.value+'-'+form.cdyDay02.value+' '+form.cdyHour02.value+':'+form.cdyMinute02.value;
var pD=function(s){
 var dt=s.split(/ /);
 var d=dt[0].split(/-/);
 var t;
 if(dt[1]){
  t=dt[1].split(/:/);
  t.push(0);
  t.push(0);
 }else{
  t=[0,0,0];
 }
 return new Date(d[0],d[1]-1,d[2],t[0],t[1],t[2]);
};
var pS=function(d){
 var Y=d.getFullYear();
 var M=d.getMonth()+1;
 (M<10)&&(M='0'+M);
 var D=d.getDate();
 (D<10)&&(D='0'+D);
 var h=d.getHours();
 (h<10)&&(h='0'+h);
 var m=d.getMinutes();
 (m<10)&&(m='0'+m);
 var s=d.getSeconds();
 (s<10)&&(s='0'+s);
 return Y+'-'+M+'-'+D+' '+h+':'+m+':'+s;
};
var d1=pD(date1);
var d2=pD(date2);
var s1=pS(d1);
var s2=pS(d2);
if(s1>s2){
alert("开始时间不能大于结束时间!")
return false;
}
}
 function checkForm(){
  document.getElementById("_fieldvalue_sp_f250").value=document.getElementById("spF250").value;
document.getElementById("_fieldvalue_comaddress").value=document.getElementById("dizhi1").value+document.getElementById("dizhi2").value+document.getElementById("dizhi3").value;
document.getElementById("_fieldvalue_name").value=document.getElementById("farenname").value;  
  /*  if(document.myform_sp_t49._fieldvalue_spF250.value==""){
     alert('被查单位名称不能为空，请填写！');
     document.myform_sp_t49._fieldvalue_sp_f250.focus();
     return false;
     }
      if(document.myform_sp_t49._fieldvalue_comaddress.value==""){
     alert('被查单位地址不能为空，请填写！');
     document.myform_sp_t49._fieldvalue_comaddress.focus();
     return false;
   }
   if(document.myform_sp_t49._fieldvalue_name.value==""){
   alert('法定代表人（负责人）不能为空，请填写！');
   document.myform_sp_t49._fieldvalue_name.focus();
   return false;
    }  
 if(document.myform_sp_t49._fieldvalue_zhiwu.value==""){
   alert('职务不能为空，请填写！');
   document.myform_sp_t49._fieldvalue_zhiwu.focus();
   return false;
    } 
     if(document.myform_sp_t49._fieldvalue_phone.value==""){
   alert('联系电话不能为空，请填写！');
   document.myform_sp_t49._fieldvalue_phone.focus();
   return false;
    } 
    
/* 联系电话校验不对，目前先去掉了
   if(document.myform_sp_t49._fieldvalue_phone.value !=""){
    if(!isNumber(document.myform_sp_t49._fieldvalue_phone.value))   {
alert('联系电话格式不正确，请重新填写！');
   document.myform_sp_t49._fieldvalue_phone.focus();
   return false;
    }
}
     */
//联系电话校验开始
var mobile = /^1[3|5|8]\d{9}$/ ;
var pattern=/(^[0-9]{3,4}\-[0-9]{3,8}$)|(^[0-9]{3,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}13[0-9]{9}$)/; 
 var dianhua= document.myform_sp_t49._fieldvalue_phone.value;
/*if(mobile.test(dianhua) || pattern.test(dianhua)){ 
   }else{    
alert('您输入的电话格式不正确');
document.myform_sp_t49._fieldvalue_phone.focus();return false;
}
*/
//联系电话校验结束     
if(document.getElementById("_fieldvalue_changsuo").value=="")
{
  alert('检查场所不能为空请填写！!');
  document.myform_sp_t49._fieldvalue_changsuo.focus();
   return false;
}
if(document.myform_sp_t49.cdyYear.value=="")
{
   alert('检查日期“年”不能为空请填写！!');
  document.myform_sp_t49.cdyYear.focus();
  return false;
}
if(document.myform_sp_t49.cdyMonth.value=="")
{
      alert('检查日期“月”不能为空请填写！!');
     document.myform_sp_t49.cdyMonth.focus();
     return false;
}
if(document.myform_sp_t49.cdyDay01.value=="")
{
      alert('检查日期“日”不能为空请填写！!');
     document.myform_sp_t49.cdyDay01.focus();
     return false;
}
if(document.myform_sp_t49.cdyHour01.value=="")
{
   alert('检查日期“时”不能为空请填写！!');
  document.myform_sp_t49.cdyHour01.focus();
  return false;
}
if(document.myform_sp_t49.cdyMinute01.value=="")
{
      alert('检查日期“分”不能为空请填写！!');
     document.myform_sp_t49.cdyMinute01.focus();
     return false;
}
if(document.myform_sp_t49.cdyDay02.value=="")
{
      alert('检查日期“日”不能为空请填写！!');
     document.myform_sp_t49.cdyDay02.focus();
     return false;
}
if(document.myform_sp_t49.cdyHour02.value=="")
{
   alert('检查日期“时”不能为空请填写！!');
  document.myform_sp_t49.cdyHour02.focus();
  return false;
}
if(document.myform_sp_t49.cdyMinute02.value=="")
{
      alert('检查日期“分”不能为空请填写！!');
     document.myform_sp_t49.cdyMinute02.focus();
     return false;
}
if(document.getElementById("lawerid1").value==""){
   alert('请选择检查人员!');
  return false;
}
if(document.getElementById("lawerid2").value==""){
   alert('请选择检查人员!');
  return false;

}
    if(document.myform_sp_t49.cdyYear.value!=""||document.myform_sp_t49.cdyMonth.value!=""||
   document.myform_sp_t49.cdyDay01.value!=""||document.myform_sp_t49.cdyHour01.value!=""||
   document.myform_sp_t49.cdyMinute01.value!=""){ 
   var form=document.myform_sp_t49;
   var begingtime= form.cdyYear.value+'-'+form.cdyMonth.value+'-'+form.cdyDay01.value+' '+form.cdyHour01.value+':'+form.cdyMinute01.value+':'+0;
    if(!strDateTime(begingtime)){
     alert('日期格式不正确，请重新填写');
     document.getElementById('cdyYear').focus(); 
     return false;
      }
    }     
  if(document.myform_sp_t49.cdyYear.value!=""||document.myform_sp_t49.cdyMonth.value!=""||
   document.myform_sp_t49.cdyDay02.value!=""||document.myform_sp_t49.cdyHour02.value!=""||
   document.myform_sp_t49.cdyMinute02.value!=""){ 
   var form=document.myform_sp_t49;
  var endtime= form.cdyYear.value+'-'+form.cdyMonth.value+'-'+form.cdyDay02.value+' '+form.cdyHour02.value+':'+form.cdyMinute02.value+':'+0;
    if(!strDateTime(endtime)){
     alert('日期格式不正确，请重新填写');
     document.getElementById('cdyDay02').focus();
     return false;
      }
    }    

    

    if(document.myform_sp_t49.year.value=="")
{
   alert('检查日期“年”不能为空请填写！!');
  document.myform_sp_t49.year.focus();
  return false;
}
if(document.myform_sp_t49.month.value=="")
{
      alert('检查日期“月”不能为空请填写！!');
     document.myform_sp_t49.month.focus();
     return false;
}
if(document.myform_sp_t49.day.value=="")
{
      alert('检查日期“日”不能为空请填写！!');
     document.myform_sp_t49.day.focus();
     return false;
}
 if(document.myform_sp_t49.year.value!=""||document.myform_sp_t49.month.value!=""||
   document.myform_sp_t49.day.value!=""){ 
   var form=document.myform_sp_t49;
   var begingtime= form.year.value+'-'+form.month.value+'-'+form.day.value;
    if(!isDate(begingtime)){
     alert('日期格式不正确，请重新填写');
     document.getElementById('year').focus();
     return false;
      }
    }   
      return true;
     
     }
//将隐藏的赋值
function fuzhi()
{
document.getElementById('panduan_qiye').value=document.getElementById('_fieldvalue_sp_f250').value;
document.getElementById('panduan_dizhi').value=document.getElementById('_fieldvalue_comaddress').value;
}
//企业名称和地址进行比较对比
function ifchange()
{
var flag=0;
var newqiye=document.getElementById('_fieldvalue_sp_f250').value;
var hiddenqiye=document.getElementById('panduan_qiye').value;
var newdizhi=document.getElementById('_fieldvalue_comaddress').value;
var hiddendizhi=document.getElementById('panduan_dizhi').value;
if(newqiye!=hiddenqiye||newdizhi!=hiddendizhi)
{
flag=1;
}
return flag;
}
</script> 
<form action='print_html' method=post name='form_trans'><input type=hidden name='html_code' value=''>
<input type="hidden" id='wenshuText' name="wenshuText" value=""/>
</form>
<script> 
function weifaWrite(cbId){
 var checkedBox = document.getElementById(cbId);
 if(checkedBox && checkedBox.checked){
  var stringNeiRong = document.getElementById(checkedBox.value);
if(stringNeiRong.value !=""){
         var haha="<br />"; haha=haha.replace('<br />','\n');      //换行的写法
  document.getElementById('_fieldvalue_jcneirong').value =document.getElementById('_fieldvalue_jcneirong').value + stringNeiRong.value + haha;
  }
 }
}
     var tmp_sp_f837=""; 
     var tmp_sp_f838=""; 
     //所属分类级联
     function changeSuoshufenleiBig(){
	      if (document.myform_sp_t49.spF838==null){
				return;
	      }
	      if (tmp_sp_f837=="") tmp_sp_f837=document.myform_sp_t49.spF838.outerHTML; 
	      document.myform_sp_t49.spF838.outerHTML=tmp_sp_f837; 
	      var str1=document.myform_sp_t49.spF837.options(document.myform_sp_t49.spF837.selectedIndex).title;
	      for(i=0;i<document.myform_sp_t49.spF838.length;){
	       	   str2=document.myform_sp_t49.spF838.options(i).title;
		       if (str2.indexOf(str1,0)!=0&&str2!='quanbu'){
		        	document.myform_sp_t49.spF838.remove(i);
		       }else{
		        	i++;
		       }
	      }
	      
	     //changeSuoshufenleiMiddle();
     }
    
 	/*function changeSuoshufenleiMiddle(){
		  if (document.myform_sp_t49.spF839==null){
				return;
		  }
	      if (tmp_sp_f838=="") tmp_sp_f838=document.myform_sp_t49.spF839.outerHTML; 
	      document.myform_sp_t49.spF839.outerHTML=tmp_sp_f838; 
	      var str1=document.myform_sp_t49.spF838.options(document.myform_sp_t49.spF838.selectedIndex).title;
	      for(i=0;i<document.myform_sp_t49.spF839.length;){
	       	   str2=document.myform_sp_t49.spF839.options(i).title;
		       if (str2.indexOf(str1,0)!=0&&str2!='quanbu'){
		       		document.myform_sp_t49.spF839.remove(i);
		       }else{
		       		i++;
		       }
	      }
	}*/
	function xiazaiajax(){

var qiyename = document.getElementById("spF250").value;

		     	var url="../xzjc/ifcunzai.action?funcCode=${funcCode}&qiyename="+qiyename;
	     		url = encodeURI(url, "utf-8");
				url = encodeURI(url, "utf-8");
				 //url = convertURL(url);
	     		$.post(
				  url,
				  {
				   
				  },
				  function(data,status){
				  	if(status=="success"){
					if(data=="1"){
					alert("企业信息重复！请点击“点击添加”按钮选择被检查单位");
				  	document.getElementById("spF250").value="";
					document.getElementById("dizhi1").value="";
					document.getElementById("dizhi2").value="";
					document.getElementById("dizhi3").value="";
					document.getElementById("farenname").value="";
					}

				  	}
				  });

}
function getguominmen(){

var value = document.getElementById("guominmen").value;

		     	var url="../xzjc/guominmen.action?funcCode=${funcCode}&value1="+value;
	     		url = encodeURI(url);
	     		$.post(
				  url,
				  {
				   
				  },
				  function(data,status){
				  	if(status=="success"){
					$("#guominda").find("option").remove();
						$("#guominda").append(data);

				  	}
				  });

}

function getguominda(){

var value = document.getElementById("guominmen").value;
var value1 = document.getElementById("guominda").value;
		     	var url="../xzjc/guominda.action?funcCode=${funcCode}&value1="+value+"&value2="+value1;
	     		url = encodeURI(url);
	     		$.post(
				  url,
				  {
				   
				  },
				  function(data,status){
				  	if(status=="success"){
					$("#guominzhong").find("option").remove();
						$("#guominzhong").append(data);

				  	}
				  });

}
function getguominzhong(){

var value = document.getElementById("guominmen").value;
var value1 = document.getElementById("guominda").value;
var value2 = document.getElementById("guominzhong").value;
		     	var url="../xzjc/guominzhong.action?funcCode=${funcCode}&value1="+value+"&value2="+value1+"&value3="+value2;
	     		url = encodeURI(url);
	     		$.post(
				  url,
				  {
				   
				  },
				  function(data,status){
				  	if(status=="success"){
					$("#guominxiao").find("option").remove();
						$("#guominxiao").append(data);

				  	}
				  });

}
function getguominmen1(t){

var value = document.getElementById("guominmen").value;

		     	var url="../xzjc/guominmen.action?funcCode=${funcCode}&value1="+value;
	     		url = encodeURI(url);
	     		$.post(
				  url,
				  {
				   
				  },
				  function(data,status){
				  	if(status=="success"){
					$("#guominda").find("option").remove();
						$("#guominda").append(data);

				  	}
				  });

}

function getguominda1(t){
document.getElementById("guominda").value=t;
var value = document.getElementById("guominmen").value;
var value1 = t;
		     	var url="../xzjc/guominda.action?funcCode=${funcCode}&value1="+value+"&value2="+value1;
	     		url = encodeURI(url);
	     		$.post(
				  url,
				  {
				   
				  },
				  function(data,status){
				  	if(status=="success"){
					$("#guominzhong").find("option").remove();
						$("#guominzhong").append(data);

				  	}
				  });

}
function getguominzhong1(t1,t2){
document.getElementById("guominzhong").value=t2;
var value = document.getElementById("guominmen").value;
var value1 = t1;
var value2 = t2;
		     	var url="../xzjc/guominzhong.action?funcCode=${funcCode}&value1="+value+"&value2="+value1+"&value3="+value2;
	     		url = encodeURI(url);
	     		$.post(
				  url,
				  {
				   
				  },
				  function(data,status){
				  	if(status=="success"){
					$("#guominxiao").find("option").remove();
						$("#guominxiao").append(data);

				  	}
				  });

}		
function setfenlei(t){
alert(t);
alert(t.substring(1,3));
alert(document.getElementById("guominda").value);
document.getElementById("guominda").value=t.substring(1,3);
alert(document.getElementById("guominda").value);
document.getElementById("guominzhong").value=t.substring(1,4);
document.getElementById("guominxiao").value=t.substring(1,5);
	
}
function clearthis(){
document.getElementById("yinhuanneirong").value="";
}

 	 function changeDanweidizhi1(){
		 if (document.getElementById("dizhi2")==null){
			 return;	
		  }
	      if (tmp_sp_f58==""){
	      	tmp_sp_f58=document.getElementById("dizhi2").outerHTML;
	      }  
	      document.getElementById("dizhi2").outerHTML=tmp_sp_f58; 
	      var str1=document.getElementById("dizhi1").options(document.getElementById("dizhi1").selectedIndex).title;
	      for(i=0;i<document.getElementById("dizhi2").length;){
	       	   str2=document.getElementById("dizhi2").options(i).title;
		       if (str2.indexOf(str1,0)!=0){
		         document.getElementById("dizhi2").remove(i);
		       }else{
		         i++;
		       }
	       }
	 }
		if(document.getElementById("dizhi2").value==""){
		changeDanweidizhi1();
	} 
</script>

</body>
</html>
