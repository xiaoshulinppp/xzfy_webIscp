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


<div class="wal">

                         <div class="imgDiv" id="Divx1"></div>
                         <script type="text/javascript">
				              var chartx= new FusionCharts("../pages/fusionCharts/chartsflash/Column2D.swf", "Divx1", "600", "400", "0", "0");

				               chartx.setDataXML("<chart caption='本年度市政府各委办局收案情况统计' xAxisName='' yAxisName='' showValues='1' decimals='0' formatNumberScale='0' baseFontSize='14' outCnvBaseFontSize='14'><set label='市发展和改革委员会' value='35' /><set label='市教育委员会' value='22' /><set label='市科学技术委员会' value='32' /><set label='市民族事务委员会' value='20' /><set label='市公安局' value='51' /><set label='市监察局' value='23' /><set label='市民政局' value='25' /><set label='市司法局' value='31' /><set label='市财政局' value='25' /><set label='市人力资源和社会保障局' value='22' /><set label='市农业局' value='9' /><set label='市统计局' value='11' /><set label='市住房和城乡建设委员会' value='13' /><set label='市市政市容管理委员会' value='8' /><set label='市交通委员会' value='16' /><set label='市水务局' value='5' /></chart>")
				              chartx.render("Divx1");
			             </script>
      <div class="pageBoxBg"></div>
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