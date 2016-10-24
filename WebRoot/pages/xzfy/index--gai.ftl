<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=7">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行政复议信息管理系统</title>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
<!--<script type="text/javascript" src="../js/index/jquery-1.7.1.min.js"></script>-->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script>  
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
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

<!-- 弹出样式 -->
<link href="../webstyle/style/base.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/main_style_indexTanchu.css" rel="stylesheet" type="text/css" />

</head>
<body>
<#include "../banan/indexInform.ftl">


<div class="headDiv">
<div class="wal">
<#assign user_name=Session['_USER_LOGIN_'].name>
      <!--<a href="http://www.beijing.gov.cn/" class="logo" target="_blank"><img src="../webstyle/image/logo.png"/></a>-->
      <div class="time"  id="time"></div>
      <div class="nav">
            <ul>
  				<#assign thisColumn="${column?default('0')}">
               <li class="li_01"><a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页</a></li>
               <li class="li_02"><a href="../website/showColumn.action?funcCode=${funcCode}&column=1" <#if thisColumn=="1">class="aNow"</#if>>复议动态</a></li>
               <li class="li_03"><a href="../website/showColumn.action?funcCode=${funcCode}&column=2" <#if thisColumn=="2">class="aNow"</#if>>时政快递</a></li>
               <li class="li_04"><a href="../website/showColumn.action?funcCode=${funcCode}&column=3" <#if thisColumn=="3">class="aNow"</#if>>法律法规</a></li>
               <li class="li_05"><a href="../website/subColumnMoreDxal.action?funcCode=${funcCode}&column=4" <#if thisColumn=="4">class="aNow"</#if>>典型案例</a></li>
               <li class="li_06"><a href="../website/showColumn.action?funcCode=${funcCode}&column=5" <#if thisColumn=="5">class="aNow"</#if>>统计查询</a></li>
               <li class="li_07"><a href="../website/articleAreaOnFrontPage.action?funcCode=${funcCode}&column=6" <#if thisColumn=="6">class="aNow"</#if>>内容管理</a></li>
               <li class="li_08"><a href="../website/xinXiBaoSong.action?funcCode=${funcCode}&column=7" <#if thisColumn=="7">class="aNow"</#if>>信息报送</a></li>
               <li class="li_10"><a href="../xzcj/showUndertakerList.action?funcCode=${funcCode}&column=9" <#if thisColumn=="9">class="aNow"</#if>>裁决案件</a></li>
               <li class="li_09"><a href="../website/zlk.action?funcCode=${funcCode}&column=8" <#if thisColumn=="8">class="aNow"</#if>>资料库</a></li>
               
            </ul>
      </div>
</div>
</div>
<script type="text/javascript">
             
			function startTime()
			{
			var today=new Date()
			var y=today.getFullYear()
			var month=today.getMonth()+1
			var d=today.getDate()
			var h=today.getHours()
			var m=today.getMinutes()
			var s=today.getSeconds()
			// add a zero in front of numbers<10
			m=checkTime(m)
			s=checkTime(s)
			//document.getElementById('time').innerHTML="${Session['_USER_LOGIN_'].name}：您好！  "+"当前时间："+y+"年"+month+"月"+d+"日"+h+"点"+m
			document.getElementById('time').innerHTML="当前时间abc："+y+"年"+month+"月"+d+"日"+h+"点"+m+"分"
			t=setTimeout('startTime()',1000)
			}
			
			
			
			function checkTime(i)
			{
			if (i<10) 
			  {i="0" + i}
			  return i
			}
			startTime();
			
			
			
		</script>
<div class="indexPart1">
<div class="wal">
      <div class="fl indexPart1_01">
            <div class="list">
              <ul>
              <#list articleInfoList1 as data>
                <li><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${data.id}" target="blank" title="${data.title?default('')}"><img src="${data.firstImage?default('')}" width="100%" height="329"></a></li>
              </#list>
              </ul>
            </div>
            <div class="list1">
              <ul>
          		<#list articleInfoList1 as data>
                	<li><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${data.id}" target="blank" >
         <#if data.title?has_content>
	     	<#if data.title.length() gt 28>
	      		${data.title[0..27]}..
	    	<#else>
	   	  		${data.title}
	    	</#if>
	     </#if>                	
                	</a></li>
             	</#list>
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
                     	<li><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${data.id}" target="blank" title="${data.title?default('')}">
         <#if data.title?has_content>
	     	<#if data.title.length() gt 20>
	      		${data.title[0..20]}..
	    	<#else>
	   	  		${data.title}
	    	</#if>
	     </#if>
                    <img src="../images/index/lico2.gif"/></a></li>
                     </#if>
                    </#list>
                    
                    <#list articleInfoList3 as data>
                     <#if data_index gt 3>
                     	<li><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${data.id}" target="blank" title="${data.title?default('')}">
         <#if data.title?has_content>
	     	<#if data.title.length() gt 25>
	      		${data.title[0..24]}..
	    	<#else>
	   	  		${data.title}
	    	</#if>
	     </#if>                     	
                     </a></li>
                     </#if>
                    </#list>

                  </ul>
            </div>
      </div>
