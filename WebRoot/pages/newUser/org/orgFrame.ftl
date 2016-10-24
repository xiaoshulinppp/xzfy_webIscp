<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>信息采集报送平台</title>
		<script type="text/javascript">
			function setOrgId(nodeId){
				var url = "../newUser/showOrgInfo.action?funcCode=${funcCode}&orgId=" + nodeId;
				window.document.getElementById("orgData").src = url;
			}
			
			function updateTree(treeNodeId){
				window.document.getElementById("orgTree").contentWindow.updateNode(treeNodeId);
			}
			
			function deleteTree(treeNodeId){
				window.document.getElementById("orgTree").contentWindow.deleteNode(treeNodeId);
			}
			
			function insertTree(treeNodeId){
				window.document.getElementById("orgTree").contentWindow.insertNode(treeNodeId);
			}
			
			function refreshTree(treeNodeId){
				window.document.getElementById("orgTree").contentWindow.refreshTree(treeNodeId);
			}
			
			function expandTree(treeNodeId){
				window.document.getElementById("orgTree").contentWindow.expandNode(treeNodeId);
			}
		</script>
		<frameset cols="260,*" border="3" framespacing="3" borderColor="#28746a" >
			<frame id="orgTree" src="../newUser/getUserOrgTree.action?funcCode=${funcCode}" frameborder="1" border="1" scrolling="yes" />
			<frame id="orgData" src="../newUser/showOrgInfo.action?funcCode=${funcCode}" />
		</frameset>
	</head>
	<noframes>
		<body>
		</body>
	</noframes>
</html>