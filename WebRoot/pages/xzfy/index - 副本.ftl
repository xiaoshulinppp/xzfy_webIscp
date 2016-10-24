<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=7">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行政复议信息管理系统</title>
<link href="../css/main.css" rel="stylesheet" type="text/css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/index/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../js/index/js.js"></script>
<script language="javascript" type="text/javascript" src="../js/index/fun.js"></script>

<!--[if lte IE 6]>
<script src="../js/index/png.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div, ul, img, li, input , a');
    </script>
<![endif]--> 


<script language="JavaScript" src="../pages/fusionCharts/chartsjs/FusionCharts.js"></script>
<script language="JavaScript" src="../pages/fusionCharts/chartsjs/FusionChartsExportComponent.js"></script>
</head>

<body>
<div class="headDiv">
<div class="wal">
      <a href="" class="logo"><img src="../webstyle/image/logo.png"/></a>
      <div class="time">当前时间： 2013年10月28日 22点41分</div>
      <div class="nav">
            <ul>
               <li class="li_01"><a href="../xzfy/gotoIndex.action?funcCode=${funcCode}" class="aNow">首页</a></li>
               <li class="li_02"><a href="../website/showColumn.action?funcCode=${funcCode}&column=1">复议动态</a></li>
               <li class="li_03"><a href="../website/showColumn.action?funcCode=${funcCode}&column=2">时政快递</a></li>
               <li class="li_04"><a href="../website/showColumn.action?funcCode=${funcCode}&column=3">法律法规</a></li>
               <li class="li_05"><a href="../website/showColumn.action?funcCode=${funcCode}&column=4">典型案例</a></li>
               <li class="li_06"><a href="">资料库</a></li>
               <li class="li_07"><a href="">工作建议</a></li>
            </ul>
      </div>
</div>
</div>

<div class="indexPart1">
<div class="wal">
      <div class="fl indexPart1_01">
            <div class="list">
              <ul>
              <#list articleInfoList1 as data>
                <li><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${data.id}" target="blank"><img src="${data.firstImage?default('')}" width="100%" height="329"></a></li>
                <#-- 
                <li><a href=""><img src="../images/index/limg522.jpg"/></a></li>
                <li><a href=""><img src="../../kindeditor/attached/image/20131104/20131104182857_766.png"/></a></li>
                <li><a href=""><img src="../images/index/limg522.jpg"/></a></li>
                <li><a href=""><img src="../images/index/limg522.jpg"/></a></li>
                <li><a href=""><img src="../images/index/limg522.jpg"/></a></li>
                -->
              </#list>
              </ul>
            </div>
            <div class="list1">
              <ul>
          		<#list articleInfoList1 as data>
                	<li><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${data.id}" target="blank">${data.title?default('')}</a></li>
             	</#list>
             	<#--
                <li><a href="">p1</a></li>
                <li><a href="">11月28日，北京，中国妇女第十一次全国代表大会今天上午在京开幕</a></li>
                <li><a href="">12月28日，北京，中国妇女第十一次全国代表大会今天上午在京开幕</a></li>
                <li><a href="">1月28日，北京，中国妇女第十一次全国代表大会今天上午在京开幕</a></li>
                <li><a href="">2月28日，北京，中国妇女第十一次全国代表大会今天上午在京开幕</a></li>
                -->
              </ul>
            </div>
            <div class="btnDiv"><span class="spanNow"></span><span></span><span></span><span></span><span></span></div>
      </div>
      <div class="fr indexPart1_02">
            <div class="title">行政复议工作动态</div>
            <a href="../website/subColumnMore.action?funcCode=${funcCode}&column=1&subColumn=12" target="blank" class="more">更多</a>
            	<#list articleInfoList3 as data>
			     <#if data_index == 0>
			      <#assign title = "${data.title?default('')}" />
			      <#assign id="${data.id?default('')}">
			     </#if>
				</#list>
            
            <h1><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${id?default('')}" target="blank">${title?default('')}</a></h1>
            <div class="list">
                  <ul>
                    <#list articleInfoList3 as data>
                     <#if data_index gt 0 && data_index lt 4>
                     	<li><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${data.id}" target="blank">·${data.title?default('')}<img src="../images/index/lico2.gif"/></a></li>
                     </#if>
                    </#list>
                    
                    <#list articleInfoList3 as data>
                     <#if data_index gt 3>
                     	<li><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${data.id}" target="blank">${data.title?default('')}</a></li>
                     </#if>
                    </#list>
                   <#--
                    <li><a href="">·习近平：三中全会将对深化改革作总体部署<img src="../images/index/lico2.gif"/></a></li>
                    <li><a href="">·政府或在十八届三中全会后推出地产调控长效机制<img src="../images/index/lico2.gif"/></a></li>
                    <li><a href="">·知情者称十八届三中全会不会废除征地制<img src="../images/index/lico1.gif"/></a></li>
                    <li><a href="">·习近平：三中全会将对深化改革作总体部署</a></li>
                    <li><a href="">·政府或在十八届三中全会后推出地产调控长效机制</a></li>
                    <li><a href="">·知情者称十八届三中全会不会废除征地制</a></li>
                    <li><a href="">·政府或在十八届三中全会后推出地产调控长效机制除征地制</a></li>
                     -->
                  </ul>
            </div>
      </div>
