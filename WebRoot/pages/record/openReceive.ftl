<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行政复议信息管理系统</title>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>

<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>
<!--[if lte IE 6]>
<script src="../webstyle/script/png.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div, ul, img, li, input , a');
    </script>
<![endif]--> 
</head>

<body>
<#include "../website/header.ftl">
<script>
	function changeClass(id){
		if(id==1){
			document.getElementById("classDiv").style.display="none";
			document.getElementById("btn1").style.display="block";
			document.getElementById("classList1").style.display="block";
		}
		if(id==2){
			document.getElementById("classDiv").style.display="none";
			document.getElementById("btn1").style.display="block";
			document.getElementById("classList2").style.display="block";
		}
		if(id==3){
			document.getElementById("classDiv").style.display="none";
			document.getElementById("btn1").style.display="block";
			document.getElementById("classList3").style.display="block";
		}
	}

	function getDefaultDiv(){
			document.getElementById("classDiv").style.display="block";
			document.getElementById("btn1").style.display="none";
			document.getElementById("classList1").style.display="none";
			document.getElementById("classList2").style.display="none";
			document.getElementById("classList3").style.display="none";
	}
</script>
<div class="wal pageNow2">
      <div class="fl">当前位置：<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a>  > 新增/接收案件</div>
      <div class="fr">
	 
	   <input type="button" class="btn1" style="display:none" id="btn1" onclick="getDefaultDiv()" value="返  回">
	   </span>
	  </div>
</div>
<div class="pageBg1">
<div class="classList">
      <h2>请选择类别</h2>
      <div class="list" id="classDiv">
           <ul>
             <li>
                 <div class="imgDiv"><a href="javascript:changeClass(1)"><img src="../webstyle/image/nimg106.png" alt="" /></a></div>
                 <div class="title">当面接待</div>
             </li>
             <li>
                 <div class="imgDiv"><a href="javascript:changeClass(2)"><img src="../webstyle/image/nimg106_2.png" alt="" /></a></div>
                 <div class="title">来信接收复议申请</div>
             </li>
             <li>
                 <div class="imgDiv"><a href="javascript:changeClass(3)"><img src="../webstyle/image/nimg106_3.png" alt="" /></a></div>
                 <div class="title">协助案件审理</div>
             </li>
             
             <li>

                 <!--<div class="imgDiv"><img src="../webstyle/image/nimg106_13.png" alt="" /></div>-->
                 <div class="imgDiv"><a href="../xzfy/buweiListByName.action?funcCode=${funcCode}"><img src="../webstyle/image/nimg106_13.png" alt="" /></a></div>

                 <div class="title">国家部委受理案件登记</div>
             </li>
             
           </ul>
      </div>
      <div class="list2" id="classList1">
           <div class="bg">
           <ul>
             <li>
                 <div class="imgDiv"><a href="../xzfy/appFYfaceInsert.action?funcCode=${funcCode}"><img src="../webstyle/image/nimg106_4.jpg" alt="" /></a></div>
                 <div class="title">当面接收复议申请</div>
             </li>
             <li>
                 <div class="imgDiv"><a href="../xzfy/buzhengFace.action?funcCode=${funcCode}"><img src="../webstyle/image/nimg106_5.png" alt="" /></a></div>
                 <div class="title">已收材料当面补正</div>
             </li>
             <li>
                 <div class="imgDiv"><a href="../meet/updateyibanjiedai.action?funcCode=${funcCode}"><img src="../webstyle/image/nimg106_12.png" alt="" /></a></div>
                 <div class="title">一般接待</div>
             </li>             
           </ul>
           </div>
      </div>
      <div class="list3" id="classList2">
           <div class="bg">
           <ul>
             <li>
                 <div class="imgDiv"><a href="../xzfy/appPaperInsert.action?funcCode=${funcCode}"><img src="../webstyle/image/nimg106_6.png" alt="" /></a></div>
                 <div class="title">接收复议来信</div>
             </li>
             <li>
                 <div class="imgDiv"><img src="../webstyle/image/nimg106_7.png" alt="" /></div>
                 <div class="title">接收监督案件来信</div>
             </li>
           </ul>
           </div>
      </div>
       <div class="list1" id="classList3">
           <ul>
             <li>
                 <div class="imgDiv"><a href="../meet/showDaibanList.action?funcCode=${funcCode}"><img src="../webstyle/image/nimg106_8.png" alt="" /></a></div>
                 <div class="title">阅卷</div>
             </li>
             <li>
                 <div class="imgDiv"><a href="../meet/showDaibanList1.action?funcCode=${funcCode}"><img src="../webstyle/image/nimg106_9.png" alt="" /></a></div>
                 <div class="title">送达</div>
             </li>
              <li>
                 <div class="imgDiv"><a href="../meet/showDaibanList2.action?funcCode=${funcCode}"><img src="../webstyle/image/nimg106_10.png" alt="" /></a></div>
                 <div class="title">转接材料22</div>
             </li>
              <li>
                 <div class="imgDiv"><a href="../meet/showDaibanList4.action?funcCode=${funcCode}"><img src="../webstyle/image/nimg106_11.png" alt="" /></a></div>
                 <div class="title">谈话调查</div>
             </li>
           </ul>
      </div>
</div>
</div>

<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>
</body>
</html>