<%@ page language="java"
	import="java.util.*,java.sql.*,java.text.SimpleDateFormat"
	pageEncoding="UTF-8"%>
<%@include file="DBHelper.jsp"%>
<%!public Connection con = null;
	public PreparedStatement stmt = null;
	public ResultSet rs = null;
	public String ms_TemplateDOC = "";
	public String ms_TemplateXLS = "";
	public String ms_TemplatePPT = "";
	public String ms_TemplateWPS = "";
	public String ms_TemplateET = "";
	public String ms_TemplateDPS = "";

	public String GetTemplateData(String sType) {
		con = getConn();
		String s_sql = "select * from eWebOffice_T_TemplateFile where D_FileType='"
				+ sType + "'";
		String Data = "";
		try {
			rs = ExecuteQuery(con, s_sql);
			while (rs.next()) {
				Data += rs.getString("D_TemplateID") + ","
						+ rs.getString("D_Descript") + "|";
			}
			closeAll(null, null, rs);
			Data = Data.equals("") ? "" : Data.substring(0, Data.length() - 1);
		} catch (Exception e) {
			Data = "";
		} finally {
			closeAll(con, null, rs);
		}
		return Data;
	}%>
<%
	ms_TemplateDOC = GetTemplateData("doc");
	ms_TemplateXLS = GetTemplateData("xls");
	ms_TemplatePPT = GetTemplateData("ppt");
	ms_TemplateWPS = GetTemplateData("wps");
	ms_TemplateET = GetTemplateData("et");
	ms_TemplateDPS = GetTemplateData("dps");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>eWebOffice示例首页</title>
		<link rel="Stylesheet" type="text/css" href="css/eweboffice.css" />

		<script type="text/javascript">

function ChangeFileType() {
	var s_TemplateData = "";
	var s_FileType = document.getElementById("d_filetype").value;
	switch (s_FileType) {
	case "doc":
		s_TemplateData = "<%=ms_TemplateDOC%>";
		break;
	case "xls":
		s_TemplateData = "<%=ms_TemplateXLS%>";
		break;
	case "ppt":
		s_TemplateData = "<%=ms_TemplatePPT%>";
		break;
	case "wps":
		s_TemplateData = "<%=ms_TemplateWPS%>";
		break;
	case "et":
		s_TemplateData = "<%=ms_TemplateET%>";
		break;
	case "dps":
		s_TemplateData = "<%=ms_TemplateDPS%>";
		break;
	default:
		s_TemplateData = "<%=ms_TemplateDOC%>";
		break;
	}

	document.getElementById("d_templateid").options.length = 1;

	var arr = s_TemplateData.split('|');
	for ( var i = 0; i < arr.length; i++) {
		var arr2 = arr[i].split(',');
		AddOption("d_templateid", arr2[0], arr2[1]);
	}
}

function AddOption(s_Id, s_Value, s_Text) {
	var el = document.getElementById(s_Id);
	el.options[el.length] = new Option(s_Text, s_Value);
}
</script>

	</head>


	<body onload="ChangeFileType()">
		<div id="bdy">

			<div id="nav">
				您当前位置 &gt;&gt;
				<a href="default.jsp">首页</a>
			</div>
			<hr />

			<table class="lst">
				<tr>
					<th colspan="2">
						eWebOffice控件操作示例
					</th>
				</tr>
				<tr>
					<td>
						<form name="form1" action="document_edit.jsp?action=new"
							method="post">
							文档类型：
							<select name="d_filetype" id="d_filetype"
								onchange="ChangeFileType()">
								<option value="doc">
									微软Word文字(.doc)
								</option>
								<option value="xls">
									微软Excel表格(.xls)
								</option>
								<option value="ppt">
									微软PowerPoint演示(.ppt)
								</option>
								<option value="wps">
									金山WPS文字(.wps)
								</option>
								<option value="et">
									金山WPS表格(.et)
								</option>
								<option value="dps">
									金山WPS演示(.dps)
								</option>
							</select>
							模板：
							<select name='d_templateid' id="d_templateid">
								<option value=''>
									---不使用模板---
								</option>
							</select>
							用户名：
							<input name="d_username" id="d_username" style="width: 75px"
								type="text" value="演示人" />

							<input type="submit" value="新建文档" />
							<input type=button value="打印交费通知" onclick="printNotice()">
							<script>
<%!public String tempUrl;
	public String d_templateid = "20130725154319";
	public String caseId = "1";%>
