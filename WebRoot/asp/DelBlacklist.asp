<!--#include file="conn.asp"-->
<%
	 '*******************************************************************
	 ' 弹出对话框
	 '*******************************************************************
	 Sub Alert(message)
	  message = Replace(message,"'","\'")
	  message = Replace(message,Chr(13),"\n")
	  message = Replace(message,Chr(10),"")
	  Response.Write ("<script>alert('" & message & "')</script>")
	 End Sub
	 
	 '*******************************************************************
	 ' 返回上一页，一般用在判断信息提交是否完全之后
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
   'Response.write ("<script>window.alert('黑名单删除成功!')</script>")
   Response.write "<script language=JavaScript>{window.alert('黑名单数据删除成功！');window.location.href='ALLBlacklist.asp'}</script>"
   'GoBack()
   'response.write("<script language=JavaScript>{window.alert('删除成功，页面关闭：^_^!');window.close();}</script>")
   'response.write("<script language=JavaScript>{window.alert('删除成功，页面关闭：^_^!');javascript:history.back();}</script>")
   response.end
%>