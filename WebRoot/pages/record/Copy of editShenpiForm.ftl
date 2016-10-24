<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link rel="stylesheet" type="text/css" href="../css/style_anju.css">
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script>  
		<style type="text/css">img,z_wrap_info,.z_wrap_info{behavior: url(../css/ie-css3.htc);} </style> 
	</head>
	<body>
	<form id="createForm" action="../xzfy/subCheckCase.action" method="post" >
	<#assign docType=''>

<script>
subcat = new Array();
var count=0;
   subcat[0]=new Array("6","北京市人民政府","0000"); 
       count++;    
       subcat[1]=new Array("2","东城区人民政府","0100"); 
       count++;    
       subcat[2]=new Array("2","西城区人民政府","0200"); 
       count++;    
       subcat[3]=new Array("2","崇文区人民政府","0300"); 
       count++;    
       subcat[4]=new Array("2","宣武区人民政府","0400"); 
       count++;    
       subcat[5]=new Array("2","朝阳区人民政府","0500"); 
       count++;    
       subcat[6]=new Array("2","海淀区人民政府","0600"); 
       count++;    
       subcat[7]=new Array("2","丰台区人民政府","0700"); 
       count++;    
       subcat[8]=new Array("2","石景山区人民政府","0800"); 
       count++;    
       subcat[9]=new Array("2","门头沟区人民政府","0900"); 
       count++;    
       subcat[10]=new Array("2","房山区人民政府","1000"); 
       count++;    
       subcat[11]=new Array("2","通州区人民政府","1100"); 
       count++;    
       subcat[12]=new Array("2","顺义区人民政府","1200"); 
       count++;    
       subcat[13]=new Array("2","大兴区人民政府","1300"); 
       count++;    
       subcat[14]=new Array("2","昌平区人民政府","1400"); 
       count++;    
       subcat[15]=new Array("2","平谷区人民政府","1500"); 
       count++;    
       subcat[16]=new Array("2","怀柔区人民政府","1600"); 
       count++;    
       subcat[17]=new Array("2","密云县人民政府","1700"); 
       count++;    
       subcat[18]=new Array("2","延庆县人民政府","1800"); 
       count++;    
       subcat[19]=new Array("7","市发展和改革委员会","1900"); 
       count++;    
       subcat[20]=new Array("7","市教育委员会","2000"); 
       count++;    
       subcat[21]=new Array("7","市科学技术委员会","2100"); 
       count++;    
       subcat[22]=new Array("7","市民族事务委员会","2200"); 
       count++;    
       subcat[23]=new Array("7","市公安局","2300"); 
       count++;    
       subcat[24]=new Array("7","市监察局","2400"); 
       count++;    
       subcat[25]=new Array("7","市民政局","2500"); 
       count++;    
       subcat[26]=new Array("7","市司法局","2600"); 
       count++;    
       subcat[27]=new Array("7","市财政局","2700"); 
       count++;    
       subcat[28]=new Array("7","市人力资源和社会保障局","2900"); 
       count++;    
       subcat[29]=new Array("7","市国土资源局","3000"); 
       count++;    
       subcat[30]=new Array("7","市规划委员会","3100"); 
       count++;    
       subcat[31]=new Array("7","市住房和城乡建设委员会","3200"); 
       count++;    
       subcat[32]=new Array("7","市市政市容管理委员会","3300"); 
       count++;    
       subcat[33]=new Array("7","市交通委员会","3400"); 
       count++;    
       subcat[34]=new Array("7","市水务局","3500"); 
       count++;    
       subcat[35]=new Array("7","市农村工作委员会","3600"); 
       count++;    
       subcat[36]=new Array("7","北京市商务局","3700"); 
       count++;    
       subcat[37]=new Array("7","市文化局","3800"); 
       count++;    
       subcat[38]=new Array("7","市卫生局","3900"); 
       count++;    
       subcat[39]=new Array("7","市人口和计划生育委员会","4000"); 
       count++;    
       subcat[40]=new Array("7","市审计局","4100"); 
       count++;    
       subcat[41]=new Array("7","市人民政府外事办公室","4200"); 
       count++;    
       subcat[42]=new Array("7","市国有资产监督管理委员会","4300"); 
       count++;    
       subcat[43]=new Array("7","市地方税务局","4400"); 
       count++;    
       subcat[44]=new Array("7","市工商行政管理局","4500"); 
       count++;    
       subcat[45]=new Array("7","市质量技术监督局","4600"); 
       count++;    
       subcat[46]=new Array("7","市环境保护局","4700"); 
       count++;    
       subcat[47]=new Array("7","北京市工业促进局","4800"); 
       count++;    
       subcat[48]=new Array("7","市农业局","4900"); 
       count++;    
       subcat[49]=new Array("7","市广播电影电视局","5000"); 
       count++;    
       subcat[50]=new Array("7","市新闻出版局","5100"); 
       count++;    
       subcat[51]=new Array("7","市文物局","5200"); 
       count++;    
       subcat[52]=new Array("7","市体育局","5300"); 
       count++;    
       subcat[53]=new Array("7","市统计局","5400"); 
       count++;    
       subcat[54]=new Array("7","市园林绿化局","5500"); 
       count++;    
       subcat[55]=new Array("7","市药品监督管理局","5600"); 
       count++;    
       subcat[56]=new Array("7","市安全生产监督管理局","5700"); 
       count++;    
       subcat[57]=new Array("7","市旅游局","5800"); 
       count++;    
       subcat[58]=new Array("7","市人民政府侨务办公室","5900"); 
       count++;    
       subcat[59]=new Array("7","市民防局","6000"); 
       count++;    
       subcat[60]=new Array("7","北京市信息化工作办公室","6100"); 
       count++;    
       subcat[61]=new Array("7","市城市管理综合行政执法局","6200"); 
       count++;    
       subcat[62]=new Array("7","市运输管理局","6300"); 
       count++;    
       subcat[63]=new Array("7","北京市交通执法总队","6400"); 
       count++;    
       subcat[64]=new Array("7","路政局","6500"); 
       count++;    
       subcat[65]=new Array("7","北京市乡镇企业局","6600"); 
       count++;    
       subcat[66]=new Array("7","市粮食局","6700"); 
       count++;    
       subcat[67]=new Array("7","市中医管理局","6800"); 
       count++;    
       subcat[68]=new Array("7","北京市地方海事局","6900"); 
       count++;    
       subcat[69]=new Array("7","市文化执法总队","6900"); 
       count++;    
       subcat[70]=new Array("7","市档案局","7000"); 
       count++;    
       subcat[71]=new Array("7","市国家保密局","7100"); 
       count++;    
       subcat[72]=new Array("7","市知识产权局","7200"); 
       count++;    
       subcat[73]=new Array("7","北京市投资促进局","7300"); 
       count++;    
       subcat[74]=new Array("7","市住房公积金管理中心","7400"); 
       count++;    
       subcat[75]=new Array("7","公安交通管理局","7500"); 
       count++;    
       subcat[76]=new Array("7","消防局","7600"); 
       count++;    
       subcat[77]=new Array("7","市地震局","7700"); 
       count++;    
       subcat[78]=new Array("7","北京市气象局","7800"); 
       count++;    
       subcat[79]=new Array("7","北京市通信管理局","7900"); 
       count++;    
       subcat[80]=new Array("7","市邮政管理局","8000"); 
       count++;    
       subcat[81]=new Array("7","市无线电管理局","8100"); 
       count++;    
       subcat[82]=new Array("7","市劳动教养工作管理局","8200"); 
       count++;    
       subcat[83]=new Array("8","市经济技术开发区管委会","8300"); 
       count++;    
       subcat[84]=new Array("7","市烟草专卖局","8400"); 
       count++;    
       subcat[85]=new Array("7","市爱国卫生运动委员会办公室","8400"); 
       count++;    
       subcat[86]=new Array("7","市政府台湾事务办公室","8500"); 
       count++;    
       subcat[87]=new Array("7","市人民政府新闻办公室","8600"); 
       count++;    
       subcat[88]=new Array("7","市商务委员会","8700"); 
       count++;    
       subcat[89]=new Array("7","中关村科技园区管理委员会","8800"); 
       count++;    
       subcat[90]=new Array("7","市社会建设工作办公室","8900"); 
       count++;    
       subcat[91]=new Array("7","市经济信息化委","9007"); 
       count++;    
       subcat[92]=new Array("7","市劳动教养管理委员会","9008"); 
       count++;    
       subcat[93]=new Array("7","市医院管理局","9009"); 
       count++;    

