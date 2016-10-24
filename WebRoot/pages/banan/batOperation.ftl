<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
<link href="../sys_theme/css/base.css" rel="stylesheet" type="text/css" />
<link href="../sys_theme/css/main_style.css" rel="stylesheet" type="text/css" />
	
	<!--                       Javascripts 注意不要改变顺序                      -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>


		
	<form name="form" id="form" method="post" ENCTYPE="multipart/form-data">




	<input type="hidden" name="funcCode" value="${funcCode}" />
	<input type="hidden" name="ids" value="${ids}"/>
	<input type="hidden" name="listkeyword" value="${listkeyword}"/>
	<input type="hidden" name="batType" value="${batType}"/>
	<input type="hidden" name="listkeyword" value="${listkeyword}"/>
		
<div class="ui-form fn-clear"><br/><br/>
	<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table ui-table-form" >
	<#if batType==6||batType==8||batType==10>
		<tr>
			<th>请选择时间：</th>
			<td><input class="ui-input-wdm" type="text" onClick="WdatePicker()" value="${todate}"  id="batTime" name="batTime"/></td>
		</tr>
	<!-- 听证记录-->
	<#elseif batType==50>
		<tr>
			<th>添加听证记录：</th>
			<td>
				<input type="file" name="upFileTzjl" id="tzjl" class="inputTextFile" />
		    		
					<script type="text/javascript">
						var b=1;
						function view(){
							if(b==1){
								document.getElementById("tzjl").style.display="block";
								b=0;
							}
							else{
								document.getElementById("tzjl").style.display="none";
								b=1;
							}
						}
					</script>
				
			</td>
		</tr>
	<!-- 调解记录-->
	<#elseif batType==60>
		<tr>
			<th>添加调解记录：</th>
			<td>
				<input type="file" name="upFile1" id="tjjl" value="" class="inputTextFile" id="tj1" style="display:block" />
			</td>
		</tr>
	</#if>

	</table>
		<div align="center">
			<input type="button" id="finish" class="ui-btn ui-btn-normal" value="完成" style="display:block" onclick="savebat();"/>	
			<!--
		  	<#if batType==6||batType==8||batType==10>
		  	<input type="button" id="finish" class="ui-btn ui-btn-normal" value="完成" style="display:block" onclick="savebat1();"/>	
			<#elseif batType==50>
			<input type="button" id="finish" class="ui-btn ui-btn-normal" value="完成" style="display:block" onclick="savebat2();"/>
			<#elseif batType==60>
			<input type="button" id="finish" class="ui-btn ui-btn-normal" value="完成" style="display:block" onclick="savebat3();"/>
			</#if>
			-->
   		</div>
 </div>

</from>

</body>
</html>
<script>
	function savebat(){
		if(confirm("确定完成？")){
			window.form.action="savebat.action";	
			window.form.submit();
		}
	}
	function savebat1(){
		if(confirm("确定完成？")){
			var time=document.getElementById("batTime").value;

			
			window.location="../banan/savebat.action?funcCode=${funcCode}&listkeyword=${listkeyword}&ids=${ids}&batType=${batType}&batTime="+time;
			//window.form1.action="savebat.action";	
			//window.form1.submit();
		}
	}
	function savebat2(){
		if(confirm("确定完成？")){
			var tz=document.getElementById("tzjl").value;
			
			window.location="../banan/savebat.action?funcCode=${funcCode}&listkeyword=${listkeyword}&ids=${ids}&batType=${batType}&upFileTzjl="+tz;
			//window.form1.action="savebat.action";	
			//window.form1.submit();
		}
	}
	function savebat3(){
		if(confirm("确定完成？")){
			var tj=document.getElementById("tjjl").value;
			
			window.location="../banan/savebat.action?funcCode=${funcCode}&listkeyword=${listkeyword}&ids=${ids}&batType=${batType}&upFile1="+tj;
			//window.form1.action="savebat.action";	
			//window.form1.submit();
		}
	}

</script>
	