</div>
</div>

<div class="indexPart2">
<div class="wal">
      <div class="title"></div>
      <div class="fl indexPart2_01">
  		<iframe frameborder="0"  marginwidth="0" marginheight="0" width="548";  height="460" scrolling="no" src="../banan/anjianbanliroad.action?funcCode=${funcCode}"></iframe>
      </div>
      <div class="fr indexPart2_02">
      <#--
   		<#include "/pages/xzfy/calendar.ftl">
   		-->
        <iframe frameborder="0" name="user_state" marginwidth="0" marginheight="0" width="480";  height="265" scrolling="no" src="getCalendar.action?funcCode=${funcCode}"></iframe>
        
            <div class="list">
                 <ul>
                    <li><a href="../xzfy/openReceive.action?funcCode=${funcCode}"><img src="../images/index/limg141_1.jpg"/></a></li>
                    <li><a href="../website/showColumn.action?funcCode=${funcCode}&column=5" ><img src="../images/index/limg141_2.jpg"/></a></li>
                    <li><a href="../website/showDanInfo.action?funcCode=${funcCode}"><img src="../images/index/limg141_3.jpg"/></a></li>
                 </ul>
                 <#if locbm =='0000'>
                 <ul>
                    <a href="../wyxx/gotoCompaniesIndex.action?funcCode=${funcCode}"><img style="width:85%;height:55px" src="../images/index/sys_mt_trace.png"/></a>
                 </ul>
                 </#if>
            </div>
      </div>
</div>
</div>
<script>
function opendg(dgurl,dgw,dgh)
{
  $.dialog({ 
    title:'复议委员会管理',
    width: dgw,
    height: dgh,
    content:'url:'+ dgurl});
}
</script>
<div class="indexPart3">
<div class="wal">
      <div class="fl indexPart3_01">
            <ul>
              <li><a href="#" >
              		<img src="../images/index/limg309_1.png"/></a>
              </li>
              <li>
              <a href="../xzfy/getMemberList.action?funcCode=${funcCode}" >
              <img src="../images/index/limg309_2.png"/></a></li>
              <li><a href="../website/showAjList.action?funcCode=${funcCode}"><img src="../images/index/limg309_3.png"/></a></li>
              <li><a href="../website/zlk.action?funcCode=${funcCode}&column=8" target="_blank"><img src="../images/index/limg309_4.png"/></a></li>
            </ul>
      </div>
      <div class="fl indexPart3_02">
            <h1 class="title">行政诉讼文书</h1>
            <a href="../website/subColumnMore.action?funcCode=${funcCode}&column=11&subColumn=50" target="blank" class="more">更多</a>
            <div class="list">
                <ul>
                <#list articleInfoList9 as data>
                 <li><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${data.id}" title="${data.title?default('')}" target="blank">
         <#if data.title?has_content>
	     	<#if data.title.length() gt 20>
	      		${data.title[0..19]}..
	    	<#else>
	   	  		${data.title}
	    	</#if>
	     </#if>  
                 </a></li>
                </#list>
                </ul>
            </div>
      </div>
      
      <div class="fl indexPart3_02">
            <h1 class="title">领导讲话</h1>
            <a href="../website/subColumnMore.action?funcCode=${funcCode}&column=2&subColumn=21" target="blank" class="more">更多</a>
            <div class="list">
                <ul>
                <#list articleInfoList2 as data>
                 <li><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${data.id}" title="${data.title?default('')}" target="blank">
         <#if data.title?has_content>
	     	<#if data.title.length() gt 20>
	      		${data.title[0..19]}..
	    	<#else>
	   	  		${data.title}
	    	</#if>
	     </#if>  
                 </a></li>
                </#list>
                </ul>
            </div>
      </div>
      
      
      
     <#-- <div class="fr indexPart3_02">
            <h1 class="title">法律法规</h1>
            <a href="../website/subColumnMore.action?funcCode=${funcCode}&column=3&subColumn=31" target="blank" class="more">更多</a>
            <div class="list">
                <ul>
                <#list articleInfoList4 as data>
                 <li><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${data.id}" title="${data.title?default('')}" target="blank">
         <#if data.title?has_content>
	     	<#if data.title.length() gt 23>
	      		${data.title[0..22]}..
	    	<#else>
	   	  		${data.title}
	    	</#if>
	     </#if>                   
                 </a></li>
                </#list>
                
                </ul>
            </div>
      </div>-->
