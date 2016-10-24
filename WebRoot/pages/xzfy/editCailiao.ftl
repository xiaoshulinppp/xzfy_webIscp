<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title></title>
<link href="../${Session['_USER_STYLE_'].cssPath}/base.css" rel="stylesheet" type="text/css" />
<link href="../${Session['_USER_STYLE_'].cssPath}/main_style.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 7]><link href="../sys_theme/css/ie7hack.css" rel="stylesheet" type="text/css" media="screen"/><![endif]--><!--不可删--->
<link href="../css/style_form.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>

	<!--                       Javascripts 注意不要改变顺序                      -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/function.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
<!-- 组件template -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
<style>   
.diva{ 
BORDER:#bfceff 1px solid;
height:22;
FILTER:progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr='#ddecfb',endColorStr='#ffffff');
PADDING-TOP: 3px; 
}
.divb{
BORDER: #bfceff 1px solid;
PADDING-TOP: 10px; 
PADDING-LEFT: 10px;
FONT-SIZE: 12px;
HEIGHT: 100px;
width:180;
border-top:0;
}
</style>

<!--javascript脚本添加位置。-->

<!--javascript脚本添加位置结束。-->
</head>
<body>


<form action="''" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
<div class="ui-form fn-clear">

<#assign sdResult=xzfyInfo.stadardResult?default('0')>

<!--主体内容、列表显示区域-->


<input name="isView" type="hidden" value="${isView?default('0')}">

<input id="xzfyId" name="xzfyInfo.id" value="${xzfyInfo.id}" type="hidden">

 <table  id="" class="ui-table ui-table-form "  ><!--表单填写项文字居右样式由 fn-text-right控制。td宽度在第一行标记 不要每行都标记-->	  	
    <tr>
    <td align="center" colspan=4 title="请根据本单位实际工作要求操作">申请材料电子版上传
    </td>
    </tr>
 <tr>
 <th width="15%">上传申请书、申请人身份证明、委托手续：</th>
 <td width="35%"><input name="upFile0" type="file" class="file" id="upFile0" />
 <#list fileList as fList>
 	<#if fList.type=='1'>
 		<br>已上传：<a href="..${fList.storedLocation?default('')}${fList.storedName?default('')}">下载</a>
 		<a href="../xzfy/deleteFile.action?fileId=${fList.id}&funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&listkeyword=${listkeyword}"><font color="red">删除</font></a>
 	</#if>
 </#list>
 </td>
 <th width="15%">上传其他证据<br>材料：</th>
 <td width="35%">
	<a href="#" onclick="addattachment(this.form);return false;" title="添加">添加</a>
	<table id="upFile2T" class="upLoadTable" >
		<tr >
			<td  >
				<input style='width:170px' name="upFile02" type="file" class="file" id="upFile02" />
			</td>
		</tr>
	</table>	
	 <#list fileList as fList>
 	<#if fList.type=='2'>
 		<a href="..${fList.storedLocation?default('')}${fList.storedName?default('')}">${fList.fileName?default('')}</a>
 		<a href="../xzfy/deleteFile.action?fileId=${fList.id}&funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&listkeyword=${listkeyword}&isView=1"><font color="red">删除</font></a>
 		<br>
 	</#if>
 </#list> 
 			</td>
		</tr> 	
<script>
	function addattachment(){

		
		var tabObj = document.getElementById("upFile2T");//获取表格对象
		var newRow = tabObj.insertRow(tabObj.rows.length);//插入行对象
		newRow.width='100%';
		//行数据
		var valueArr = new Array("<input style='width:170px' name='upFile02' type='file' class='file' id='upFile02'  /><a href='#' onclick='del(this);return false;' title='删除'>删除</a>" )
		var tempCell = new Array();
		for (var i = 0; i < valueArr.length; i++) {
			tempCell[i] = newRow.insertCell(i);//插入单元格
			tempCell[i].innerHTML = valueArr[i];//插入内容
		}
		tempCell[0].className="upLoad";//设置单元格class
		tempCell[0].width = "50%";//设置单元格width
		
	}
	
	function del(obj) {
	<#--
		var e = document.getElementById(id.id);
		document.getElementById("newdiv").removeChild(e);
		count11--;
	-->
	//if (confirm("\u786e\u8ba4\u5220\u9664\uff1f")) {
		obj.parentNode.parentNode.removeNode(true);
	//}
}
</script>		



  </table>

  <table  id=""class="ui-table  "   width="50%">

  <tfoot>
      <tr>
            <td>
		<input class="ui-btn ui-btn-normal"	
		 title="阶段性保存所填案件信息" type="button" id="lian3Btn"   value="保存" onClick="saveShencha()">

            </td>
      </tr>
    </tfoot>
    </table>

</div>	 

  </div>


</div>


<div id="frDiv" style="position:absolute;display:none;" class="formDiv">
 <div class="btn">
                       <div class="fl">
<a href="javascript:addFr()">继续添加</a>
</div>
<div class="fr">
<a href="javascript:checkFr();closeDivById('frDiv')">完成</a>
<a href="javascript:closeDivById('frDiv')">关闭</a>
                       </div>
                  </div>
<table width="90%">
<tr>
<td id="tfaren">
<#if xzfyInfo.app_type == "2"  && xzfyInfo.id?length gt 10>
<#list xzfyInfo.xzfyApps as app>
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="appfaren" >
<tr>
<th stlye="align:right">
申请人：</th>
<td colspan=3>
<input name="frsqr" type="text" isUser="true" size="50" value="${app.app_name?default('')}"/>
</td>
</tr>
<tr>

<th width="18%"  stlye="align:right">
&nbsp;&nbsp;代表人名称：
</th>
<td width="32%"><input name="fuzeren" type="text" isUser="true" value="${app.deputyName?default('')}"/>
</td>
<th width="18%"  stlye="align:right">
	&nbsp;&nbsp;送达地址：</th>
<td width="32%">
<textarea name="fzraddress" isUser="true" >${app.mail_address?default('')}</textarea>
<!--<input name="fzraddress" isUser="true" value="" size=30/>-->
	</td>
</tr>
	<tr><th>
	&nbsp;&nbsp;代表人类别：</th>
