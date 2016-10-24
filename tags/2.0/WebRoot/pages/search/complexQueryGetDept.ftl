<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
<title>${action.getText("platform.name")}</title>

<script>
function createXMLHttpRequest() {
 if (window.ActiveXObject) {
    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	} 
    else if (window.XMLHttpRequest) {
    xmlHttp = new XMLHttpRequest();                
	}
}
function flush(valueDiv)
{
	createXMLHttpRequest();
	var url="../system/complexSerachSelectChildDept.action?funcCode=${funcCode}";
	var submitText="tempId="+encodeURIComponent(valueDiv);
	xmlHttp.open("POST", url, true);
	xmlHttp.setRequestHeader("contentType","text/html;charset=utf-8");
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlHttp.send(submitText);
	xmlHttp.onreadystatechange = Callback;
}
function Callback(){

    if (xmlHttp.readyState == 4) {
          if (xmlHttp.status == 200|| xmlHttp.status == 0) {
		  document.getElementById("divR").innerHTML=xmlHttp.responseText;
		}
	}
 	
 }
</script>
</head>
</title>

<body>
<form id="search_form" name="queryForm" method="post" >
<fieldset class="fieldsetStyle">
      <legend>
     省名<select name="queryTableName" onchange="flush(this.value)">
     	<option value=" " selected>请选择省名</option>
     	
     	   <#list userList as user>
				<option value="${user.value}">${user.name}</option>
			</#list>
			<option value="1" >所有单位</option>
     	</select>
      </legend>
      <table width="98%" border="0" align="center" cellpadding="3" cellspacing="0">
        <tr>
          <th width="45%" class="thFormNormal">全部单位</th>
          <th class="thFormNormal">选择</th>
          <th width="45%" class="thFormNormal">统计单位</th>
        </tr>
        <tr class="trcolor">
          <td class="tdFormCenter">
         
			 <div id="divR">
			<select multiple id="allDepts" name="allDepts" class="selectStyleLong" style="width:100%">
			</select>
			 </div>
			
          </td>
          
          <td class="tdFormCenter"><br />
              <input name="button1" type="button" title="右移" class="arrowButton" value="-&gt;" onclick="showSelectedDepts()"/>
              <br />
              <input name="button2" type="button" title="左移" class="arrowButton" value="&lt;-" onclick="hideSelectedDepts()"/>
              <br />
              <input name="button2" type="button" title="全选" class="arrowButton" value="全" onclick="SelectedAllDepts()"/>
              </td>
          <td class="tdFormCenter">
        <select multiple id="showDeptsEditor" name="showDeptsEditor" class="selectStyleLong" style="width:100%" >	
		</select>
		<div style="display:none">
		<select multiple id="showDepts" name="showDepts" class="selectStyleLong" style="width:100%">
		</select>
          
		</div>
        </tr>
        <tr class="trcolor">
          <td class="tdFormCenter">&nbsp;</td>
          <td class="tdFormCenter">&nbsp;</td>
          <td class="tdFormInput">&nbsp;</td>
        </tr>
      </table>
</fieldset>  
    
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td>
    <input name="Button322" type="button" class="button" value="确定" onClick = "setDept()"/>
    </td>
  </tr>
</table>
<input type="hidden" name="funcCode" value="${funcCode}"/>
      </form>
</body>
<script>


function showSelectedDepts(){

var allDepts_ = document.getElementById("allDepts");

var showDepts_ = document.getElementById("showDeptsEditor");

var showDeptsValue_ = document.getElementById("showDepts");

	for(var i = 0;allDepts_.options != null && i<allDepts_.options.length;i++){
	
		if(allDepts_.options[i].selected){
		
			var existed = false;
			for(var j = 0;j<showDepts_.length;j++){
			
				existed = existed || (allDepts_.options[i].value == showDepts_.options[j].value);
			}
			
			if(!existed){
				showDepts_.options[showDepts_.options.length] = new Option(allDepts_.options[i].innerHTML,allDepts_.options[i].value);
				showDeptsValue_.options[showDeptsValue_.options.length] = new Option(allDepts_.options[i].innerHTML,allDepts_.options[i].value);
				showDeptsValue_.options[showDeptsValue_.options.length-1].selected = true;
			}
		}
	}
	
}

function hideSelectedDepts(){
var allDepts_ = document.getElementById("allDepts");
var showDepts_ = document.getElementById("showDeptsEditor");
var showDeptsValue_ = document.getElementById("showDepts");
	for(var i = 0;showDepts_.options != null && i<showDepts_.options.length;i++){
		if(showDepts_.options[i].selected){
			showDepts_.options.removeChild(showDepts_.options[i]);
			showDeptsValue_.options.removeChild(showDeptsValue_.options[i]);
			i--;
		}
	}
}
	function SelectedAllDepts()
	{
	var allDepts_ = document.getElementById("allDepts");
	var showDepts_ = document.getElementById("showDeptsEditor");
	var showDeptsValue_ = document.getElementById("showDepts");
		for(var i = 0;allDepts_.options != null && i<allDepts_.options.length;i++){
	
		
		
			var existed = false;
			for(var j = 0;j<showDepts_.length;j++){
			
				existed = existed || (allDepts_.options[i].value == showDepts_.options[j].value);
			}
			
			if(!existed){
				showDepts_.options[showDepts_.options.length] = new Option(allDepts_.options[i].innerHTML,allDepts_.options[i].value);
				showDeptsValue_.options[showDeptsValue_.options.length] = new Option(allDepts_.options[i].innerHTML,allDepts_.options[i].value);
				showDeptsValue_.options[showDeptsValue_.options.length-1].selected = true;
			}
		}
	
	}
</script>
<script>
fieldValue = opener.document.getElementById("${fieldValue}");
fieldName = opener.document.getElementById("${fieldName}");
function setDept()
	{
	var showDepts_ = document.getElementById("showDeptsEditor");
    var showDeptsValue_ = document.getElementById("showDepts");
	name = "";
	value = "";
    for(var i = 0;showDepts_.options != null && i<showDepts_.options.length;i++){
        var tempValue = showDepts_.options[i].value;
        var index = tempValue.indexOf(',');
        value+=tempValue.substring(0,index)+";";
		name+=tempValue.substring(index+1)+";";
	
	}
	fieldName.value = name;
	fieldValue.value = value;
    window.close();
}
	
</script>
</html>