function aaa(ss)
{
    if( document.getElementById('beapptype').value==8){
    document.getElementById("beappname").setAttribute("ischeck","y");
    document.getElementById("beappnamesel").style.display="block";
	document.getElementById("beappnametd").style.display="none";
	document.getElementById("beappname").name="xzfyInfo.defendant_name";
	document.getElementById("beappnameinput").name="ssss";
	document.getElementById("beappnameinput").removeAttribute("ischeck");	
	
    document.getElementById('beappname').length=0;
   var tempOption=new Option("北京经济技术开发区管理委员会","北京经济技术开发区管理委员会");
   document.getElementById('beappname').options[1] = tempOption;
  
   }
   else if(document.getElementById('beapptype').value==1||document.getElementById('beapptype').value==3){
	document.getElementById("beappnameinput").setAttribute("ischeck","y");
	
	document.getElementById("beappnametd").style.display="block";
	document.getElementById("beappnamesel").style.display="none";
	document.getElementById("beappnameinput").name="xzfyInfo.defendant_name";
	document.getElementById("beappname").name="ssss";
	document.getElementById("beappname").removeAttribute("ischeck");
   
   }
   else{
   document.getElementById("beappname").setAttribute("ischeck","y");
    document.getElementById("beappnamesel").style.display="block";
	document.getElementById("beappnametd").style.display="none";
	document.getElementById("beappname").name="xzfyInfo.defendant_name";
	document.getElementById("beappnameinput").name="ssss";
	document.getElementById("beappnameinput").removeAttribute("ischeck");
	 document.getElementById('beappname').length = 0; 
		document.getElementById('beappname').options[document.getElementById('beappname').length] = new Option("----请选择-----", "0");
        var locationid=locationid;
		var x;
        for (x=0; x < count; x++)
         {
            if (subcat[x][0] == ss)

               {   var tempOption=new Option(subcat[x][1], subcat[x][1]);tempOption.deptcode=subcat[x][2];
                   document.getElementById('beappname').options[document.getElementById('beappname').length] = tempOption;
                } 
           }
	}
}
function beappcode(){
	var code=document.getElementById('beappname').options[document.getElementById('beappname').selectedIndex].deptcode;	
	if(document.getElementById('beappname').value!=''){
	//var code=document.getElementById('beappname').deptcode;
	document.getElementById('deptid').value=code;	}
}


function ajgllb(){
	
	if(document.getElementById("ajsjfm1").value==1){		
		
		document.getElementById("ajgllbga").style.display="block";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="xzfyInfo.refer2";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="sss";

		
	}
	if(document.getElementById("ajsjfm1").value==6){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="block";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="xzfyInfo.refer2";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="sss";



	}
	if(document.getElementById("ajsjfm1").value==7){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="block";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="xzfyInfo.refer2";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="sss";
	}

	if(document.getElementById("ajsjfm1").value==8){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="block";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="xzfyInfo.refer2";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="sss";
	}
	if(document.getElementById("ajsjfm1").value==9){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="block";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="xzfyInfo.refer2";
		document.getElementById("ajgllbjkww").name="sss";
	}
	if(document.getElementById("ajsjfm1").value==10){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="block";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="xzfyInfo.refer2";
	}

	if(!(document.getElementById("ajsjfm1").value==1||document.getElementById("ajsjfm1").value==6||document.getElementById("ajsjfm1").value==7||document.getElementById("ajsjfm1").value==8||document.getElementById("ajsjfm1").value==9||document.getElementById("ajsjfm1").value==10))
	{
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="ss";
	}
	//document.getElementById("divxzgllbinput").innerHTML='<input name="app_face.TReferOther" class="input2" altname="行政管理类别" id="xzgllbinput" class="inputTextNormal">';
}


