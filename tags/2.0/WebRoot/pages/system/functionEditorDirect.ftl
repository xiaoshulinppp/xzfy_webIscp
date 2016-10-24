<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
</head>
<body>
</body>
</html>
<script language="JavaScript" src="../js/tree/tree.js" object="" style="display:" width = "16",height="16"></script>
<script>
root = parent.leftframe.root;


<#if opName == "update">
updateItem(${entityId},"${func.name}");
</#if>
<#if opName == "delete">
deleteItem(${entityId});
</#if>
<#if opName == "create">
createItem(${funcId},"${func.name}",${parentId});
</#if>
function updateItem(funcId,funcName){
  updateNode(funcId,funcName);
  root.loadAllTabs();
}
function updateNode(id,name){
  node = root.findChildById(id);
  if(node != null){
  	node.nameElement.innerHTML = name;
  }
  root.loadAllTabs();
  window.location = "./viewFunction.action?funcCode=${funcCode}&entityId=${entityId}&opName=update";
}

function deleteItem(funcId){
  deleteNode(funcId);
  root.loadAllTabs();
}
function deleteNode(id){
  node = root.findChildById(id);
  if(node != null){
  	node.remove();
  }
  root.loadAllTabs();
  window.location = "./createFunction.action?funcCode=${funcCode}&opName=create";
}

function createItem(funcId,funcName,parentId){
  createNode(funcId,funcName,parentId);
}
function createNode(id,name,parentId){
  node = root.findChildById(parentId);
  if(node != null){
     if(node.loaded){
     	if(node.children.length == 0){
     	   node.loaded = false;
     	   node.loadChildren();
     	}
     	else{
		   newNode = node.addNode(name,name);
		   newNode.id = id;
	    }
	 }
	 else{
		node.loadChildren();
	 }
	 newNode = node.findChildById(id);
	 newNode.expandElement.onclick();
  }
  root.loadAllTabs();

   window.location = "./viewFunction.action?funcCode=${funcCode}&entityId="+id+"&opName=update";


}
</script>
