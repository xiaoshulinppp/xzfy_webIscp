<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@include file="DBHelper.jsp" %>
<%
		Connection con = getConn();
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
		String mRecordID = "";
    	String mSubject = "";
    	String mAuthor = "";
    	String mFileDate = "";
    	String mFileType = "";

		String s_sql="";
		String s_alert="";
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
        mRecordID = request.getParameter("d_recordid")+"";
        mSubject = request.getParameter("d_subject")+"";
        mAuthor = request.getParameter("d_author")+"";
        mFileType = request.getParameter("d_filetype")+"";
 		mFileDate = GetDateTime();
        
        //保存表单基本信息
        s_sql = "SELECT D_RecordID from  eWebOffice_T_Document Where D_RecordID='" + mRecordID + "'";
		rs = ExecuteQuery(con,s_sql);
        if (rs.next())
        {
            s_sql = "update eWebOffice_T_Document set D_RecordID=?,D_Subject=?,D_Author=?,D_FileDate=?,D_FileType=? where D_RecordID='" + mRecordID + "'";
        }
        else
        {
            s_sql = "insert into eWebOffice_T_Document (D_RecordID,D_Subject,D_Author,D_FileDate,D_FileType) values (?,?,?,?,?)";
        }
        stmt=con.prepareStatement(s_sql);
        stmt.setString(1,mRecordID);
        stmt.setString(2,mSubject);
        stmt.setString(3,mAuthor);
        stmt.setDate(4,this.GetDate());
        stmt.setString(5,mFileType);
        int count = stmt.executeUpdate();
        if(count > 0){
        	s_alert="<script>alert('操作成功!');window.location='bac_default.jsp';</script>";
        }else{
        	s_alert="<script>alert('操作失败!');window.location='bac_default.jsp';</script>";
        }
        response.getWriter().write(s_alert);
%>