<% 
Response.Buffer = True 
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache" 
%>  
<H1 align="center"><font size="6" color="#0000FF">�ɹ�������������</font></H1><p align="center">
<p><font color="#FF00FF">��������Ϊ��</font></p>
<HR>
<%
If  request("submit")<>"" then 
 Response.Write "������" & Request.Form("Name") & "<br>"
 Response.Write "�Ա�" & Request.Form("Sex") & "<br>"
 Response.Write "���壺" & Request.Form("Nation") & "<br>"
 Response.Write "������" & Request.Form("Born") & "<br>"
 Response.Write "��ַ��" & Request.Form("Address") & "<br>"
 Response.Write "���֤�ţ�" & Request.Form("CardNo") & "<br>"
 Response.Write "ǩ�����أ�" & Request.Form("Police") & "<br>"
 Response.Write "��Ч���ޣ�" & Request.Form("Activity") & "<br>"
 Response.Write "���µ�ַ��" & Request.Form("NewAddr") & "<br>" 
 Response.Write "��Ƭ�ļ�Ĭ�ϱ����� " & Request.Form("PhotoPath") & "<br>" 

End if
%>
<p><a href="../CVR_IDCard.asp">&lt;&lt;���ض���</a></p>
