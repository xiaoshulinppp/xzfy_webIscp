<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/base.css" rel="stylesheet" type="text/css" />
		<link href="../${Session['_USER_STYLE_'].cssPath}/main_style.css" rel="stylesheet" type="text/css" />
	
	<!--                       Javascripts 注意不要改变顺序                      -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
</head>
<body >
<span class="x-line fn-clear"><img src="../${Session['_USER_STYLE_'].imagePath}/pic_search_line.png"/></span><!--我是有箭头灰色的分割线-->
<input type="hidden" name="funcCode" value="${funcCode}" />
<form name="form" id="form" action="" method="post">

<input type="hidden" name="shenji" id="shenji" value="" />
<input type="hidden" name="fuyi" id="fuyi" value="" />
<input type="hidden" name="shenhe1" id="shenhe1" value=""/>
<input type="hidden" name="shenhe2" id="shenhe2" value=""/>
<input type="hidden" name="beigao" id="beigao" value=""/>
<input type="hidden" name="fuyiOrbeishen" id="fuyiOrbeishen" value=""/>
<div id="shenjidiv" style="display:block">

<p><h2>&nbsp;&nbsp;&nbsp;&nbsp;请选择审级：</h2></p>

<ul >
    <li>
    <input type='radio'  name="level" onclick="setLevel('1');"/><span>&nbsp;&nbsp;一审</span>
    </li>
    <br/>
    <li>
    <input type='radio'  name="level" onclick="setLevel('2');"/><span>&nbsp;&nbsp;二审</span>
    </li>
    <br/>
    <li>
    <input type='radio' name="level" onclick="setLevel('3');"/><span>&nbsp;&nbsp;再审</span>
    </li>
</ul>
<br/>
<input type="button" onclick="submitShenji();" value="提交" style="width:50px;height:30px;color:white;background:green">
</div>

<div id="shenhe2div" style="display:none">
<br/>
<p><h2>&nbsp;&nbsp;&nbsp;&nbsp;是否经过二审：</h2></p>
<ul >
<br/>
    <li>
    <input type='radio' name="shenhe2" onclick="setshen2('1')"/><span>&nbsp;&nbsp;是</span>
    </li>
    <br/>
    <li>
    <input type='radio' name="shenhe2" onclick="setshen2('0')"/><span>&nbsp;&nbsp;否</span>
    </li>
</ul>
<br/>
<input type="button" onclick="submitshen2();" value="提交" style="width:50px;height:30px;color:white;background:green">
</div>
<!--
<div id="shenhe1div" style="display:none" >
<p><h2>是否经过一审：</h2></p>
<ul>
    <li>
    <input type='radio' name="level" onclick="setshen1('1')"/><span>是</span>
    </li>
    <li>
    <input type='radio' name="level" onclick="setshen1('0')"/><span>否</span>
    </li>
</ul>
<input type="button" onclick="submitshen1();" value="提交" style="width:50px;height:30px;color:white;background:green">
</div>
-->
<div id="beigaodiv" style="display:none" >
<br/>
<p><h2></h2></p>
<ul >
    <li>
    <input type='radio' name="beigao" onclick="setbeigao('1')"/><span>&nbsp;&nbsp;复议机关为单独被告</span>
    </li>
    <br/>
    <li>
    <input type='radio' name="beigao" onclick="setbeigao('2')"/><span>&nbsp;&nbsp;复议机关为共同被告</span>
    </li>
</ul>
<br/>
<input type="button" onclick="submitbeigao();" value="提交" style="width:50px;height:30px;color:white;background:green">
</div>

<div id="isfuyidiv" style="display:none" >
<br/>
<p><h2>&nbsp;&nbsp;&nbsp;&nbsp;是否经过行政复议：</h2></p>
<br/>
<ul >
    <li>
    <input type='radio' name="level" onclick="setisfuyi('1')"/><span>&nbsp;&nbsp;是</span>
    </li>
    <br/>
    <li>
    <input type='radio' name="level" onclick="setisfuyi('0')"/><span>&nbsp;&nbsp;否</span>
    </li>
</ul>
<br/>
<input type="button" onclick="submitFuyi();" value="提交" style="width:50px;height:30px;color:white;background:green">
</div>

<div id="fuyiOrbeishendiv" style="display:none" >
<br/>
<p><h2></h2></p>
<ul>
    <li>
    <input type='radio' name="level" onclick="setfuyiOrbeishen('1')"/><span>&nbsp;&nbsp;用户所在单位为复议机关</span>
    </li>
    <br/>
    <li>
    <input type='radio' name="level" onclick="setfuyiOrbeishen('2')"/><span>&nbsp;&nbsp;用户所在单位为被申请人</span>
    </li>
</ul>
<br/>
<input type="button" onclick="submitfuyiOrbeishen();" value="提交" style="width:50px;height:30px;color:white;background:green">
</div>

<script>

