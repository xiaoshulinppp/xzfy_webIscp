<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="utf-8" />
	<title></title>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../pages/fusionCharts/chartsjs/FusionCharts.js"></script>
</head>
<body>
<#include "../website/header.ftl">
<div class="" style="padding-top:0px;">


<div class="pageBg1">
    <div class="wal">
<div  id="Divx"></div>
                         <script type="text/javascript">
				              var chartx= new FusionCharts("../pages/fusionCharts/chartsflash/Column2D.swf", "Divx", "600", "400", "0", "0");
				              chartx.setDataXML("<chart caption='本年度全市各区县人民政府受理情况统计' xAxisName='' yAxisName='' showValues='1' decimals='0' formatNumberScale='0' baseFontSize='14' outCnvBaseFontSize='14'><set label='东城区' value='30' /><set label='西城区' value='26' /><set label='朝阳区' value='22' /><set label='海淀区' value='20' /><set label='丰台区' value='18' /><set label='石景山区' value='17' /><set label='门头沟区' value='16' /><set label='房山区' value='9' /><set label='通州区' value='9' /><set label='顺义区' value='6' /><set label='大兴区' value='5' /><set label='昌平区' value='5' /><set label='平谷区' value='5' /><set label='怀柔区' value='5' /><set label='密云县' value='3' /><set label='延庆县' value='2' /></chart>");	
				              
				              chartx.render("Divx");
			             </script>
      <div class="pageBoxBg"></div>

</div>

</div>
</div>
<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>

</body>
<script>
function dyniframesize(down) { 
	var pTar = null; 
	if (document.getElementById){ 
		pTar = document.getElementById(down); 
	} 
	else{ 
		eval('pTar = ' + down + ';'); 
	} 
	if (pTar && !window.opera){ 
	//begin resizing iframe 
		pTar.style.display="block" 
		if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight){ 
	//ns6 syntax 
			pTar.height = pTar.contentDocument.body.offsetHeight +20; 
			pTar.width = pTar.contentDocument.body.scrollWidth+20; 
		} 
		else if (pTar.Document && pTar.Document.body.scrollHeight){ 
	//ie5+ syntax 
			pTar.height = pTar.Document.body.scrollHeight; 
			pTar.width = pTar.Document.body.scrollWidth; 
		} 
	} 
} 
</script>
</html>