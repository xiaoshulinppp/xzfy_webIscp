<% 
Response.Buffer = True 
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache" 
%>  
<H1 align="center"><font size="6" color="#0000FF">成功保存读卡结果！</font></H1><p align="center">
<p><font color="#FF00FF">读卡内容为：</font></p>
<HR>
<%
If  request("submit")<>"" then 
 Response.Write "姓名：" & Request.Form("Name") & "<br>"
 Response.Write "性别：" & Request.Form("Sex") & "<br>"
 Response.Write "民族：" & Request.Form("Nation") & "<br>"
 Response.Write "出生：" & Request.Form("Born") & "<br>"
 Response.Write "地址：" & Request.Form("Address") & "<br>"
 Response.Write "身份证号：" & Request.Form("CardNo") & "<br>"
 Response.Write "签发机关：" & Request.Form("Police") & "<br>"
 Response.Write "有效期限：" & Request.Form("Activity") & "<br>"
 Response.Write "最新地址：" & Request.Form("NewAddr") & "<br>" 
 Response.Write "相片文件默认保存在 " & Request.Form("PhotoPath") & "<br>" 

End if
%>
<p><a href="../CVR_IDCard.asp">&lt;&lt;返回读卡</a></p>