<td colspan=3>
<select name="fzrlb" isUser="true" retSelect="1">
<option value="法定代表人">法定代表人</option>
	<option value="负责人" <#if app.deputyType?default('')=="负责人">selected</#if>>负责人</option>
    <option value="执行合伙事务的合伙人" <#if app.deputyType?default('')=="执行合伙事务的合伙人">selected</#if>>执行合伙事务的合伙人</option>
    <option value="合伙人" <#if app.deputyType?default('')=="合伙人">selected</#if>>合伙人</option>
    <option value="主要负责人" <#if app.deputyType?default('')=="主要负责人">selected</#if>>主要负责人</option>
    <option value="被共同推选的非法人组织其他成员" <#if app.deputyType?default('')=="被共同推选的非法人组织其他成员">selected</#if>>被共同推选的非法人组织其他成员</option>
	</select>

	</td>
	
	</tr>
	<tr>
	<th>
	&nbsp;&nbsp;邮编：</th>
<td><input name="fzrpost" isUser="true"  type="text"  value="${app.postcode?default('')}"/>
	</td>
	<th>
	&nbsp;&nbsp;电话：</th>
<td><input name="fzrtele" isUser="true"  type="text"  value="${app.telephone?default('')}"/>
	</td>
</tr>
<tr>
<th>
	&nbsp;&nbsp;其他情形：
	</th>
<td colspan=2><select name="fzrother" isUser="true" retSelect="1">
	 <option value="0">无</option>
    <option value="由股东代表大会以股份制企业名义提出申请"  <#if app.otherType?exists && app.otherType=="由股东代表大会以股份制企业名义提出申请">selected</#if>>由股东代表大会以股份制企业名义提出申请</option>
    <option value="由董事会以股份制企业名义提出申请" <#if app.otherType?exists && app.otherType=="由董事会以股份制企业名义提出申请">selected</#if>>由董事会以股份制企业名义提出申请</option>
    <option value="其他" <#if app.otherType?exists && app.otherType=="其他">selected</#if>>其他</option>
	</select>
	
	</td>
<td align='left'><input value="删除" type="button" class="btn1" onclick="deleteFr(this)"></td>
</tr>
</table>
</#list>
<#else>
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="appfaren" >
<tr>
<th align="right">
&nbsp;&nbsp;申请人：</th>
<td colspan=3>
<input name="frsqr" isUser="true" size="50" value="" type="text"/>
</td>
</tr>
<tr>

<th width="18%" stlye="align:right">
&nbsp;&nbsp;代表人名称：
</th>
<td width="32%"><input name="fuzeren" isUser="true" value="" type="text"/>
</td>
<th width="15%">
	&nbsp;&nbsp;送达地址：</th>
<td width="35%">
<textarea name="fzraddress" isUser="true" ></textarea>
<!--<input name="fzraddress" isUser="true" value="" size=30/>-->
	</td>
</tr>
	<tr><th>
	&nbsp;&nbsp;代表人类别：</th>
<td colspan=3>
<select name="fzrlb" isUser="true" retSelect="1">
<option value="法定代表人">法定代表人</option>
	<option value="负责人">负责人</option>
    <option value="执行合伙事务的合伙人">执行合伙事务的合伙人</option>
    <option value="合伙人">合伙人</option>
    <option value="主要负责人">主要负责人</option>
    <option value="被共同推选的非法人组织其他成员">被共同推选的非法人组织其他成员</option>
	</select>

	</td>
	
	</tr>
	<tr>
	<th>
	&nbsp;&nbsp;邮编：</th>
<td><input name="fzrpost" isUser="true" value="" type="text"/>
	</td>
	<th>
	&nbsp;&nbsp;电话：</th>
<td><input name="fzrtele" isUser="true" value="" type="text"/>
	</td>
</tr>
<tr>
<th>
	&nbsp;&nbsp;其他情形：
	</th>
<td colspan=2><select name="fzrother" isUser="true" retSelect="1">
	 <option value="0">无</option>
    <option value="由股东代表大会以股份制企业名义提出申请">由股东代表大会以股份制企业名义提出申请</option>
    <option value="由董事会以股份制企业名义提出申请">由董事会以股份制企业名义提出申请</option>
    <option value="其他">其他</option>
	</select>
	
	</td>
<td align='left'><input value="删除" type="button" class="btn1" onclick="deleteFr(this)"></td>

</tr>
</table>
</#if>
<table  id="insfaren">
&nbsp;
</table>
</td></tr>
</table>
</div>

<div id="appDiv" style="position:absolute;display:none;" class="formDiv">
<div class="btn">
<div class="fl">
<a href="javascript:addApp()">继续添加</a>
</div>
<div class="fr">
<a href="javascript:addApp:closeApp1()" id="appEnd">完成</a>
<a href="javascript:addUser:closeDivById('appDiv')">关闭</a>
</div>
</div>

<table width="90%" >
<tr>
<td id="tapp">
<#if xzfyInfo.app_type == "1" && xzfyInfo.id?length gt 10>
<#list xzfyInfo.xzfyApps as app>
<table   width="100%"  id="appapp">
<tr>
<th>&nbsp;&nbsp;申请人：</th>
<td><input name="appsqr" type="text"  isUser="true" value="${app.app_name?default('')}"/></td>
<th>&nbsp;&nbsp;性别：</th>
<td><select name="appsex" isUser="true" retSelect="1" style="display:block">
	<option value="男" <#if app.sexy?default('')=="男">selected</#if>>男</option>
	<option value="女" <#if app.sexy?default('')=="女">selected</#if>>女</option>
	</select></td>
	</tr>
<tr>
	<th>&nbsp;&nbsp;身份证号：</th>
	<td><input name="appnum" type="text" isUser="true" value="${app.app_id?default('')}" />
	</td>
	<th>
	&nbsp;&nbsp;送达地址：
	</th>
	<td>
	<textarea name="appaddress" type="text" isUser="true">${app.mail_address?default('')}</textarea>
	</td>
</tr>
<tr>
	<th>
	&nbsp;&nbsp;邮编：
	</th>
	<td><input name="apppost" type="text" isUser="true" value="${app.postcode?default('')}"/>
	</td>
	<th>
	&nbsp;&nbsp;电话：
	</th>
	<td><input name="appphone" type="text" isUser="true" value="${app.telephone?default('')}" />
	<a href="#" onclick="deleteApp(this);return false;" title="删除"  >删除</a>
	</td>
</tr>
</table>
</#list>
<#else>
<table   width="100%"  id="appapp">
<tr>
<th>&nbsp;&nbsp;申请人：</th>
<td><input name="appsqr" type="text" isUser="true" value=""/></td>
<th>&nbsp;&nbsp;性别：</th>
<td><select name="appsex" isUser="true" retSelect="1" style="display:block">
	<option value="男">男</option>
	<option value="女">女</option>
	</select></td>
	</tr>
