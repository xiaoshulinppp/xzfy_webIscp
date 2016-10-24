<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>信息采集报送平台</title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../plugs/kindeditor/kindeditor.js"></script>
	</head>
	<body>
		<table border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" style="width:98%;">
			<tr>
				<td height="20">信息采集报送平台 > 新闻管理 > 新闻管理</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
			<tr>
				<td>修改新闻</td>
			</tr>
		</table>
		<form id="createForm" action="../appNewsTemplate/updateSimpleNews.action" method="post" enctype="multipart/form-data">
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
			<tr>
				<th class="thListNormal" width="20%">&nbsp;</th>
				<th class="thListNormal" width="30%">&nbsp;</th>
				<th class="thListNormal" width="20%">&nbsp;</th>
				<th class="thListNormal" width="30%">&nbsp;</th>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">新闻标题</td>
				<td class="tdFormInput">
					<input type="text" name="newsTemplate.title" value="${newsTemplate.title}" class="inputTextNormal" />
				</td>
				<td class="tdFormText">新闻编辑</td>
				<td class="tdFormInput">
					<input type="text" name="newsTemplate.editor" value="${newsTemplate.editor}" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">附件上传</td>
				<td class="tdFormInput">
					<input type="file" name="upFile" value="" class="inputTextFile" />
				</td>
				<td class="tdFormText">新闻来源</td>
				<td class="tdFormInput">
					<input type="text" name="newsTemplate.source" value="${newsTemplate.source}" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">新闻内容</td>
				<td class="tdFormInput" colspan="3">
					<script type="text/javascript">
    					KE.show({
    						id:'newsContent',
    						//width:'40%',
    						imageUploadJson : '../../jsp/upload_json.jsp',
    						resizeMode:'0',
    						height:'200px',
    						afterCreate:function(id){KE.html('newsContent', '${newsTemplate.content}');},
    						items:[
    							'fullscreen','|','undo','redo','cut','copy','paste','plainpaste','wordpaste',
    							'|','justifyleft','justifycenter','justifyright','justifyfull','insertorderedlist',
    							'insertunorderedlist','subscript','superscript','|',
    							'fontname','fontsize','|','textcolor','bold','italic','underline','|',
    							'image','advtable','hr'
    						]
    					});
    				</script>
					<textarea id="newsContent" cols="40" rows="5" wrap="virtual" class="textarea"></textarea>
				</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<input type="button" class="button" value="提 交" onclick="createSimpleNews();" />
					<input type="button" class="button" value="返 回" onclick="gotoBack();" />
				</td>
			</tr>
			<input type="hidden" id="hiddenContent" name="newsTemplate.content" value="" />
			<input type="hidden" name="classifyId" value="${classifyId}" />
			<input type="hidden" name="entityId" value="${newsTemplate.id}" />
			<input type="hidden" name="funcCode" value="${funcCode}" />
		</form>
		</table>
	</body>
</html>
<script type="text/javascript">
	function createSimpleNews(){
		if(confirm("确认提交？")){
			var content = KE.html("newsContent");
			window.document.getElementById("hiddenContent").value = content;
			window.document.getElementById("createForm").submit();
		}
	}
	
	function gotoBack(){
		window.history.back();
	}
</script>