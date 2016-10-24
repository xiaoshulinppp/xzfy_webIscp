<%@ page language="java" import="java.util.*,java.sql.*,java.text.SimpleDateFormat" pageEncoding="UTF-8"%>
<%@include file="DBHelper.jsp" %>
<%!

	Connection con = null;
	ResultSet rs = null;
	public String ms_Action;
    public String ms_TemplateID;
    public String ms_FileName;
    public String ms_Descript;
    public String ms_FileType;
    public String ms_UserName;
    public String ms_WebUrl;
    public String ms_ActionDesc;
 %>
 
 <%
 		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
 		ms_Action = request.getParameter("action") + "";
       
		
		if (ms_Action.equals("edit") )
        {
            //修改模板
            ms_TemplateID = request.getParameter("d_templateid")+ "";
            ms_ActionDesc = "修改";

            try{
	            String s_sql = "Select * From eWebOffice_T_TemplateFile Where D_TemplateID='" + ms_TemplateID + "'";
	            con = getConn();
	            rs = ExecuteQuery(con,s_sql);
	            if (rs.next())
	            {
	                ms_TemplateID = rs.getString("D_TemplateID");
	                ms_FileName = rs.getString("D_FileName");
	                ms_FileType = rs.getString("D_FileType");
	                ms_Descript = rs.getString("D_Descript");
	                ms_UserName=rs.getString("D_UserName");
	            }
	         }catch(Exception e){
	         	response.getWriter().write(e.getMessage());
	         }finally{
	         	closeAll(con,null,rs);
	         }
        }
        else
        {
            //新建模板
            ms_FileType =  request.getParameter("d_filetype")+"";

            ms_ActionDesc = "新建";
            ms_UserName = "测试用户";
            ms_TemplateID = getDateTimeFormat();
            ms_FileName = "";
            ms_Descript = "";
        }
		
        
        ms_WebUrl= request.getContextPath();
	    ms_WebUrl=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ms_WebUrl+"/";
	    ms_WebUrl +="eWebOffice/eWebOfficeAction.jsp";
  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>eWebOffice示例 : 模板管理</title>
<link rel="Stylesheet" type="text/css" href="css/eweboffice.css" />

<!--引用eWebOffice公用脚本-->
<script type="text/javascript" src="eWebOffice/eWebOffice.js"></script>


<script type="text/javascript">

//表单检测，保存
function DoCheckSubmit(){
    if (document.getElementById("d_filename").value==""){
        alert("模板名称不能为空！");
        return false;
    }
    try{
		
        if ((eWebOffice1.CurFileType=="DOC") || (eWebOffice1.CurFileType=="WPS")){
            eWebOffice1.WebSaveBookmark()       //交互Action="SAVEBOOKMARK"，保存模板的所有书签
        }
        return eWebOffice1.WebSaveTemplate();   //交互Action="SAVETEMPLATE"，保存模板
    }catch(e){
        alert("请选安装eWebOffice控件，再操作！");
        return false;
    }
    

} 



//作用：标签管理
function DoWebOpenBookmark(){
    eWebOffice1.WebOpenBookmark();    //交互Action="LISTBOOKMARK"
}

//作用：填充模板
function DoLoadBookmark(){
    eWebOffice1.WebLoadBookmark();    //交互Action="LOADBOOKMARK"
}

//作用：根据标签名称获取标签值
//  s_Name:标签名称
function DoGetBookmark(s_Name){
	alert(eWebOffice1.WebObject.Bookmarks.Item(1));
	//eWebOffice1.WebMsgSetString("BookmarkName1","承办人第二");
	//alert(eWebOffice1.WebMsgGetString("BookmarkName1"));
    //var s_Text = eWebOffice1.GetBookmarkText("承办人");
	//eWebOffice1.SetBookmarkText("承办人", "承办人第二");
    //alert(s_Text);
}