function sqfysx(){
	if(document.getElementById("xzfysx").value==1){
	document.getElementById("xzfysx2xzcf").style.display="block";
	document.getElementById("xzfysx2xzqzcs").style.display="none";
	document.getElementById("xzfysx2xzsx").style.display="none";
	document.getElementById("xzfysx2xzqzcs").name="sss";
	document.getElementById("xzfysx2xzsx").name="sss";
	document.getElementById("xzfysx2xzcf").name="xzfyInfo.casetype2";
	}
	if(document.getElementById("xzfysx").value==2){	
	document.getElementById("xzfysx2xzcf").style.display="none";
	document.getElementById("xzfysx2xzqzcs").style.display="block";
	document.getElementById("xzfysx2xzsx").style.display="none";
	document.getElementById("xzfysx2xzqzcs").name="xzfyInfo.casetype2";
	document.getElementById("xzfysx2xzcf").name="sss";
	document.getElementById("xzfysx2xzsx").name="sss";
	}
	if(document.getElementById("xzfysx").value==3){
	document.getElementById("xzfysx2xzcf").style.display="none";
	document.getElementById("xzfysx2xzqzcs").style.display="none";
	document.getElementById("xzfysx2xzsx").style.display="block";
	document.getElementById("xzfysx2xzcf").name="sss";
	document.getElementById("xzfysx2xzqzcs").name="sss";
	document.getElementById("xzfysx2xzsx").name="xzfyInfo.casetype2";
	}
	if(!(document.getElementById("xzfysx").value==1||document.getElementById("xzfysx").value==2||document.getElementById("xzfysx").value==3))
	{
	document.getElementById("xzfysx2xzcf").style.display="none";
	document.getElementById("xzfysx2xzqzcs").style.display="none";
	document.getElementById("xzfysx2xzsx").style.display="none";
	document.getElementById("xzfysx2xzcf").name="sss";
	document.getElementById("xzfysx2xzsx").name="sss";
	document.getElementById("xzfysx2xzqzcs").name="sss";
	}
}

function handle_request(){
	if(document.getElementById("scresult").value==1){
		document.getElementById("sdResult1").style.display="block";
		document.getElementById("sdResult2").style.display="none";
		document.getElementById("sdResult3").style.display="none";
		document.getElementById("sdResult4").style.display="block";
		document.getElementById("sdResult5").style.display="none";
		document.getElementById("lian_date").style.display="block";
		document.getElementById("finish_date").style.display="none";
		document.getElementById("shouli").style.display="block";
		document.getElementById("bushouli").style.display="none";
	}else if(document.getElementById("scresult").value>1){
		document.getElementById("sdResult1").style.display="none";
		document.getElementById("sdResult2").style.display="block";	
		document.getElementById("shouli").style.display="none";
		document.getElementById("bushouli").style.display="block";
		document.getElementById("sdResult3").style.display="none";
		document.getElementById("sdResult4").style.display="none";
		document.getElementById("sdResult5").style.display="block";
		document.getElementById("lian_date").style.display="none";
		document.getElementById("finish_date").style.display="block";
	}else{
		document.getElementById("sdResult1").style.display="none";
		document.getElementById("sdResult2").style.display="none";		
		document.getElementById("shouli").style.display="none";
		document.getElementById("sdResult3").style.display="none";
		document.getElementById("bushouli").style.display="none";
		document.getElementById("sdResult4").style.display="none";
		document.getElementById("sdResult5").style.display="block";
		document.getElementById("lian_date").style.display="none";
		document.getElementById("finish_date").style.display="none";
	}
}
</script>	
	<div class="z_wrap_info">
		<#assign sdResult=xzfyInfo.stadardResult?default('0')>
		 <#if xzfyInfo.check_status=="0">
		<a href="javascript:docPrint()" title="" class="btn-blue btn">打印</a>
		</#if>
		<span <#if sdResult=="1">style="display:block"<#else>style="display:none"</#if> id="shouli">
		<a href="javascript:savaToGetDoc()" title="" sty class="btn-blue btn">生成受理通知</a>
		</span>
		<span <#if sdResult=="2" ||sdResult=="3" ||sdResult=="5">style="display:block"<#else>style="display:none"</#if> id="bushouli">
		<a href="javascript:savaToGetDoc1()" title="" class="btn-blue1 btn">生成不予受理告知书</a>
		</span>
		
		<h2 class="z_title">
		<span id="sdResult1" <#if sdResult=="1">style="display:block"<#else>style="display:none"</#if>>立案审查信息</span>
		<span id="sdResult2" <#if sdResult=="2" ||sdResult=="3" ||sdResult=="5">style="display:block"<#else>style="display:none"</#if>>结案审批</span>
		<span id="sdResult3" <#if sdResult=="0">style="display:block"<#else>style="display:none"</#if>>案件信息</span>
		</h2>
		<div class="f12">
		<#assign currentStatus=xzfyInfo.status?number  >
		<#if (currentStatus>3 && currentStatus<11) || (currentStatus==11 && xzfyInfo.stadardResult=="1") >
		来件处理:&nbsp;&nbsp;<select name="xzfyInfo.stadardResult" class="select"
			id="scresult" nbzcheck="y" altname="来件处理">
		  <option value="1" >受理</option>
	    </select>
	    <#else>
	    来件处理:&nbsp;&nbsp;<select name="xzfyInfo.stadardResult" class="select" <#if xzfyInfo.check_status=="1">disabled</#if>
			id="scresult" nbzcheck="y" altname="来件处理" onchange="handle_request()">
	      <option value="0" <#if sdResult=='0'>selected</#if>>----请选择----</option>
		  <option value="1" <#if sdResult=='1'>selected</#if>>受理</option>
		  <option value="2" <#if sdResult=='2'>selected</#if>>告知</option>
		  <option value="3" <#if sdResult=='3'>selected</#if>>不予受理</option>
		  <option value="5" <#if sdResult=='5'>selected</#if>>其他</option>
	    </select>	
	    </#if>
	    </div>
		<div class="z_info">
		
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">			
			  <tr>
				<th width="18%">申请人<br/>（当事人）</th>
				<td colspan="2" width="30%">
				 <textarea class="textarea" name="xzfyInfo.appdetail" id="appdetail" class="textarea" id="user" ischeck="y" ><#if xzfyInfo.appdetail?has_content>${xzfyInfo.appdetail}</#if></textarea>
				</td>
				<th width="20%">委托代理人</th>
				<td width="20%">
				<input class="z_input" name="xzfyInfo.agent_name" value="${xzfyInfo.agent_name?default('无')}" id="agent_name">
				</td>
			  </tr>

			  <tr>
				<th width="18%">第三人</th>
				<td colspan="2" width="30%">
				<input class="z_input" name="xzfyInfo.third" value="${xzfyInfo.third?default('无')}" id="third">
				</td>
				<th width="20%">第三人代理人</th>
				<td width="20%">
				<input class="z_input" name="xzfyInfo.third_agent" value="${xzfyInfo.third_agent?default('无')}" id="third_agent">
				</td>
			  </tr>	  
		  
			  <tr>
				<th width="18%">代表人</th>
				<td colspan="2" width="30%">
				<input class="z_input" name="xzfyInfo.deputy_show" value="${xzfyInfo.deputy_show?default('无')}" id="deputy_show">
				</td>
				<th width="20%">多人复议</th>
				<td width="20%">
						<select name="xzfyInfo.isMany" id="isMany">
				    		<option value="否" <#if xzfyInfo.isMany?has_content&&xzfyInfo.isMany=="否">selected</#if>>否</option>
							<option value="是" <#if xzfyInfo.isMany?has_content&&xzfyInfo.isMany=="是">selected</#if>>是</option>

   	    
     					</select>
				</td>
			  </tr>	  			  
			  <tr>
			  <th>申请人类别</th>
				<td colspan=2> <@ww.select  name="'xzfyInfo.app_type'" id="applicationtype" headerKey="''" headerValue=""  list="getDictMap('sqrlb')" value="'${xzfyInfo.app_type?default('')}'.toString()" onchange="'checksqr()'"/></td>
				<th>收件时间</th>
				<td><input name="xzfyInfo.receive_date" id="receivedate" ischeck="y"  altname="收案日期"  readonly
    class="z_input" onClick="WdatePicker()"  <#if xzfyInfo.receive_date?has_content>value="${xzfyInfo.receive_date}"</#if>></td>			
			
				  </tr>
			  
			  <tr>
			  	<th >被申请人种类</th>
				<td colspan="2">
  
