<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
<title>${action.getText("platform.name")}</title>
</head>
</title>
<body>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0"  class="tabtitle">
  <tr>
    <td height="24" align="center">设置查询条件</td>
  </tr>
</table>
<form id="search_form" action="${beanName}AdvancedQuery.action">
<table width = "100%">
<tr><td width="5%">
<select id="link_element">
<option value="and" selected>并且
<option value="or">或
</select>
</td>
<td width="5%">
<select name="field" onchange="fieldChanged(this)" id="field_element">
<#list fieldList as field>
<option value="${field.name}" selected>${field.showName}
</#list>
</select>
</td>
<td width="5%">
<select class="normalinput" id="equation_element">
<option value="=" selected>等于
<option value="like">包含
<option value=">">大于
<option value="<">小于
<option value=">=">大于等于
<option value="<=">小于等于
</select>
</td>
<td align="left" width="50%">
<select id="value_select" style="display:none"></select>
<input class="inputTextLong" id="value_input" style="display:block">
</td>
<td align="right" width = "5%">
<input class="button" type="button" value="添加" onclick="addExp()"></input></td>
<td align="right" width = "5%">
<input type="button" class="button" value="删除" onclick="removeExp()"></td>
<td align="right" width = "5%">
<input type="button" class="button" value="加括号" onclick="addBracket()"></td>
<td align="right" width = "5%">
<input type="button" class="button" value="去括号" onclick="removeBracket()"></td>
</tr>
<tr>
<td colspan="10" width="100%">
<select multiple id = "exp_show" style="width:100%">
</select>
</td>
</tr>
<tr><td align="center" colspan="10" width = "100%">
<input type="hidden" id="exp_value" name="searchhql" value="fff">
</td></tr>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" id=control class="tabtitle">
  <tr>
    <td height="24" align="center">设置展现方式</td>
  </tr>
</table>
<div align="center">
<table width="60%">
<tr>
<th class="thListNormal" width="20%">全部字段</th>
<th class="thListNormal" width="10%"></th>
<th class="thListNormal" width="20%">显示字段</th>
<th class="thListNormal" width="20%"><input type="checkbox" name="sortType" <#if sortType.longValue() == 1>checked</#if> value="1">降序排列</th>
</tr>
<tr><td rowspan="2">
<select multiple id="allFields" style="width:100%">
<#list fieldList as field>
<option value="${field.name}">${field.showName}
</#list>
</select>
</td>
<td><input type="button" class="button" value=">>" onclick="showSelectedFields()"></td>
<td rowspan="2">
<select multiple id="showFieldsEditor" name="showFieldsEditor" style="width:100%">
<#list lastSelectedFieldList as field>
<option value="${field.name}">${field.showName}
</#list>
</select>
<div style="display:none">
<select multiple id="showFields" name="showFields" style="width:100%">
<#list lastSelectedFieldList as field>
<option value="${field.name}" selected>${field.showName}
</#list>
</select>
</td>
<td rowspan="2"><select name="sortField"><#list fieldList as field>
<option <#if field.name == sortField.name>selected</#if> value="${field.name}">${field.showName}
</#list></select></td>
</tr>
<tr><td><input type="button" class="button" value="<<" onclick="hideSelectedFields()"></td></tr>
</table>
<input type="button" class="button" value="查询" onclick="submitSearch()">
</div>
<@ww.hidden name ="'funcCode'"/>
</form>
</div>
</body>
</html>
<script language="javascript" type="text/javascript" src="../pages/search/advancedSearch.js"></script>
<script>
field_type = new Array(0);
<#list fieldList as field>
<#if field.fromDict>
field_type[field_type.length] = "select";
</#if>
<#if !field.fromDict>
field_type[field_type.length] = "input";
</#if>
</#list>

var field_dict = ${dictExpress};

searchEditor = new SearchEditor();
searchEditor.init(field_dict,field_type);

</script>
<script>
var allFields_ = document.getElementById("allFields");
var showFields_ = document.getElementById("showFieldsEditor");
var showFieldsValue_ = document.getElementById("showFields");
function showSelectedFields(){
	for(var i = 0;allFields_.options != null && i<allFields_.options.length;i++){
		if(allFields_.options[i].selected){
			var existed = false;
			for(var j = 0;j<showFields_.length;j++){
				existed = existed || (allFields_.options[i].value == showFields_.options[j].value);
			}
			if(!existed){
				showFields_.options[showFields_.options.length] = new Option(allFields_.options[i].innerHTML,allFields_.options[i].value);
				showFieldsValue_.options[showFieldsValue_.options.length] = new Option(allFields_.options[i].innerHTML,allFields_.options[i].value);
				showFieldsValue_.options[showFieldsValue_.options.length-1].selected = true;
			}
		}
	}
}
function hideSelectedFields(){
	for(var i = 0;showFields_.options != null && i<showFields_.options.length;i++){
		if(showFields_.options[i].selected){
			showFields_.options.removeChild(showFields_.options[i]);
			showFieldsValue_.options.removeChild(showFieldsValue_.options[i]);
			i--;
		}
	}
}
fieldChanged(document.getElementById("field_element"));
</script>