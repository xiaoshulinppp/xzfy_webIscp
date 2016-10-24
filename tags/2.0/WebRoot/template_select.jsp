<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@include file="DBHelper.jsp" %>
<%!
    //列出所有模版
    public String LoadTemplateOptions()
    {
        Connection con = null;
		ResultSet rs = null;
        String s_Options="";
        String strSelectCmd = "Select D_TemplateID,D_FileType,D_FileName,D_Descript From eWebOffice_T_TemplateFile order by D_ID desc";
        
        try{
	        con = getConn();
	        rs = ExecuteQuery(con,strSelectCmd);
	        while(rs.next())
	        {
	            s_Options = s_Options + "<option value='" + rs.getString("D_TemplateID") + "'>" + rs.getString("D_Descript") + "</option>" + "\r\n";
	        }
        }catch(Exception e){
      		s_Options = s_Options + "<option>没有数据</option>";
        }
        finally{
  			closeAll(con,null,rs);
        }
        
        return (s_Options);
    }
    
    %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1">
<link rel="Stylesheet" type="text/css" href="css/eweboffice.css" />
<title>选择模板列表</title>
    
<script type="text/javascript">
    function DoClickOk(o_Form){
        var o_Arg = window.dialogArguments;			//获取父页面传来的对话框参数
        o_Arg.TemplateID = o_Form.d_template.value;	//obj.模板ID = 表单.下拉框选中的模板
        window.close();								//关闭模式窗口
        return;
    }
</script>
  
</head>
<body>


<form name="form1">
<table  cellspacing="5" align="center">
	<tr>
		<td>模版名称：<select name=d_template style='width:250px;'><%=LoadTemplateOptions()%></select></td>
	</tr>    
	<tr>
		<td align="right">
			<input type=button class="btn" value="  确定  " onclick="DoClickOk(this.form);">
			<input type=button class="btn" value="  取消  " onclick="window.close();"> 
		</td>
	</tr>
</table>
</form>

</body>
</html>


    