<select name="xzfyInfo.defendant_type" id="beapptype" ischeck="y"
    altname="被申请人种类" class="select" 
     onchange="aaa(document.getElementById('beapptype').options[document.getElementById('beapptype').selectedIndex].value)">

    <#if xzfyInfo.defendant_type?has_content>
      <option value="0">----请选择----</option>	
	  <option value="1" <#if xzfyInfo.defendant_type=="1">selected</#if>>乡镇政府</option>
	  <option value="2" <#if xzfyInfo.defendant_type=="2">selected</#if>>县级政府</option>
	  <option value="3" <#if xzfyInfo.defendant_type=="3">selected</#if>>县级政府部门</option>
	  <option value="6" <#if xzfyInfo.defendant_type=="6">selected</#if>>省部级行政机关</option>
	  <option value="7" <#if xzfyInfo.defendant_type=="7">selected</#if>>省级政府部门</option>
	  <option value="8" <#if xzfyInfo.defendant_type=="8">selected</#if>>其他</option>
	<#else>
	  <option value="0">----请选择----</option>	
	  <option value="1" >乡镇政府</option>
	  <option value="2" >县级政府</option>
	  <option value="3" >县级政府部门</option>
	  <option value="6" >省部级行政机关</option>
	  <option value="7" >省级政府部门</option>
	  <option value="8" >其他</option>
	  </#if>
	  	 
    </select>				
  
	     </span>
				</td>
				<th >被申请人<br/>（涉及部门）</th>
				<td >
  
			
					    <span  style="display:none;" id="beappnametd" >
	     <input name="ssss" class="z_input" id="beappnameinput" altname="被申请人名称"> 
	      <input name="sss" type="hidden" class="z_input" id="beappname2" >
	     </span>  
	     	     <span id="beappnamesel" style="display:block"> 
		    <#if xzfyInfo.defendant_name?has_content>
		    <select name="xzfyInfo.defendant_name" ischeck="y" id="beappname"
		     onchange="beappcode()" altname="被申请人名称" class="select">
		      <option value="${xzfyInfo.defendant_name}" deptcode="">${xzfyInfo.defendant_name}</option>     	 
		    </select>
		    <#else>
			<select name="xzfyInfo.defendant_name" ischeck="y" id="beappname"
		     onchange="beappcode()" altname="被申请人名称" class="select">
		        	 
		    </select>
		    </#if>	     
	     </span>
				</td>
				
			  </tr>			  
			  
			  <tr>
				<th>申请复议事项</th>
				<td colspan="2">
				  <#assign caseType=xzfyInfo.casetype?default('0')>
    <select name="xzfyInfo.casetype" ischeck="y" altname="申请复议事项"
     class="select" id="xzfysx" onchange="sqfysx()">

     <option value="0">----请选择----</option>
     <option value="1" <#if caseType=="1">selected</#if>>行政处罚</option>
	 <option value="2" <#if caseType=="2">selected</#if>>行政强制措施</option>
	 <option value="3" <#if caseType=="3">selected</#if>>行政征收</option>
	 <option value="4" <#if caseType=="4">selected</#if>>行政许可</option>
	 <option value="5" <#if caseType=="5">selected</#if>>行政确权</option>
	 <option value="6" <#if caseType=="6">selected</#if>>干预经营自主权</option>
     <option value="7" <#if caseType=="7">selected</#if>>信息公开</option>
	 <option value="8" <#if caseType=="8">selected</#if>>行政不作为</option>
	 <option value="9" <#if caseType=="9">selected</#if>>其他</option>
	
    </select>
 
     <select  <#if caseType=="1"> name="xzfyInfo.casetype2"
      style="display:block"<#else>name="ss" style="display:none"</#if>
       altname="申请复议事项" class="select" id="xzfysx2xzcf"
        ishidden="y" onchange="">
      <option value="0">----请选择----</option>
 	 <option value="1" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="1">selected</#if>>拘留</option>
	 <option value="2" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="2">selected</#if>>没收</option>
	 <option value="3" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="3">selected</#if>>罚款</option>
	 <option value="4" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="4">selected</#if>>其他</option>
	
  </select>
   <select <#if caseType=="2">
   name="xzfyInfo.casetype2" style="display:block"<#else>name="ss" 
   style="display:none"</#if> altname="申请复议事项" class="select"
    id="xzfysx2xzqzcs" ishidden="y" onchange="">
      <option value="0">----请选择----</option>

	 <option value="5" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="5">selected</#if>>对人身的强制措施</option>
	 <option value="6" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="6">selected</#if>>对不动产的强制措施</option>
	 <option value="7" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="7">selected</#if>>对其它财产的强制措施</option>

  </select>
   <select <#if caseType=="3">name="xzfyInfo.casetype2" 
   style="display:block"<#else>name="ss" style="display:none"</#if> 
   altname="申请复议事项" class="select" id="xzfysx2xzsx"
    ishidden="y" onchange="">
      <option value="0">----请选择----</option>

	 <option value="8" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="8">selected</#if>>征收土地</option>
	 <option value="9" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="9">selected</#if>>版税</option>
	 <option value="10" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="10">selected</#if>>收费</option>
	 <option value="11" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="11">selected</#if>>要求履行其他义务</option>	 
  </select>
				</td>
				<th>行政管理类别</th>
				<td>
				    <#if xzfyInfo.refer?has_content>
    <select name="xzfyInfo.refer" ischeck="y" class="select"  id="ajsjfm1"
      altname="行政管理类别" onchange="ajgllb()">    
	<option value="0" <#if xzfyInfo.refer=="0">selected</#if>>----请选择----</option>   
	<option value="1" <#if xzfyInfo.refer=="1">selected</#if>>公安</option>
	<option value="2" <#if xzfyInfo.refer=="2">selected</#if>>国家安全</option>
	<option value="3" <#if xzfyInfo.refer=="3">selected</#if>>劳动和社会保障</option>
	<option value="4" <#if xzfyInfo.refer=="4">selected</#if>>司法行政</option>
	<option value="5" <#if xzfyInfo.refer=="5">selected</#if>>民政</option>
	<option value="6" <#if xzfyInfo.refer=="6">selected</#if>>农林环资</option>
	<option value="7" <#if xzfyInfo.refer=="7">selected</#if>>城建</option>
	<option value="8" <#if xzfyInfo.refer=="8">selected</#if>>工交商事</option>
	<option value="9" <#if xzfyInfo.refer=="9">selected</#if>>财政金融</option>
	<option value="10" <#if xzfyInfo.refer=="10">selected</#if>>教科文卫</option>
	<option value="11" <#if xzfyInfo.refer=="11">selected</#if>>其他</option>		
    </select>
    
    <#else>
    <select name="xzfyInfo.refer" ischeck="y" class="select" id="ajsjfm1"
     altname="行政管理类别" onchange="ajgllb()">
        
	<option value="0">----请选择----</option>
	<option value="1">公安</option>
	<option value="2">国家安全</option>
	<option value="3">劳动和社会保障</option>
	<option value="4">司法行政</option>
	<option value="5">民政</option>
	<option value="6">农林环资</option>
	<option value="7">城建</option>
	<option value="8">工交商事</option>
	<option value="9">财政金融</option>
	<option value="10">教科文卫</option>
	<option value="11">其他</option>		
    </select>
    </#if>

     <select <#if xzfyInfo.refer?has_content&&xzfyInfo.refer=="1">name="xzfyInfo.refer2"
      style="display:block"<#else>name="ss" style="display:none"</#if> 
      class="select" id="ajgllbga" altname="行政管理类别" ishidden="y">
        <option value="0">----请选择----</option>
	<option value="1" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="1">selected</#if>>治安</option>
	<option value="2" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="2">selected</#if>>劳教</option>
	<option value="3" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="3">selected</#if>>其他</option>
	 </select>
	 <!--农林环资-->
	 <select <#if xzfyInfo.refer?has_content&&xzfyInfo.refer=="6">name="xzfyInfo.refer2" 
	 style="display:block"<#else>name="ss" style="display:none"</#if>
	  class="select" id="ajgllbnlhz" altname="行政管理类别" ishidden="y">
	  <option value="0">----请选择----</option>
	<option value="9" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="9">selected</#if>>土地</option>
	<option value="10" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="10">selected</#if>>地矿</option>
	<option value="11" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="11">selected</#if>>环保</option>
	<option value="12" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="12">selected</#if>>农业</option>
	<option value="13" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="13">selected</#if>>水利</option>
	<option value="14" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="14">selected</#if>>林业</option>
	<option value="15" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="15">selected</#if>>其他</option>
	
	</select>
	 <!--城建-->
	 <select <#if xzfyInfo.refer?has_content&&xzfyInfo.refer=="7">
	 name="xzfyInfo.refer2" style="display:block"<#else>name="ss" 
	 style="display:none"</#if> class="select" id="ajgllbcj" altname="行政管理类别" ishidden="y">
	  <option value="0">----请选择----</option>
	<option value="17" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="17">selected</#if>>规划</option>
	<option value="18" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="18">selected</#if>>拆迁</option>
	<option value="19" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="19">selected</#if>>房屋登记</option>
	<option value="20" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="20">selected</#if>>其他</option>

	</select>
	 <!--工交商事-->
	 <select <#if xzfyInfo.refer?has_content&&xzfyInfo.refer=="8">
	 name="xzfyInfo.refer2" style="display:block"<#else>
	 name="ss" style="display:none"</#if> class="select" 
	 id="ajgllbgjss" altname="行政管理类别" ishidden="y">
	  <option value="0">----请选择----</option>
	<option value="22" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="22">selected</#if>>工商</option>
	<option value="23" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="23">selected</#if>>质监</option>
	<option value="24" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="24">selected</#if>>商务</option>
	<option value="25" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="25">selected</#if>>物价</option>
	<option value="26" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="26">selected</#if>>能源</option>
	<option value="27" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="27">selected</#if>>交通</option>
	<option value="28" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="28">selected</#if>>信息产业</option>
	<option value="29" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="29">selected</#if>>邮政</option>
	<option value="30" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="30">selected</#if>>烟草专买</option>

	</select>
	 <!--财政金融-->
	 <select <#if xzfyInfo.refer?has_content&&xzfyInfo.refer=="9">
	 name="xzfyInfo.refer2" style="display:block"<#else>name="ss" 
	 style="display:none"</#if> class="select" id="ajgllbczjr" altname="行政管理类别" ishidden="y">
	  <option value="0">----请选择----</option>
	<option value="32" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="32">selected</#if>>税务</option>
	<option value="33" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="33">selected</#if>>人民银行</option>
	<option value="34" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="34">selected</#if>>证监</option>
	<option value="35" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="35">selected</#if>>保监</option>
	<option value="36" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="36">selected</#if>>银监</option>
	<option value="37" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="37">selected</#if>>外汇</option>
	<option value="38" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="38">selected</#if>>财政</option>
	<option value="39" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="39">selected</#if>>统计</option>
	<option value="40" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="40">selected</#if>>审计</option>
	<option value="41" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="41">selected</#if>>海关</option>
	<option value="42" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="42">selected</#if>>商检</option>

	</select>
	 <!--教科文卫-->
	 <select <#if xzfyInfo.refer?has_content&&xzfyInfo.refer=="10">name="xzfyInfo.refer2" style="display:block"<#else>name="ss" style="display:none"</#if> class="select" id="ajgllbjkww" altname="行政管理类别" ishidden="y">
	  <option value="0">----请选择----</option>
	<option value="44" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="44">selected</#if>>药监</option>
	<option value="45" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="45">selected</#if>>卫生</option>
	<option value="46" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="46">selected</#if>>计划生育</option>
	<option value="47" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="47">selected</#if>>教育</option>
	<option value="48" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="48">selected</#if>>文化</option>
	<option value="49" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="49">selected</#if>>专利</option>
	<option value="50" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="50">selected</#if>>商标</option>
	<option value="51" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="51">selected</#if>>版权</option>
	<option value="52" <#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="52">selected</#if>>旅游</option>

     </select>
     <div   id="divxzgllbinput">
     <#if xzfyInfo.referother?has_content>
    <input name="xzfyInfo.referother" class="input2" altname="行政管理类别" value="${xzfyInfo.referother}"
     id="xzgllbinput" class="inputTextNormal">
     </#if>
    </div>
				</td>
			  </tr>	
			  <tr>
				<th width="18%">
				<span id="sdResult4"<#if sdResult=="1">style="display:block"<#else>style="display:none"</#if>>立案日期</span>
				<span id="sdResult5" <#if sdResult=="2" ||sdResult=="3" ||sdResult=="5">style="display:block"<#else>style="display:none"</#if>>结案日期</span>
				</th>
				<td colspan="2" width="30%">
				<input class="z_input"  
				<#if sdResult=="1">style="display:block"<#else>style="display:none"</#if>
				onClick="WdatePicker()"   name="xzfyInfo.lian_date" id="lian_date" value="${xzfyInfo.lian_date?default('')}">
				
				<input class="z_input"  
				<#if sdResult=="2" ||sdResult=="3" ||sdResult=="5">style="display:block"<#else>style="display:none"</#if>
				onClick="WdatePicker()"   nname="xzfyInfo.finish_date" id="finish_date" value="${xzfyInfo.finish_date?default('')}">
				</span></td>
				<th ="18%">办理文号</th>
				<td width="30%">
				<input class="z_input" name="xzfyInfo.tjzfzh" value="${xzfyInfo.tjzfzh?default('')}" id="tjzfzh">
				</td>
			  </tr>				  
			  <tr>
				<th>收件方式</th>
				<td colspan="2">
				<#if xzfyInfo.receive_type?has_content>
				<#if xzfyInfo.receive_type=='1'>
					当面
				<#elseif xzfyInfo.receive_type=='2'>
					来信
				<#elseif xzfyInfo.receive_type=='3'>
					电子邮件
				</#if>	
				</#if>	
				</td>
				<th>是否提出听证申请</th>
				<td>
				<select class="select" name="xzfyInfo.istingzheng">
				<option value="否" <#if xzfyInfo.istingzheng=="否">selected</#if>>否</option>
				<option value="是" <#if xzfyInfo.istingzheng=="是">selected</#if>>是</option>
				</select>
				</td>
			  </tr>
			  
			  <tr>
				<th>立案审查人</th>
				<td colspan="2">
				${xzfyInfo.user1_name?default('')}					
				</td>
				<th>复议前置</th>
				<td>
				    <select name="xzfyInfo.isfront" id="isfront">
				    		<option value="否" <#if xzfyInfo.isfront?has_content&&xzfyInfo.isfront=="否">selected</#if>>否</option>
							<option value="是" <#if xzfyInfo.isfront?has_content&&xzfyInfo.isfront=="是">selected</#if>>是</option>

   	    
     					</select>
				</td>
			  </tr>			  
			  <tr>
				<th>调解</th>
				<td colspan="2">
				 <select name="xzfyInfo.istiaojie" id="tjjg">
    	<#if xzfyInfo.istiaojie?has_content>
		<option value="1" <#if xzfyInfo.istiaojie?has_content&&xzfyInfo.istiaojie=="1">selected</#if>>案前调解</option>
		<option value="2" <#if xzfyInfo.istiaojie?has_content&&xzfyInfo.istiaojie=="2">selected</#if>>调解</option>
		<option value="3" <#if xzfyInfo.istiaojie?has_content&&xzfyInfo.istiaojie=="3">selected</#if>>否</option>
   	    
    <#else>
    		<option value="1">案前调解</option>
		<option value="2">调解</option>
		<option value="3" selected>否</option>
     </#if>		
     </select>	
				</td>
				<th>调解结果</th>
				<td>
    <select name="xzfyInfo.tiaojie_result" id="tiaojie">
	<option value="无" <#if xzfyInfo.tiaojie_result?has_content&&xzfyInfo.tiaojie_result=="无">selected</#if>>无</option>
	<option value="成功"  <#if xzfyInfo.tiaojie_result?has_content&&xzfyInfo.tiaojie_result=="成功">selected</#if>>成功</option>
	<option value="不成功"  <#if xzfyInfo.tiaojie_result?has_content&&xzfyInfo.tiaojie_result=="不成功">selected</#if>>不成功</option>
    </select>
				</td>
			  </tr>
			  
			  <tr>
				<th width="18%">被复议的具体行政行为名称</th>
				<td colspan="2" width="30%">
				 <input name="xzfyInfo.xwname" class="z_input" id="TBeName" ischeck="y"
			 	altname="被复议的具体行政行为"  value="${xzfyInfo.xwname?default('')}">
				</td>
				<th width="20%">被复议的具体行政行为案号</th>
				<td width="20%">
				<input class="z_input" name="xzfyInfo.xwnum" value="${xzfyInfo.xwnum?default('')}" >
				</td>
			  </tr>
			  <tr>
				<td colspan="5">
					<div class="f12 c6">行政复议请求：</div>
					<div class="mt10 em2">
					  <textarea class="textarea" name="xzfyInfo.xzfy_requset_retail" id="xzfyqq1" class="textarea" 
     altname="行政复议请求">${xzfyInfo.xzfy_requset_retail?default('')}</textarea>
					</div>
				</td>
			  </tr>			  
			  <tr>
				<td colspan="5">
					<div class="f12 c6">简要内容：</div>
					<div class="mt10 em2">
					<textarea class="textarea" name="xzfyInfo.content_abstract" id="content" class="textarea" 
     altname="行政复议请求">${xzfyInfo.content_abstract?default('')}</textarea>
					</div>
				</td>
			  </tr>
			  <tr>
				<td colspan="5">
					<div class="f12 c6">立案审查人意见：</div>
					<div class="mt10 em2">
				<textarea class="textarea" name="xzfyInfo.laAdvice" id="laAdvice">${xzfyInfo.laAdvice?default('')}</textarea>
					</div>
					<div class="ml30 mt10 f12 c6"></div>
				</td>
			  </tr>
					   <tr>
				<td colspan="5">
					<div class="mt10 c6 f12">领导批示：<br><br>
						<#list xzfyCheckList_la as checkList>
							<#if checkList.check_name?has_content>
								<#if checkList.check_result=='1'>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${checkList.check_name}：
								</#if>
							</#if>
							<#if checkList.check_advise?has_content>
								<#if checkList.check_result=='1'>
									${checkList.check_advise}
								</#if>
							</#if>	
							<br>					
						</#list>					
					</div>
				</td>
			  </tr>	 
		 <#assign checkUserId=xzfyInfo.check_id?default('0')>
		 
		 <#if (currentStatus>3 && currentStatus<11) || (currentStatus==11 && xzfyInfo.stadardResult=="1") || currentStatus==2 >
		 <#if xzfyInfo.check_status=="0">
		 <tr>
				<td colspan="5">
		 <div class="align-center"><br>
					<a href="javascript:saveApp()" class="btn-blue btn">保存</a>
					</div>
			</td>
			</tr>
			</#if>
		 <#else>
			  <tr>
				<td colspan="5">
					<div class="mt10 c6 f12">
				<#if (currentStatus>3 && currentStatus<11) || (currentStatus==11 && xzfyInfo.stadardResult=="1") >
					审批人：${xzfyInfo.isdelay_to?default('')}
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;审批日期${xzfyInfo.isdelay_from?default('')}
				<#else>
					请选择审批人：
					 <select name="xzfyInfo.check_id" id="check_id" >
    <option value="0">未指定审批人</option>
    <#list userList as uList>
    <option value="${uList.getId()}" <#if uList.getId().toString()==checkUserId>selected</#if>>${uList.getName()}</option>
    </#list>
    
    </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请输入审批日期：<input class="z_input1" id="pizhunDate" name="pizhunDate" onClick="WdatePicker()"/></div>
					<div class="align-center"><br>
					<#if xzfyInfo.check_status=="0">
					<a href="javascript:createApp()" title="提交审批" class="btn-blue btn">提交审批</a>
					<a href="javascript:finishApp()" title="结束审批" class="btn-blue btn">结束审批</a>
					<a href="javascript:saveApp()" class="btn-blue btn">保存</a>
					<#else>
						<a href="javascript:cancleApp()" title="取消审批" class="btn-blue btn">取消审批</a>
					</#if>
					
				</#if>
					</div>
				</td>
			  </tr>
	</#if>
			</table>
			
		</div>
	</div>	
			<input type="hidden" name="listkeyword" value="${listkeyword}" />
			<input type="hidden" name="xzfyId" value="${xzfyInfo.id}" />
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input name="xzfyInfo.tAppDeptId" type="hidden"  id="deptid" />
		</form>

	</body>
