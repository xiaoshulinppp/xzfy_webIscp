<!--#include file="conn.asp"-->
<%
CardNo=Request("CardNo")
IDName=Request("Name")
exec="select * from BlackList where IDCode = '"&CardNo&"'" 
set rs=server.createobject("adodb.recordset")
rs.open exec,conn,1,1

'����û������ʱ
If rs.eof and rs.bof then   
   response.write ("<p align='center'><b><font color='#0000FF' size='6'>"& IDName &" Ϊ�Ϸ��û�!</font></b></p>")
   response.write ("<p>")
   response.write ("<p align='center'>")
   response.write ("<a href='#' onclick='window.opener = null;window.close()' return false>�رձ�����</a> ")
   'response.write("<script language=JavaScript>{window.alert(IDName+'Ϊ�Ϸ��û�!');window.close();}</script>")
   response.end
   rs.close                
   conn.close 
End If

   response.write ("<p align='center'><b><font color='#FF0000' size='6'>��ע�⣬"&rs("IDName")&" Ϊ�������û�!!!</font></b></p>")
   response.write ("<p>")
   response.write ("<p align='center'>")
   response.write ("<a href='#' onclick='window.opener = null; window.close()' return false>�رձ�����</a> ")
   'response.write("<script language=JavaScript>{window.alert('��ע�⣬'+IDName+'Ϊ�������û�!!!');window.close();}</script>")
   response.end


rs.close                
conn.close  

%>