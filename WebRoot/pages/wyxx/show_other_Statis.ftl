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
</head>
<body  onload="startTime()">
<#include "../website/header.ftl">

<div class="wal">
<div class="pageBg2">

<div class="fl w198">
      <div class="sideNav">
            <div class="title">请选择栏目</div>
            <ul>
                 <li><a href="../wyxx/showQustnPage.action?funcCode=${funcCode}">调查问卷</a></li>
                 <li><a href="../wyxx/showOtherStatis.action?funcCode=${funcCode}" class="aNow">意见汇总</a></li>
            </ul>
      </div>
</div>

<div class="fr w771">
	<div class="pageNow">当前位置：意见汇总</div>
  
    <div id="totallist" style="display:block">

           <div class="dataListTitle"><h1>意见汇总</h1></div>

           <div class="dataList">
              <ul>
              	
   			     <#list opinionList as a>
   			     <assign op=a.opinion?defalut('')>
   			     <li title='${a.opinion}'>
   			     <#if a.opinion?has_content && a.opinion.length() gt 40><a href="../wyxx/viewDetail.action?funcCode=${funcCode}&id=${a.id}">${a.opinion[0..39]}...</a>
   			     <#else>
   			     <a href="../wyxx/viewDetail.action?funcCode=${funcCode}&id=${a.id}">${a.opinion?default('')}</a>
   			     </#if>（${a.fullName}）<span>${a.submitTime}</span></li>

   			     </#list>
   			  </ul>
           </div>
   	
           <div class="dataListB"></div>
    </div>
    
    <div class="pageNum">
             第${currentPgNo}/${totlPg}页  共有${pglist.getTotalCount()}条
　                                                <#assign upPage = currentPgNo -1>
					<#if upPage lt 1 >
					<#assign upPage = 1>
					</#if>
					<#assign downPage = currentPgNo +1>
					<#if (downPage gt totlPg)>
					<#assign downPage = totlPg>
					</#if>
	    <a href ="../wyxx/showOtherStatis.action?currentPgNo=1&funcCode=${funcCode}">首页</a>
        <a href ="../wyxx/showOtherStatis.action?currentPgNo=${upPage}&funcCode=${funcCode}">上一页</a>	
        <a href ="../wyxx/showOtherStatis.action?currentPgNo=${downPage}&funcCode=${funcCode}">下一页</a>
        <a href ="../wyxx/showOtherStatis.action?currentPgNo=${totlPg}&funcCode=${funcCode}">末页</a>
        第
        <input class="input1" name="gotoPageNum" id="gotoPageNum" type="text" class="inputTextSmall" maxlength="3">
        页
        <a href="#" onclick="gotoPage()">跳转</a>
    </div>

</div>

<span class="clear_f"></span>
<div class="h50"></div>
<!--walEnd-->
</div>
</div>


<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>
</body>
</html>

<script>
function gotoPage(){
				var inputPage = window.document.getElementById("gotoPageNum").value;
				if(!inputPage.match("[\\d+]+")){
					alert("页数必须为整数！");
					return;
				}else{
					for(var i=0;i<inputPage.length;i++){
						if(inputPage.charCodeAt(i)>57 || inputPage.charCodeAt(i)<48){
							alert("页数必须为整数！");
							return;
						}
					}
				}
				if(inputPage > ${totlPg}){
					alert("输入的页数不能超过总页数！");
				}else if(inputPage < 1){
					alert("输入的页数不能少于1页！");
				}else{
					window.location = "../wyxx/showOtherStatis.action?funcCode=${funcCode}&currentPgNo=" + inputPage;
				}
				    return;
			}
</script>