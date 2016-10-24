<html>
<head>
<title>${action.getText("platform.name")}</title>
</head>

<frameset id="mainframeset" cols="300,*" border="3" framespacing="3"  borderColor="#0088ff" > 
	<frame frameborder="1" border="1" src="../tongJi/showOrgUserTree.action?funcCode=${funcCode}&orgId=1" name="leftframe" scrolling="yes" >
	<frame id="mainframe" src="../tongJi/listUser.action?funcCode=${funcCode}&orgId=${Session["_USER_LOGIN_"].org.id}" name="mainiframe">
</frameset>
<noframes>
<body>
</body>
</noframes>
</html>