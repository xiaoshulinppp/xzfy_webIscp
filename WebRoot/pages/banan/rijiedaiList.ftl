
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

<body   onload="startTime()">

<form name="Form1" id="Form1" action="" method="post">

<#include "../website/header.ftl">

<div class="wal pageNow2">
      <div class="fl">当前位置：<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a>> 待办理案件查询</div>
      <div class="fr"></div>
</div>

<div class="pageBg1">
<div class="wal">
     
	  
		<input type="hidden" name="funcCode" value="${funcCode}">
		<input type="hidden" name="pNum" value="${pNum}" id="pageNum">
	  
      <div class="pageBox">
            <div class="searchList">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <th>序号</th>
                    <th>接收日期</th>
                    <th>申请人类别</th> 
                    <th width="15%">申请人名称</th>   
                    <th>接待人</th>  
                    <th>接待处理</th>            
                    <th>被申请人名称</th>
                    <th>立案审查人</th>
                    <th>承办人</th>
                    <th>结案日期</th>
                    <th>结案方式</th>
                    <th width="3%">操作</th>
                   
                  </tr>
				  <#assign account=1>
				<#list rijiedaiList as data>
					
						
					<tr>
						<td>${account}</td>
						<td>&nbsp;${data[0]?default('')}</td>
						<td>&nbsp;
							<#assign apptype=data[1]>
							<#if apptype=='1'>公民<#elseif apptype=='2'>法人<#elseif apptype=='3'>当面补正<#else>${data[1]?default('')}</#if>							
						</td>
						<td>&nbsp;${data[2]?default('')}</td>
						<td>&nbsp;${data[3]?default('')}&nbsp;${data[4]?default('')}</td>
						<td>&nbsp;${data[5]?default('')}</td>
						<td>&nbsp;${data[6]?default('')}</td>
						<td>&nbsp;${data[7]?default('')}</td>
						<td>&nbsp;${data[8]?default('')}&nbsp;${data[9]?default('')}</td>
						<td>&nbsp;${data[10]?default('')}</td>
						<td>&nbsp;
						<#assign finishtype=data[11]?default('')>
						<#if finishtype=="0"></#if>
						<#if finishtype=="1">驳回</#if> 
						<#if finishtype=="2">维持</#if> 
						<#if finishtype=="3">确认违法</#if> 
						<#if finishtype=="4">撤销</#if> 
						<#if finishtype=="5">变更</#if>
						<#if finishtype=="6">责令履行</#if> 
						<#if finishtype=="7">调解</#if> 
						<#if finishtype=="8">终止</#if> 
						<#if finishtype=="9">其他</#if>
						</td>
						<td>
						<#if data[12]=='1'>
							<a href="../xzfy/viewCase.action?funcCode=${funcCode}&xzfyId=${data[13]}" target="_blank" ><font color="green">查看</font></a>
						<#elseif data[12]=='3'>
							<a href="../xzfy/viewXzfyInfo.action?funcCode=${funcCode}&xzfyId=${data[13]}" target="_blank" ><font color="green">查看</font></a>
						<#elseif data[12]=='2'>
							<#if apptype =="送达" >
								<a href="../meet/viewSongda.action?funcCode=${funcCode}&Main_id=${data[13]}" target="_blank" ><font color="green">查看</font></a>
							</#if>
							<#if apptype =="阅卷" >
								<a href="../meet/viewYuejuan.action?funcCode=${funcCode}&Main_id=${data[13]}" target="_blank" ><font color="green">查看</font></a>
							</#if>
							<#if apptype =="转交材料" >
								<a href="../meet/viewZhuanjiaocailiao.action?funcCode=${funcCode}&Main_id=${data[13]}" target="_blank" ><font color="green">查看</font></a>
							</#if>
							<#if apptype =="一般接待" >
								<a href="../meet/viewYibanjiedai.action?funcCode=${funcCode}&Main_id=${data[13]}" target="_blank" ><font color="green">查看</font></a>
							</#if>
						</#if>
						</td>
					</tr>
					<#assign account=account+1>
				</#list>
             
            </table>
          
            
            </div>
      </div>
      <div class="pageBoxBg"></div>
</div>
</div>
</form>
<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>
</body>
</html>

<script>
	
		function handleOp(type,xzfyId){
			opendg("../xzfy/handleOpreator.action?funcCode=${funcCode}&listkeyword=${listkeyword}&typeId="+type+"&xzfyId="+xzfyId,300,300);
		}
	
		function opendg(dgurl,dgw,dgh)
			{
			  $.dialog({ 
			    title:'',
			    width: dgw,
			    height: dgh,
			    content:'url:'+ dgurl});
			}
			
		function cancleOp(xzfyId){
			if(confirm("您确认要取消审批？")){
				window.location="../xzfy/cancleListCase.action?xzfyId="+xzfyId+"&funcCode=${funcCode}&listkeyword=${listkeyword}";
				
			}
		}	
			
		function contactPeople(peopleId){
			parent.document.getElementById("shen1").value=peopleId;
		}
		function updatexzss(id){
				//document.getElementById("tempid").value=id;
				tempid = id;
				document.Form1.action="updatexzss.action";
				document.Form1.submit();
		}
		
		function goPage(pNum){		
			document.getElementById("pageNum").value=pNum;
			document.Form1.submit();
		}
		
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
				if(inputPage > ${totalPage}){
					alert("输入的页数不能超过总页数！");
				}else if(inputPage < 1){
					alert("输入的页数不能少于1页！");
				}else{
					window.location = "../banan/showDmjiedaiList.action?funcCode=${funcCode}&pNum=" + inputPage + "";
				}
				return;
			}

		function plsp(){
			if(!isSelect()){
				alert("请选择需批量审批的案件！");	
			}else{
				var ids=getIds();
				opendg("../xzfy/batchOperation.action?funcCode=${funcCode}&listkeyword=${listkeyword}&ids="+ids,600,200);
			}
		}
		function isSelect(){
			var check=document.getElementsByName("idList");
			b=false;
			for(var i=0;i<check.length;i++){
				if(check[i].checked==true){
					b=true;
				}
			}
			return b;	
		}
		function getIds(){
			var check=document.getElementsByName("idList");
			var id="";
			for(var i=0;i<check.length;i++){
				if(check[i].checked==true){
					if(id=="")
					id+=check[i].value;
					else
					id+=","+check[i].value;
				}
			}
			return id;
		}
	
	</script>