</div>
</div>

<div class="indexPart2">
<div class="wal">
      <div class="title"></div>
      <div class="fl indexPart2_01">
            <div class="title">
                  <div class="fl">案件办理通道</div>
                  <div class="fr">您所在复议机关名称：<font color="red">${bumen}</font></div>
            </div>
            <div class="list">
                  <ul>
                    <li>您单位目前有<a href="../banan/showanjianbanliList.action?listkeyword=1&funcCode=${funcCode}"><font color="red">${weibanjieList.size()}</font></a>件行政复议案件未办结，
                   		 其中：审理期限不满20天的有<a href="../banan/showanjianbanliList.action?listkeyword=2&funcCode=${funcCode}"><font color="red">${shenliqixian_20_List.size()}</font></a>件，
                   		 不满10天的有<a href="../banan/showanjianbanliList.action?listkeyword=3&funcCode=${funcCode}"><font color="red">${shenliqixian_10_List.size()}</font></a>件，
                   		 <a href="../banan/showanjianbanliList.action?listkeyword=4&funcCode=${funcCode}"><font color="red">${shenliqixian_chaoqi_List.size()}</font></a>件案件已超期，
                   		 <a href="../banan/showanjianbanliList.action?listkeyword=5&funcCode=${funcCode}"><font color="red">${zhongzhiList.size()}</font></a>件案件处于中止状态。
                    </li>
                    <li>您单位有<a href="../banan/showanjianbanliList.action?listkeyword=6&funcCode=${funcCode}"><font color="red">${newdaifenpeiList.size()}</font></a>件新收案件待分配，
                    	有<a href="../banan/showanjianbanliList.action?listkeyword=7&funcCode=${funcCode}"><font color="red">${weizhidingList.size()}</font></a>件已受理案件未指定承办人</li>
                    <li>您目前有<a href="../banan/showanjianbanliList.action?listkeyword=8&funcCode=${funcCode}"><font color="red"> ${dailianshenchaList.size()}</font></a>件案件待立案审查,
                    	<a href="../banan/showanjianbanliList.action?listkeyword=9&funcCode=${funcCode}"><font color="red"> ${daibanliList.size()}</font></a>件案件待办理</li>
                    <li>您目前有<a href="../banan/showanjianbanliList.action?listkeyword=10&funcCode=${funcCode}"><font color="red"> ${daishenpiList.size()}</font></a>件案件待审批，
                    	有<a href="../banan/showanjianbanliList.action?listkeyword=11&funcCode=${funcCode}"><font color="red"> ${dailianshenpiList.size()} </font></a>件案件待立案审批（动态获取）</li>
                    <li><font color="red"> ${subbumen} </font>目前有
                    	<a href="../banan/showanjianbanliList.action?listkeyword=12&funcCode=${funcCode}"> <font color="red"> ${weibanjie_sub_List.size()} </font></a>件行政复议案件未办结，
                    	其中：<a href="../banan/showanjianbanliList.action?listkeyword=13&funcCode=${funcCode}"><font color="red"> ${shenliqixian_sub40_List.size()} </font></a>件审理时间已满40天，
                    	<a href="../banan/showanjianbanliList.action?listkeyword=14&funcCode=${funcCode}"><font color="red"> ${shenliqixian_sub50_List.size()} </font></a>件审理时间已满50天，
                    	<a href="../banan/showanjianbanliList.action?listkeyword=15&funcCode=${funcCode}"><font color="red"> ${shenliqixian_subchaoqi_List.size()} </font></a>件案件已超期。
                    </li>
                  </ul>
            </div>
      </div>
      <div class="fr indexPart2_02">
      <#--
   		<#include "/pages/xzfy/calendar.ftl">
   		-->
        <iframe frameborder="0" name="user_state" marginwidth="0" marginheight="0" width="480";  height="280" scrolling="no" src="getCalendar.action?funcCode=${funcCode}"></iframe>
        
            <div class="list">
                 <ul>
                    <li><a href="../xzfy/appFYfaceInsert.action?funcCode=${funcCode}"><img src="../images/index/limg141_1.jpg"/></a></li>
                    <li><a href=""><img src="../images/index/limg141_2.jpg"/></a></li>
                    <li><a href=""><img src="../images/index/limg141_3.jpg"/></a></li>
                 </ul>
            </div>
      </div>
