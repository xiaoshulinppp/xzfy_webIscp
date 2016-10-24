<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=7">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行政复议信息管理系统</title>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
<!--[if lte IE 6]>
<script src="script/png.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div, ul, img, li, input , a');
    </script>
<![endif]--> 

<script language="JavaScript" src="../pages/fusionCharts/chartsjs/FusionCharts.js"></script>
<script language="JavaScript" src="../pages/fusionCharts/chartsjs/FusionChartsExportComponent.js"></script>
</head>
<body  onload="startTime()">
<#include "../website/header.ftl">
<div class="wal pageNow2">
      <div class="fl">当前位置：<a href="#">数据统计</a></div>

</div>



<div class="pageBg1">
<div class="wal">
                         

                   <div class="pageBox" style="padding:10px;">
                         <!--
                         <div class="pageBtn">
                            <div class="fr"><a href="#">导出</a></div>
                         </div>
                         -->
                         <div class="Statistics">
                               
                              <div class="imgDiv" id="Divx1"></div>
   
                        
                              <script type="text/javascript">
				              var chartx= new FusionCharts("../pages/fusionCharts/chartsflash/Column2D.swf", "Divx1", "600", "400", "0", "0");
				              chartx.setDataXML("${xmlString1}");	
				              chartx.render("Divx1");
				              
			                  </script>
                               
                               
                             <div class="title">${year}年度市区县人民政府受理情况统计</div>
                        
                         </div>
                    </div>
                    <div class="pageBoxBg"></div>
                         
</div>
</div>
</body>
</html>