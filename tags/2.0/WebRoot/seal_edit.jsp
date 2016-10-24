<%@ page language="java" import="java.util.*,org.apache.commons.fileupload.*,java.io.*,org.apache.commons.fileupload.servlet.ServletFileUpload,org.apache.commons.fileupload.disk.DiskFileItemFactory,java.sql.*" pageEncoding="UTF-8"%>
<%@include file="DBHelper.jsp" %>
<%!
	String ms_UserName="";
	String ms_PassWord="";
	String ms_MarkName="";
	byte[] ma_MarkBody;
	int mi_MarkSize;
	String ms_MarkType="";
	java.sql.Date md_MarkDate;
	int ms_ID=0;
	Connection con = null;
	ResultSet rs = null;
	PreparedStatement stmt = null;
%>
<%
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	if (!isNullOrEmpty(request.getParameter("action"))
			&& request.getParameter("action").equals("save")) {
		con = getConn();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		// 设置字符编码为UTF-8, 统一编码，处理出现乱码问题
		response.setCharacterEncoding("UTF-8");
	
		final String[] allowedExt = new String[] { "jpg", "jpeg",
				"gif", "bmp" };

		
		// 实例化一个硬盘文件工厂,用来配置上传组件ServletFileUpload
		DiskFileItemFactory dfif = new DiskFileItemFactory();

		dfif.setSizeThreshold(4096);// 设置上传文件时用于临时存放文件的内存大小,这里是4K.多于的部分将临时存在硬盘

		dfif.setRepository(new File(request.getRealPath("/") + "CSS"));// 设置存放临时文件的目录,web根目录下的ImagesUploadTemp目录

		// 用以上工厂实例化上传组件
		ServletFileUpload sfu = new ServletFileUpload(dfif);
		// 设置最大上传大小
		//sfu.setSizeMax(MAX_SIZE);

		//PrintWriter out1 = response.getWriter();
		// 从request得到所有上传域的列表
		
		List fileList = null;
		try {
			fileList = sfu.parseRequest(request);
		} catch (FileUploadException e) {// 处理文件尺寸过大异常
			e.printStackTrace();
		}
		// 没有文件上传
		if (fileList == null || fileList.size() == 0) {
			out.println("<script>alert('请选择上传文件!');history.back();</script>");
			return;
		}
		// 得到所有上传的文件
		Iterator fileItr = fileList.iterator();
		// 循环处理所有文件
		while (fileItr.hasNext()) {
			FileItem fileItem = null;
			String path = null;
			long size = 0;
			// 得到当前文件
			fileItem = (FileItem) fileItr.next();
			// 忽略简单form字段而不是上传域的文件域(<input type="text" />等)
			if (fileItem == null || fileItem.isFormField()) {
				if(fileItem.getFieldName().equals("d_username")){
						ms_UserName = fileItem.getString();

				}else if(fileItem.getFieldName().equals("d_password")){
						ms_PassWord = fileItem.getString();

				}else if(fileItem.getFieldName().equals("d_markname")){
						ms_MarkName = fileItem.getString();

				}else if(fileItem.getFieldName().equals("id")){
						ms_ID = Integer.parseInt(fileItem.getString());

				}
				continue;
			}
			// 得到文件的完整路径
			path = fileItem.getName();
			// 得到文件的大小
			size = fileItem.getSize();
			if ("".equals(path) || size == 0) {
				out.println("<script>alert('请选择上传文件!');history.back();</script>");
				return;
			}

			// 得到去除路径的文件名
			String t_name = path.substring(path.lastIndexOf("\\") + 1);
			// 得到文件的扩展名(无扩展名时将得到全名)
			String t_ext = t_name
					.substring(t_name.lastIndexOf(".") + 1);
			// 拒绝接受规定文件格式之外的文件类型
			int allowFlag = 0;
			int allowedExtCount = allowedExt.length;
			for (; allowFlag < allowedExtCount; allowFlag++) {
				if (allowedExt[allowFlag].equals(t_ext.toLowerCase()))
					break;
			}
			if (allowFlag == allowedExtCount) {
				String s_type="";
				for (allowFlag = 0; allowFlag < allowedExtCount; allowFlag++)
					s_type += allowedExt[allowFlag] + ",";

				out.println("<script>alert('只能上传:"+s_type+"类型的文件!');history.back();</script>");
				return;
			}
			 
			mi_MarkSize = (int)size;
			ma_MarkBody = new byte[mi_MarkSize];//图片字节流
			ms_MarkType = t_ext;
			ma_MarkBody=fileItem.get();
			
		}

		md_MarkDate = GetDate();
		boolean mResult = false;
		if(ms_ID>0){
			String s_sql = "select D_SealName from eWebOffice_T_Seal where D_ID <> ? and D_SealName=?";
			stmt = con.prepareStatement(s_sql);
			stmt.setInt(1,ms_ID);
			stmt.setString(2,ms_MarkName);
			rs = stmt.executeQuery();
			if (rs.next()) {
				mResult = false;
			} else {
				mResult = true;
			}
			closeAll(null,stmt,rs);
			if (mResult) {
				String s_mess = "";
				try{
				con.setAutoCommit(false);
				String s_sql1 = "update eWebOffice_T_Seal set D_UserName=?,D_PassWord=?,D_SealName=?,D_FileBody=EMPTY_BLOB(),D_FileType=?,D_FileSize=?,D_FileDate=? WHERE D_ID=?";
				stmt = con.prepareStatement(s_sql1);
				stmt.setString(1,ms_UserName);
				stmt.setString(2,ms_PassWord);
				stmt.setString(3,ms_MarkName);
				stmt.setString(4,ms_MarkType);
				stmt.setInt(5,mi_MarkSize);
				stmt.setDate(6,md_MarkDate);
				stmt.setInt(7,ms_ID);
				
				int n_result = stmt.executeUpdate();
				s_sql1 = "select D_FileBody from eWebOffice_T_Seal where D_ID="+ms_ID+" for update";
        		boolean b_return = this.WriteBlob(con,s_sql1,ma_MarkBody);
        		con.commit();		
				if(n_result > 0&b_return){
					s_mess="<script>alert('保存成功!');window.location='seal_list.jsp';</script>";
				}else{
					s_mess="<script>alert('保存失败!');history.back();</script>";
				}
				}catch(Exception e){
					con.rollback();
					s_mess="<script>alert('保存失败!');history.back();</script>";
				}finally{
					closeAll(con,stmt,rs);
				}
				out.print(s_mess);
			 }else{
			 	out.println("<script>alert('保存失败!');history.back();</script>");
			 }
			 
		}else{
			String s_sql = "select D_SealName from eWebOffice_T_Seal where D_SealName='"
				+ ms_MarkName + "'";
			con = getConn();
			rs = ExecuteQuery(con,s_sql);
			if (rs.next()) {
				mResult = false;
			} else {
				mResult = true;
			}
			
			if (mResult) {
				String s_mess="";
				try{
				boolean b_return =false;
				con.setAutoCommit(false);
				
				s_sql = "insert into eWebOffice_T_Seal (D_UserName,D_PassWord,D_SealName,D_FileType,D_FileBody,D_FileSize,D_FileDate) values (?,?,?,?,EMPTY_BLOB(),?,?)";
				stmt = con.prepareStatement(s_sql);
				
				stmt.setString(1,ms_UserName);
				stmt.setString(2,ms_PassWord);
				stmt.setString(3,ms_MarkName);
				stmt.setString(4,ms_MarkType);
				stmt.setInt(5,mi_MarkSize);
				stmt.setDate(6,md_MarkDate);
				int n_result=stmt.executeUpdate();
				if(n_result>0){
					s_sql = "select Max(D_ID) from eWebOffice_T_Seal";
					
					rs =ExecuteQuery(con,s_sql);
					if(rs.next()){
						ms_ID = rs.getInt(1);
					}
					if(ms_ID>0){
						
						s_sql = "select D_FileBody from eWebOffice_T_Seal where D_ID="+ms_ID+" for update";
	        		    b_return = this.WriteBlob(con,s_sql,ma_MarkBody);
					}
				}
						
				if(b_return){
					con.commit();
					s_mess="<script>alert('保存成功!');window.location='seal_list.jsp';</script>";
				}else{
					con.rollback();
					s_mess="<script>alert('保存失败!');history.back();</script>";
				}
				}catch(Exception e){
					con.rollback();
					System.out.print(e.getMessage());
					s_mess="<script>alert('保存失败!');history.back();</script>";
				}finally{
					closeAll(con,stmt,rs);
				}
				out.print(s_mess);
			}else{
					out.println("<script>alert('保存失败!');history.back();</script>");
			}
		}
	}else{

			ms_ID = isNullOrEmpty(request.getParameter("id"))?0:Integer.parseInt(request.getParameter("id"));
			if(ms_ID>0){
	            String strSelectCmd = "select D_ID,D_UserName,D_PassWord,D_SealName from eWebOffice_T_Seal where D_ID =?";
	            con = getConn();
	            stmt = con.prepareStatement(strSelectCmd);
	            stmt.setInt(1,ms_ID);
				rs = stmt.executeQuery();
	                if (rs.next())
	                {
	                    ms_UserName = rs.getString("D_UserName");
	                    ms_PassWord = rs.getString("D_PassWord");
	                    ms_MarkName = rs.getString("D_SealName");
	                }
	                
	              
            }
	}
	closeAll(con,stmt,rs);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>eWebOffice示例 : 签章管理</title>