</div>
</div>

<div class="indexPart4">
<div class="wal">
      <div class="fl indexPart4_01">
            <div class="title"><h1>行政复议文书</h1></div>
            <a href="../website/subColumnMore.action?funcCode=${funcCode}&column=12&subColumn=53" target="blank" class="more">更多</a>
            <div class="list">
                <ul>
                <#list articleInfoList5 as data>
                 <li><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${data.id}" title="${data.title?default('')}" target="blank">
         <#if data.title?has_content>
	     	<#if data.title.length() gt 20>
	      		${data.title[0..19]}..
	    	<#else>
	   	  		${data.title}
	    	</#if>
	     </#if>                   
                 </a></li>
                </#list>
                </ul>
            </div>
      </div>
      <div class="fl indexPart4_01">
            <div class="title"><h1>典型案例</h1></div>
            <a href="../website/subColumnMore.action?funcCode=${funcCode}&column=4&subColumn=41" target="blank" class="more">更多</a>
            <div class="list">
                <ul>
                <#list articleInfoList6 as data>
                 <li><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${data.id}" title="${data.title?default('')}" target="blank">
         <#if data.title?has_content>
	     	<#if data.title.length() gt 20>
	      		${data.title[0..19]}..
	    	<#else>
	   	  		${data.title}
	    	</#if>
	     </#if>
				</a></li>
                </#list>
                </ul>
            </div>
      </div>
      <div class="fr indexPart4_02">
            <ul>
              <li><img src="../images/index/limg105_1.jpg"/></li>
              <li><a href="../website/zlk.action?funcCode=${funcCode}&isSoft=1"><img src="../images/index/limg105_2.jpg"/></a></li>
              <li><a href="../website/showXzfyTongXun.action?funcCode=${funcCode}"><img src="../images/index/limg105_3.jpg"/></a></li>
              <li><a href="http://223.4.233.197/capital/default.aspx?T=1" target="_blank"><img src="../images/index/limg105_4.jpg"/></a></li>
              <li><a href="../wyxx/showQustnPage.action?funcCode=${funcCode}&column=7&subColumn=72"><img src="../images/index/limg105_5.jpg"/></a></li>
              <li><a href="../website/zlk.action?funcCode=${funcCode}&column=8"><img src="../images/index/limg105_6.jpg"/></a></li>
            </ul>
            <span class="clear_f"></span>
      </div>
      <span class="clear_f"></span> 
      
      
      <div class="indexPart4_03">
            <div class="fl contentDiv">
                  <h1 class="title"><a href="javascript:setContent(1);"><font style="color:#887a5c;">2016年数据汇总</font></a> | <a href="javascript:setContent(2);"><font style="color:#887a5c;">当日接待汇总</font></a> </h1>
                 
                  <div class="content" id="content1">
                         1. 本年度全市各级行政复议机关已接待行政复议当事人<font color="red" >${totalOfJdPiCi}</font>批次，共计<font color="red" >${totalOfJdRenShu}</font>人次。<br/>
        2. 本年度全市各级行政复议机关，共接收全市行政复议案件<font color="red" >${receivedTotalOfCases}</font>件，已立案<font color="red" >${receivedTotalOfRegistered}</font>件，待处理<font color="red" >${receivedTotalOfPreDealt}</font>件，未受理<font color="red">${unReceived}</font>件。其中：告知<font color="red">${notified}</font>件，不予受理<font color="red">${refused}</font>件，其它处理<font color="red">${others}</font>件。<br/>
        3. 本年度全市各级行政复议机关已受理复议案件<font color="red" >${acceptedFuYiCases}</font>件，驳回<font color="red" >${reject}</font>件，维持<font color="red" >${preserve}</font>件，确认违法<font color="red" >${illegal}</font>件，撤销<font color="red" >${revocation}</font>件，变更<font color="red" >${mofify}</font>件，责令履行<font color="red" >${executionInOrder}</font>件，调解<font color="red" >${reconciliation}</font>件，终止<font color="red" >${termination}</font>件，其它<font color="red" >${otherDeals}</font>件。
                  </div>
                  <div class="content" id="content2" style="display:none">
                  1. 当日全市各级复议机关当面接收复议申请：<font color="red">${faceRecep}</font>件，接收来信申请：<font color="red">${letterRecep}</font>件。<br/>
                  2. 当日全市各级复议机关协助案件审理：<font color="red">${totalCurrent}</font>次。其中，阅卷：<font color="red">${scan}</font>次，送达：<font color="red">${delivery}</font>次，转接材料：<font color="red">${transfer}</font>次，谈话调查：<font color="red">${chat}</font>次。
                  </div>
                  
            </div>
            <script>
            function setContent(type){
            	if(type==1){
            		document.getElementById("content1").style.display="block";
            		document.getElementById("content2").style.display="none";
            	}else{
            		document.getElementById("content2").style.display="block";
            		document.getElementById("content1").style.display="none";            	
            	}
            }
            </script>
            
            <div class="fr list">
                  <ul>
                    <li>
                    	  <div  id="Divx" onclick="getFtl()"></div>
                          <script type="text/javascript">

				              var chartx= new FusionCharts("../pages/fusionCharts/chartsflash/Column2D.swf", "Divx", "340", "230", "0", "0");
				              chartx.setDataXML("${xmlString1}");	
				              <#--chartx.setDataXML("<chart caption='本年度全市各区县人民政府受理情况统计' xAxisName='' yAxisName='' showValues='1' decimals='0' formatNumberScale='0' baseFontSize='14' outCnvBaseFontSize='14'><set label='东城区' value='30' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='西城区' value='26' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='朝阳区' value='20' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='海淀区' value='20' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='丰台区' value='18' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='石景山区' value='16' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='门头沟区' value='13' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='房山区' value='8' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='通州区' value='7' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='顺义区' value='5' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='大兴区' value='5' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='昌平区' value='5' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='平谷区' value='4' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='怀柔区' value='3' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='密云县' value='3' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='延庆县' value='2' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/></chart>");	
				              -->
				              chartx.render("Divx");
			             
			             <#--function getFtl(){
			             	window.open('../pages/showCount.ftl');
			             }-->
			             </script>
                         
                        
                    </li>
                    <li>
                    			
                         <div class="imgDiv" id="Divx1"><img src="../images/index/weiban.png"></div>
                         <script type="text/javascript">
				              var chartx= new FusionCharts("../pages/fusionCharts/chartsflash/Column2D.swf", "Divx1", "350", "220", "0", "0");
				              chartx.setDataXML("${xmlString2}");	
				              <#--chartx.setDataXML("<chart caption='本年度市政府各委办局收案情况统计' xAxisName='' yAxisName='' showValues='1' decimals='0' formatNumberScale='0' baseFontSize='10' outCnvBaseFontSize='10' ><set label='市发展和改革委员会' value='51' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='市教育委员会' value='44' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='市科学技术委员会' value='32' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='市民族事务委员会' value='30' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='市公安局' value='28' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='市监察局' value='25' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='市民政局' value='23' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='市司法局' value='21' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='市财政局' value='21' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='市人力资源和社会保障局' value='17' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/></chart>");
				              -->
				              chartx.render("Divx1");
			             </script>
                         
                         
                         
                    </li>
                    
                    
                    
                    
                  </ul>
            </div>
            
           
      </div>
      <!--加入DIV-->
      
      
