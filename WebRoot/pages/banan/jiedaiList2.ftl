
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

<script language="JavaScript" src="../pages/fusionCharts/chartsjs/FusionCharts.js"></script>
<script language="JavaScript" src="../pages/fusionCharts/chartsjs/FusionChartsExportComponent.js"></script>


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
       <div class="fl">当前位置：&nbsp;&nbsp;<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a> >&nbsp;&nbsp;  <a href="../website/showColumn.action?funcCode=${funcCode}&column=5">统计查询</a>  &nbsp;&nbsp;在线服务平台综合查询  </div>
     <div class="fr"></div>
</div>

<div class="pageBg1">
<div class="wal">
     
	  
		<input type="hidden" name="funcCode" value="${funcCode}">
		<input type="hidden" name="pNum" value="${pNum}" id="pageNum">

		<#assign lurushuju='5342'>
		<#assign yitongbu='5300'>
		<#assign daitongbu='42'>
	<font  size="4">  服务平台录入数据：<font style="color:green">${lurushuju}</font>&nbsp;件&nbsp;&nbsp;已同步数据：<font style="color:green">${yitongbu}</font>&nbsp;件&nbsp;&nbsp;待同步数据：<font style="color:red">${daitongbu}</font>&nbsp;件
	</font>	
		
		<br/>	
		<br/>
		
	<tr>
	
	    <td align="center">
	    	 <label for="isting_y" onclick="check_qtfyjg('0')" > <input type="radio" checked  name="xzfyInfo.istingzheng" value="是" id="tingzheng_y" ischeck="y" altname="平台录入情况按月统计" >
		      <font size="3">平台录入情况按月统计</font></label>
		      
		   <label for="isting_n" onclick="check_qtfyjg('1')">   <input type="radio"  name="xzfyInfo.istingzheng" value="否" id="tingzheng_n" ischeck="y" altname="平台录入情况按日统计">
		      <font size="3">平台录入情况区域统计(逻辑有待商榷)</font></label>
		      
		     <label for="isting_n"  onclick="check_qtfyjg('2')">  <input type="radio"   name="xzfyInfo.istingzheng" value="否" id="tingzheng_s" ischeck="y" altname="待同步数据分析">
		     <font size="3">待同步数据分析</font></label>
	    </td>
	   
    </tr>  
    <br>
    <br>
    <br>
    <br>
	<div id="char1" >
      
                  <ul>
                    <li>
                         <div  id="Divx2"></div>
                         <script type="text/javascript">
				              var chartx= new FusionCharts("../pages/fusionCharts/chartsflash/Column2D.swf", "Divx2", "900", "500", "0", "1");
				            
				              chartx.setDataXML("<chart caption='平台录入情况月份统计分析' xAxisName='' yAxisName='' showValues='1' decimals='0' formatNumberScale='0' baseFontSize='10' outCnvBaseFontSize='10' ><set label='一月' value='51' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='二月' value='44' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='三月' value='32' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='四月' value='30' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='五月' value='28' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='六月' value='25' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='七月' value='23' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='八月' value='21' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='九月' value='21' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='十月' value='17' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='十一月' value='21' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/><set label='十二月' value='17' link='../xzfy/showDetailChart2.action?funcCode=${funcCode}'/> </chart>");
				              
				              chartx.render("Divx2");
			             </script>
                    </li>
                 </ul>
      
      <!--加入DIV-->
      
      
</div>
	  
	<div id="char2"  style="display:none">
	
                    	  <div  id="Divx" ></div>
                          <script type="text/javascript">

				              var chartx= new FusionCharts("../pages/fusionCharts/chartsflash/Pie3D.swf", "Divx", "900", "500", "0", "1");
				              <#--chartx.setDataXML("${xmlString1}");-->	
				              chartx.setDataXML("<chart caption='平台录入情况区域统计' xAxisName='' yAxisName='' showValues='1' decimals='0' formatNumberScale='0' baseFontSize='14' outCnvBaseFontSize='14'><set label='东城区' value='30' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='西城区' value='26' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='朝阳区' value='20' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='海淀区' value='20' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='丰台区' value='18' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='石景山区' value='16' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='门头沟区' value='13' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='房山区' value='8' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='通州区' value='7' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='顺义区' value='5' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='大兴区' value='5' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='昌平区' value='5' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='平谷区' value='4' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='怀柔区' value='3' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='密云区' value='3' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/><set label='延庆区' value='2' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/></chart>");	
				              
				              chartx.render("Divx");
			             
			             <#--function getFtl(){
			             	window.open('../pages/showCount.ftl');
			             }-->
			             </script>
                     
	
	</div>

	  
	  <div id="char3" style="display:none">
                 
                    	  <div  id="Divx4444" onclick="getFtl()"></div>
                          <script type="text/javascript">

				              var chartx3= new FusionCharts("../pages/fusionCharts/chartsflash/Column2D.swf", "Divx", "900", "500", "0", "1");
				              <#--chartx.setDataXML("${xmlString1}");  -->	
				              chartx3.setDataXML("<chart caption='待同步数据统计情况' xAxisName='' yAxisName='' showValues='1' decimals='0' formatNumberScale='0' baseFontSize='14' outCnvBaseFontSize='14'>"+
				             " <set label='6.23'  value='50' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/>"+
				              "<set label='6.13' value='1' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/>"+
				              "<set label='6.10' value='1' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/>"+
				              "<set label='6.9' value='0' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/>"+
				              "<set label='6.8' value='0' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/>"+
				              "<set label='6.7' value='0' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/>"+
				              "<set label='6.6' value='0' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/>"+
				              "<set label='6.5' value='0' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/>"+
				              "<set label='6.4' value='0' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/>"+
				              "<set label='6.3' value='0' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/>"+
				              "<set label='6.2' value='0' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/>"+
				              "<set label='6.1' value='0' link='../xzfy/showDetailChart1.action?funcCode=${funcCode}'/>"+
				                 " </chart>");	
				            
				              chartx3.render("Divx4444");
			             
			             <#--function getFtl(){
			             	window.open('../pages/showCount.ftl');
			             }-->
			             </script>
           
	  </div>
	  
	  
	  
	  
	  
	  
	  
     
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
	
	
	
	function check_qtfyjg(id){
	//alert(id);
	if(id=='0')
	{   
	  document.getElementById("char1").style.display="block";
	  document.getElementById("tingzheng_y").checked=true
	  document.getElementById("char2").style.display="none";
	  document.getElementById("char3").style.display="none";
	//  document.getElementById("handle_detail").style.display="none";
	}
	if(id=='1')
	{   
      document.getElementById("char1").style.display="none";
	  document.getElementById("char2").style.display="block"; 
	  
	  document.getElementById("tingzheng_n").checked=true
	  document.getElementById("char3").style.display="none";
	}
	if(id=='2')
	{   
      document.getElementById("char1").style.display="none";
	  document.getElementById("char2").style.display="none";
	  document.getElementById("char3").style.display="block";
	  document.getElementById("tingzheng_s").checked=true
	}
	
	
	}
	
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