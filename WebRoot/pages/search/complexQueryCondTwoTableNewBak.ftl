<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
<title>${action.getText("platform.name")}</title>
</head>
</title>
<body>
<#assign showState = "false">
<#if opName == "view">
  <#assign showState="true">
</#if>
<form id="search_form" name="queryForm" action="${opName}ComplexAdvancedQuery.action" >
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0"  class="tabtitle">
   <tr class="trWhite">
      <td class ="tdFormText">查询名称:</td>
      <td class="tdFormInput"><@ww.textfield  name="'query.name'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  required = "'true'" theme="simple"/><font color=red>**</font></td>
   </tr>
   <tr class="trWhite">
      <td class ="tdFormText">查询描述:</td>
      <td class="tdFormInput"><@ww.textarea name="'query.desc'"  cols="40" rows="5" cssClass="'textarea'" tabindex = "3" disabled ="'${showState}'"  /></td>
   </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0"  class="tabtitle">
  <tr>
    <td height="24" align="center">设置查询条件</td>
  </tr>
</table>

<table width = "100%">
<tr><td align="left" colspan="12">
${action.getText("recordperm.tablename")}<@ww.select name="'queryTableName'" id ="table_element" list="getAllTable()" value="getCustomQueryTableName()" theme ="simple" onchange="'javascript:flush()'"/><font color=red>**</font>&nbsp;
${action.getText("recordperm.fieldname")}<@ww.select name="'field'"  id="field_element" list="getAllObjectField()"  onclick="'javascript:fieldChanged(this)'" theme ="simple"/><font color=red>**</font>&nbsp;
<input class="button" type="button" value="添加对象" onclick="addField()" ></input>
<select class="normalinput" id="equation_element" onchange="addEquation()">
<option value="" selected>选择
<option value="=" >等于
<option value="like">包含
<option value=">">大于
<option value="<">小于
<option value=">=">大于等于
<option value="<=">小于等于
<option value="+">加
<option value="-">减
<option value="*">乘
<option value="/">除
</select>
<input class="inputTextNormal" id="inputValue" style="display:block"><input class="button" type="button" value="添加值" onclick="addInputValue()" ></input>
<select id="link_element">
<option value="and" selected>并且
<option value="or">或
</select>
</td>
</tr>
<tr>
<td align="left" colspan="12">
<select id="value_select" style="display:none"></select>
<input class="inputTextLong" id="value_input" style="display:block" name="valueInput" value="${valueInput}" readonly>
<input class="button" type="button" value="清除" onclick="clearInputValue()" ></input>
<input type="hidden"  id="value_input_hide" name="valueInputHide" value="${valueInputHide}">
</td>
</tr>
<tr>
<td align="right" colspan="12">
<input class="button" type="button" value="添加" onclick="addExp()" ></input>
<input type="button" class="button" value="删除" onclick="removeExp()" >
<input type="button" class="button" value="加括号" onclick="addBracket()" >
<input type="button" class="button" value="去括号" onclick="removeBracket()" >
</td>
</tr>
<tr>
<td colspan="12" width="100%">
<select multiple id="exp_show" style="width:100%" name="expShow">
</select>
</td>
</tr>
<tr><td align="center" colspan="12" width = "100%">
<input type="hidden" id="exp_value" name="searchhql" >
<input type="hidden" id="exp_show_value" name="searchHqlShow" >
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
<select multiple id="allFields" name="allFields" style="width:100%">
<#list allShowField?keys as fieldKey>
<option value="${fieldKey}">${allShowField[fieldKey]}
</#list>
</select>
</td>
<td><input type="button" class="button" value=">>" onclick="showSelectedFields()" ></td>
<td rowspan="2">
<select multiple id="showFieldsEditor" name="showFieldsEditor" style="width:100%" >
<#list lastSelectedFieldMap?keys as fieldKey>
<option value="${fieldKey}">${lastSelectedFieldMap[fieldKey]}
</#list>
</select>
<div style="display:none">
<select multiple id="showFields" name="showFields" style="width:100%">
<#list lastSelectedFieldMap?keys as fieldKey>
<option value="${fieldKey}">${lastSelectedFieldMap[fieldKey]}
</#list>
</select>
</td>
<td rowspan="2">
<select name="sortField">
<#if allObjectFieldNoClass?has_content>
<#list allObjectFieldNoClass?keys as fieldKey>
<option value="${fieldKey}">${allObjectFieldNoClass[fieldKey]}
</#list>
</#if>
</select>
</td>
</tr>
<tr><td><input type="button" class="button" value="<<" onclick="hideSelectedFields()" ></td></tr>
</table>
<input type="button" class="button" value="查询" onclick="submitSearch()">
</div>
<@ww.hidden name ="'funcCode'"/>
<@ww.hidden name ="'opName'"/>
<@ww.hidden name ="'entityId'"/>
</form>
</div>
</body>
</html>
<script language="javascript" type="text/javascript" src="../pages/search/advancedSearchMuiltTable.js" charset="utf-8"></script>
<script type="text/javascript">

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

<#if searchhql?has_content>
document.queryForm.searchhql.value="${searchhql}";
</#if>
<#if searchHqlShow?has_content>
document.queryForm.searchHqlShow.value="${searchHqlShow}";
</#if>
var count =0;
<#if searchHqlShowList?has_content>
<#list searchHqlShowList as showHql>
document.queryForm.expShow.options[count]=new Option();
document.queryForm.expShow.options[count].innerHTML="${showHql}";
count=count+1;
</#list>
</#if>
</script>
<script>
var allFields_ = document.getElementById("allFields");
var showFields_ = document.getElementById("showFieldsEditor");
var showFieldsValue_ = document.getElementById("showFields");
function showSelectedFields(){
    if(showFieldsValue_.options.length>0) {
       for(var k =0 ;k<showFieldsValue_.options.length;k++) {
		 showFieldsValue_.options[k].selected = true;
    }   
    }
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

function flush() {
     var tableElement = document.getElementById("table_element");
  	 for(var i=0;tableElement.options != null && i<tableElement.options.length;i++)
  	 {
			if(tableElement.options[i].selected)
			{
				var tableName = tableElement.options[i].value;
			    if(tableName=="0")
				 return;
			}
	 }
     this.submitCond();
     window.queryForm.action="../system/complexQueryTerm.action";
     window.queryForm.submit();
  }
</script>