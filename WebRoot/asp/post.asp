<!--#include file="conn.asp"-->
<%
	UserId=trim(request("xId"))
	set rsUser=server.createobject("adodb.recordset")
	sqltext="select * from BlackList where IDCODE='"&UserIdId&"'"
	rsUser.open sqltext,conn,3,3
	

		rsUser.addnew
		'������
		rsUser("IDCODE")=Request("CardNo")
		rsUser("IDNAME")=Request("Name")      

		
		rsUser.update
		rsUser.close
		conn.close
		
		response.write "<script language=JavaScript>{window.alert('������������ӳɹ���');window.location.href='ALLBlackList.asp'}</script>"
	    response.end
	
%>