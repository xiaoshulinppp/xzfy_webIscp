<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="web/css/12B/style.css" type="text/css">
<title>
表单布局工具
</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<Script Language="Javascript" src="js/colorEditor.js"></Script>
<body>
<form  name="'designForm'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
  <tr>
    <td height="20"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="30" align="center"><img src="../${Session["_USER_STYLE_"].imagePath}/icon_yourplace.gif" width="14" height="12"></td>
        <td>您的位置:表单单元编辑器</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%" height="90%">
	   <tr height=10%>
		<td >
	        <select language="javascript" onchange="document.execCommand('fontsize',true,this[this.selectedIndex].value);">
				<option >字号
				<option value="1">1
				<option value="2">2
				<option value="3">3
				<option value="4" selected>4
				<option value="5">5
				<option value="6">6
				<option value="7">7</option>
			</select>
		</td>
		<td id=sys_toolbar_top0></td>
		<td id=sys_toolbar_top1></td>
		<td id=sys_toolbar_top2></td>
		<td id=sys_toolbar_top3></td>
		<td id=sys_toolbar_top4></td>
		<td id=sys_toolbar_top5></td>
		<td id=sys_toolbar_top6></td>
		<td id=sys_toolbar_top7></td>
		<td id=sys_toolbar_top8></td>
		<td id=sys_toolbar_top9></td>
		<td id=sys_toolbar_top10></td>
		<td id=sys_toolbar_top11></td>
		<td id=sys_toolbar_top12></td>
		<td width="100%"></td>
		<td>
	<!--��ɫ��-->
	<div id=colorTableDiv style="LEFT:200 px; POSITION:absolute; TOP:40px;display:none;width:200; Height:100;background-color:#ddeeff">
		<table><tr>
		<td id=colorTableInfo></td>
		<td id=colorTableView>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr></table>
		<table id=colorTable onmousedown="colorEditor.setColor();" onmousemove="colorEditor.setSelected()" cellspacing="1px" cellpadding="0px" bgColor="#000000" style="cursor:hand;"></table>
	</div>
	</td>
	</tr>
	<tr height=80%><td colspan=14>
		<div id="cellDesignArea" style="display:block;height:100%" contenteditable></div>
		<div id=codeArea style="display:none;height=100%" height="100%">
			<Textarea name="htmlsource" id="htmlsource" style="width:100%; Height:100%"></Textarea>
		</div>
	</td></tr>
	</table>


<input id=button_ok type="button" class="button" onclick="webDesignEnd();" value="确定"/>
<input id=button_cancel type="button" class="button" onclick="window.close();" value="取消"/>
<input id=button_design type="button" class="button" onclick="viewDesign();" disabled value="编辑"/>
<input id=button_code type="button" class="button" onclick="viewCode();" value="代码"/>
</body>
</html>
<script>
function viewDesign(){
	cellDesignArea.innerHTML = htmlsource.value;
	cellDesignArea.style.display="block";
	codeArea.style.display="none";
	button_ok.disabled=false;
	button_design.disabled=true;
	button_code.disabled=false;
}
function viewCode(){
	htmlsource.value = cellDesignArea.innerHTML;
	cellDesignArea.style.display="none";
	codeArea.style.display="block";
	button_ok.disabled=true;
	button_design.disabled=false;
	button_code.disabled=true;
}
function webDesignEnd(){
  var str=new Array(cellDesignArea.innerHTML);
  window.returnValue = str;
  window.close();
}
cellDesignArea.innerHTML = window.dialogArguments[0];
cellDesignArea.align = window.dialogArguments[1];
cellDesignArea.valign = window.dialogArguments[2];

