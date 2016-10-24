<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>信息采集报送平台</title>
		<link href="../css/${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
		<link type="text/css" rel="stylesheet" href="../plugs/zTree3.1/zTreeStyle/zTreeStyle.css">
		<script type="text/javascript" src="../plugs/zTree3.1/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="../plugs/zTree3.1/jquery.ztree.core-3.1.js"></script>
	</head>
	<script type="text/javascript">
		var setting = {
			data: {
				simpleData: {
					enable: true,
					idKey: "id",
					pIdKey: "pId"
				}
			},
			callback: {
				onClick: setOrgId,
				onExpand: getChildOrg
			},
			key: {
				children: "nodes"
			}
		};
		
		var zNodes = ${treeData};
		
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			var node = treeObj.getNodeByParam("id",${orgId},null);
			if(node.level == 0){
				treeObj.expandNode(node, true, false, false);
				treeObj.selectNode(node);
			}else{
				var parentNode = node.getParentNode();
				treeObj.expandNode(parentNode, true, false, false);
				treeObj.selectNode(node);
				<#if expandOrg == '1'>
				treeObj.expandNode(node, true, false, false);
				</#if>
			}
		});
		
		function setOrgId(event, treeId, treeNode){
			window.parent.setOrgId(treeNode.id);
		}
		
		function getChildOrg(event, treeId, treeNode){
			window.document.getElementById("orgId").value = treeNode.id;
			var treeObj = $.fn.zTree.getZTreeObj(treeId);
			var childs = treeObj.getNodesByParam("pId",treeNode.id,null);
			if(childs.length == 0){
				window.document.getElementById("getChildOrgTree").submit();
			}
		}
	</script>
	<body>
		<div>
			<ul id="treeDemo" class="ztree"></ul>
		</div>
		<form id="getChildOrgTree" action="../newUser/getChildOrgTreeWithState.action" method="post">
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="treeData" value='${treeData}' />
			<input type="hidden" id="orgId" name="orgId" value="" />
		</form>
	</body>
</html>