<link rel="Stylesheet" type="text/css" href="css/eweboffice.css" />


<script language="javascript">
function DoCheckSubmit(){
	if (document.getElementById("d_markname").value == ""){
		alert("请输入印签章名！");
		return false;
	}
	return true;
}
</script>

</head>
<body>
<div id="bdy">

<div id="nav">您当前位置 &gt;&gt; <a href="default.jsp">eWebOffice示例首页</a> &gt;&gt; <a href="seal_list.jsp">签章管理</a> &gt;&gt; 新增</div> 
<hr />



<form name="form1" method="post" enctype="multipart/form-data" action="?action=save" onsubmit="return DoCheckSubmit();" >
<input type="hidden" class="txt" name="id" size="50" id="id" value="<%=ms_ID %>"/>
<table class="edit">
	
<tr>
	<td>用户名称</td>
	<td><input type="text" class="txt" name="d_username" size="50" id="d_username" value="<%=ms_UserName %>"></td>
</tr>
<tr>
	<td>用户密码</td>
	<td><input type="text" class="txt" name="d_password" size="50" id="d_password" value="<%=ms_PassWord %>"></td>
</tr>
<tr>
	<td>签章名称</td>
	<td><input type="text" class="txt" name="d_markname" size="50" id="d_markname" value="<%=ms_MarkName %>"></td>
</tr>
<tr>
	<td>签章文件</td>
	<td><input type="file" class="file" name="d_markfile" size="50" id="d_markfile"></td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" class="btn" value=" 保 存 " />
		<input type="reset" class="btn" value=" 重 填 " />
		<input type="button" class="btn" value=" 返 回 " onclick="history.back();" />
	</td>
</tr>
</table>
</form>





<hr />
<div id="footer">Copyright &copy; <span style="color:Blue;">eWebSoft.com</span>, All Rights Reserved .&nbsp; 福州极限软件开发有限公司&nbsp; 邮箱：<a href="mailto:service@ewebsoft.com">service@ewebsoft.com</a>&nbsp; 官网：<a href="http://www.ewebsoft.com/eweboffice/" target="_blank">http://www.ewebsoft.com/eweboffice/</a></div>


</div>
</body>
</html>


