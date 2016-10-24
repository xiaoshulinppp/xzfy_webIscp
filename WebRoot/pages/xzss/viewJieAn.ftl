<!DOCTYPE html>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" type="text/css" href="../pages/xzfy/css/style_anju1.css">
<script type="text/javascript" src="../pages/xzfy/js/html5.js"></script>
<script type="text/javascript" src="../pages/xzfy/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../pages/xzfy/js/treeJs.js"></script>
<title></title>

<style type="text/css">img,z_wrap_info,.z_wrap_info{behavior: url(../css/ie-css3.htc);} </style> 
<style>
.btn{border:none;cursor:pointer;border-radius:3px}
.btn-blue{display:block; width:107px; height:27px;background: url(../images/sideNavBg.gif);line-height:27px; text-align:center; border:#eeeded solid 1px; margin-left:36px;margin-top:10px;float:left;}
.btn-blue:link,.btn-blue:visited{color:#000;}
</style>
</head>
<body>

<form name="form" id="form" method="post" ENCTYPE="multipart/form-data">
	<input type="hidden" name="funcCode" value="${funcCode}">
	<div class="z_wrap_info">
		<div class="align-right">
			<#if xzssInfo.status?has_content&&xzssInfo.status=="1">
			<a href="../xzss/viewJieAn.action?funcCode=${funcCode}&viewxzss=0&xzssId=${xzssInfo.id}" title="" class="btn-blue btn">修改</a>
			<#else>
			<a href="../xzss/viewJieAn.action?funcCode=${funcCode}&viewxzss=0&xzssId=${xzssInfo.id}" title="" class="btn-blue btn">填写</a>
			</#if>
		</div>
		<br/>&nbsp;
		<div class="z_info">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
		<tr>
		<th>结案时间</th>
		<td>
		<input name="xzssInfo.jieandate" type="text" class="inputTextNormal" <#if xzssInfo.jieandate?has_content>value="${xzssInfo.jieandate}"</#if> onClick="WdatePicker()" / >
		</td>
		</tr>
		<tr>
		<th>结案方式</th>
		<td>
		<input type="radio" name="xzssInfo.jieanType" value="1" <#if xzssInfo.jieanType?has_content&&xzssInfo.jieanType=="1">checked</#if> />判决
		<select name="xzssInfo.panjue" style="width:200px" id="panjue" >
	      <option value="0">----请选择----</option>
	      <option value="1" <#if xzssInfo.panjue?default("0")=="1">selected</#if>>驳回上诉，维持原判决</option>
	      <option value="2" <#if xzssInfo.panjue?default("0")=="2">selected</#if>>驳回诉讼请求</option>
	      <option value="3" <#if xzssInfo.panjue?default("0")=="3">selected</#if>>全部撤销</option>
	      <option value="4" <#if xzssInfo.panjue?default("0")=="4">selected</#if>>全部撤销并重作</option>
	      <option value="5" <#if xzssInfo.panjue?default("0")=="5">selected</#if>>部分撤销</option>
	      <option value="6" <#if xzssInfo.panjue?default("0")=="6">selected</#if>>部分撤销并重作</option>
	      <option value="7" <#if xzssInfo.panjue?default("0")=="7">selected</#if>>履行法定职责</option>
	      <option value="8" <#if xzssInfo.panjue?default("0")=="8">selected</#if>>履行给付义务</option>
	      <option value="9" <#if xzssInfo.panjue?default("0")=="9">selected</#if>>确认违法</option>
	      <option value="10" <#if xzssInfo.panjue?default("0")=="10">selected</#if>>确认无效</option>
	      <option value="11" <#if xzssInfo.panjue?default("0")=="11">selected</#if>>变更</option>
	      <option value="12" <#if xzssInfo.panjue?default("0")=="12">selected</#if>>行政协议履行</option>
	      <option value="13" <#if xzssInfo.panjue?default("0")=="13">selected</#if>>行政协议补偿</option>
	    </select>
	    <br/><br/>
	    <input type="radio" name="xzssInfo.jieanType" value="2" <#if xzssInfo.jieanType?has_content&&xzssInfo.jieanType=="2">checked</#if>  />裁定
	    <select name="xzssInfo.caiding" style="width:200px" id="cading" >
	      <option value="0">----请选择----</option>
	      <option value="1" <#if xzssInfo.caiding?default("0")=="1">selected</#if>>驳回上诉，维持原裁定</option>
	      <option value="2" <#if xzssInfo.caiding?default("0")=="2">selected</#if>>撤销原判，发回重审</option>
	      <option value="3" <#if xzssInfo.caiding?default("0")=="3">selected</#if>>驳回起诉</option>
	      <option value="4" <#if xzssInfo.caiding?default("0")=="4">selected</#if>>准许原告主动撤诉</option>
	      <option value="5" <#if xzssInfo.caiding?default("0")=="5">selected</#if>>准许原告因被告改变原行政行为撤诉</option>
	      <option value="6" <#if xzssInfo.caiding?default("0")=="6">selected</#if>>终结诉讼</option>
	      <option value="7" <#if xzssInfo.caiding?default("0")=="7">selected</#if>>其他</option>
	    </select>
	    <br/><br/>
	    <input type="radio" name="xzssInfo.jieanType" value="3" onclick="setJieAnType('3')" <#if xzssInfo.jieanType?has_content&&xzssInfo.jieanType=="3">checked</#if>  />其他
	    <select name="tiaojie" id="tiaojie"  style="width:200px;"  >
	      <option value="0">----请选择----</option>
	      <option value="1" <#if xzssInfo.tiaojie?default("0")=="1">selected</#if>>调解</option>
	      <option value="2" <#if xzssInfo.tiaojie?default("0")=="2">selected</#if>>其他</option>
	    </select>
		</td>
		</tr>
		<tr>
		<th>是否有司法建议</th>
		<td>
		<input type="radio" name="xzssInfo.issifajianyi" value="1"  <#if xzssInfo.issifajianyi?has_content&&xzssInfo.issifajianyi=="1">checked</#if> />是
		<input type="radio" name="xzssInfo.issifajianyi" value="0"  <#if xzssInfo.issifajianyi?has_content&&xzssInfo.issifajianyi=="0">checked</#if> />否
		</td>
		</tr>
		</table>
		</div>
		<br/>
	</div>
</form>
</body>
</html>
<script>
//alert("viewxzss="+${viewxzss})

</script>