<tr>
	<th>&nbsp;&nbsp;身份证号：</th>
	<td><input name="appnum" type="text" isUser="true" value="" />
	</td>
	<th>
	&nbsp;&nbsp;送达地址：
	</th>
	<td>
	<textarea name="appaddress"  type="text" isUser="true"></textarea>
	</td>
</tr>
<tr>
	<th>
	&nbsp;&nbsp;邮编：
	</th>
	<td><input name="apppost" type="text" isUser="true" value=""/>
	</td>
	<th>
	&nbsp;&nbsp;电话：
	</th>
	<td><input name="appphone" type="text" isUser="true" value='' />
	<a href="#" onclick="deleteApp(this);return false;" title="删除"  >删除</a>
	</td>
</tr>
</table>
</#if>
<table  id="insapp">
</table>
</td></tr>
</table>
</div>

<div id="deputyDiv" style="width:610px;position:absolute;display:none;" class="formDiv">
	<div class="btn">
		<div class="fr">
			<a href="javascript:addApp:closeDep()">完成</a>
			<a href="javascript:addUser:closeDivById('deputyDiv')">关闭</a>
		</div>
	</div>
</tr>
<table   id="dep" style="width:600px;">
	<tr style="width:600px;">
		<th style="width:25%">
		请选择代表人：
		</th>
		<td id="xuandbr">

		</td>
	</tr>
</table>
</div>



</form>
</body>

<script language="javascript">

	function jafss(){
		if(document.getElementById("jafs").value==8){
			document.getElementById("jafs1").style.display="block";
			document.getElementById("jafs2").style.display="none";
			document.getElementById("jafs1").name="xzfyInfo.finishBreakType"
			document.getElementById("jafs2").name="xzfyfb";
			
		}else if(document.getElementById("jafs").value==1){
			document.getElementById("jafs2").style.display="block";
			document.getElementById("jafs1").style.display="none";
			document.getElementById("jafs2").name="xzfyInfo.finishBreakType"
			document.getElementById("jafs1").name="xzfyfb";
			
		}
		else{
			document.getElementById("jafs1").style.display="none";
			document.getElementById("jafs2").style.display="none";
		}
	}

