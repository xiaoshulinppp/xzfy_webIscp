<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../pages/system/jstree/style.css" type="text/css">
<title>欢迎光临</title>
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
<script language="JavaScript" src="../pages/system/jstree/tree.js" object="" style="display:" width = "16",height="16"></script>
<script>
tree = document.getElementById("tree_");
treeGlobe = new TreeGlobe();
//初始化图形界面
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
"tree_node_close.gif",
"tree_node_close.gif",
"tree_node_group.gif");

allNodes = new Array(0);
multiselect = true;
treeGlobe.modifyNode = function(node,name,value,parent){
	if(node != null && node.parent != null){
		node.nameElement.onclick=setValue;
	}
}
var positionUrl = "../system/listPositionS.action?funcCode=${funcCode}&positionId=0";
var ptreeUrl = "../system/listPtreeS.action?funcCode=${funcCode}";
var tagUrl = "../system/listPostUser.action?funcCode=${funcCode}";

function setValue(){
	o = this.object;
	if(o.parent == null || o.parent.parent == null){
		return;
	}
	link(tagUrl+"&ptreeId="+o.id+"&positionId="+getPositionId(o));
}
//
treeGlobe.treeNodeElement = document.getElementById("tree_node");
root = treeGlobe.createTreeNode("岗位",1,null);
tree.appendChild(root.nodeElement);
root.id = 0;
node.expandElement.onclick();

function getPositionId(o){
  for(i = 0;i<100&&o.parent != null && o.parent.parent != null;i++){
    o = o.parent;
  }
  return o.id;
}

function link(url){
  if(parent.mainframeset != null && parent.mainframeset.mainframe != null){
    parent.mainframeset.mainframe.location=url;
  }
  else if(parent.mainframe != null){
    parent.mainframe.location= url;
  }
}

</script>