<!--#include file="conn.asp"-->
<%
	 '*******************************************************************
	 ' �����Ի���
	 '*******************************************************************
	 Sub Alert(message)
	  message = Replace(message,"'","\'")
	  message = Replace(message,Chr(13),"\n")
	  message = Replace(message,Chr(10),"")
	  Response.Write ("<script>alert('" & message & "')</script>")
	 End Sub
	 
	 '*******************************************************************
	 ' ������һҳ��һ�������ж���Ϣ�ύ�Ƿ���ȫ֮��
	 '*******************************************************************
	 Sub GoBack()	  
	  Response.write ("<script>history.go(-1)</script>")
	  Response.write ("<script>Location.refresh()</script>")
	 End Sub
 
 
   dim SQL, sqltext, rs, contentID,CurrentPage
   contentID=trim(request("ID"))

   set rs=server.createobject("adodb.recordset")
   sqltext="delete from Blacklist where id="&contentID
   rs.open sqltext,conn,3,3
   set rs=nothing
   
   'conn.Execute sqltext
   'set conn=nothing
   
   'response.redirect "ALLBlacklist.asp"
   'Response.write ("<script>window.alert('������ɾ���ɹ�!')</script>")
   Response.write "<script language=JavaScript>{window.alert('����������ɾ���ɹ���');window.location.href='ALLBlacklist.asp'}</script>"
   'GoBack()
   'response.write("<script language=JavaScript>{window.alert('ɾ���ɹ���ҳ��رգ�^_^!');window.close();}</script>")
   'response.write("<script language=JavaScript>{window.alert('ɾ���ɹ���ҳ��رգ�^_^!');javascript:history.back();}</script>")
   response.end
%>