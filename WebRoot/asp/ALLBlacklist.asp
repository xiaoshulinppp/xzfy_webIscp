<!--#include file="conn.asp"-->
<!--#include file="nocache.asp"-->
<html>
<head>
<title>ȫ��������----���ڻ��ӵ��Ӷ�д�豸���޹�˾</title>
<meta http-equiv="Content-Type" content="text/html;  charset=gb2312">
<link rel="stylesheet" href="../pic/style2.css"  type="text/css"></head>
<body text="#000000">

<H1 align="center"> <font color="#5555FF"> ���ڻ��ӵ��Ӷ�д�豸���޹�˾</font> </H1>
<p align="center"><font color="#FF0000">�ڶ����������֤�Ķ����</font>
<center>
<HR>                                             

<%
exec="select * from BlackList " 
set rs=server.createobject("adodb.recordset")
rs.open exec,conn,1,1

dim MaxPerPage
MaxPerPage=10

'����û������ʱ
If rs.eof and rs.bof then 
   call showpages
   response.write "<p align='center'><font  color='#ff0000'>û����Ҫ��ѯ�ĺ�������Ϣ</font></p>"
   response.end
End if

'ȡ��ҳ��,���ж��û�������Ƿ��������͵����ݣ��粻�ǽ��� ��һҳ��ʾ
dim text,checkpage
text="0123456789"
 Rs.PageSize=MaxPerPage
for i=1 to len(request("page"))
   checkpage=instr(1,text,mid(request("page"),i,1))
   if checkpage=0 then
      exit for 
   end if
next

If checkpage<>0 then
      If NOT IsEmpty(request("page")) Then
        CurrentPage=Cint(request("page"))
        If CurrentPage < 1 Then CurrentPage = 1
        If CurrentPage > Rs.PageCount Then CurrentPage =  Rs.PageCount
      Else
        CurrentPage= 1
      End If
      If not Rs.eof Then Rs.AbsolutePage = CurrentPage  end if
Else
   CurrentPage=1
End if

call showpages
call list

If Rs.recordcount > MaxPerPage then
  call showpages
end if

'��ʾ���ӳ���
Sub list()%> 
            <TABLE cellSpacing=1 cellPadding=4  bgColor=#416327>
              <TBODY>
        <center>                    
              <tr>
                <TD class=main2  height="1" width="98"  bgcolor="#DEEBD6"> 
                 <img border="0" src="../pic/power.gif">ȫ����������
</TD>
              </tr>
              <TR vAlign=top bgColor=#e1f0ff>                     
                <TD class=main2  height="15" width="893"  bgcolor="#DEEBD6">                    
                  <table border="1" cellpadding="0"  cellspacing="0" width="100%" bordercolorlight="#416327"  bordercolordark="#DEEBD6" height="1">                     
                        <td width="3%"  bgcolor="#398A00" align="center" height="19" class=main2  ><font color="#FFFFFF">���</font></td>                  
                        <td width="6%"  bgcolor="#398A00" align="center" height="19" class=main2  ><font color="#FFFFFF">����</font></td>                  
                      <td width="18%" bgcolor="#398A00"  align="center" height="19" class=main2 ><font  color="#FFFFFF">���֤����</font></td>                  
                      <td width="11%" bgcolor="#398A00"  align="center" height="19" class=main2 ><font  color="#FFFFFF">�Ա�</font></td>                  
                      <td width="12%" bgcolor="#398A00"  align="center" height="19" class=main2 ><font  color="#FFFFFF">��������</font></td>                  
                      <td width="14%" bgcolor="#398A00"  align="center" height="19" class=main2><font  color="#FFFFFF">��ַ</font></td>                 
                      <td width="14%" bgcolor="#398A00"  align="center" height="19" class=main2><font  color="#FF0000">����</font></td>                 
                      <%                 
if not rs.eof then                 
  i=0                 
  do while not rs.eof                  
%>                  
        </center>                 
                   <tr class=main2>                 
        <center>                 
                      <td width="3%" align="left"  height="1">         
                        <p  align="center"><li><%=i+1%></li></td>                
        </center>                
                      <td width="6%" align="left"  height="1">         
                        <p  align="center"><%=rs("IDName")%></td>                
                      <td width="18%" align="left"  height="1"><%=rs("IDCODE")%></td>                
                      <td width="11%" align="left"  height="1"><center>����<font></td>                 
                      <td width="12%" align="left"  height="1"><center>����</center></td>                
                      <td width="14%" align="left"  height="1"><center>����                
                               
                      <td width="14%" align="left"  height="1">                
