<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report" %>
<%@	page import="java.util.Date,java.text.SimpleDateFormat"%>
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>申报表</title>
<link href="../css/16B/style.css" rel="stylesheet" type="text/css">
<SCRIPT language="JavaScript" src="../css/19_b/Calendar.js"></SCRIPT>
</head>

<body leftMargin=0 topMargin=0 >
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" id=control>
  <tr>
    <td height="20">您的位置：申报表</td>
  </tr>
</table>
<br>
<%
	String user="";
	String wtdlr="";
	String beappname="";
	String receivedate="";
	String appType="";
	String isting="否";
	String startDate="";
	String endDate="";
	String tjjg="";
	String checker="";
	String jzfz="";
	String sqrSum="";
	String yijian="";
	String qingqiu="";
	String TBeName="";
	String annum="";
	String neirong="";
	String remark="";
	String content="";

	if(request.getParameter("jzfz")!=null)
		jzfz=request.getParameter("jzfz");

	if(request.getParameter("remark")!=null)
		remark=request.getParameter("remark");

	if(request.getParameter("content")!=null)
		content=request.getParameter("content");

	if(request.getParameter("TBeName")!=null)
		TBeName=request.getParameter("TBeName");

	if(request.getParameter("qingqiu")!=null)
		qingqiu=request.getParameter("qingqiu");

	if(request.getParameter("annum")!=null)
		annum=request.getParameter("annum");

	if(request.getParameter("yijian")!=null){
		yijian=request.getParameter("yijian");
		int qiIndex = yijian.indexOf("请");
		int bingIndex = yijian.indexOf("并");
		if (qiIndex != -1 && bingIndex != -1) {
			yijian = yijian.substring(0, qiIndex + 1) + "      "
					+ yijian.substring(bingIndex, yijian.length());
		}	
	}

	if(!content.equals("")){
		neirong="简要内容：\n　　"+content;
	}else{
		neirong="简要内容：\n　　";
	}

	if(request.getParameter("user")!=null)
		user=request.getParameter("user");

	if(request.getParameter("rencount")!=null)
		sqrSum=request.getParameter("rencount");

	int rencount=0;
	if(!sqrSum.equals("")){
		rencount=Integer.parseInt(sqrSum);
		if(rencount<2){
			if(user.indexOf("，")>0)
				user=user.substring(0,user.indexOf("，"));
		}else{
			if(user.indexOf("，")>0)
				user=user.substring(0,user.indexOf("，"))+"等"+rencount+"位";
		}

	}

	if(request.getParameter("wtdlr")!=null)
		wtdlr=request.getParameter("wtdlr");

	if(request.getParameter("beappname")!=null)
		beappname=request.getParameter("beappname");

	if(request.getParameter("receivedate")!=null)
		receivedate=request.getParameter("receivedate");

	if(request.getParameter("appType")!=null)
		appType=request.getParameter("appType");

	if(request.getParameter("isting")!=null)
		isting=request.getParameter("isting");

	if(request.getParameter("tjjg")!=null)
		tjjg=request.getParameter("tjjg");

	if(request.getParameter("endDate")!=null)
		endDate=request.getParameter("endDate");

	if(request.getParameter("startDate")!=null)
		startDate=request.getParameter("startDate");

	if(request.getParameter("checker")!=null)
		checker=request.getParameter("checker");

	String rdate="";
	if(startDate.equals("") && endDate.equals(""))
		rdate="无";
	else
		rdate=startDate+" 至 "+endDate;
	
	remark="　　"+remark;
	String param="app="+user+";dlr="+wtdlr+";beename="+beappname+";rdate="+receivedate+";apptype="+appType+";isting="+isting+";tiaojie="+tjjg+";checker="+checker+";bzdate="+rdate+";jzfz="+jzfz+";yijian="+yijian+";neirong="+neirong+";remark="+remark+";";
	String raq="application_Sheet1.raq";
%>
    
</table>
<%
	String appmap = request.getContextPath();
	String printImage = "<img src='" + appmap + "/images/print.gif' border=no style='vertical-align:middle'>";
	String excelImage = "<img src='" + appmap + "/images/excel.gif' border=no style='vertical-align:middle'>";
	String pdfImage = "<img src='" + appmap + "/images/pdf.gif' border=no style='vertical-align:middle'>";
	String firstPageImage = "<img src='" + appmap + "/images/firstpage.gif' border=no style='vertical-align:middle'>";
	String lastPageImage = "<img src='" + appmap + "/images/lastpage.gif' border=no style='vertical-align:middle'>";
	String nextPageImage = "<img src='" + appmap + "/images/nextpage.gif' border=no style='vertical-align:middle'>";
	String prevPageImage = "<img src='" + appmap + "/images/prevpage.gif' border=no style='vertical-align:middle'>";
	String submitImage = "<img src='" + appmap + "/images/savedata.gif' border=no style='vertical-align:middle'>";
	
	%>

		<table width="60%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">

			<tr >
				<td align='right'>
				<input type="button" value=打印 onClick="report1_print();return false;"> 
				<input type="button" value=excel onClick="report1_saveAsExcel();return false;"> 
				<input type="button" value=pdf onClick="report1_saveAsPdf();return false;"> 
				<input type="button" value=Word onClick="report1_saveAsWord();return false;"> 
			  </td>
			</tr>
	  </table>
	


<div id=div1 style="overflow:auto;vertical-align:top" onscroll="_reportScroll( 'report1' )" >
	<table id=rpt align=center><tr><td>
				<!--<report:param name = "report0" paramFileName = "fzb_param.raq" needSubmit = "yes"/>-->
				<report:html name="report1" reportFileName="<%=raq%>" excelPageStyle="0" params="<%=param%>" 
				/>
			</td>
		
		</tr>
	</table>
	</td>
	</tr>
	</table>
	</div>
<script language="javascript">
function check_byyear(){
	document.getElementById("byYear").style.display="block";
	document.getElementById("by").checked=true;
	document.getElementById("bd").checked=false;
	document.getElementById("byDate").style.display="none";
	document.getElementById("mark").value="1";

	//document.getElementById("byDate2").style.display="none";
}

function check_bydate(){
	document.getElementById("byYear").style.display="none";
	document.getElementById("byDate").style.display="block";
	document.getElementById("bd").checked=true;
	document.getElementById("by").checked=false;
	document.getElementById("mark").value="2";
	//document.getElementById("byDate2").style.display="block";
}

function check_submit(){
	if(document.getElementById("by").checked==true){
		document.getElementById("mark").value="1";
	}else if(document.getElementById("bd").checked==true){
		document.getElementById("mark").value="2";
	}
	window.StatisticsForm.submit();
}

	//document.getElementById( "t_page_span" ).innerHTML=report1_getTotalPage();
	//document.getElementById( "c_page_span" ).innerHTML=report1_getCurrPage();
</script>
</body>
</html>
