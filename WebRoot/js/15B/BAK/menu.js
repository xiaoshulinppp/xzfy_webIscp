document.write("<style type=text/css>#master {LEFT: -197px; POSITION: absolute; TOP: -10px; VISIBILITY: visible; WIDTH: 200px; Z-INDEX: 2;height:expression(body.offsetHeight);}#menu {LEFT:0px; POSITION: absolute; TOP: -10px; VISIBILITY: visible; WIDTH: 18px; Z-INDEX: 5;height:expression(body.offsetHeight);}#top {LEFT: 0px; POSITION: absolute; TOP: -10px; VISIBILITY: visible; WIDTH: 100px; Z-INDEX: 5}#screen {LEFT: 0px; POSITION: absolute; TOP: -10px; VISIBILITY: visible; WIDTH: 100px; Z-INDEX: 5}#screenlinks {LEFT: 0px; POSITION: absolute; TOP: -10px; VISIBILITY: visible; WIDTH: 100px; Z-INDEX: 5}</style>")
var ie = document.all ? 1 : 0
var ns = document.layers ? 1 : 0

if(ie){
document.write('<style type="text/css">')
document.write("#screen	{filter:Alpha(Opacity=30);}")
document.write("</style>")
}

if(ns){
document.write('<style type="text/css">')
document.write("#master	{clip:rect(0,150,250,0);}")
document.write("</style>")
}


var ie = document.all ? 1 : 0
var ns = document.layers ? 1 : 0


var master = new Object("element")
master.curLeft = -197;	master.curTop = 10;
master.gapLeft = 0;		master.gapTop = 0;
master.timer = null;

function moveAlong(layerName, paceLeft, paceTop, fromLeft, fromTop){
clearTimeout(eval(layerName).timer)

if(eval(layerName).curLeft != fromLeft){
     if((Math.max(eval(layerName).curLeft, fromLeft) - Math.min(eval(layerName).curLeft, fromLeft)) < paceLeft){eval(layerName).curLeft = fromLeft}
else if(eval(layerName).curLeft < fromLeft){eval(layerName).curLeft = eval(layerName).curLeft + paceLeft}
else if(eval(layerName).curLeft > fromLeft){eval(layerName).curLeft = eval(layerName).curLeft - paceLeft}
if(ie){document.all[layerName].style.left = eval(layerName).curLeft}
if(ns){document[layerName].left = eval(layerName).curLeft}
}

if(eval(layerName).curTop != fromTop){
     if((Math.max(eval(layerName).curTop, fromTop) - Math.min(eval(layerName).curTop, fromTop)) < paceTop){eval(layerName).curTop = fromTop}
else if(eval(layerName).curTop < fromTop){eval(layerName).curTop = eval(layerName).curTop + paceTop}
else if(eval(layerName).curTop > fromTop){eval(layerName).curTop = eval(layerName).curTop - paceTop}
if(ie){document.all[layerName].style.top = eval(layerName).curTop}
if(ns){document[layerName].top = eval(layerName).curTop}
}


eval(layerName).timer=setTimeout('moveAlong("'+layerName+'",'+paceLeft+','+paceTop+','+fromLeft+','+fromTop+')',30)
}

function setPace(layerName, fromLeft, fromTop, motionSpeed){
eval(layerName).gapLeft = (Math.max(eval(layerName).curLeft, fromLeft) - Math.min(eval(layerName).curLeft, fromLeft))/motionSpeed
eval(layerName).gapTop = (Math.max(eval(layerName).curTop, fromTop) - Math.min(eval(layerName).curTop, fromTop))/motionSpeed

moveAlong(layerName, eval(layerName).gapLeft, eval(layerName).gapTop, fromLeft, fromTop)
}

var expandState = 0

function expand(){
if(expandState == 0){setPace("master", 0, 10, 10); if(ie){document.menutop.src = "../../images/12B/menub.gif"}; expandState = 1;}
else{setPace("master", -197, 10, 10); if(ie){document.menutop.src = "../../images/12B/menu.gif"}; expandState = 0;}
}

