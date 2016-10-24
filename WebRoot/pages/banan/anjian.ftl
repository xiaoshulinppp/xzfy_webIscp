<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=7">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行政复议信息管理系统</title>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />

<!--[if lte IE 6]>
<script src="script/png.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div, ul, img, li, input , a');
    </script>
<![endif]--> 
</head>

<body>

	<#assign user_name=Session['_USER_LOGIN_'].name>


      <div class="indexPart2_01">
            <div class="title">
                  <div class="fl">案件办理通道</div>
                  <div class="fr"><font color="green">您好，${user_name}！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您所在复议机关：${bumen}</font></div>
            </div>
            <div class="list">
                  <ul>
                    <li>您单位目前有<a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=1&funcCode=${funcCode}')">
                    <font color="green">
                    &nbsp;&nbsp;${homeCaseNumList[0]}&nbsp;&nbsp;</font></a>件行政复议案件未办结，
                   		 其中：审理所用时间已满40天不到50天的有<a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=2&funcCode=${funcCode}')" >
                   		 <font color="orange">&nbsp;&nbsp;${homeCaseNumList[1]}&nbsp;&nbsp;</font></a>件，
                   		 已满50天的有<a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=3&funcCode=${funcCode}')" >
                   		 <font color="orange">&nbsp;&nbsp;${homeCaseNumList[2]}&nbsp;&nbsp;</font></a>件，
                   		 <a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=4&funcCode=${funcCode}')" >
                   		 <font color="red">&nbsp;&nbsp;${homeCaseNumList[3]}&nbsp;&nbsp;</font></a>件案件已超期，
                   		 <a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=5&funcCode=${funcCode}')" >
                   		 <font color="red">&nbsp;&nbsp;${homeCaseNumList[4]}&nbsp;&nbsp;</font></a>件案件处于中止状态。
                    </li>
                    <li>您单位有<a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=6&funcCode=${funcCode}')" >
                    <font color="green">&nbsp;&nbsp;${homeCaseNumList[5]}&nbsp;&nbsp;</font></a>件新收案件待分配，
                    	有<a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=7&funcCode=${funcCode}')" >
                    	<font color="green">&nbsp;&nbsp;${homeCaseNumList[6]}&nbsp;&nbsp;</font></a>件已受理案件未指定承办人</li>
                    <#if orgBm=="0000">
	                    <#--<#if orgid!=1556 && orgid!=999>-->
                    <li><font color='green'>案件办理：</font>您目前有<a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=9&funcCode=${funcCode}')" >
                    <font color="green"> ${homeCaseNumList[8]}&nbsp;</font></a>件待办理,
                    	<a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=23&funcCode=${funcCode}')" >
                    	<font color="green"> ${sbzhongzhi}&nbsp;</font></a>件处于中止状态。
                    	<font color="green">您已办结</font><a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=24&funcCode=${funcCode}')" >
                    	<font color="green"> ${sbbanjie}&nbsp;</font></a><font color="green">件。</font></li>
                    	<#--</#if> <#if orgid=999>-->
                    <li><font color='green'>立案审查：</font>您目前有<a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=8&funcCode=${funcCode}')" >
                    <font color="green"> ${homeCaseNumList[7]}&nbsp;</font></a>件待立案审查,
                    	<a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=22&funcCode=${funcCode}')" >
                    	<font color="green"> ${sbBuzheng}&nbsp;</font></a>件处于补正阶段,
                    	
                    	<a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=26&funcCode=${funcCode}')" >
                    	<font color="green"> ${sbGuoqi}&nbsp;</font></a>件已过期。
                    	
                    	<font color="green">您已审查</font><a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=25&funcCode=${funcCode}')" >
                    	<font color="green"> ${sbYishencha}&nbsp;</font></a><font color="green">件。</font></li>
                    	<#--</#if>-->
                    </#if>
                    <#if orgBm!="0000">
                    	<li><font color='green'>案件办理：</font>您目前有<a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=8&funcCode=${funcCode}')" >
                    <font color="green">&nbsp;&nbsp;${homeCaseNumList[7]}&nbsp;&nbsp;</font></a>件待立案审查,
                    	<a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=9&funcCode=${funcCode}')" >
                    	<font color="green"> &nbsp;&nbsp;${homeCaseNumList[8]}&nbsp;&nbsp;</font></a>件待办理</li>
                    </#if>
                    <li><font color='green'>领导审批：</font>您目前有<a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=10&funcCode=${funcCode}')" >
                    <font color="green"> &nbsp;&nbsp;${homeCaseNumList[9]}&nbsp;&nbsp;</font></a>件待审批，
                    	有<a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=11&funcCode=${funcCode}')" >
                    	<font color="green"> &nbsp;&nbsp;${homeCaseNumList[10]}&nbsp;&nbsp; </font></a>件待立案审批</li>
                    <#if orgBm=="0000">
	                    <#if orgid!=1556 && orgid!=999>
	                    <li><font color="green"> ${subbumen}： </font>目前有
	                    	<a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=12&funcCode=${funcCode}')" > 
	                    	<font color="green">&nbsp;&nbsp; ${subweibanjie}&nbsp;&nbsp; </font></a>件行政复议案件未办结，
	                    	其中：<a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=16&funcCode=${funcCode}')" >
	                    	<font color="orange"> &nbsp;&nbsp;${subweifenpei}&nbsp;&nbsp; </font></a>件待分配，
	                    	审理所用时间已满40天不到50天的有<a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=13&funcCode=${funcCode}')" >
	                    	<font color="orange"> &nbsp;&nbsp;${sub40}&nbsp;&nbsp; </font></a>件，
	                    	已满50天的有<a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=14&funcCode=${funcCode}')" >
	                    	<font color="orange"> &nbsp;&nbsp;${sub50}&nbsp;&nbsp; </font></a>件，
	                    	<a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=15&funcCode=${funcCode}')" >
	                    	<font color="red"> &nbsp;&nbsp;${subchaoqi}&nbsp;&nbsp; </font></a>件案件已超期。
	                    	<a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=17&funcCode=${funcCode}')" >
	                   		<font color="red">&nbsp;&nbsp;${subzhongzhi}&nbsp;&nbsp;</font></a>件案件处于中止状态。
	                    </li>
	                    </#if>
	                    <#if orgid=999>
	                    	<li><font color="green"> ${subbumen}： </font>目前有
	                    	<a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=18&funcCode=${funcCode}')" > 
	                    	<font color="green">&nbsp;&nbsp; ${subDailianshencha}&nbsp;&nbsp; </font></a>案件待立案审查，
	                    	其中:已满3天不到5天的案件有<a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=19&funcCode=${funcCode}')" >
	                    	<font color="orange"> &nbsp;&nbsp;${sub35}&nbsp;&nbsp; </font></a>件，
	                    	已超过5天的案件有<a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=20&funcCode=${funcCode}')" >
	                    	<font color="orange"> &nbsp;&nbsp;${sub5}&nbsp;&nbsp; </font></a>件，
	                    	处于补正状态的案件有<a href="javascript:getUrlLocation('../banan/showanjianbanliList.action?listkeyword=21&funcCode=${funcCode}')" >
	                    	<font color="red"> &nbsp;&nbsp;${subBuzheng}&nbsp;&nbsp; </font></a>件。
	                    </li>
	                    </#if>
                    </#if>
                    <#if orgBm!="0000">
                    <li>您单位作为被申请人目前有<a href="javascript:getUrlLocation('../bsqr/showList.action?funcCode=${funcCode}')" >
                    <font color="green">&nbsp;&nbsp;${bsqrListSize}&nbsp;&nbsp;</font></a>件案件待答复</li>
                    </#if>
                  </ul>
            </div>
      </div>
      <script>
      function getUrlLocation(urls){
      	parent.location.href=urls;
      }
      </script>

</body>
</html>