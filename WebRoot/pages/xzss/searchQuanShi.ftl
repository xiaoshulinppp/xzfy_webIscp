<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>行政复议信息管理系统</title>
		<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
		<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../plugs/kindeditor/kindeditor.js"></script>
		<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="../js/16B/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="../js/16B/tpl.base.js"></script>
		<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
		<style type="text/css">img,formDiv,.formDiv{behavior: url(../webstyle/style/ie-css3.htc);} </style> 	
		<style type="text/css">img,z_wrap_info,.z_wrap_info{behavior: url(../css/ie-css3.htc);} </style> 
	</head>
	<body>
	<#if panduanGL != "1" && panduanGL != "2">
		<#include "../website/header.ftl">
	
		<div class="wal pageNow2">
	      <div class="fl">当前位置：<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a> > 
	      <a href="../xzss/showUndertakerList.action?funcCode=${funcCode}">行政诉讼案件列表</a> >诉讼案件高级检索（全市）</div>
	      <div class="fr"></div>
		</div>
	</#if>	
		
		
		<form id="form1" name="form1" action="''" method="post" ENCTYPE="multipart/form-data">
		
		<input type="hidden" name="funcCode" value="${funcCode}" />
		<input type="hidden" name="panduanGL" value="${panduanGL}" />
	
	
		
		<div class="formDiv" id="banan" >	
		<table width="100%" border="0" align="center" cellpadding="10" cellspacing="0">
		
			<tr>      
	     		<th>审级：</th>
			    <td>
				    <select name="xzssInfo.shen_level"  >
				      <option value="">----请选择----</option>
				      <option value="1">一审</option>
				      <option value="2">二审</option>
				      <option value="3">再审</option>
				    </select>
			    </td>
			    <th>案号</th>
				<td colspan=2>
					<input type="text" name="xzssInfo.case_num" value="" class="inputTextNormal" />
				</td>
	  		</tr>
		
			<tr>
			<th>应诉通知书签收日期:</th>
		    <td colspan=4>
		          从  <input class="inputTextNormal" type="text" readonly="readonly" name="receiveCaseDate1" value="" onClick="WdatePicker()">                               
          	   到 <input class="inputTextNormal" type="text" readonly="readonly" name="receiveCaseDate2" value="" onClick="WdatePicker()">
			</td>
			</tr>
			<tr>
			
			<th>结案日期:</th>
		    <td colspan=4>
		          从  <input class="inputTextNormal" type="text" readonly="readonly" name="jieanDate1" value="" onClick="WdatePicker()">                               
          	   到 <input class="inputTextNormal" type="text" readonly="readonly" name="jieanDate2" value="" onClick="WdatePicker()">
			</td>
			</tr>
			<tr>
			<th>结案日期</th>
			<td colspan=4>
				<input name="xzssInfo.jieandate" type="text" class="inputTextNormal"  
			     value="" onClick="WdatePicker()" altname="收案日期" >
			</td>
			</tr>
			<tr>
				<th>应诉通知书签收日期</th>
				<td >
					<input name="xzssInfo.notice_receiptDate" type="text" class="inputTextNormal"  
				     value="" onClick="WdatePicker()" altname="收案日期" >
				</td>
				<th>原告类别</th>
				<td colspan=2>
					<select name="xzssInfo.app_type"  >
				      <option value="">----请选择----</option>
				      <option value="1">公民</option>
				      <option value="0">法人或其他组织</option>
				    </select>
				</td>
			</tr>
		
			<tr>
				<th>原告</th>
				<td>
					<input type="text" name="xzssInfo.app_name" value="" class="inputTextNormal" />
				</td>
				<th >被告</th>
				<td colspan=2>
					<input type="text" name="xzssInfo.defendant" value="" class="inputTextNormal" />
				</td>
			</tr>

			
			<tr>
				<th>应诉承办人</th>
				<td>
					<input type="text" name="xzssInfo.ysundertaker_name" value="" class="inputTextNormal" />
				</td>
				<th>行政类别</th>
				<td colspan=2>
					<select name="xzssInfo.manage_type" class="select-page" id="" onchange="" style="width:150px">
						<option value="">----请选择----</option>
						<option value="1" >公安</option>
						<option value="2" >国家安全</option>
						<option value="3" >劳动和社会保障</option>
						<option value="4" >司法行政</option>
						<option value="5" >民政</option>
						<option value="6" >土地</option>
						<option value="7" >地矿</option>
						<option value="8" >环保</option>
						<option value="9" >农业</option>
						<option value="10" >水利</option>
						<option value="11" >林业</option>
						<option value="12" >城市规划</option>
						<option value="13" >房屋拆迁</option>
						<option value="14" >房屋登记</option>
						<option value="15" >工商</option>
						<option value="16" >质监</option>
						<option value="17" >商务</option>
						<option value="18" >物价</option>
						<option value="19" >能源</option>
						<option value="20" >交通</option>
						<option value="21" >信息产业</option>
						<option value="22" >邮政</option>
						<option value="23" >烟草专卖</option>
						<option value="24" >税务</option>
						<option value="25" >人民银行</option>
						<option value="26" >证监</option>
						<option value="27" >保监</option>
						<option value="28" >银监</option>
						<option value="29" >外汇</option>
						<option value="30" >财政</option>
						<option value="31" >统计</option>
						<option value="32" >审计</option>
						<option value="33" >海关</option>
						<option value="34" >商检</option>
						<option value="35" >药监</option>
						<option value="36" >卫生</option>
						<option value="37" >计划生育</option>
						<option value="38" >教育</option>
						<option value="39" >文化</option>
						<option value="40" >专利</option>
						<option value="41" >商标</option>
						<option value="42" >版权</option>	
						<option value="43" >旅游</option>	
						<option value="44" >其他</option>
				    </select>
				</td>
			</tr>
			
			<tr>
				<th>案件类别</th>
				<td>
					<select name="xzssInfo.case_type" class="select-page" id="" onchange="" style="width:150px">
					<option value="">----请选择----</option>
					<option value="1" >行政处罚</option>
					<option value="2" >行政强制措施</option>
					<option value="3" >行政征收</option>
					<option value="4" >行政许可</option>
					<option value="5" >行政确权</option>
					<option value="6" >干预经营自主权</option>
					<option value="7" >信息公开</option>
					<option value="8" >行政不作为</option>
					<option value="9" >其他</option>
					</select>
	
				</td>
				<th>受理法院</th>
				<td colspan=2>
					<select name="xzssInfo.court" class="select-page" id="fayuan" onchange="setCourt()"  style="width:200px">
					<option value="">----请选择----</option>
					<option value="1" >北京市高级人民法院</option>
					<option value="2" >北京市第一中级人民法院 </option>
					<option value="3" >北京市第二中级人民法院 </option>
					<option value="4" >北京市第三中级人民法院 </option>
					<option value="5" >北京市第四中级人民法院（铁中院）</option>
					<option value="6" >北京市东城区法院</option>
					<option value="7" >北京市西城区法院</option>
					<option value="8" >北京市朝阳区法院</option>
					<option value="9" >北京市海淀区法院</option>
					<option value="10" >北京市平谷区法院</option>
					<option value="11" >北京市石景山区法院</option>
					<option value="12" >北京市门头沟区法院</option>
					<option value="13" >北京市房山区法院 </option>
					<option value="14" >北京市大兴区法院 </option>
					<option value="15" >北京市通州区法院</option>
					<option value="16" >北京市昌平区法院</option>
					<option value="17" >北京市顺义区法院</option>
					<option value="18" >北京市怀柔区法院</option>
					<option value="19" >北京市平谷区法院</option>
					<option value="20" >北京市密云县法院</option>
					<option value="21" >北京市延庆县法院</option>
					<option value="22" >北京市铁路运输法院</option>
					</select>
				</td>
			</tr>
			<tr>	
				<th>是否行政赔偿</th>
				<td>
					<input type="radio" name="xzssInfo.ismoney" value="1"  />是&nbsp;&nbsp;
					<input type="radio" name="xzssInfo.ismoney" value="0"  />   否
				</td>
				<th>案由</th>
				<td colspan=2>
					<input type="text" name="xzssInfo.case_cause" value="" class="inputTextNormal" />
				</td>
			</tr>
			<tr>	
				<th>书面答辩提交<br/>截止日期</th>
				<td>
				<input name="xzssInfo.dabian_endDate" type="text" class="inputTextNormal"  
				     value="" onClick="WdatePicker()" altname="收案日期" >
				</td>
				<th>是否有司法建议</th>
				<td colspan=2>
				<input type="radio" name="xzssInfo.issifajianyi" value="1"  />是&nbsp;&nbsp;
				<input type="radio" name="xzssInfo.issifajianyi" value="0"  />   否
				</td>
			</tr>
			<tr>	
			<th>被告形式</th>
			<td>
			<select name="xzssInfo.beigao" class="select-page" id="" onchange="" style="width:150px">
			<option value="">----请选择----</option>
			<option value="0">未经复议</option>
			<option value="1" >复议机关为单独被告</option>
			<option value="2" >复议机关为共同被告</option>
			</select>
			</td>
			<th >结案方式</th>
			<td >
			<select name="xzssInfo.jieanType"  class="select-page" id="jieanType" onchange="setJieanType()" style="width:100px">
			<option value="">--请选择--</option>
			<option value="1" >判决</option>
			<option value="2" >裁定</option>
			<option value="3" >其他</option>
			</select>
			</td>
			<td style="width:80px">
			<select name="xzssInfo.panjue" style="width:80px;display:none" id="panjue"  >
		      <option value="">----请选择----</option>
		      <option value="1" >驳回上诉，维持原判决</option>
		      <option value="2" >驳回诉讼请求</option>
		      <option value="3" >全部撤销</option>
		      <option value="4" >全部撤销并重作</option>
		      <option value="5" >部分撤销</option>
		      <option value="6" >部分撤销并重作</option>
		      <option value="7" >履行法定职责</option>
		      <option value="8" >履行给付义务</option>
		      <option value="9" >确认违法</option>
		      <option value="10" >确认无效</option>
		      <option value="11" >变更</option>
		      <option value="12" >行政协议履行</option>
		      <option value="13" >行政协议补偿</option>
		    </select>
		    <select name="xzssInfo.caiding" style="width:80px;display:none" id="caiding"  >
		      <option value="">----请选择----</option>
		      <option value="1" >驳回上诉，维持原裁定</option>
		      <option value="2" >撤销原判，发回重审</option>
		      <option value="3" >驳回起诉</option>
		      <option value="4" >准许原告主动撤诉</option>
		      <option value="5" >准许原告因被告改变原行政行为撤诉</option>
		      <option value="6" >终结诉讼</option>
		      <option value="7" >其他</option>
		    </select>
		    <select name="tiaojie" id="tiaojie"  style="width:80px;display:none"  >
		      <option value="">----请选择----</option>
		      <option value="1" >调解</option>
		      <option value="2" >其他</option>
		    </select>
			</td>
			</tr>
		</table>
		<br/>
			<div align="center" class="btnDiv" >
                <input type="button" name="button" class="btn1" style="float:none;" value="查询" onclick="search()" />&nbsp;&nbsp;&nbsp;
                <input type="reset" class="btn1 btn2" style="float:none;" value="重置" />
            </div>
        <br/> 
        </div>
	
	</form>
	<#if panduanGL != "1" && panduanGL != "2">
		<div class="foot">
			版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
			电话：65193431
		</div>
	</#if>
	</body>
