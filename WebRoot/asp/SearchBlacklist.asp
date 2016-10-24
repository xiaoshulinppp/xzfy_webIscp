<!--#include file="conn.asp"-->
<%
CardNo=Request("CardNo")
IDName=Request("Name")
exec="select * from BlackList where IDCode = '"&CardNo&"'" 
set rs=server.createobject("adodb.recordset")
rs.open exec,conn,1,1

'假如没有数据时
If rs.eof and rs.bof then   
   response.write ("<p align='center'><b><font color='#0000FF' size='6'>"& IDName &" 为合法用户!</font></b></p>")
   response.write ("<p>")
   response.write ("<p align='center'>")
   response.write ("<a href='#' onclick='window.opener = null;window.close()' return false>关闭本窗口</a> ")
   'response.write("<script language=JavaScript>{window.alert(IDName+'为合法用户!');window.close();}</script>")
   response.end
   rs.close                
   conn.close 
End If

   response.write ("<p align='center'><b><font color='#FF0000' size='6'>请注意，"&rs("IDName")&" 为黑名单用户!!!</font></b></p>")
   response.write ("<p>")
   response.write ("<p align='center'>")
   response.write ("<a href='#' onclick='window.opener = null; window.close()' return false>关闭本窗口</a> ")
   'response.write("<script language=JavaScript>{window.alert('请注意，'+IDName+'为黑名单用户!!!');window.close();}</script>")
   response.end


rs.close                
conn.close  

%>