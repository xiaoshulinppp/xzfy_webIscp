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
	      <a href="../xzss/showUndertakerList.action?funcCode=${funcCode}">行政诉讼案件列表</a> >行政复议查询</div>
	      <div class="fr"></div>
		</div>
	</#if>	
		
		
		<form id="form1" name="form1" action="''" method="post" ENCTYPE="multipart/form-data">
		
		<input type="hidden" name="funcCode" value="${funcCode}" />
		<input type="hidden" name="panduanGL" value="${panduanGL}" />
	
	
		
		<div class="formDiv" id="" >	
		<table width="100%" border="0" align="center" cellpadding="10" cellspacing="0">
		
			<tr>      
	     		<th>被申请人名称：</th>
			    <td>
				    <input name="respondent" type="text" class="inputTextNormal" value=""  >
			    </td>
			    <th>申请人：</th>
				<td>
					<input type="text" name="applicant" value="" class="inputTextNormal" />
				</td>
	  		</tr>
		
			<tr>
				<th>承办人姓名：</th>
				<td>
					<input type="text" name="undertakerName" value="" class="inputTextNormal" />
				</td>
				<th>第二承办人姓名：</th>
				<td>
					<input type="text" name="undertakerSecond" value="" class="inputTextNormal" />
				</td>
			</tr>
		
			<tr>
				<th>案件号：</th>
				<td>
					<input type="text" name="caseNo" value="" class="inputTextNormal" />
				</td>
				<th>代表人名称：</th>
					<td>
					<input type="text" name="representative" value="" class="inputTextNormal" />
				</td>
			</tr>

			
			<tr>
				<th>文号：</th>
				<td>
					<input type="text" name="caseNumBFY" value="" class="inputTextNormal" />
				</td>
				<th>被复议的具体行为-名称：</th>
				<td>
					<input type="text" name="caseNameBFY" value="" class="inputTextNormal" />
				</td>
			</tr>
		</table>
		<br/>
			<div align="center" class="btnDiv" style="padding-left:300px">
                <input type="button" name="button" class="btn1" value="查询" onclick="search()" />
                <input type="reset" class="btn1 btn2" value="重置" />
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
		window.form1.action="dosearchxzfy.action?";
		window.form1.submit();
		
	}
</script>