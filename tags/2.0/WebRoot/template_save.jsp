<%@ page language="java" import="java.util.*,java.sql.*,java.text.SimpleDateFormat" pageEncoding="UTF-8"%>
<%@include file="DBHelper.jsp" %>
<%
		System.out.println("template_save.jsp");


	    String ms_TemplateID;
    	String ms_FileName="";
    	String ms_Descript="";
	    Connection con = null;
	    PreparedStatement stmt = null;
	    String s_alert="";
	    request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
        ms_TemplateID = request.getParameter("d_templateid")+"";
        ms_FileName = request.getParameter("d_filename")+"";
        String  s_sql = "";
       if(!isNullOrEmpty(ms_TemplateID)){
	        try
	        {        
	        	con = getConn();
		        s_sql = "Update eWebOffice_T_TemplateFile Set D_FileName =?,D_Descript =? Where D_TemplateID=?";
		        stmt= con.prepareStatement(s_sql);
		        stmt.setString(1,ms_FileName);
		        stmt.setString(2,ms_Descript);
		        stmt.setString(3,ms_TemplateID);
	            if(stmt.executeUpdate()>0){
	            	s_alert="<script>alert('修改成功!');window.location='template_list.jsp';</script>";
	            }else{
	            	s_alert="<script>alert('修改失败!');window.location='template_list.jsp';</script>";
	            }
	        }
	        catch (Exception ex)
	        {
	            s_alert="<script>alert('修改失败!');window.location='template_list.jsp';</script>";
	        }finally{
	        	closeAll(con,stmt,null);
	        }
	        response.getWriter().write(s_alert);
	   }
%>