<center>
                       
                        <input type="button" value="ɾ��"  onClick="if (confirm('ȷʵҪɾ����<%=rs("IDName")%>���ĺ�������¼�𣿲��ɻָ���')) window.location='DelBlacklist.asp?id=<%=rs("id")%>'"  style="font-family: ��ϸ����, ����, Arial; font-size:  9pt; height: 20px; background-color: #D4D0C8; color:  #FF0000"  onMouseOver="this.style.backgroundColor='#FFC864'"  onMouseOut="this.style.backgroundColor='#D4D0C8'"></center>        </td>                
                    </tr>                
<%                
   i=i+1                
   if i >= MaxPerpage then exit do                
   rs.movenext                
   loop                
end if                
%>                
                  </table>                
                </TD></TR>                
              <TR bgColor=#e1f0ff>                
                <TD class=main2 width="893" height="27"  bgcolor="#DEEBD6">                
                <p align="center">                 </TD></TR>                
              <TR bgColor=#e1f0ff>                
<TD class=main2 width="893" height="4"  bgcolor="#398A00" ></TD>
              </TR></TBODY></TABLE>
            <br>                
<%                
End sub                
rs.close                
conn.close                
%>                        
<div align="center">                
  <center>
                                                                                                                                     
<%                         
'��ʾ��ҳ���ӳ���                         
sub showpages()%>                         
<table bgColor="#f8e8a0" border="0" cellPadding="0"  cellSpacing="0" width="100%" >                           
<tr><td >                         
<%                         
response.write "<form method=Post action='ALLBlacklist.asp'>"                          
%>                          
                         
<table bgColor="#1f60a0" border="0" cellPadding="0"  cellSpacing="0" width="100%" height="30">                            
   <tr>                         
    <td  bgcolor="#DEEBD6" class=main2>                             
<font color="#000000">                            
<p align="left">                            
<%                         
   Response.write "<font color='#000000'>��ҳ-</font>"                             
   If currentpage > 1 Then                         
      response.write "<a  href='ALLBlacklist.asp?page="+cstr(1)+"'><font color='#000000'> ��ҳ</font></a><font color='#ffffff'><b>-</b></font>"                            
      Response.write "<a  href='ALLBlacklist.asp?page="+Cstr(currentpage-1)+"'><font  color='#000000'>ǰҳ</font></a><font  color='#ffffff'><b>-</b></font>"                         
   Else                         
      Response.write "<font  color='#000000'>��ҳ-</font>"                         
      Response.write "<font  color='#000000'>ǰҳ-</font>"                                
   End if                         
                            
   If currentpage < Rs.PageCount Then                          
      Response.write "<a  href='ALLBlacklist.asp?page="+Cstr(currentPage+1)+"'><font  color='#000000'>��ҳ</font></a><font  color='#ffffff'><b>-</b></font>"                         
      Response.write "<a  href='ALLBlacklist.asp?page="+Cstr(Rs.PageCount)+"'><font  color='#000000'>βҳ</font></a>&nbsp;&nbsp;"                          
   Else                         
      Response.write "<font  color='#000000'>��ҳ-</font>"                         
      Response.write "<font  color='#000000'>βҳ</font>&nbsp;&nbsp;"                                 
   End if                         
   Response.write "<font color='#000000'>ҳ��:</font>" &  "<font color=#FF0000>" & Cstr(CurrentPage) &  "</font>"  & "<font color='#000000'>/" & Cstr(rs.pagecount) &  "</font>&nbsp;"                         
   Response.write "<font color=#ff0000>" &  Cstr(MaxPerPage) & "</font>" & "<font color='#000000'>����¼/ҳ&nbsp" & "��</font>" & "<font color=#FF0000>" &  Cstr(Rs.RecordCount) & "</font>" & "<font  color='#000000'>����¼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='../CVR_IDCard.asp'><font color='red' class=main>���ض���</a></font>&nbsp;&nbsp;"
response.write "</td><td align='right'>"                          
response.write "<font color='#ffffff' class=main2>ת���� </font><input type='text' name='page' size=4 maxlength=4  class=smallInput value="&Currentpage&">&nbsp;"                          
   response.write "<input class=buttonface type='submit'   value='Go'  name='cndok' style='background-color:  #e1f0ff'></span>&nbsp;&nbsp;"                            
%> 
</font>                             
    </td>                           
   </tr>                         
  </table>                         
  </center>                         
</td></tr>                         
</table>                         
</form>                         
<%end sub%>                                  
</body>                         
</html>