/////////////////////////////����Ϊҳ��༭���/////////////////////////////////
var sys_toolbar_item_img;
var sys_toolbar_item_cmd;
var sys_toolbar_item_label;
var sys_toolbar_item_count;
function sys_toolbar_item_insert(cmd_,img_,label_){
	sys_toolbar_item_insert_("my_execCommand('"+cmd_+"')",img_,label_);
}
function sys_toolbar_item_insert_(cmd_,img_,label_){
	sys_toolbar_item_img[sys_toolbar_item_count] = cmd_;
	sys_toolbar_item_cmd[sys_toolbar_item_count] = img_;
	sys_toolbar_item_label[sys_toolbar_item_count] = label_;
	sys_toolbar_item_count++;
}
//��ʼ���Ϸ�����8
function sys_toolbar_up_init(){
	cmd_ = new Array(0);
	img_ = new Array(0);
	label_ = new Array(0);
	sys_toolbar_item_img = cmd_;
	sys_toolbar_item_cmd = img_;
	sys_toolbar_item_label = label_;
	sys_toolbar_item_count = 0;
	sys_toolbar_item_insert("Bold","set_blod.gif","粗体");
	sys_toolbar_item_insert("Italic","set_italic.gif","斜体");
	sys_toolbar_item_insert("Underline","set_underline.gif","下划线");
	sys_toolbar_item_insert("CreateLink","insert_link.gif","插入链接");
	sys_toolbar_item_insert("Unlink","remove_link.gif","删除链接");
	sys_toolbar_item_insert("JustifyLeft","set_justifyleft.gif","左对齐");
	sys_toolbar_item_insert("JustifyCenter","set_justifycenter.gif","居中");
	sys_toolbar_item_insert("JustifyRight","set_justifyright.gif","右对齐");
	sys_toolbar_item_insert("SelectForeColor","set_foreground.gif","调色板");
	sys_toolbar_item_insert("SelectBackColor","set_background.gif","调色板");
	sys_toolbar_item_insert("InsertImage","insert_image.gif","插入图片");
	for(i =0;i<cmd_.length;i++){
		str = "<img src=\"icon/toolbar_top/"+img_[i] +"\" onclick=\""+cmd_[i]+"\"";
		str += " unselectable = \"on\"";
		str += " style=\"filter:alpha(opacity=50)\"";
		str += " onMouseOver=\"componentTooBar_component_mouseOver(this)\"";
		str += " onMouseOut=\"componentTooBar_component_mouseOut(this)\"";
		str += " alt=\""+label_[i]+"\"";
		str +="/>";
		e = document.createElement(str);
		//e.setAttribute("width",20);
		//e.setAttribute("height",20);
		e.setAttribute("");
		e.setAttribute("onMouseOut","\"componentTooBar_component_mouseOut(this)\"");
		e.setAttribute("style","\"filter:alpha(opacity=50)\"");
		columnElement = document.getElementById("sys_toolbar_top"+i);
		if(columnElement == null)break;
		columnElement.setAttribute("align","center");
		columnElement.appendChild(e);
	}

}

function initFormDesigner(){
	sys_toolbar_up_init();
}
initFormDesigner();
colorEditor = new ColorEditor();
colorEditor.initWebDesign_colorTable(colorTable,colorTableDiv,colorTableInfo,colorTableView
);
function componentTooBar_component_mouseOver(e){
	if(cellDesignArea.style.display=="none")return;
	e.filters.alpha.opacity=100;
}
function componentTooBar_component_mouseOut(e){
	if(cellDesignArea.style.display=="none")return;
	e.filters.alpha.opacity=50;
}
//ִ�б༭����
function my_execCommand(type){
	if(cellDesignArea.style.display=="none")return;
	cellDesignArea.focus();
	if(type == "SelectForeColor"){
		colorEditor.show(true);
	}
	else if(type == "SelectBackColor"){
		colorEditor.show(false);
	}
	else if(type == "InsertImage"){
		src = prompt("请插入图片链接","");
		if(src!=null){
			document.selection.createRange().pasteHTML("<img src=\""+src+"\">");
		}
	}
	else{
		document.execCommand(type,true);
	}
	cellDesignArea.focus();
}

</script>