document.write("<div id=master><div id=menu onclick=\"javascript:expand()\"><table width=\"100%\" height=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td valign=\"top\"><IFRAME name=menuPage border=0 marginWidth=0 marginHeight=0 src=\"menu.htm\" frameBorder=0 width=\"197\" scrolling=NO height=\"100%\"></IFRAME></td>");
//<table border=0 cellpadding=0 cellspacing=0 width=18><tbody><tr><td width=\"100%\"><a href=\"javascript:expand()\" onFocus=this.blur()></a></td></tr></tbody></table></div><div id=top><table border=0 cellpadding=0 cellspacing=0 width=100><tbody><tr><td width=\"100%\"><img border=0 height=6 src=\"images/top.gif\"  width=100></td> </tr></tbody></table></div><div id=screen onmouseout=\"javascript:expand()\"><table border=0 cellpadding=5 cellspacing=0 width=100><tbody><tr><td bgcolor=#336666 width=\"100%\"><table bgcolor=#336666 border=0 cellpadding=0 cellspacing=0 width=\"100%\" height=213><tbody><tr><td width=\"100%\"><table border=0 cellpadding=5 cellspacing=1 width=\"100%\"><tbody><tr> <td bgcolor=#ecf6f5 width=\"100%\"><br><br><br><br><br></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></div><div id=screenlinks ><table border=0 cellpadding=6 cellspacing=0 width=100><tbody><tr><td style=\"FILTER: alpha(opacity=90)\" width=\"100%\"><table bgcolor=#336666 border=0 cellpadding=0 cellspacing=0 width=\"100%\" ><tbody> <tr><td width=\"100%\"><table border=0 cellpadding=6 cellspacing=1 width=\"100%\"><tbody><tr><td bgcolor=#ecf6f5 width=\"100%\" align=\"center\"><font color=999900>IT���ŵ���</font><br><br><a href=\"http://www.itleague.org/index.asp\" target=\"_blank\">IT������ҳ</a><br>��<a href=\"http://www.itleague.org/default.ASP\" target=\"_blank\">��������</a><br>��<a href=\"http://www.itleague.org/download/index.asp\" target=\"_blank\">�������</a><br>��<a href=\"index.asp\" target=\"_blank\">��̳����</a><br>��<a href=\"http://www.itleague.org/song/default.asp\" target=\"_blank\">��������</a><br>��<a href=\"http://www.itleague.org/friend/default.asp\" target=\"_blank\">������Ů</a><br>��<a href=\"http://www.itleague.org/class/index.asp\" target=\"_blank\">ͬ ѧ ¼</a><br>��<a href=\"http://www.itleague.org/vchat.html\" target=\"_blank\">��������</a><br>��<a href=\"http://www.itleague.org/free/default.asp\" target=\"_blank\">��ѷ���</a><br>��<a href=\"http://www.itleague.org/aboutus.html\" target=\"_blank\">��������</a><br>��<a href=\"http://www.itleague.org/rules.html\" target=\"_blank\">�����³�</a><br>��<a href=\"http://www.itleague.org/market.html\" target=\"_blank\">����ҵ��</a><br>��<a href=\"http://www.itleague.org/ourcase.html\" target=\"_blank\">�ɹ�����</a><br>��<a href=\"http://www.itleague.org/ad.html\" target=\"_blank\">������</a><br>��<a href=\"http://www.itleague.org/feedback.html\" target=\"_blank\">��Ϣ����</a><br>��<a href=\"http://www.itleague.org/personnal.html\" target=\"_blank\">�����ɲ�</a><br></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table>");
document.write("<td width=20 valign=top bgcolor=\"#417BD1\" style=\"cursor:hand;\"><img alt=�������չ��/�رտ�ݲ˵� border=0 height=80 name=menutop src=\"../../images/12B/menu.gif\" width=20 style=\"cursor:hand;\"></td></tr></table></div></div>");

if(ie){var sidemenu = document.all.master;}
if(ns){var sidemenu = document.master;}

function FixY(){
if(ie){sidemenu.style.top = document.body.scrollTop+10}
if(ns){sidemenu.top = window.pageYOffset+10}
}

setInterval("FixY()",100);