</div>
</div>

<div class="indexPart4">
<div class="wal">
      <div class="indexPart4_03">
            <div class="fr list">
                  <ul>
                    <li>
                         <div class="imgDiv" id="Divx1"><img src="../images/index/weiban.png"></div>
                         <script type="text/javascript">
				              var chartx= new FusionCharts("../pages/fusionCharts/chartsflash/Column2D.swf", "Divx1", "350", "220", "0", "0");
				              chartx.setDataXML("${xmlString2}");	
				              <#--chartx.setDataXML("<chart caption='本年度市政府各委办局收案情况统计' xAxisName='' yAxisName='' showValues='1' decimals='0' formatNumberScale='0' baseFontSize='10' outCnvBaseFontSize='10' ><set label='市发展和改革委员会' value='51' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='市教育委员会' value='44' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='市科学技术委员会' value='32' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='市民族事务委员会' value='30' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='市公安局' value='28' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='市监察局' value='25' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='市民政局' value='23' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='市司法局' value='21' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='市财政局' value='21' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='市人力资源和社会保障局' value='17' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/></chart>");
				              -->
				              chartx.render("Divx1");
			             </script>
                    </li>
                 </ul>
            </div>
            
           
      </div>
      <!--加入DIV-->
      
      
</div>
</div>

<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号a<br />
电话：65193431
</div>

</body>
</html>