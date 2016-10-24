<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="utf-8" />
	<title></title>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>
</head>
<body>

<#include "../website/header.ftl">
      <iframe frameborder="0" id="ifm" name="ifm" height="700px"   scrolling="no"
       width="100%" src="../schedule/showScheduleList.action?funcCode=${funcCode}"></iframe>

<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>

</body>
<script>
//var isClick=false;
var num=0;
function submitComment(){
	if(document.getElementById("comment").value==""){
		alert("回复不可为空");
	}else{
		if(confirm("确认回复")){
			document.form.submit();
		}
	}
}


function setStar(grade){
	
	var e = document.getElementsByName("gradeImg");
	
	for(var i=0;i<grade;i++){
		e[i].src="../webstyle/image/nimg19.gif";
		
	}
	for(var i=grade;i<6;i++){
		e[i].src="../webstyle/image/nimg19_2.gif";
		
	}
}
function setGrade(grade){
	//isClick=true;
	document.getElementById("grade").value=grade;
	setStar(grade);
	
}
function mouseout(){
	num=document.getElementById("grade").value;
	setStar(num);
}
</script>
</html>