<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css/tree/style.css" type="text/css">
<title>${action.getText("platform.name")}</title>
</head>
<body>
<div style="display:none">
<IMG id= "exampleImg_" src="tree_close.gif" onclick=""></IMG>
<a id="exampleA_" object="" onclick=""></a>
</div>
<div id= "tree_node" style="margin-top:-4; margin-bottom:0"></div>
<div id = "tree_" class="normaltext" valign="middle">
</div>
</body>
</html>
<script language="JavaScript" src="../js/tree/tree.js" object="" style="display:" width = "16",height="16"></script>
<script>
tree = document.getElementById("tree_");
treeGlobe = new TreeGlobe();

treeGlobe.rootPath="../js/tree/icons/";
treeGlobe.init(document.getElementById("exampleImg_"),document.getElementById("exampleA_"),
"tree_expand.gif",
"tree_close.gif",
"tree_expand_a.gif",
"tree_close_a.gif",
"tree_line_a.gif",
"tree_line_b.gif",
"tree_line_c.gif",
"tree_blank.gif",
"tree_node_open.gif",
"tree_node_close.gif");

allNodes = new Array(0);
treeGlobe.modifyNode = function(node,name,value,parent){
	if(node != null){
		node.entityid = ${entityId};
		node.nameElement.onclick=setValue;
	}
	if(node.parent == null){
	   node.nameElement.innerHTML = "<b>"+node.nameElement.innerHTML+"</b>";
	}	
}

function setValue(){
	node = this.object;
	parent.mainframe.location="./viewDictItemNew.action?dictId=${entityId}&funcCode=${funcCode}&opName=${opName}&dictType=${type}&entityId="+node.id;
}
serverUrl = "./showDictItemServer.action?funcCode=${funcCode}";

//
treeGlobe.treeNodeElement = document.getElementById("tree_node");
root = treeGlobe.createTreeNode("${dict.name}",1,null);
root.id = 0;
root.entityid = ${entityId};
root.entityabbr="${dict.abbr}";
tree.appendChild(root.nodeElement);
root.treeNodeOpenElement = treeGlobe.initImage(document.getElementById("exampleImg_"),"tree_root.gif");
root.treeNodeCloseElement = root.treeNodeOpenElement.cloneNode();
root.nameElement.onclick = function(){
  parent.mainframe.location="./createDictItemNew.action?funcCode=${funcCode}&dictId=${entityId}&parentId=0&opName=create";
}
root.expandElement.onclick();
</script>