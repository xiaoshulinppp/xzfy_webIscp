<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@include file="DBHelper.jsp" %>
<%
		Connection con = null;
	    PreparedStatement stmt = null;
	    request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	 	String s_ID = request.getParameter("id")+"";
		String ms_TemplateID = request.getParameter("d_templateid") + "";
	 	String s_alert="";
	 	if(!isNullOrEmpty(s_ID)){
        	String s_sql = "Delete from eWebOffice_T_BookMark where D_ID =?";
       		try{
       			con = getConn();
       			stmt = con.prepareStatement(s_sql);
       			stmt.setString(1,s_ID);
       			if(stmt.executeUpdate()>0){
       				s_alert = "<script>alert('删除成功!');window.location='bac_bookmark_list.jsp?d_templateid="+ms_TemplateID+"';</script>";
       			}else{
       				s_alert = "<script>alert('数据不存在!');window.location='bac_bookmark_list.jsp?d_templateid="+ms_TemplateID+"';</script>";
       			}
       		}catch(Exception e){
       			
       		}finally{
       			closeAll(con,stmt,null);
       		}
        }else{
        	s_alert = "<script>alert('无效的参数!');window.location='bac_bookmark_list.jsp?d_templateid="+ms_TemplateID+"';</script>";
        }
        response.getWriter().write(s_alert);
%>