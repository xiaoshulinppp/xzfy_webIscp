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

<!--主体内容、列表显示区域-->
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
  <tr class="trColor">
    <td class="tdFormleft">查询名称：</td>
    <td class="tdFormRight"><@ww.textfield  name="'query.name'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  required = "'true'" theme="simple"/><font color=red>**</font></td>
    </tr>
  <tr class="trWhite">
    <td class="tdFormleft">查询描述：</td>
    <td class="tdFormRight"><@ww.textarea name="'query.desc'"  cols="40" rows="5" cssClass="'textarea'" tabindex = "3" disabled ="'${showState}'"/></td>
    </tr>
</table>
<!--底部按钮表格开始-->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabout">
  <tr class="trWhite">
    <td class="tdFormCenter"><fieldset class="fieldsetStyle">
    <legend>设置查询条件</legend>
    <table width="98%" border="0" align="center" cellpadding="3" cellspacing="0">
      <tr class="trColor">
        <td class="tdFormInput"><select id="link_element" class="selectStyleNormal">
          <option value="and" selected >与</option>
          <option value="or" >或</option>
        </select>
       <@ww.select name="'queryTableName'" id ="table_element" cssClass="'selectStyleNormal'" list="getAllTable()" value="getCustomQueryTableName()" theme ="simple" onchange="'javascript:flush()'"/>
       <@ww.select  id="field_element" cssClass="selectStyleNormal" list="getAllObjectField()"   theme ="simple"/>
       <input class="button" type="button" value="添加对象" onclick="addField()" ></input>
       <select class="selectStyleNormal" id="equation_element" onchange="addEquation()">
         <option value="" selected>运算符
         <option value="=" >等于</option>
         <option value="like">包含</option>
         <option value=">">大于</option>
         <option value="<">小于</option>
         <option value=">=">大于等于</option>
         <option value="<=">小于等于</option>
         <option value="+">加</option>
         <option value="-">减</option>
         <option value="*">乘</option>
         <option value="/">除</option>
       </select>
       <select class="selectStyleNormal"  id="leftBracket_element"  onchange="addLeftBracket()">
          <option value="" selected>左括号</option>
          <option value="(">(</option>
       </select>
       <select class="selectStyleNormal" id="rightBracket_element"  onchange="addRightBracket()">
          <option value="" selected>右括号</option>
          <option value=")">)</option>
       </select>
       
       <input type="text" id="inputValue" class="inputTextNormal" size="6" />
       <input  type="button" class="button" value="插入值" onclick="addInputValue()" />
       </td>
      </tr>
      <tr class="trWhite">
        <td class="tdFormInput">
           <select id="value_select" style="display:none"></select>
           <input  id="value_input" type="text" class="inputTextNormal" size="90" value="${valueInput}" readonly/>
          <input type="hidden"  id="value_input_hide" name="valueInputHide" value="${valueInputHide}">
          <input class="button" type="button" value="清除" onclick="clearInputValue()" ></input>
          <input name="Button3222" type="button" class="button" value="添加" onclick="addExp()"/>
          <input name="Button3223" type="button" class="button" value="删 除" onclick="removeExp()" />
        </td>
      </tr>
      <tr class="trColor">
        <td class="tdFormInput">
          <select   id="exp_show" size="7" class="selectStyleLong"   name="expShow">
          </select>
          <input type="hidden" id="exp_value" name="searchhql" >
          <input type="hidden" id="exp_show_value" name="searchHqlShow" >
        </td>
      </tr>
      <tr class="trWhite">
        <td class="tdFormInput">
        <input name="deptInput" id="deptInput" type="text" class="inputTextNormal" size="90" value="${deptInput}"/>
        <input type="hidden" id="deptHide" name="deptHide" value="${deptHide}">
         <input  type="button" class="button" value="选择单位" onclick="addDept()"/>
         </td>
      </tr>
    </table>
    </fieldset>
          <fieldset class="fieldsetStyle">
      <legend>设置显示方式</legend>
      <table width="98%" border="0" align="center" cellpadding="3" cellspacing="0">
        <tr>
          <th width="45%" class="thFormNormal">全部字段</th>
          <th class="thFormNormal">选择</th>
          <th width="45%" class="thFormNormal">显示字段</th>
        </tr>
        <tr class="trColor">
          <td class="tdFormCenter">
              <select multiple id="allFields" name="allFields" size="7" class="selectStyleLong">
              <#list allShowField?keys as fieldKey>
                 <option value="${fieldKey}">${allShowField[fieldKey]}
              </#list>
              </select>
          </td>
          <td class="tdFormCenter"><br />
              <input name="right" type="button" title="右移" class="arrowButton" value="-&gt;"  onclick="showSelectedFields()"/>
              <br />
              <input name="left" type="button" title="左移" class="arrowButton" value="&lt;-" onclick="hideSelectedFields()"/>
              <br />
          </td>
          
          
          <td class="tdFormCenter">
             <select multiple id="showFieldsEditor" name="showFieldsEditor" size="7" class="selectStyleLong">
             </select>
             <div style="display:none">
             <select multiple id="showFields" name="showFields" style="width:100%">

            </select>
         </td>
         
        </tr>
        <tr class="trColor">
          <td class="tdFormInput"><select name="sortType" class="selectStyleNormal">
            <option>设置展现方式</option>
            <option value="0" <#if sortType==0> selected </#if>>升序排列</option>
            <option value="1" <#if sortType==1> selected </#if>>降序排列</option>
          </select></td>
          <td class="tdFormCenter">&nbsp;</td>
          <td class="tdFormInput">排序字段：
            <select name="sortField" class="selectStyleNormal">
             <#if allObjectFieldNoClass?has_content>
                <#list allObjectFieldNoClass?keys as fieldKey>
                  <option value="${fieldKey}">${allObjectFieldNoClass[fieldKey]}
                </#list>
            </#if>
            </select></td>
        </tr>
        
      </table>
      </fieldset><br></td>
    </tr>
  
  
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td><input  type="button" class="button" value="查 询" onclick="submitSearch()"/>
      </td>
  </tr>
</table>

<@ww.hidden name ="'funcCode'"/>
<@ww.hidden name ="'opName'"/>
<@ww.hidden name ="'entityId'"/>
</form>
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


var showFields_ = document.getElementById("showFieldsEditor");
var showFieldsValue_ = document.getElementById("showFields");
<#if lastSelectedFieldMap?has_content>
  <#list lastSelectedFieldMap?keys as fieldKey>
           		showFields_.options[showFields_.options.length] = new Option("${lastSelectedFieldMap[fieldKey]}","${fieldKey}");
				showFieldsValue_.options[showFieldsValue_.options.length] = new Option("${lastSelectedFieldMap[fieldKey]}","${fieldKey}");
				showFieldsValue_.options[showFieldsValue_.options.length-1].selected = true;
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
  function addDept(){
   window.open("../system/getDeptByComplexQuery.action?funcCode=${funcCode}&fieldValue=deptHide&fieldName=deptInput","SelectDeptWindow","status=yes,scrollbars=yes,resizable=yes,width=550,height=350");
 
  }
</script>