</html>
<script type="text/javascript">
	function saveApp(){
		if(document.getElementById("appdetail").value==""){
			alert("请填写申请人");
		}else if(document.getElementById("agent_name").value==""){
			alert("请填写委托代理人");
		}else if(!checknull()){
			return ;
		} else if(document.getElementById("xzfyqq1").value==""){
			alert("请填写行政复议请求");
			return ;
		}	else if(document.getElementById("TBeName").value==""){
			alert("请填写被复议的具体行政行为名称");
			return ;
		}	else if(document.getElementById("content").value==""){
			alert("请填写简要内容");
			return ;
		}else if(confirm("您确认要保存吗？")){
			document.getElementById("createForm").action="../xzfy/saveCase.action";
			document.getElementById("createForm").submit();
			
		}
	}

	function createApp(){
		if(document.getElementById("scresult").value=="0")
		{
			alert("请选择来件处理方式");

		}else if(document.getElementById("tjzfzh").value=="" && document.getElementById("scresult").value==1){
			alert("请输入办理文号");
		
		}else if(document.getElementById("appdetail").value==""){
			alert("请填写申请人");
		}else if(document.getElementById("agent_name").value==""){
			alert("请填写委托代理人");
		}else if(!checknull()){
			return ;
		} else if(document.getElementById("xzfyqq1").value==""){
			alert("请填写行政复议请求");
			return ;
		}	else if(document.getElementById("TBeName").value==""){
			alert("请填写被复议的具体行政行为名称");
			return ;
		}	else if(document.getElementById("content").value==""){
			alert("请填写简要内容");
			return ;
		}
		else if(document.getElementById("laAdvice").value==""){
			alert("请填写立案审查人意见");
			return ;
		}else if(document.getElementById("check_id").value=="0"){
			alert("请选择审批人");
			return ;
		}else if(confirm("您确认要提交吗？")){
			document.getElementById("createForm").action="../xzfy/subCheckCase.action";
			document.getElementById("createForm").submit();
			
		}
	}
	
	function finishApp(){
		if(document.getElementById("scresult").value=="0")
		{
			alert("请选择来件处理方式");

		}else if(document.getElementById("tjzfzh").value=="" && document.getElementById("scresult").value==1){
			alert("请填写办理文号");
		
		}else if(document.getElementById("lian_date").value=="" && document.getElementById("scresult").value==1){
			alert("请填写立案日期");
		
		}else if(document.getElementById("finish_date").value=="" && document.getElementById("scresult").value>1){
			alert("请填写结案日期");
		
		}else if(document.getElementById("appdetail").value==""){
			alert("请填写申请人");
		}else if(document.getElementById("agent_name").value==""){
			alert("请填写委托代理人");
		}else if(!checknull()){
			return ;
		} else if(document.getElementById("xzfyqq1").value==""){
			alert("请填写行政复议请求");
			return ;
		}	else if(document.getElementById("TBeName").value==""){
			alert("请填写被复议的具体行政行为名称");
			return ;
		}	else if(document.getElementById("content").value==""){
			alert("请填写简要内容");
			return ;
		}
		else if(document.getElementById("laAdvice").value==""){
			alert("请填写立案审查人意见");
			return ;
		}else if(document.getElementById("check_id").value=="0"){
			alert("请选择审批人");
			return ;
		}
		else if(document.getElementById("pizhunDate").value==""){
			alert("请填写批准日期");
			return ;
		}else if(confirm("提交后，将完成立案审查工作，您确认要提交吗？")){
			document.getElementById("createForm").action="../xzfy/finishLian.action";
			document.getElementById("createForm").submit();
			
		}	
	}
	
	function cancleApp(){
		if(confirm("您确认要取消交吗？")){
			document.getElementById("createForm").action="../xzfy/cancleCheckCase.action";
			document.getElementById("createForm").submit();
			
		}		
	}
	
