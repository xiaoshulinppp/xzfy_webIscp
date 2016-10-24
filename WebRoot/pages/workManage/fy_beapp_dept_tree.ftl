<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css/tree/style.css" type="text/css">
<title>${action.getText("platform.name")}</title>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
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
<script language="JavaScript" src="../js/beappdepttree/tree.js" object="" style="display:" width = "16",height="16"></script>
<script>
	function setDictItems() {
		window.close();
	}
</script>
<script>
	tree = document.getElementById("tree_");
	treeGlobe = new TreeGlobe();
	
	treeGlobe.rootPath="../js/beappdepttree/icons/";
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
	treeGlobe.modifyNode = function(node,name,value,parent,abbr){
		if(node != null){	
			node.entityid = ${initId};
			node.nameElement.onclick=setValue;
		}
		if(node.parent == null){
		   node.nameElement.innerHTML = "<b>"+node.nameElement.innerHTML+"</b>";
		}	
	}
	fieldId = $("#${fieldId}", opener.document);
	fieldName = $("#${fieldName}", opener.document);
	beapptype = $("#beapptype", opener.document);
	function setValue(){
		node = this.object;
		if(node.id!=${initId}||node.id==1){
			fieldId.val(node.value);
			fieldName.val(node.name);
			beapptype.val(node.abbr);
			window.close();
		}
	}
	serverUrl = "../user/beAppDeptTreeServer.action?funcCode=${funcCode}";
	
	//
	treeGlobe.treeNodeElement = document.getElementById("tree_node");
	root = treeGlobe.createTreeNode("${initname}",null,null,${initId},${initabbr});
	root.id = ${initId};
	root.entityid = ${initId}; 
	root.entityabbr="0";
	tree.appendChild(root.nodeElement);
	root.treeNodeOpenElement = treeGlobe.initImage(document.getElementById("exampleImg_"),"tree_root.gif");
	root.treeNodeCloseElement = root.treeNodeOpenElement.cloneNode();
	root.expandElement.onclick();
	type=1;
</script>