//作用：设置书签值
//  s_Name:标签名称,注意大小写
//  s_Text:标签值
function DoSetBookmark(s_Name, s_Text){
    eWebOffice1.SetBookmarkText(s_Name, s_Text);
}





</script>


<script type="text/javascript" for="eWebOffice1" event="OnInit()">
    eWebOffice1.QuickBarCommentVisible = false;
</script>

<script type="text/javascript" for="eWebOffice1" event="OnLoad()">
    eWebOffice1.WebUrl="<%=ms_WebUrl%>";            //WebUrl:系统服务器路径，与服务器文件交互操作，如保存、打开文档，重要文件
    eWebOffice1.FileType="<%=ms_FileType%>";        //FileType:文档类型  doc  xls 
    eWebOffice1.UserName="<%=ms_UserName%>";        //UserName:操作用户名
    eWebOffice1.TemplateID="<%=ms_TemplateID%>";    //Template:模板编号，如果是新建，就在webNew之后赋值模板编号
    <% if(ms_Action.equals("edit")){ %>
        eWebOffice1.WebOpenTemplate();              //打开模板
    <%}else{ %>
        eWebOffice1.WebNewTemplate();
    <%} %>
	
</script>

</head>
<body>
<div id="bdy">

<div id="nav">您当前位置 &gt;&gt; <a href="default.jsp">eWebOffice示例首页</a> &gt;&gt; <a href="template_list.jsp">模板管理</a> &gt;&gt; 编辑[<span class=red><%=ms_ActionDesc %></span>]</div> 
<hr />

<div id="templateleft">
    <table cellspacing=3 class="tlt">
    <tr><td><input type=button value="定义标签" class="btn90"  onclick="DoWebOpenBookmark()"></td></tr>
    <tr><td><input type=button value="填充模版" class="btn90" onclick="DoLoadBookmark()"></td></tr>
    <tr><td><input type=button value="打开文件" class="btn90" onclick="eWebOffice1.LocalOpen()"></td></tr>
    <tr><td><input type=button value="保存文件" class="btn90" onclick="eWebOffice1.LocalSave()"></td></tr>
    <tr><td><input type=button value="获取标签值" class="btn90"  onclick="DoGetBookmark('Title')"></td></tr>
    <tr><td><input type=button value="设置标签值" class="btn90" onclick="DoSetBookmark('Title','福州极限软件开发有限公司')"></td></tr>
    </table>
</div>

<div id="templatemain">
    <form name="form1" method="post" action="template_save.jsp" onsubmit="return DoCheckSubmit();">
    <input type=hidden name="d_templateid"  id="d_templateid"  value="<%=ms_TemplateID%>"/>
    <table class="edit">
    <tr>
      <td align=center>模版名称</td>
      <td><input type=text class=txt name="d_filename" id="d_filename" value="<%=ms_FileName%>" size=50></td>
      <td align=center rowspan="2">
        <input class="btn4" type=submit value="保存模板">
        <input class="btn4" type=button value="返回列表" onclick="location.href='template_list.jsp'">
        <br /><br /><span class=red>注意：只有选择《保存》后，所做的操作才有效！</span></td>
    </tr>
    <tr>
      <td align=center>模板说明</td>
      <td><input type=text class=txt name="d_descript" id="d_descript" value="<%=ms_Descript%>" size=50></td>
    </tr>
    </table>
    </form>

    <!--创建eWebOffice实例-->
    <script type="text/javascript">
    eWebOfficeJS.Create("eWebOffice1", "100%", "700px");
    </script>

</div>
<div id="footer"><hr />Copyright &copy; <span style="color:Blue;">eWebSoft.com</span>, All Rights Reserved .&nbsp; 福州极限软件开发有限公司&nbsp; 邮箱：<a href="mailto:service@ewebsoft.com">service@ewebsoft.com</a>&nbsp; 官网：<a href="http://www.ewebsoft.com/eweboffice/" target="_blank">http://www.ewebsoft.com/eweboffice/</a></div>


</div>
</body>
</html>