</div>
</div>

<div class="indexPart3">
<div class="wal">
      <div class="fl indexPart3_01">
            <ul>
              <li><a href=""><img src="../images/index/limg309_1.png"/></a></li>
              <li><a href=""><img src="../images/index/limg309_2.png"/></a></li>
              <li><a href=""><img src="../images/index/limg309_3.png"/></a></li>
              <li><a href=""><img src="../images/index/limg309_4.png"/></a></li>
            </ul>
      </div>
      <div class="fl indexPart3_02">
            <h1 class="title">领导讲话<span>Leadership speech</span></h1>
            <a href="../website/subColumnMore.action?funcCode=${funcCode}&column=2&subColumn=21" target="blank" class="more">更多</a>
            <div class="list">
                <ul>
                <#list articleInfoList2 as data>
                 <li><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${data.id}" target="blank">·${data.title?default('')}</a></li>
                </#list>
                <#--
                  <li><a href="">·习近平：三中全会将对深化改革作总体部署</a></li>
                  <li><a href="">·政府或在十八届三中全会后推</a></li>
                  <li><a href="">·知情者称十八届三中全会不会废除征地制</a></li>
                  <li><a href="">·习近平：三中全会将对深化改革作总体部署</a></li>
                  <li><a href="">·政府或在十八届三中全会后推出地产</a></li>
                  <li><a href="">·政府或在十八届三中全会后推出地产调控长效</a></li>
                  <li><a href="">·知情者称十八届三中全会不会废除征地制</a></li>
                  <li><a href="">·知情者称十八届三中全会不会废除征地制</a></li>
                  <li><a href="">·习近平：三中全会将对深化改革作总体部署</a></li>
                  <li><a href="">·政府或在十八届三中全会后推出地产</a></li>
                -->
                </ul>
            </div>
      </div>
      <div class="fr indexPart3_02">
            <h1 class="title">法律法规<span>laws and regulations;</span></h1>
            <a href="../website/subColumnMore.action?funcCode=${funcCode}&column=3&subColumn=31" target="blank" class="more">更多</a>
            <div class="list">
                <ul>
                <#list articleInfoList4 as data>
                 <li><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${data.id}" target="blank">·${data.title?default('')}</a></li>
                </#list>
                
                </ul>
            </div>
      </div>
