<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<body>

		<input type="hidden" name="funcCode" value="${funcCode}"/>
		<input type="hidden" name="mainidd" value="${mainidd}"/>
				</td>
			</tr>
		</table>
	</body>
</html>
<script type="text/javascript">
   alert("提交成功");
   window.open("http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20130725154319&d_username=${Session['_USER_LOGIN_'].id}&caseId=${mainidd}")
   window.location="updateyibanjiedai.action?funcCode=${funcCode}"
</script>