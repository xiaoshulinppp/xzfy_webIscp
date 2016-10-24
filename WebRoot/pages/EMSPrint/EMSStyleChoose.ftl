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
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
</head>
<body >
<div>
<span class="x-line fn-clear"><img src="../${Session['_USER_STYLE_'].imagePath}/pic_search_line.png"/></span><!--我是有箭头灰色的分割线-->

<form name="form" id="form" action="" method="post">
	<input type="hidden" name="funcCode" value="${funcCode}" />
	<input type="hidden" id="emsStyle" name="emsStyle"/>
<p><h2>&nbsp;&nbsp;&nbsp;&nbsp;请选择EMS套打样式：</h2></p>
<br/>
<ul >
    <li>
    <input type='radio'  name="style" onclick="setStyle('1');"/><span>&nbsp;&nbsp;同城EMS</span>
    </li>
    <br/>
    <li>
    <input type='radio'  name="style" onclick="setStyle('2');"/><span>&nbsp;&nbsp;国内EMS</span>
    </li>
</ul>
<br/>
<input type="button" onclick="submitEMSStyle();" target="_blank" value="下一步" style="width:50px;height:30px;color:white;background:green">
</div>

<script>

function setStyle(style){
	document.getElementById("emsStyle").value=style;
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

	function submitEMSStyle(){
	    var style=document.getElementById("emsStyle").value;

		if(style=="" || style==null){
			alert("请选择EMS套打样式！");
			return;
		}
		else{
		    if(style=="1"){
//				opendg("../xzfy/styleFirstChose.action?emsStyle='1'&funcCode=${funcCode}",1000,500);
//				parent.window.close();
				parent.location="../xzfy/styleChoseReaction.action?emsStyle=1&funcCode=${funcCode}&xzfyId=${xzfyId}";
			}
			else{
//				opendg("../xzfy/styleFirstChose.action?emsStyle='2'&funcCode=${funcCode}",1000,500);
//				parent.window.close();
				parent.location="../xzfy/styleChoseReaction.action?emsStyle=2&funcCode=${funcCode}&xzfyId=${xzfyId}";
			}
		}
	}	
	
	function opendg(dgurl,dgw,dgh){
		$.dialog({ 
		title:'',
		width: dgw,
		height: dgh,
		content:'url:'+ dgurl});
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