</div>
</div>

<div class="indexPart4">
<div class="wal">
      <div class="fl indexPart4_01">
            <div class="title"><h1>法制舆情摘报</h1><span>Leadership speech</span></div>
            <a href="../website/subColumnMore.action?funcCode=${funcCode}&column=2&subColumn=22" target="blank" class="more">更多</a>
            <div class="list">
                <ul>
                <#list articleInfoList5 as data>
                 <li><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${data.id}" target="blank">·${data.title?default('')}</a></li>
                </#list>
                </ul>
            </div>
      </div>
      <div class="fl indexPart4_01">
            <div class="title"><h1>典型案例</h1><span>A typical case</span></div>
            <a href="../website/subColumnMore.action?funcCode=${funcCode}&column=4&subColumn=41" target="blank" class="more">更多</a>
            <div class="list">
                <ul>
                <#list articleInfoList6 as data>
                 <li><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${data.id}" target="blank">·${data.title?default('')}</a></li>
                </#list>
                </ul>
            </div>
      </div>
      <div class="fr indexPart4_02">
            <ul>
              <li><a href=""><img src="../images/index/limg105_1.jpg"/></a></li>
              <li><a href=""><img src="../images/index/limg105_2.jpg"/></a></li>
              <li><a href=""><img src="../images/index/limg105_3.jpg"/></a></li>
              <li><a href=""><img src="../images/index/limg105_4.jpg"/></a></li>
              <li><a href=""><img src="../images/index/limg105_5.jpg"/></a></li>
              <li><a href=""><img src="../images/index/limg105_6.jpg"/></a></li>
            </ul>
            <span class="clear_f"></span>
      </div>
      <span class="clear_f"></span>
      <div class="indexPart4_03">
            <div class="fl contentDiv">
                  <h1 class="title">2013年全市数据汇总</h1>
                  <a href="" class="more">更多</a>
                  <div class="content">
                         1. 本年度全市各级行政复议机关已接待行政复议当事人人<font color="red" > ${totalOfJdPiCi} </font>批次，共计<font color="red" > ${totalOfJdRenShu} </font>人次。<br/>
        2. 本年度全市各级行政复议机关，共接收全市行政复议案件<font color="red" > ${receivedTotalOfCases} </font>件，已立案<font color="red" > ${receivedTotalOfRegistered} </font>件，待处理<font color="red" > ${receivedTotalOfPreDealt} </font>件。<br/>
        3. 本年度全市各级行政复议机关已受理复议案件<font color="red" > ${acceptedFuYiCases} </font>件，驳回<font color="red" > ${reject} </font>件，维持<font color="red" > ${preserve} </font>件，确认违法<font color="red" > ${illegal} </font>件，撤销<font color="red" > ${revocation} </font>件，变更<font color="red" > ${mofify} </font>件，责令履行<font color="red" > ${executionInOrder} </font>件，调解<font color="red" > ${reconciliation} </font>件，终止<font color="red" > ${termination} </font>件，其它<font color="red" > ${otherDeals} </font>件。
                  </div>
            </div>
            <div class="fr list">
                  <ul>
                    <li>
                    			<div class="imgDiv" id="Divx"></div>
                         <script type="text/javascript">
				              var chartx= new FusionCharts("../pages/fusionCharts/chartsflash/Column2D.swf", "Divx", "345", "220", "0", "0");
				              chartx.setDataXML("${xmlString1}");	
				              chartx.render("Divx");
			             </script>
                         
                        
                    </li>
                    <li>
                    			
                         <div class="imgDiv" id="Divx1"></div>
                         <script type="text/javascript">
				              var chartx= new FusionCharts("../pages/fusionCharts/chartsflash/Column2D.swf", "Divx1", "350", "220", "0", "0");
				              chartx.setDataXML("${xmlString2}");	
				              chartx.render("Divx1");
			             </script>
                         
                         
                         
                    </li>
                  </ul>
            </div>
      </div>
</div>
</div>

<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>
</body>
</html>