function checknull()
{
	var intReg=/^[0-9]*[1-9][0-9]*$/;
	var a=document.getElementsByTagName("input");
	var isbz=0;
	
	for(var i=0;i<a.length;i++)
	{
		if(a.item(i).ischeck){
		    if(a.item(i).type=="radio")
			{
			if(!(((document.getElementsByName(a.item(i).name)[0]).checked)||((document.getElementsByName(a.item(i).name)[1]).checked)))
				{
				alert("请填写:"+document.getElementsByName(a.item(i).name)[0].altname+"!");return false;}			
			}
			else if(a.item(i).value==""){
			alert("请填写:"+a.item(i).altname+"!");return false;
			}
		}	

	}
	
	var a=document.getElementsByTagName("select");
	for(var i=0;i<a.length;i++)
	{
		if(a.item(i).ischeck){
			if(a.item(i).value=="0"){
			alert("请填写:"+a.item(i).altname+"!");return false;
			}			
		}
		
	}
	
	if(!checkfysx()){alert("请填写申请复议事项!");return false;}
	if(!checkajgllb()){alert("请填写行政管理类别!");return false;}
	return true;
}	


function checkfysx(){
	if(document.getElementById("xzfysx").value==1){
	if(document.getElementById("xzfysx2xzcf").value==0)
	return false;
	}
	if(document.getElementById("xzfysx").value==2){
	if(document.getElementById("xzfysx2xzqzcs").value==0)
	return false;
	}
	if(document.getElementById("xzfysx").value==3){
	if(document.getElementById("xzfysx2xzsx").value==0)
	return false;
	}


	return true;
}