function setLevel(shenji){
	document.getElementById("shenji").value=shenji;
	//alert(document.getElementById("shenji").value)
}
function setshen2(shen2){
    document.getElementById("shenhe2").value=shen2;
}
//function setshen1(shen1){
//    document.getElementById("shenhe1").value=shen1;
//}
function setisfuyi(fuyi){
	document.getElementById("fuyi").value=fuyi;
}
function setbeigao(beigao){
	document.getElementById("beigao").value=beigao;
	//alert(document.getElementById("beigao").value);
}
function setfuyiOrbeishen(fuyiOrbeishen){
document.getElementById("fuyiOrbeishen").value=fuyiOrbeishen;
}
function submitShenji(){
    var shenji=document.getElementById("shenji").value;
    var fuyi=document.getElementById("fuyi").value;
	var shenhe1=document.getElementById("shenhe1").value;
	var shenhe2=document.getElementById("shenhe2").value;
	var beigao=document.getElementById("beigao").value;
	var fuyiOrbeishen=document.getElementById("fuyiOrbeishen").value;
	if(shenji==""){
		alert("请选择审级！");
	}
	else{
	    if(shenji=="1"){
		document.getElementById("shenjidiv").style.display="none";
		document.getElementById("isfuyidiv").style.display="block";
		}
		if(shenji=="2"){
		parent.location="../xzss/tiquxzss.action?funcCode=${funcCode}&shenji="+shenji+"&shenhe2=0&shenhe1=1&fuyi="+fuyi;
		}
		if(shenji=="3"){
		document.getElementById("shenjidiv").style.display="none";
		document.getElementById("shenhe2div").style.display="block";
		}
	}
}
function submitshen2(){
    var shenji=document.getElementById("shenji").value;
    var fuyi=document.getElementById("fuyi").value;
	var shenhe1=document.getElementById("shenhe1").value;
	var shenhe2=document.getElementById("shenhe2").value;
	var beigao=document.getElementById("beigao").value;
	var fuyiOrbeishen=document.getElementById("fuyiOrbeishen").value;
	if(shenhe2==""){
		alert("请选择是否经过二审！");
	}else{
	    if(shenhe2=="1"){
		parent.location="../xzss/tiquxzss.action?funcCode=${funcCode}&shenji="+shenji+"&shenhe2="+shenhe2+"&shenhe1="+shenhe1+"&fuyi="+fuyi;
		}
		if(shenhe2=="0"){
		parent.location="../xzss/tiquxzss.action?funcCode=${funcCode}&shenji="+shenji+"&shenhe2="+shenhe2+"&shenhe1=1&fuyi="+fuyi;
		}
	}
}
function submitFuyi(){
    var shenji=document.getElementById("shenji").value;
	var fuyi=document.getElementById("fuyi").value;
	var shenhe1=document.getElementById("shenhe1").value;
	var shenhe2=document.getElementById("shenhe2").value;
	var beigao=document.getElementById("beigao").value;
	var fuyiOrbeishen=document.getElementById("fuyiOrbeishen").value;
	if(fuyi==""){
		alert("请选择是否经过行政复议！");
	}else{
	    if(fuyi=="1"){
		//parent.location="../xzss/searchxzfy.action?funcCode=${funcCode}&shenji="+shenji+"&shenhe2="+shenhe2+"&shenhe1="+shenhe1+"&fuyi="+fuyi;
		document.getElementById("isfuyidiv").style.display="none";
		document.getElementById("fuyiOrbeishendiv").style.display="block";
		}
		if(fuyi=="0"){
		parent.location="../xzss/xzssguanli.action?funcCode=${funcCode}&isxinzeng=1&shenji="+shenji+"&shenhe2=0&shenhe1=0&fuyi="+fuyi+"&beigao=0&fuyiOrbeishen="+fuyiOrbeishen;
		}
	}
}
function submitfuyiOrbeishen(){
	var shenji=document.getElementById("shenji").value;
	var fuyi=document.getElementById("fuyi").value;
	var shenhe1=document.getElementById("shenhe1").value;
	var shenhe2=document.getElementById("shenhe2").value;
	var beigao=document.getElementById("beigao").value;
	var fuyiOrbeishen=document.getElementById("fuyiOrbeishen").value;
	if(fuyiOrbeishen==""){
	    alert("请选择用户所在单位为本机关还是被申请人");
	}else{
		if(fuyiOrbeishen=="1"){
			document.getElementById("fuyiOrbeishendiv").style.display="none";
			document.getElementById("beigaodiv").style.display="block";
		}
		if(fuyiOrbeishen=="2"){
		parent.location="../xzss/searchxzfy.action?funcCode=${funcCode}&shenji="+shenji+"&shenhe2=0&shenhe1=0&fuyi="+fuyi+"&beigao=0&fuyiOrbeishen="+fuyiOrbeishen;
		}
	}
}
function submitbeigao(){
	var shenji=document.getElementById("shenji").value;
	var fuyi=document.getElementById("fuyi").value;
	var shenhe1=document.getElementById("shenhe1").value;
	var shenhe2=document.getElementById("shenhe2").value;
	var beigao=document.getElementById("beigao").value;
	var fuyiOrbeishen=document.getElementById("fuyiOrbeishen").value;
	if(beigao==""){
		alert("请选择复议机关为单独被告还是共同被告");
	}
	if(beigao=="1"){
	parent.location="../xzss/searchxzfy.action?funcCode=${funcCode}&shenji="+shenji+"&shenhe2="+shenhe2+"&shenhe1="+shenhe1+"&fuyi="+fuyi+"&beigao="+beigao+"&fuyiOrbeishen="+fuyiOrbeishen;
	}
	if(beigao=="2"){
	parent.location="../xzss/searchxzfy.action?funcCode=${funcCode}&shenji="+shenji+"&shenhe2="+shenhe2+"&shenhe1="+shenhe1+"&fuyi="+fuyi+"&beigao="+beigao+"&fuyiOrbeishen="+fuyiOrbeishen;
	}
}
</script>
</form>

</body>
<style>
body{
text-align:center;
}
</style>