<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行政复议信息管理系统</title>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
	
<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/banli.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
<style type="text/css">img,formDiv,.formDiv{behavior: url(../webstyle/style/ie-css3.htc);} </style> 
<style>
.btn-blue{display:block; width:107px; height:27px;background: url(../images/sideNavBg.gif);line-height:27px; text-align:center; border:#eeeded solid 1px; margin-left:36px;margin-top:10px;float:left;}
.btn-blue:link,.btn-blue:visited{color:#000;}
</style>
</head>

<body   onload="startTime()">
<#include "../website/header.ftl">

<div class="wal">
<div class="pageBg">
<!--wal-->
<div class="fl w198">
      <div class="sideNav">
            <div class="title">请选择栏目</div>
            <ul>
            	 <li><a href="javascript:divControl('1');" class="aNow" >案件信息</a></li>
            	 <#if xzfyInfo.id.length() gt 10>
            	 <li><a href="javascript:divControl('2');"  >接待信息</a></li>
            	 <li><a href="javascript:divControl('9');"  >立案审批</a></li>
            	 <li><a href="javascript:divControl('3');"  >复议委员会</a></li>
                 <li><a href="javascript:divControl('4');" >答复通知</a></li>
                 <li><a href="javascript:divControl('5');" >延期审批</a></li>
                 <li><a href="javascript:divControl('6');" >中止审批</a></li>
                 <#if xzfyInfo.isstop?has_content && xzfyInfo.isstop=="1"><li><a href="javascript:divControl('7');" >恢复审批</a></li></#if>
                 <li><a href="javascript:divControl('8');" >结案审批</a></li>
                 
                 </#if>
                 <li><a href="javascript:divControl('11');" >案卷管理</a></li>
                 <li><a href="javascript:divControl('10');" >操作记录</a></li>
            </ul>
      </div>
      <div class="sideTip">
            <h1 class="title">案件办理提示</h1>
            <div class="content">同一具体行政行为案件共<a href="../banan/showsamexwList.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}" target="_blank">${totalCount1}</a>件<br />同一类别具体行政行为案件共<a href="../banan/showsamekindxwList.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}" target="_blank">${totalCount2}</a>件<br /></div>
      </div>
</div>
<div class="fr w739">
      <div class="pageNow">
      		当前位置：<a href="../banan/showanjianbanliList.action?funcCode=${funcCode}&listkeyword=${listkeyword}" style="text-decoration:underline">待办案件列表</a> > 案件办理 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      		案件状态：<font color="red">
      				<#if xzfyInfo.status=="4">
						案件办理
					<#elseif xzfyInfo.status=="5">
						延期审批
					<#elseif xzfyInfo.status=="6">
						案件延期
					<#elseif xzfyInfo.status=="7">
						中止审批
					<#elseif xzfyInfo.status=="8">
						案件中止
					<#elseif xzfyInfo.status=="9">
						恢复审理审批
					<#elseif xzfyInfo.status=="10">
						恢复审理
					<#elseif xzfyInfo.status=="11">
						结案审批
					<#elseif xzfyInfo.status=="12">
						结案
					</#if>
					</font>
					
				&nbsp;&nbsp;&nbsp;&nbsp;
				<#if dateCheck?default('')!='break'>
				 距审理期限届满之日还有 <font style="font-size:24px;color:red">${dateCheck}</font> 天	
				 </#if>
				 &nbsp;&nbsp;&nbsp;&nbsp;
				 <a onclick="getMsg();return false;" href="" style="width:107px; height:27px;background: url(../images/sideNavBg.gif);line-height:27px; text-align:center; border:#eeeded solid 1px; margin-left:36px;margin-top:10px;float:right;">短信平台</a>
				 <!--<input type="button" value="短信平台" onclick="getMsg()" style="border:1px solid;font-family:仿宋;font-size:14px;color:#668B8B;background:#FFFF00;font-weight:bolder;vertical-align:middle;text-align:center;padding:5px;"/>
				 -->
				 
				 <!--<a href="/xzfy/ssoServlet?LinkID=mhsms&LinkType=online" target='_blank' style="color:black;background:yellow" >短信平台</a>-->
			<h1 class="fr"></h1>
      </div>
	  <script>
		function getMsg(){
			window.open('/xzfy/ssoServlet?LinkID=mhsms&LinkType=online');
		}
	  </script>
    <form id="form1" name="form1" action="''" method="post" ENCTYPE="multipart/form-data">
    		<#assign isde=xzfyInfo.isdelay?default('0')>
			<#assign isst=xzfyInfo.isstop?default('0')>		
			<#assign withdrawsp=xzfyInfo.check_status?default('0')>	
			<input type="hidden" name="listkeyword" value="${listkeyword}" />
			<input type="hidden" name="xzfyDftz.sentanswerdate" value="${todate}" />
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="tempid" value="${xzfyInfo.id}" />
			<input type="hidden" name="xzfyInfo.id" value="${xzfyInfo.id}" />
			<input type="hidden" id="checkstatus" name="tempchsta" value="${xzfyInfo.check_status?default('')}" />		
			<input type="hidden" id="zidongzhanshi" name="" value="${xzfyInfo.status?default('')}" />			
			<input type="hidden" id="checkid" name="checkid" value="" />			
			<input type="hidden" name="xzfySenpi.sqspren_id" value="<#if xzfyInfo.user2_id?has_content>${xzfyInfo.user2_id}</#if>" />
			<input type="hidden" name="xzfySenpi.sqspren_name" value="<#if xzfyInfo.user2_name?has_content>${xzfyInfo.user2_name}</#if>" />
			<input type="hidden" name="admit_name" value="admit_name" />
			

			<input type="hidden" id="anjianxinxi" value="../xzfy/editlian.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&listkeyword=${listkeyword}&isView=0" />
			<input type="hidden" id="jiedaixinxi" value="../xzfy/viewXzfyInfo.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&isView=1" />
			<input type="hidden" id="anjianshenli" value="../banan/anjianbanliform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}&listkeyword=${listkeyword}&isView=1" />
			<input type="hidden" id="dafutongzhi" value="../banan/dftzform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}&listkeyword=${listkeyword}&isView=1" />
			<input type="hidden" id="yanqishenli" value="../banan/yanqiform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}&listkeyword=${listkeyword}&admit_name=${admit_name}&isView=1" />
			<input type="hidden" id="zhongzhishenli" value="../banan/zhongzhiform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}&listkeyword=${listkeyword}&isView=1" />
			<input type="hidden" id="huifushenli" value="../banan/huifuform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}&listkeyword=${listkeyword}&isView=1" />
			<input type="hidden" id="jieanshenli" value="../banan/jieanform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}&listkeyword=${listkeyword}&isView=1" />
			<input type="hidden" id="lianshouli" value="../xzfy/shenpiFormInfo.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&checkDocType=3&listkeyword=${listkeyword}&resultType=1&isView=0" />
			<input type="hidden" id="logDiv" value="../xzfy/showLogList.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&listkeyword=${listkeyword}">
 			<input type="hidden" id="archive" value="../archive/showArchiveList.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}" />
 		<div class="pageDiv" style="display:block">
     		<iframe id="ifm0" src="../xzfy/editlian.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&listkeyword=${listkeyword}&isView=${isView?default(0)}" 
  		 	frameborder="0" marginheight="0" marginwidth="0" frameborder="0" scrolling="yes"  width="100%" height="1800px"></iframe>
	  	</div>

		<script>
			var x;
			var a=document.getElementById("anjianxinxi").value;
			var b=document.getElementById("jiedaixinxi").value;
			var c=document.getElementById("anjianshenli").value;
			var d=document.getElementById("dafutongzhi").value;
			var e=document.getElementById("yanqishenli").value;
			var f=document.getElementById("zhongzhishenli").value;
			var g=document.getElementById("huifushenli").value;
			var h=document.getElementById("jieanshenli").value;
			var i=document.getElementById("lianshouli").value;
			var j=document.getElementById("logDiv").value;
			var k=document.getElementById("archive").value;
			var n=document.getElementById("ifm0");
			function divControl(x){
				if(x=='1')
					n.src=a;
				else if(x=='2')
					n.src=b;
				else if(x=='3')
					n.src=c;
				else if(x=='4')
					n.src=d;
				else if(x=='5')
					n.src=e;
				else if(x=='6')
					n.src=f;
				else if(x=='7')
					n.src=g;
				else if(x=='9')
					n.src=i;
				else if(x=='10')
					n.src=j;
				else if(x=='11')
					n.src=k;
				else
					n.src=h;
			}
		</script>
	  	
 </form>
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


<script type="text/javascript">

//这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！
//这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！
//这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！
//这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！
//这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！
//这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！
//这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！这些js不用看了都没用了！！
	var aaaa = 1;
	var bbbb = 1;
	var cccc = 1;
	var dddd = 1;
	var eeee = 1;
	var ffff = 1;
	//var temp = 0;
	function gotoBack(){
		window.history.back();
	}
	function banan(){
		document.getElementById("dftz").style.display="none";
		aaaa=1;
		document.getElementById("yanqi").style.display="none";
		bbbb=1;
		document.getElementById("zhongzhi").style.display="none";
		cccc=1;
		document.getElementById("huifushenli").style.display="none";
		dddd=1;
		document.getElementById("jiean").style.display="none";
		eeee=1;
		if(ffff==1){
			document.getElementById("banan").style.display="block";
			ffff=0;
		}
		else{
			document.getElementById("banan").style.display="none";
			ffff=1;
		}
	}
	function dftz(){
		document.getElementById("yanqi").style.display="none";
		bbbb=1;
		document.getElementById("zhongzhi").style.display="none";
		cccc=1;
		document.getElementById("huifushenli").style.display="none";
		dddd=1;
		document.getElementById("jiean").style.display="none";
		eeee=1;
		document.getElementById("banan").style.display="none";
		ffff=1;
		if(aaaa==1){
			document.getElementById("dftz").style.display="block";
			aaaa=0;
		}
		else{
			document.getElementById("dftz").style.display="none";
			aaaa=1;
		}
		temp=1;
	}

	function yanqi(){
		document.getElementById("dftz").style.display="none";
		aaaa=1;
		document.getElementById("zhongzhi").style.display="none";
		cccc=1;
		document.getElementById("huifushenli").style.display="none";
		dddd=1;
		document.getElementById("jiean").style.display="none";
		eeee=1;
		document.getElementById("banan").style.display="none";
		ffff=1;
		if(bbbb==1){
			document.getElementById("yanqi").style.display="block";
			bbbb=0;
		}
		else{
			document.getElementById("yanqi").style.display="none";
			bbbb=1;
		}
		temp=2;
		temp1=2;
	}

	function zhongzhi(){
		document.getElementById("dftz").style.display="none";
		aaaa=1;
		document.getElementById("yanqi").style.display="none";
		bbbb=1;
		document.getElementById("huifushenli").style.display="none";
		dddd=1;
		document.getElementById("jiean").style.display="none";
		eeee=1;
		document.getElementById("banan").style.display="none";
		ffff=1;
		if(cccc==1){
			document.getElementById("zhongzhi").style.display="block";
			cccc=0;
		}
		else{
			document.getElementById("zhongzhi").style.display="none";
			cccc=1;
		}
		temp=3;
		temp1=3;
	}

	function huifushenli(){
		document.getElementById("dftz").style.display="none";
		aaaa=1;
		document.getElementById("yanqi").style.display="none";
		bbbb=1;
		document.getElementById("zhongzhi").style.display="none";
		cccc=1;
		document.getElementById("jiean").style.display="none";
		eeee=1;
		document.getElementById("banan").style.display="none";
		ffff=1;
		if(dddd==1){
			document.getElementById("huifushenli").style.display="block";
			dddd=0;
		}
		else{
			document.getElementById("huifushenli").style.display="none";
			dddd=1;
		}
		temp=4;
	}

	function jiean(){
		document.getElementById("dftz").style.display="none";
		aaaa=1;
		document.getElementById("yanqi").style.display="none";
		bbbb=1;
		document.getElementById("zhongzhi").style.display="none";
		cccc=1;
		document.getElementById("huifushenli").style.display="none";
		dddd=1;
		document.getElementById("banan").style.display="none";
		ffff=1;
		if(eeee==1){
			document.getElementById("jiean").style.display="block";
			eeee=0;
		}
		else{
			document.getElementById("jiean").style.display="none";
			eeee=1;
		}
		temp=5;
	}

	function isyanqisp(){
		//通过选择延期审批人控制批准人批复意见框是否显示
		if(document.getElementById("yanqispr").value=="0"){
			document.getElementById("yanqipz").style.display="block";			
		}
		else{
			document.getElementById("yanqipz").style.display="none";
		}
	}
	function iszhongzhisp(){
		//通过选择延期审批人控制批准人批复意见框是否显示
		if(document.getElementById("zhongzhispr").value=="0"){
			document.getElementById("zhongzhipz").style.display="block";			
		}
		else{
			document.getElementById("zhongzhipz").style.display="none";
		}
	}
	function ishuifusp(){
		//通过选择延期审批人控制批准人批复意见框是否显示
		if(document.getElementById("huifuspr").value=="0"){
			document.getElementById("huifupz").style.display="block";			
		}
		else{
			document.getElementById("huifupz").style.display="none";
		}
	}
	
	
	
	
	function isjieansp(){
		//通过选择延期审批人控制批准人批复意见框是否显示
		if(document.getElementById("jieanspr").value=="0"){
			document.getElementById("jieanpz").style.display="block";			
		}
		else{
			document.getElementById("jieanpz").style.display="none";
		}
	}
	function jafss(){
		if(document.getElementById("jafs").value==8){
			document.getElementById("jafs1").style.display="block";
		}
		else{
			document.getElementById("jafs1").style.display="none";
		}
	}
	function tiaojie(){
		if(document.getElementById("tj").value==0){
			document.getElementById("tj1").style.display="none";
		}
		else{
			document.getElementById("tj1").style.display="block";
		}
	}
	function gjpcc(){
			document.getElementById("pcje").disabled=true;
	}
	function gjpcc1(){
			document.getElementById("pcje").disabled=false;
	}
	function opendg(dgurl,dgw,dgh)
	{
	//alert(1111);
	  $.dialog({ 
	    title:'',
	    width: dgw,
	    height: dgh,
	    content:'url:'+ dgurl});
	}
	
</script>
<script type="text/javascript">
	function save(){
		if(confirm("确认提交？")){	
			window.form1.action="savebanan.action?tempstatus=0";
			window.form1.submit();
			alert("操作已完成！");
		}
	}
	function save6(){
		if(confirm("确认提交？")){	
			document.getElementById("pizhunren").value=document.getElementById("yanqispr").value;
			window.form1.action="savebanan.action?tempstatus=6&tempcheckstatus=0&isdelay=1 ";
			window.form1.submit();
			alert("操作已完成！");
		}
	}
	function save8(){
		if(confirm("确认提交？")){
			document.getElementById("pizhunren1").value=document.getElementById("zhongzhispr").value;
			window.form1.action="savebanan.action?tempstatus=8&tempcheckstatus=0&isstop=1" ;
			window.form1.submit();
			alert("操作已完成！");
		}
	}
	function save10(){
		if(confirm("确认提交？")){
			document.getElementById("pizhunren2").value=document.getElementById("huifuspr").value;	
			window.form1.action="savebanan.action?tempstatus=10&tempcheckstatus=0";
			window.form1.submit();
			alert("操作已完成！");
		}
	}
	function save12(){
		if(confirm("确认提交？")){
			document.getElementById("pizhunren3").value=document.getElementById("jieanspr").value;
			window.form1.action="savebanan.action?tempstatus=12&tempcheckstatus=0";
			window.form1.submit();
			alert("操作已完成！");
		}
	}
	function tijiaoshenpi5(){
	    //提交延期审批，若未选择审批人，则提示请选择审批人
		if(document.getElementById("yanqispr").value==0){	
			alert("请选择审批人");
			return;
		}
		if(confirm("确认提交？")){
			document.getElementById("checkid").value=document.getElementById("yanqispr").value;	
			window.form1.action="saveshenpi.action?tempstatus=5&xzfyShenpi.check_type=5&tempcheckstatus=1";	
			window.form1.submit();
		}
	}
	function tijiaoshenpi7(){
		//提交延期审批，若未选择审批人，则提示请选择审批人
		if(document.getElementById("zhongzhispr").value==0){	
			alert("请选择审批人");
			return;
		}
		if(confirm("确认提交？")){	
			document.getElementById("checkid").value=document.getElementById("zhongzhispr").value;	
			window.form1.action="saveshenpi.action?tempstatus=7&xzfyShenpi.check_type=7&tempcheckstatus=1";	
			window.form1.submit();
		}
	}
	function tijiaoshenpi9(){
		//提交延期审批，若未选择审批人，则提示请选择审批人
		if(document.getElementById("huifuspr").value==0){	
			alert("请选择审批人");
			return;
		}
		if(confirm("确认提交？")){	
			document.getElementById("checkid").value=document.getElementById("huifuspr").value;	
			window.form1.action="saveshenpi.action?tempstatus=9&xzfyShenpi.check_type=9&tempcheckstatus=1";	
			window.form1.submit();
		}
	}
	function tijiaoshenpi11(){
		//提交延期审批，若未选择审批人，则提示请选择审批人
		if(document.getElementById("jieanspr").value==0){	
			alert("请选择审批人");
			return;
		}
		if(confirm("确认提交？")){
			document.getElementById("checkid").value=document.getElementById("jieanspr").value;		
			window.form1.action="saveshenpi.action?tempstatus=11&xzfyShenpi.check_type=11&tempcheckstatus=1";	
			window.form1.submit();
		}
	}
	function withdrawsp(){
		if(document.getElementById("checkstatus").value==0){	
			alert("您未提交审批");
			return;
		}
		if(confirm("确认取消？")){	
			window.form1.action="withdrawsp.action";	
			window.form1.submit();
		}
	}
	
	
	var count=0;
	function addxcdc(){
		var e=document.createElement('div');
		e.id="div"+count;
		e.innerHTML="<input type=\"file\" name=\"upFile\" class=\"inputTextFile\" />"+"<a href=\"javascript:del(\'"+e.id+"\')\">删除</a>";
		document.getElementById("addxcdc").appendChild(e);
		count++;
	}
	function del(id){
		var e=document.getElementById(id);
		document.getElementById("addxcdc").removeChild(e);
	}
	function savedftz(){
		window.form1.action="savedftz.action";	
		window.form1.submit();
	}
	function saveToDftzDoc(){	
		if(confirm("点击确定就将保存附件内容。")){
			var options = { 
				url:'savedftz.action', //提交给哪个执行 
				type:'POST', 
				success: getDftzshu //显示操作提示 
			}; 
			$('#form1').ajaxSubmit(options); 
			return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		}
	}
	function getDftzshu(){
		var url ="http://localhost:8080/webIscp/bac_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}";
		//var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url);
	}
	function commitDftz(){
		if(confirm("确认提交？")){
			window.form1.action="commitdftz.action";
			window.form1.submit();
		}
	}
	
	
	function saveToYanqiDoc(){
		if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			var options = { 
				url:'savebanan.action', //提交给哪个执行 
				type:'POST', 
				success: getYanqishenqingshu //显示操作提示 
			}; 
			$('#form1').ajaxSubmit(options); 
			return false; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		}
	}	
	function getYanqishenqingshu(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url);
	}
	
	function saveToZhongzhiDoc(){
		if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			var options = { 
				url:'savebanan.action', //提交给哪个执行 
				type:'POST', 
				success: getZhongzhishenqingshu //显示操作提示 
			}; 
			$('#form1').ajaxSubmit(options); 
			return false; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		}
	}	
	function getZhongzhishenqingshu(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url);
	}
	
	function saveToHuifuDoc(){
		if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			var options = { 
				url:'savebanan.action', //提交给哪个执行 
				type:'POST', 
				success: getHuifushenqingshu //显示操作提示 
			}; 
			$('#form1').ajaxSubmit(options); 
			return false; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		}
	}	
	function getHuifushenqingshu(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url);
	}
	
	function saveToJieanDoc(){
		if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			var options = { 
				url:'savebanan.action', //提交给哪个执行 
				type:'POST', 
				success: getJieanshenqingshu //显示操作提示 
			}; 
			$('#form1').ajaxSubmit(options); 
			return false; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		}
	}	
	function getJieanshenqingshu(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url);
	}
	
	function saveToYijianDoc(){
		if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			var options = { 
				url:'savebanan.action', //提交给哪个执行 
				type:'POST', 
				success: getYijianshu //显示操作提示 
			}; 
			$('#form1').ajaxSubmit(options); 
			return false; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		}
	}	
	function getYijianshu(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url);
	}
	
	function saveToJianyiDoc(){
		if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			var options = { 
				url:'savebanan.action', //提交给哪个执行 
				type:'POST', 
				success: getJianyishu //显示操作提示 
			}; 
			$('#form1').ajaxSubmit(options); 
			return false; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		}
	}	
	function getJianyishu(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url);
	}
	
	
	//模板
	function savaToGetDoc(){
		if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			document.getElementById("keyword2").value=1;
			var callBackMethod;
			if(type==1){
				var options = { 
					url:'saveToDoc.action', //提交给哪个执行 
					type:'POST', 
					success: getBuzhengtongzhi //显示操作提示 
				}; 
				$('#form1').ajaxSubmit(options); 
				return false; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
			}
		}
	}	
	function getBuzhengtongzhi(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url);
	}
	
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
	
	
	function getFacePage(id){

		window.open('../xzfy/viewXzfyInfo.action?xzfyId='+id+'&funcCode=${funcCode}');

}
</script>
<script type="text/javascript">
	function createApp(){
		if(confirm("您确认要审核吗？")){
			//window.document.getElementById("sunbt").disabled=true;;
			window.document.getElementById("createForm").submit();
		}
	}
	
	function getDoc(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131017104618&d_username=panglei&caseId=${xzfyInfo.id}";
		window.open(url);
	}
	
	function docPrint(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyInfo.id}";
		window.open(url);
	}
	
	
</script>