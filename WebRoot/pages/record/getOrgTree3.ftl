<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>

	
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
<style>
<!--
body,ul,h3 {margin:0px; padding:0px;}
li {list-style-type:none;}
body{
font-size:12px;
color:#333;
font-family: Simsun;
line-height:15px;
}
a{text-decoration:none;color:#004285;border:none;}
a:hover{text-decoration:none;color:#C33;}
#menu {
width:360px;
margin:50px auto;
padding:10px;
border:#EEE 1px solid;
}
#menu h3 {
font-size:12px;
}
#menu ul {
background:url("../webstyle/image/ul-bg.gif") repeat-y 5px 0px; overflow:hidden;
}
#menu ul li {
padding:5px 0 2px 15px;
background:url("../webstyle/image/tree-ul-li.gif") no-repeat 5px -32px;
}
#menu ul li ul {display:none;}
#menu ul li em {
cursor:pointer;
display:inline-block;
width:15px;
float:left;
height:15px;
margin-left:-14px;
background:url("../webstyle/image/tree-ul-li.gif") no-repeat -32px 2px;
}
#menu ul li em.off {
background-position: -17px -18px;
}
#menu ul li#end {
background-color:#FFF;
}
#menu ul.off {
display:block;
}
-->
</style>

	</head>
	<body>
${treeDiv}
<input type="hidden" id="id" value="${elementId}"/>
<script type="text/javascript">
function setOrg(locbm,orgName){
	window.opener.document.getElementById(document.getElementById("id").value).value=orgName;
	window.opener.document.getElementById("orgName").value=locbm;
	window.close();
}


(function(e){
for(var _obj=document.getElementById(e.id).getElementsByTagName(e.tag),i=-1,em;em=_obj[++i];){
em.onclick = function(){ //onmouseover
var ul = this.nextSibling;
if(!ul){return false;}
ul = ul.nextSibling; if(!ul){return false;}
if(e.tag != 'a'){ ul = ul.nextSibling; if(!ul){return false;} } //a 标签控制 隐藏或删除该行
for(var _li=this.parentNode.parentNode.childNodes,n=-1,li;li=_li[++n];){
if(li.tagName=="LI"){
for(var _ul=li.childNodes,t=-1,$ul;$ul=_ul[++t];){
switch($ul.tagName){
case "UL":
$ul.className = $ul!=ul?"" : ul.className?"":"off";
break;
case "EM":
$ul.className = $ul!=this?"" : this.className?"":"off";
break;
}
}
}
}
}
}
})({id:'menu',tag:'em'});
</script>
	</body>
</html>