function addnotchecked(){

	document.getElementById("addbegin").value="";
	document.getElementById("addend").value="";
	document.getElementById("buzheng").style.display='none';
	document.getElementById("scresult").value="0";
	document.getElementById("buzheng").style.display="none";
	document.getElementById("yaobuzheng5").style.display="none";
	document.getElementById("bzfs").value="";
	document.getElementById("shenpiBtn").style.display="none";
	document.getElementById("buzhengshenpi").style.display="none";
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
	//document.getElementById("divxzgllbinput").innerHTML='<input name="app_face.TReferOther" type="text" altname="行政管理类别" id="xzgllbinput" class="inputTextNormal">';
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
function setNotsend_n(){
	document.getElementById("scresult").value=0;
}
function setNotsend(){
   //document.getElementById("scresult").value=5;
   document.getElementById("ajsjfm1").value=0;
   document.getElementById("dlr1").value="";
   document.getElementById("dsdlr1").value="";
   document.getElementById("bfyjtxwah1").value="";
   document.getElementById("xzfyqq1").value="";
   document.getElementById("bfyjtxwmc1").value="";
   document.getElementById("addbegin").value="";
   document.getElementById("addend").value="";
   document.getElementById("cbrsubdate").value="";
   document.getElementById("cbropinion").value="";
   
   
   //document.getElementById("di3ren_y").checked=false;
  // document.getElementById("di3ren_n").checked=false;
   document.getElementById("xzpc_y").checked=false;
   document.getElementById("xzpc_n").checked=false;

   
   
}
function test(){
//alert(document.getElementById("deptid").value);
}



function setYJ(){
  <#--
	if(document.getElementById("scresult").value==1){
		document.getElementById("cbryj").value="　　建议立案，请    并灵雁同志阅示。"
	}else if(document.getElementById("scresult").value==2){
		document.getElementById("cbryj").value="　　不符合市政府行政复议受理条件，建议告知处理，请    并灵雁同志阅示。"
	}else if(document.getElementById("scresult").value==3){
		document.getElementById("cbryj").value="　　不符合市政府行政复议受理条件，建议不予受理，请    并灵雁同志阅示。"
	}else if(document.getElementById("scresult").value==5){
		document.getElementById("cbryj").value="　　建议不予立案，结案方式按照其他处理，请    并灵雁同志阅示。"
	}-->
}


subcat = new Array();
var count=0;

<#list bList as dl>	
       subcat[${dl_index}]=new Array("${dl.type}","${dl.name}","${dl.value}"); 
       count++;    
</#list>


function aaa() {
	document.getElementById("aac").value="1";
	var aaa = document.getElementById('beapptype').value;
	if(aaa==8){
		document.getElementById("beappnameinput").setAttribute("ischeck","y");
		document.getElementById("beappnametd").style.display="block";
		document.getElementById("beappnamesel").style.display="none";
		document.getElementById("beappnameinput").name="xzfyInfo.defendant_name";
		document.getElementById("beappname").name="ssss";
		document.getElementById("beappname").removeAttribute("ischeck");
	} else {
		document.getElementById("beappname").setAttribute("ischeck","y");
	    document.getElementById("beappnamesel").style.display="block";
		document.getElementById("beappnametd").style.display="none";
		document.getElementById("beappname").name="xzfyInfo.defendant_name";
		document.getElementById("beappnameinput").name="ssss";
		document.getElementById("beappnameinput").removeAttribute("ischeck");
		document.getElementById('beappname').length = 0; 
		document.getElementById('beappname').options[document.getElementById('beappname').length] = new Option("----请选择-----", "0");
       var x;
        for (x=0; x < count; x++)
         {
            if (subcat[x][0] == aaa)

               {   var tempOption=new Option(subcat[x][1], subcat[x][1]);
               	   tempOption.deptcode=subcat[x][2];
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
	if(document.getElementById("xzfysx").value==0){
		return false;
	}


	return true;
}
function checkajgllb(){
	if(document.getElementById("ajsjfm1").value==0)
	
	{return false;}
	
	else{

	return true;
	}
}
function check_remark(){
	if(document.getElementById("handle").value==2){
		document.getElementById("handle_detail").style.display="block";
		document.getElementById("advicespan").style.display="block";
		document.getElementById("check_select").style.display="block";
		document.getElementById("otherAdvice").style.display="block";
	}else if(document.getElementById("handle").value==3){
		document.getElementById("handle_detail").style.display="none";
		document.getElementById("advicespan").style.display="none";
		document.getElementById("check_select").style.display="none";
		document.getElementById("otherAdvice").style.display="none";
	}else{
		document.getElementById("handle_detail").style.display="none";
		document.getElementById("advicespan").style.display="none";
		document.getElementById("check_select").style.display="none";
		document.getElementById("otherAdvice").style.display="block";
	}
}

function getUser(){
	var name =encodeURIComponent(document.getElementById("appstring").value);
	if(name==""){
		alert("请填写被接待人名称！")
	}else{
		window.open ("../jds/checkApplication.action?appString="+name,'newwindow','height=300,width=400,top=300,left=300,toolbar=yes,menubar=yes,scrollbars=yes, resizable=yes'); 
	}
}

function getUser1(){
       
	var name = encodeURIComponent(document.getElementById("app_face.TDeputy").value);	
	if(name==""){
		alert("请填写代表人名称！")
	}else{
	window.open ("../jds/dupdenamecheck.action?TDeputy="+name,'newwindow','height=300,width=400,top=300,left=300,toolbar=yes,menubar=yes,scrollbars=yes, resizable=yes'); 
	}
}

function sendchecknull(){
	/*
	if(document.getElementById("user").value=="") {alert("请填写申请人!");return ;}
	else if(document.getElementById("receivedate").value=="") {alert("请填写收案日期!");return ;}
	else if(document.getElementById("applicationtype").value==0) {alert("请填写申请人类别!");return ;}
	
	else if(!document.getElementById("duoren_y").checked&&!document.getElementById("duoren_n").checked) {alert("请填写多人复议!");return ;}
	else if(document.getElementById("beapptype").value==0) {alert("请填写被申请人种类!");return ;}
	else if((document.getElementById("beappname").value==0)&&(document.getElementById("beappname2").value=="")) {alert("请填写被申请人名称!");return ;}
	
	else if(document.getElementById("xzfysx").value==0) {alert("请填写案件类型!");return ;}
	else if(document.getElementById("senddept3").value=="") {alert("请填写转送机构名称!");return ;}
	*/
	return true;
}

function jashow(){
	
	if(document.getElementById("isShenpi").value==1 || document.getElementById("checkStatus").value==1){
		document.getElementById("scresult").value==0;
		alert("审批中！无法选择！");
		return ;
	}
	
    if(document.getElementById("scresult").value==2||document.getElementById("scresult").value==3||document.getElementById("scresult").value==5){
      document.getElementById("laBtn").style.display="none";
      document.getElementById("isShoulishenpi").style.display="none";
      document.getElementById("lianshenpi1").style.display="none";
	   // senddept.style.display='block';
	   // senddept1.style.display='block';
	    document.getElementById("jatbody").style.display="block";
	    document.getElementById("jzfz").style.display="none";
	    //document.getElementById("filegz").style.display="none";
      	//结案审批区域
	    document.getElementById("isjashenpi").style.display="block";
	    document.getElementById("bujieanshenpi").style.display="none";
	    document.getElementById("jaBtn").style.display="block";
	    document.getElementById("yaojieanshenpi1").style.display="block";
	    document.getElementById("yaojieanshenpi2").style.display="block";
	    document.getElementById("yaojieanshenpi3").style.display="none";
	    document.getElementById("yaojieanshenpi4").style.display="none";
	    document.getElementById("jieannBtn").style.display="block";
	    document.getElementById("isJieanshenpi").value = "1";
	    
	    
	} <#--else if(document.getElementById("scresult").value==10){
		 document.getElementById("jatbody").style.display="none";
	    document.getElementById("jzfz").style.display="block";
	    //document.getElementById("buzheng").style.display="block";
	    //document.getElementById("filegz").style.display="block";

		
	
		if(document.getElementById("isBuzheng").value==0){
				alert("补证审批才可以选择此项！");
				document.getElementById("scresult").value=0;
				return ;
		}
	}-->
	else if(document.getElementById("scresult").value==1){
		document.getElementById("jatbody").style.display="none";
	    document.getElementById("jzfz").style.display="block";
	    //立案审批区域   
	    document.getElementById("laBtn").style.display="block";
      	document.getElementById("isShoulishenpi").style.display="block";
      	document.getElementById("isLianshenpi").value="1";
      	document.getElementById("lianxuanze1").style.display="block";
      	document.getElementById("lianxuanze2").style.display="block";
      	document.getElementById("lianxuanze3").style.display="none";
      	document.getElementById("lianxuanze4").style.display="none";
      	document.getElementById("lianBtn").style.display="block";
      	//结案审批区域
	    document.getElementById("isjashenpi").style.display="none";
	    document.getElementById("bujieanshenpi").style.display="none";
	    document.getElementById("jaBtn").style.display="none";
	} else{
	    //senddept.style.display='none';
	    //senddept1.style.display='none';
	   // document.getElementById("filegz").style.display="none";
	    document.getElementById("jatbody").style.display="none";
	    document.getElementById("jzfz").style.display="block";
	    //document.getElementById("senddept3").value="";   
	    //立案审批区域   
	    document.getElementById("laBtn").style.display="none";
      document.getElementById("isShoulishenpi").style.display="none";
      document.getElementById("lianshenpi1").style.display="none";
      	//结案审批区域
	    document.getElementById("isjashenpi").style.display="none";
	    document.getElementById("bujieanshenpi").style.display="none";
	    document.getElementById("jaBtn").style.display="none";
	}
	
}

function scjlchange(){
	if(document.getElementById("scresult").value==4){
	senddept.style.display='block';
	senddept1.style.display='block';
	document.getElementById("sendtbody").style.display="block";
	//sendnotuse.style.display='none';
	//shencha.style.display='none';
	//buzheng.style.display='none';
	//setNotsend();
	}
	else{
	senddept.style.display='none';
	senddept1.style.display='none';
	document.getElementById("sendtbody").style.display="none";
	document.getElementById("senddept3").value="";
	//sendnotuse.style.display='block';
	//shencha.style.display='block';
	//setNotsend_n();
	}
}

function update(){
		var aaid = document.getElementById("Aid").value;
		
	    if(confirm("确定要修改吗？"))
	    {
		listForm_= document.getElementById("form1");
		
		listForm_.action="../jds/App_FaceUpdateAction.action?funcCode=${funcCode}&&id="+aaid;
		listForm_.submit();
	   }

}

function finishShencha(){
	
	
	if(!checknull()){return ;}

	var status;
	if(document.getElementById("scresult").value==0){
			alert("请选择立案审查意见！"); 
			return ;
	} else if(document.getElementById("scresult").value==2||document.getElementById("scresult").value==3||document.getElementById("scresult").value==5){
		if (document.getElementById("finish_date").value==""){
			alert("请填写结案日期！"); 
			return ;
		}
		status=12;
	} else if(document.getElementById("scresult").value==1){
		if (document.getElementById("lian_date").value==""){
			alert("请填写立案日期！"); 
			return ;
		}
		status=4;
	}
	
	
	if(confirm("确定要提交吗？")){
			listForm_= document.getElementById("form1");
			listForm_.action="../xzfy/finishLianshencha.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&status="+status;
			listForm_.submit();
	}

}
/*************************保存结案信息-begin**********************************************/
	function saveJiean(){
		if(checkKeyWord==1){
			if(document.getElementById("dept_keyword").value==0){
				alert("请选择统计关键词！");
				return;
			}
		}
		if(!checknull()){return ;}
		if(document.getElementById("user").value==""){
			alert("请填写申请人");
			return ;
		}

		if(document.getElementById("xzfyqq1").value==""){
			alert("请填写行政复议请求");
			return ;
		}	
		
		if(document.getElementById("TBeName").value==""){
			alert("请填写被复议的具体行政行为名称");
			return ;
		}	
		/*
		if(document.getElementById("annum").value==""){
			alert("请填写被复议的具体行政行为案号");
			return ;
		}
				
		if(document.getElementById("content").value==""){
			alert("请填写简要内容");
			return ;
		}	
		*/
	if(document.getElementById("sdResult").value=="1"){
			if(document.getElementById("tjzfzh").value==""){
				alert("请填写案号");
				return ;
			}
			if(document.getElementById("lian_date").value==""){
				alert("请填写立案日期");
				return ;
			}	
	} 	
	
			if(document.getElementById("isstop").value=="1"){
				if(document.getElementById("isstop_from").value==""){
					alert("请填写中止日期")
					return ;
				}
			}	
	/*
	if(document.getElementById("isBuzheng").value==1){
		if(document.getElementById("bzTongzhiriqi").value==""){
			alert("请填写通知补正日期")
			return;
		}
		
	}	
	*/


	if(confirm("确定要保存吗？"))
	    {
	    
	    if(document.getElementById("xzfyStatus").value<4){
	    	if(document.getElementById("sdResult").value=="1")
	    		document.getElementById("xzfyStatus")=4
	    	
	    }

		listForm_= document.getElementById("form1");
		
		listForm_.action="../xzfy/saveJiean.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}";
		
		listForm_.submit();
		}
	}
/*************************保存结案信息-end**********************************************/

/*************************完成结案信息-begin**********************************************/
	function submitJiean(){
		if(checkKeyWord==1){
			if(document.getElementById("dept_keyword").value==0){
				alert("请选择统计关键词！");
				return;
			}
		}	
		if(!checknull()){return ;}
		if(document.getElementById("user").value==""){
			alert("请填写申请人");
			return ;
		}

		if(document.getElementById("xzfyqq1").value==""){
			alert("请填写行政复议请求");
			return ;
		}	
		
		if(document.getElementById("TBeName").value==""){
			alert("请填写被复议的具体行政行为名称");
			return ;
		}	
		/*
		if(document.getElementById("annum").value==""){
			alert("请填写被复议的具体行政行为案号");
			return ;
		}
				
		if(document.getElementById("content").value==""){
			alert("请填写简要内容");
			return ;
		}	
		*/
	if(document.getElementById("sdResult").value=="1"){
			if(document.getElementById("tjzfzh").value==""){
				alert("请填写案号");
				return ;
			}
			if(document.getElementById("lian_date").value==""){
				alert("请填写立案日期");
				return ;
			}	
	}else{
		if(document.getElementById("handleReason").value=="0" && document.getElementById("sdResult").value!=5){
			if(document.getElementById("caseorg").value=="0000"){
				alert("请填写未受理原因");
				return ;	
			}
		}
	} 	
	
			if(document.getElementById("isstop").value=="1"){
				if(document.getElementById("isstop_from").value==""){
					alert("请填写中止日期")
					return ;
				}
				if(document.getElementById("breakTo").value==""){
					alert("请填写恢复审理日期")
					return ;
				}				
				
			}	
			
			if(document.getElementById("jieandate").value==""){
				alert("请填写结案日期")
				return ;
			}
			
			if(document.getElementById("jafs").value=="0"){
				alert("请填写结案方式")
				return ;
			}else if(document.getElementById("jafs").value=="8"){
				if(document.getElementById("jafs1").value=="0"){
					alert("请填写结案方式")
					return ;
				}
			}			
	/*
	if(document.getElementById("jiean_file").value=="" && document.getElementById("jieanwenshu").value==""  && document.getElementById("xzfyStatus").value<11){
			alert("请上传结案文书")
			return ;	
	
	}
	*/
	
	
	
	if(document.getElementById("isBuzheng").value==1){
		if(document.getElementById("bzTongzhiriqi").value==""){
			alert("请填写通知补正日期")
			return;
		}
	
	}	
	
	

	if(confirm("结案后信息将不能再做任何修改，您确认要结案吗？"))
	    {
	    document.getElementById("xzfyStatus").value=12;
		listForm_= document.getElementById("form1");
		
		listForm_.action="../xzfy/saveJiean_finish.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}";
		
		listForm_.submit();
		}
	}
/*************************完成结案信息-end**********************************************/
	function submitShencha1(){
		if(checkKeyWord==1){
			if(document.getElementById("dept_keyword").value==0){
				alert("请选择统计关键词！");
				return;
			}
		}		
		if(!checknull()){return ;}
		if(document.getElementById("user").value==""){
			alert("请填写申请人");
			return ;
		}

		if(document.getElementById("xzfyqq1").value==""){
			alert("请填写行政复议请求");
			return ;
		}	
		
		if(document.getElementById("TBeName").value==""){
			alert("请填写被复议的具体行政行为名称");
			return ;
		}	
		/*
		if(document.getElementById("annum").value==""){
			alert("请填写被复议的具体行政行为案号");
			return ;
		}
				
		if(document.getElementById("content").value==""){
			alert("请填写简要内容");
			return ;
		}	
		*/
	if(document.getElementById("sdResult").value=="1"){
			if(document.getElementById("tjzfzh").value==""){
				alert("请填写案号");
				return ;
			}
			if(document.getElementById("lian_date").value==""){
				alert("请填写立案日期");
				return ;
			}	
	} 		
	
	if(document.getElementById("isBuzheng").value==1){
		if(document.getElementById("bzTongzhiriqi").value==""){
			alert("请填写通知补正日期")
			return;
		}

	}	

	if(confirm("确定要完成吗？"))
	    {
	    
		listForm_= document.getElementById("form1");
		
		listForm_.action="../xzfy/finishLianInfo1.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}";
		
		listForm_.submit();
	}
	}



	function submitShencha(){
		if(checkKeyWord==1){
			if(document.getElementById("dept_keyword").value==0){
				alert("请选择统计关键词！");
				return;
			}
		}
	
		if(!checknull()){return ;}
		if(document.getElementById("user").value==""){
			alert("请填写申请人");
			return ;
		}

		if(document.getElementById("xzfyqq1").value==""){
			alert("请填写行政复议请求");
			return ;
		}	
		
		if(document.getElementById("TBeName").value==""){
			alert("请填写被复议的具体行政行为名称");
			return ;
		}	
		/*
		if(document.getElementById("annum").value==""){
			alert("请填写被复议的具体行政行为案号");
			return ;
		}
				
		if(document.getElementById("content").value==""){
			alert("请填写简要内容");
			return ;
		}	
		*/

	if(document.getElementById("sdResult").value=="1"){
			if(document.getElementById("tjzfzh").value==""){
				alert("请填写案号");
				return ;
			}
			if(document.getElementById("lian_date").value==""){
				alert("请填写立案日期");
				return ;
			}	
	} 		
	
	if(document.getElementById("isBuzheng").value==1){
		if(document.getElementById("bzTongzhiriqi").value==""){
			alert("请填写通知补正日期")
			return;
		}

	}	

	if(confirm("确定要完成吗？"))
	    {
	    
		listForm_= document.getElementById("form1");
		
		listForm_.action="../xzfy/finishLianInfo.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}";
		
		listForm_.submit();
	}
	}


function saveShencha(){

	if(confirm("确定要保存吗？"))
	    {
	    
		listForm_= document.getElementById("form1");
		
		listForm_.action="../xzfy/saveCailiao.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}";
		
		listForm_.submit();
	}

}

function subDJA(){ 
	listForm_= document.getElementById("form1");
	if(document.getElementById("finishtype1").value==0){alert("请选择结案方式!");return;}
	if(document.getElementById("finishtype1").value==8){if(document.getElementById("finishtype2").value==0){alert("请选择结案方式!");return;}}
	if(!document.getElementById("compensate_y").checked&&!document.getElementById("compensate_n").checked){alert("请选择国家赔偿!");return;}
	var doubleReg=/^\d+(\.?\d{2})?$/;	
	if(document.getElementById("compensate_y").checked&&(!doubleReg.test(document.getElementById("countrycompensatenum").value))){alert("请输入赔偿数额!");return;}
	//if(!document.getElementById("finishreport_y").checked&&!document.getElementById("finishreport_n").checked){alert("请选择是否上传结案文书!");return;}
	//if(listForm_.file2.value==""&&document.getElementById("finishreport_y").checked){
	if(listForm_.file2.value==""){
		alert("请上传结案文书!");return;
		}
	//if(listForm_.file2.value!=""&&document.getElementById("finishreport_y").checked){
	if(listForm_.file2.value!=""){
		if(!(listForm_.file2.value.substring(listForm_.file2.value.length-3,listForm_.file2.value.length)=="doc"||listForm_.file2.value.substring(listForm_.file2.value.length-3,listForm_.file2.value.length)=="xls"||listForm_.file2.value.substring(listForm_.file2.value.length-3,listForm_.file2.value.length)=="rar"||listForm_.file2.value.substring(listForm_.file2.value.length-3,listForm_.file2.value.length)=="pdf"||listForm_.file2.value.substring(listForm_.file2.value.length-3,listForm_.file2.value.length)=="ppt"))
		{alert("请确认结案文书文件格式!");return;}
		}
	if(!document.getElementById("opinion_y").checked&&!document.getElementById("opinion_n").checked){alert("请选择是否上传行政复议意见书!");return;}
	if(listForm_.file.value==""&&document.getElementById("opinion_y").checked){alert("请上传行政复议意见书!");return;}
	if(listForm_.file.value!=""&&document.getElementById("opinion_y").checked){
		if(!(listForm_.file.value.substring(listForm_.file.value.length-3,listForm_.file.value.length)=="doc"||listForm_.file.value.substring(listForm_.file.value.length-3,listForm_.file.value.length)=="xls"||listForm_.file.value.substring(listForm_.file.value.length-3,listForm_.file.value.length)=="rar"||listForm_.file.value.substring(listForm_.file.value.length-3,listForm_.file.value.length)=="pdf"||listForm_.file.value.substring(listForm_.file.value.length-3,listForm_.file.value.length)=="ppt"))
		{alert("请确认行政复议意见书文件格式!");return;}
		}
	if(!document.getElementById("advise_y").checked&&!document.getElementById("advise_n").checked){alert("请选择是否上传行政复议建议书!");return;}
	if(listForm_.file1.value==""&&document.getElementById("advise_y").checked){alert("请上传行政复议建议书!");return;}
	if(listForm_.file1.value!=""&&document.getElementById("opinion_y").checked){
	if(!(listForm_.file1.value.substring(listForm_.file1.value.length-3,listForm_.file1.value.length)=="doc"||listForm_.file1.value.substring(listForm_.file1.value.length-3,listForm_.file1.value.length)=="xls"||listForm_.file1.value.substring(listForm_.file1.value.length-3,listForm_.file1.value.length)=="rar"||listForm_.file1.value.substring(listForm_.file1.value.length-3,listForm_.file1.value.length)=="pdf"||listForm_.file1.value.substring(listForm_.file1.value.length-3,listForm_.file1.value.length)=="ppt"))
		{alert("请确认行政复议建议书文件格式!");return;}
	}
	
	
	return true;
	
	
}


function checknull()
{
	/*
	var intReg=/^[0-9]*[1-9][0-9]*$/;
	var a=document.getElementsByTagName("input");
	
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
	*/
	if(document.getElementById("beapptype").value=="0"){
		alert("请填写被申请人类别");return false;
	}
	if(!checkfysx()){alert("请填写案件类型!");return false;}
	if(!checkajgllb()){alert("请填写行政管理类别!");return false;}
	return true;
}

function setAdvice(ev){
	var udiv=document.getElementById("adviceDiv");
	var userspan=document.getElementById("advicespan");
	var areaObject=document.getElementById("handle_detail");
	if(udiv.style.display!="block"){
	ev = ev || window.event;
	var mousePos = getPosition(areaObject);
	udiv.style.position = "absolute";
	udiv.style.top      = mousePos.y+20;
	udiv.style.left     = mousePos.x+180;
	udiv.style.display="block";
	userspan.style.display="none";
	closeSelect();
	}
}

function closeAdvice(){
	var userspan=document.getElementById("advicespan");
	userspan.style.display="block";
	document.getElementById("adviceDiv").style.display="none";
	openSelect();
}

function rechekAadvice(){
	document.getElementById("handle_detail").value="";

}

function addAdvice(advice){
	document.getElementById("handle_detail").value=advice;
}

function showTiaojie(){
	var tiaojie = document.getElementById("xzpc_y").value;
	
	if(tiaojie=="是"){
		document.getElementById("otherDetail").style.display="block";	
	}
	
}
function showTiaojie2(){

	var tiaojie2 = document.getElementById("xzpc_n").value;
	if(tiaojie2=="否"){
		document.getElementById("otherDetail").style.display="none";
	}
}

 var xmlHttp;
        function createXMLHttpRequest() {
            if (window.ActiveXObject) {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            } 
            else if (window.XMLHttpRequest) {
                xmlHttp = new XMLHttpRequest();                
            }
        }


	function getTitleList(){
		createXMLHttpRequest();
		var tjzfzh=encodeURIComponent(document.getElementById("tjzfzh").value);
		var url = "../jds/chengJzfz.action?appname="+tjzfzh;
		xmlHttp.onreadystatechange = stringCallback;
		xmlHttp.open("GET", url, true);
		xmlHttp.setRequestHeader("contentType","text/html;charset=UTF-8");
		xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xmlHttp.send(null);
		
	}

	function stringCallback(){		
		if (xmlHttp.readyState == 4) {
				  if (xmlHttp.status == 200) { 		  
					var titleList=document.getElementById("checkJzfz");
					titleList.value=xmlHttp.responseText;		
					if(titleList.value==1){
						alert("案号重复，请重新输入！");
						document.getElementById("tjzfzh").value="京政复字[200]号";
						
					}

				}
			}
	}
	
	function shifoubuzheng(){
		if(document.getElementById("isBuzheng").value=="1"){
			document.getElementById("buzhengshenpi").style.display="none";
			document.getElementById("bzfs").value = "书面通知";
			document.getElementById("scresult").value = "10";
			document.getElementById("yaobuzheng1").style.display="block";
			document.getElementById("yaobuzheng2").style.display="block";
			document.getElementById("yaobuzheng3").style.display="none";
			document.getElementById("yaobuzheng4").style.display="none";
			document.getElementById("yaobuzheng5").style.display="block";
			document.getElementById("spBtn").style.display="block";
		} else {
			document.getElementById("buzhengshenpi").style.display="block";
			document.getElementById("yaobuzheng1").style.display="none";
			document.getElementById("yaobuzheng2").style.display="none";
			document.getElementById("yaobuzheng3").style.display="block";
			document.getElementById("yaobuzheng4").style.display="block";
			document.getElementById("yaobuzheng5").style.display="block";
			document.getElementById("spBtn").style.display="none";
		}
	}
	
	function jieanshenpi1(){
		if(document.getElementById("isJieanshenpi").value=="1"){
			document.getElementById("bujieanshenpi").style.display="none";
			document.getElementById("yaojieanshenpi1").style.display="block";
			document.getElementById("yaojieanshenpi2").style.display="block";
			document.getElementById("yaojieanshenpi3").style.display="none";
			document.getElementById("yaojieanshenpi4").style.display="none";
			document.getElementById("jieannBtn").style.display="block";
		} else {
			document.getElementById("bujieanshenpi").style.display="block";
			document.getElementById("yaojieanshenpi1").style.display="none";
			document.getElementById("yaojieanshenpi2").style.display="none";
			document.getElementById("yaojieanshenpi3").style.display="block";
			document.getElementById("yaojieanshenpi4").style.display="block";
			document.getElementById("jieannBtn").style.display="none";
		}
	}
	

	
	
	function getShouLi(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131019091018&d_username=panglei&caseId=${xzfyId}";
		window.open(url);
	}
	
	function getRefuse(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131019091855&d_username=panglei&caseId=${xzfyId}";
		window.open(url);	
	}
	
	function getYijian(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131017113148&d_username=panglei&caseId=${xzfyId}";
		window.open(url);	
	}
	

	function tijiaoLian(){
		if(document.getElementById("lianSpr").value==""){
			alert("请选择审批人！");return ;
		}
		var shenpiren = document.getElementById("lianSpr").value;
		url="../other/tijiaoShenpi.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&shenpiren1="+encodeURI(shenpiren)+"&status=3";
		alert(url);
       var myAjax = new Ajax.Request(
                  url, // 请求的URL
                {
                    method: 'get', // 使用post方式发送HTTP请求
                    onComplete: tijiaoLianReturn // 指定请求成功完成时需要执行的方法
                }
            );
	}
	
	function tijiaoLianReturn(response) {
		document.getElementById("isShenpi").value = 1;
		document.getElementById("lianBtn").style.display = "none";
		alert("审批已经提交！");
	}
	
	function tijiaoJiean(){
		if(document.getElementById("jieanSpr").value==""){
			alert("请选择审批人！");return ;
		}
		var shenpiren = document.getElementById("jieanSpr").value;
		url="../other/tijiaoShenpi.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&shenpiren1="+encodeURI(shenpiren)+"&status=11";
		alert(url);
       var myAjax = new Ajax.Request(
                  url, // 请求的URL
                {
                    method: 'get', // 使用post方式发送HTTP请求
                    onComplete: tijiaoJieanReturn // 指定请求成功完成时需要执行的方法
                }
            );
	}
	
	function tijiaoJieanReturn(response) {
		document.getElementById("isShenpi").value = 1;
		document.getElementById("jieannBtn").style.display = "none";
		alert("审批已经提交！");
	}
	
    function fBuzheng(){
	    if(document.getElementById("isShenpi").value==1 || document.getElementById("checkStatus").value==1){
			alert("审批中！无法完成！");
			return ;
		}
	  
	  if(document.getElementById("isBuzheng").value=="0"){

	  	if(document.getElementById("shenpiren").value==""){
			alert("请填写补证批准人！");
			return ;
	  	}
	  	if(document.getElementById("shenpishijian").value==""){
			alert("请填写批准时间！");
			return ;
	  	}
	  	if(document.getElementById("shenpiyijian").value==""){
			alert("请填写批准意见！");
			return ;
	  	}
	  }
	  
	  
      var isShenpi;
		if (document.getElementById("isBuzheng").value=="1"){
			isShenpi = 1;
		} else {
			isShenpi = 0;
		}	
		var spr = document.getElementById("shenpiren").value;
		var spDate = document.getElementById("shenpishijian").value;
		var spYijian = document.getElementById("shenpiyijian").value;
		url="../other/wanchengShenpi.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&isShenpi="+isShenpi+"&spr="+encodeURI(spr)+"&spDate="+spDate+"&spYijian="+encodeURI(spYijian)+"&status=2";
		//alert(url);
			 var myAjax = new Ajax.Request(
                  url, // 请求的URL
                {
                    method: 'get', // 使用post方式发送HTTP请求
                    onComplete: wanchengBuzhengReturn // 指定请求成功完成时需要执行的方法
                }
            );
	}
	
	function wanchengBuzhengReturn(response) {
		document.getElementById("yishenpiren").innerHTML=response.responseText;
		document.getElementById("seshenpiren").innerHTML=response.responseText;
		alert("审批完成！");
	}
	
	function fLian(){
      if(document.getElementById("isShenpi").value==1 || document.getElementById("checkStatus").value==1){
			alert("审批中！无法完成！");
			return ;
		}
	  
	  if(document.getElementById("isLianshenpi").value=="0"){

	  	if(document.getElementById("lashenpiren").value==""){
			alert("请填写立案批准人！");
			return ;
	  	}
	  	if(document.getElementById("lashenpishijian").value==""){
			alert("请填写批准时间！");
			return ;
	  	}
	  	if(document.getElementById("lashenpiyijian").value==""){
			alert("请填写批准意见！");
			return ;
	  	}
	  }
	  
	  
      var isShenpi;
		if (document.getElementById("isLianshenpi").value=="1"){
			isShenpi = 1;
		} else {
			isShenpi = 0;
		}	
		var spr = document.getElementById("lashenpiren").value;
		var spDate = document.getElementById("lashenpishijian").value;
		var spYijian = document.getElementById("lashenpiyijian").value;
		url="../other/wanchengShenpi.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&isShenpi="+isShenpi+"&spr="+encodeURI(spr)+"&spDate="+spDate+"&spYijian="+encodeURI(spYijian)+"&status=3";
		alert(url);
			 var myAjax = new Ajax.Request(
                  url, // 请求的URL
                {
                    method: 'get', // 使用post方式发送HTTP请求
                    onComplete: wanchengLianReturn // 指定请求成功完成时需要执行的方法
                }
            );
	}
	
	function wanchengLianReturn(response) {
		document.getElementById("lianSprShow1").innerHTML=response.responseText;
		document.getElementById("lianSprShow2").innerHTML=response.responseText;
		alert("审批完成！");
	}
	
	function fjiean(){
      if(document.getElementById("isShenpi").value==1 || document.getElementById("checkStatus").value==1){
			alert("审批中！无法完成！");
			return ;
		}
	  
	  if(document.getElementById("isJieanshenpi").value=="0"){

	  	if(document.getElementById("jaShenpiren").value==""){
			alert("请填写立案批准人！");
			return ;
	  	}
	  	if(document.getElementById("jaShenpishijian").value==""){
			alert("请填写批准时间！");
			return ;
	  	}
	  	if(document.getElementById("jaShenpiyijian").value==""){
			alert("请填写批准意见！");
			return ;
	  	}
	  }
	  
	  
      var isShenpi;
		if (document.getElementById("isJieanshenpi").value=="1"){
			isShenpi = 1;
		} else {
			isShenpi = 0;
		}	
		var spr = document.getElementById("jaShenpiren").value;
		var spDate = document.getElementById("jaShenpishijian").value;
		var spYijian = document.getElementById("jaShenpiyijian").value;
		url="../other/wanchengShenpi.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&isShenpi="+isShenpi+"&spr="+encodeURI(spr)+"&spDate="+spDate+"&spYijian="+encodeURI(spYijian)+"&status=3";
		alert(url);
			 var myAjax = new Ajax.Request(
                  url, // 请求的URL
                {
                    method: 'get', // 使用post方式发送HTTP请求
                    onComplete: wanchengJieanReturn // 指定请求成功完成时需要执行的方法
                }
            );
	}
	
	function wanchengJieanReturn(response) {
		document.getElementById("jieanSprShow1").innerHTML=response.responseText;
		document.getElementById("jieanSprShow2").innerHTML=response.responseText;
		alert("审批完成！");
	}
	
	function shifouLianShenpi() {
		if (document.getElementById("isLianshenpi").value=="1"){
			document.getElementById("lianshenpi1").style.display="none";
			document.getElementById("lianBtn").style.display="block";
			document.getElementById("lianSpr").style.display="block";
			document.getElementById("lianxuanze1").style.display="block";
			document.getElementById("lianxuanze2").style.display="block";
			document.getElementById("lianxuanze3").style.display="none";
			document.getElementById("lianxuanze4").style.display="none";
		} else {
			document.getElementById("lianshenpi1").style.display="block";
			document.getElementById("lianBtn").style.display="none";
			document.getElementById("lianSpr").style.display="none";
			document.getElementById("lianxuanze1").style.display="none";
			document.getElementById("lianxuanze2").style.display="none";
			document.getElementById("lianxuanze3").style.display="block";
			document.getElementById("lianxuanze4").style.display="block";
		}
	}
	function getBzw(){
		document.getElementById("requesttype2").style.display="block";
		document.getElementById("requesttype3").style.display="block";
		document.getElementById("closeBzw").style.display="block";
		document.getElementById("getBzw").style.display="none";
}
function closeBzw(){
	document.getElementById("requesttype2").style.display="none";
	document.getElementById("requesttype3").style.display="none";
	document.getElementById("closeBzw").style.display="none";
	document.getElementById("getBzw").style.display="block";
	var menuString;
	var use_type=document.getElementById("use_type").value;
	menuString="行政不作为事项："+use_type+"；<br>";
	var zhize=document.getElementById("zhize").value;
	menuString=menuString+"要求履责："+zhize+"；<br>";
	var usedate=document.getElementById("usedate").value;
	menuString=menuString+"履行日期："+usedate+"；<br>";
	var mingque=document.getElementById("mingque").value;
	menuString=menuString+"证明材料："+mingque;
	document.getElementById("xw_an").innerHTML=menuString;
	document.getElementById("require_fy").value=menuString;
}
function setKnowDate1(){
	var year=document.getElementById("knowy1").value;
	var month=document.getElementById("knowm1").value;
	var day=document.getElementById("knowd1").value;
	var knowDate="";
	if(year!=0){
		knowDate=year+"年";
		if(month!=0){
			knowDate=knowDate+month+"月";
			if(day!=0){
				knowDate=knowDate+day+"日";
			}
		}
	}
	document.getElementById("usedate").value=knowDate;
}

</script>
</html>