<%tempUrl = request.getContextPath();
			tempUrl = request.getScheme() + "://" + request.getServerName()
					+ ":" + request.getServerPort() + tempUrl + "/";
			tempUrl += "bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid="
					+ d_templateid + "&d_username=user1&caseId=" + caseId;%>
//调用示例：window.open("http://localhost:8011/eWebOffice/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20130725154319&d_username=user1&caseId=1")
function printNotice(){	
	window.open("<%=tempUrl%>");
}
</script>
						</form>
					</td>
					<td align="center">
						<input type="button" class="btn" value="模板管理"
							onclick="location.href='bac_template_list.jsp'" />
						<input type="button" class="btn" value="签章管理"
							onclick="location.href='seal_list.jsp'" />
						<input type="button" class="btn" value="书签管理"
							onclick="location.href='bookmark_list.jsp'" />
					</td>
				</tr>
			</table>

			<br />

			<table class="lst">
				<tr>
					<th style="width: 5%;">
						编号
					</th>
					<th style="width: 10%;">
						文档编号
					</th>
					<th style="width: 19%;">
						标题
					</th>
					<th style="width: 8%;">
						作者
					</th>
					<th style="width: 5%;">
						类型
					</th>
					<th style="width: 13%;">
						日期
					</th>
					<th style="width: 40%;">
						操作
					</th>
				</tr>
				<%
					String sql = "select * from eWebOffice_T_Document order by d_id desc";
					try {
						con = getConn();
						rs = ExecuteQuery(con, sql);
						while (rs.next()) {

							String s_Link = "";
							if (rs.getString("D_FileType").toLowerCase().equals("doc")
									|| rs.getString("D_FileType").toLowerCase().equals(
											"wps")) {
								s_Link = "<a href='document_edit.jsp?action=norevision&d_username=test2&d_recordid="
										+ rs.getString("D_RecordID")
										+ "'>修改无痕迹</a>"
										+ "→<a href='document_edit.jsp?action=yesrevision&d_username=test3&d_recordid="
										+ rs.getString("D_RecordID")
										+ "'>修改有痕迹</a>"
										+ "→<a href='document_edit.jsp?action=comment&d_username=test4&d_recordid="
										+ rs.getString("D_RecordID")
										+ "'>领导手写圈批</a>"
										+ "→<a href='document_edit.jsp?action=verify&d_username=test5&d_recordid="
										+ rs.getString("D_RecordID")
										+ "'>核搞</a>"
										+ "→<a href='document_edit.jsp?action=embed&d_username=test6&d_recordid="
										+ rs.getString("D_RecordID")
										+ "'>套红</a>"
										+ "→<a href='document_edit.jsp?action=seal&d_username=test7&d_recordid="
										+ rs.getString("D_RecordID")
										+ "'>签章</a>"
										+ "→<a href='document_edit.jsp?action=read&d_username=test1&d_recordid="
										+ rs.getString("D_RecordID")
										+ "'>阅读</a>"
										+ " <a style='color:red;' href='document_delete.jsp?d_recordid="
										+ rs.getString("D_RecordID") + "'>删除</a>";
							} else {
								s_Link = "<a href='document_edit.jsp?action=norevision&d_username=test2&d_recordid="
										+ rs.getString("D_RecordID")
										+ "'>修改无痕迹</a>"
										+ "→修改有痕迹"
										+ "→领导手写圈批"
										+ "→核搞"
										+ "→套红"
										+ "→签章"
										+ "→<a href='document_edit.jsp?action=read&d_username=test1&d_recordid="
										+ rs.getString("D_RecordID")
										+ "'>阅读</a>"
										+ " <a style='color:red;' href='document_delete.jsp?d_recordid="
										+ rs.getString("D_RecordID") + "'>删除</a>";
							}

							out.print("<tr align=center>" + "<td>"
									+ rs.getString("D_ID") + "</td>" + "<td>"
									+ rs.getString("D_RecordID") + "</td>"
									+ "<td align=left>" + rs.getString("D_Subject")
									+ "</td>" + "<td>" + rs.getString("D_Author")
									+ "</td>" + "<td>" + rs.getString("D_FileType")
									+ "</td>" + "<td>" + rs.getDate("D_FileDate")
									+ "</td>" + "<td>" + s_Link + "</td>" + "</tr>");

						}
					} catch (Exception e) {
						System.out.println(e.getMessage());
						out.print("<tr><td colspan=7>没有数据</td></tr>");

						//response.getWriter().write(e.getMessage());
					} finally {
						closeAll(con, stmt, rs);
					}
				%>
			</table>

			<hr />
		</div>
	</body>
</html>

