function checkajgllb(){
	if(document.getElementById("ajsjfm1").value==0||(document.getElementById("ajsjfm1").value==1&&document.getElementById("ajgllbga").value==0)||(document.getElementById("ajsjfm1").value==6&&document.getElementById("ajgllbnlhz").value==0)||(document.getElementById("ajsjfm1").value==7&&document.getElementById("ajgllbcj").value==0)||(document.getElementById("ajsjfm1").value==8&&document.getElementById("ajgllbgjss").value==0)||(document.getElementById("ajsjfm1").value==9&&document.getElementById("ajgllbczjr").value==0)||(document.getElementById("ajsjfm1").value==10&&document.getElementById("ajgllbjkww").value==0))
	
	{return false;}
	
	else{

	return true;
	}
}
	
	function getDoc(){
		var checkStatus=0;
		if(document.getElementById("scresult").value==1)
			checkStatus=3
		if(document.getElementById("scresult").value==11)
			checkStatus=11
		var url="../bac_default_shenpidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus="+checkStatus;
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	

	
	function docPrint(){
		if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			var callBackMethod;
				var options = { 
					url:'saveCase.action', //提交给哪个执行 
					type:'POST', 
					success: getDoc //显示操作提示 
				}; 
				$('#createForm').ajaxSubmit(options); 
				return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		}
}
	
function savaToGetDoc(){
		if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			var callBackMethod;
				var options = { 
					url:'saveCase.action', //提交给哪个执行 
					type:'POST', 
					success: getBuzhengtongzhi //显示操作提示 
				}; 
				$('#createForm').ajaxSubmit(options); 
				return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		}
}

function savaToGetDoc1(){
		if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			var callBackMethod;
				var options = { 
					url:'saveCase.action', //提交给哪个执行 
					type:'POST', 
					success: getBuzhengtongzhi1 //显示操作提示 
				}; 
				$('#createForm').ajaxSubmit(options); 
				return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		}
}

	function getBuzhengtongzhi1(){
		var url="http://localhost:8080/webIscp/bac_default_buyushouligaozhishu.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}

	function getBuzhengtongzhi(){
		var url="http://localhost:8080/webIscp/bac_default_shoulitongzhishu.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
</script>