</html>


<script type="text/javascript">
	function search(){
		//alert(111)
		window.form1.action="dosearchQuanShi.action";
		window.form1.submit();
		
	}
	function setJieanType(){
		if($("#jieanType").val()=="1"){
		var caidingOption=document.getElementById("caiding").getElementsByTagName("option");
		var tiaojieOption=document.getElementById("tiaojie").getElementsByTagName("option");
		caidingOption[0].selected=true;
		tiaojieOption[0].selected=true;
		document.getElementById("panjue").style.display="block";
		document.getElementById("caiding").style.display="none";
		document.getElementById("tiaojie").style.display="none";
		}
		else if($("#jieanType").val()=="2"){
		var panjueOption=document.getElementById("panjue").getElementsByTagName("option");
		var tiaojieOption=document.getElementById("tiaojie").getElementsByTagName("option");
		panjueOption[0].selected=true;
		tiaojieOption[0].selected=true;
		document.getElementById("panjue").style.display="none";
		document.getElementById("caiding").style.display="block";
		document.getElementById("tiaojie").style.display="none";
		}
		else if($("#jieanType").val()=="3"){
		var panjueOption=document.getElementById("panjue").getElementsByTagName("option");
		var caidingOption=document.getElementById("caiding").getElementsByTagName("option");
		panjueOption[0].selected=true;
		caidingOption[0].selected=true;
		document.getElementById("panjue").style.display="none";
		document.getElementById("caiding").style.display="none";
		document.getElementById("tiaojie").style.display="block";
		}else{
		document.getElementById("panjue").style.display="none";
		document.getElementById("caiding").style.display="none";
		document.getElementById("tiaojie").style.display="none";
		}
		
	}
</script>
