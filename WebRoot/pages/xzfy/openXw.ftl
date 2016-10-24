<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<title>来信申请行政复议</title>

<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/prototype.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/function.js"></script>

<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>

<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>

<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
<SCRIPT src="../css/01/setday.js"></SCRIPT>
<script type="text/javascript" src="../js/calendar.js"></script>
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>

<style type="text/css">img,formDiv,.formDiv{behavior: url(../webstyle/style/ie-css3.htc);} </style> 


<!--javascript脚本添加位置。-->
<SCRIPT LANGUAGE="JavaScript">
<!--
function toggle(id) {
theObj = document.getElementById(id).style;
if ( theObj.display == "none" ) theObj.display = "block"; else theObj.display = "none";
}
//-->
</SCRIPT>

<!--javascript脚本添加位置结束。-->
</head>
<input type="hidden" value=${dname} id="dname" >
<input type="hidden" value=${xwNum} id="num" >
<input type="hidden" value=${xwName} id="xname" >
<body>
<form action="" name="form1" id="form1" method="post" >
<div class="" style="padding-top:0px;">
<div class="wal">
<div class="sideTip">
            <h1 class="title">案件办理提示</h1>
            <div class="content">同一具体行政行为案件共<a href="javascript:view2()">${n2}</a>件<br />同一类别具体行政行为案件共<a href="javascript:view1()">${n1}</a>件<br /></div>
      </div>

</div>
</div>
</form>
</body>
<script>
function view1() {
		listForm_= document.getElementById("form1");
		var dname = document.getElementById("dname").value;
		var xwNum = document.getElementById("num").value;
		var xwName = document.getElementById("xname").value;
		listForm_.action="../xzfy/showXw1.action?funcCode=${funcCode}&xwName="+encodeURI(xwName)+"&dname="+encodeURI(dname);
		window.open(listForm_.action);
}


function view2() {listForm_= document.getElementById("form1");
		var dname = document.getElementById("dname").value;
		var xwNum = document.getElementById("num").value;
		var xwName = document.getElementById("xname").value;
		listForm_.action="../xzfy/showXw2.action?funcCode=${funcCode}&xwName="+encodeURI(xwName)+"&xwNum="+encodeURI(xwNum);
		window.open(listForm_.action);
}

</script>