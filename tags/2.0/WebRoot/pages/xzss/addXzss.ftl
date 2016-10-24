<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../plugs/kindeditor/kindeditor.js"></script>
		<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="../js/16B/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="../js/16B/tpl.base.js"></script>
		<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
	</head>
	<body>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
			<tr>
				<td>诉讼案件录入</td>
			</tr>
		</table>
		
		
		
		<form id="form1" name="form1" action="''" method="post" ENCTYPE="multipart/form-data">
		
		<input type="hidden" name="funcCode" value="${funcCode}" />
		<input type="text" name="xzssInfo.id" value="${tempid}" />
		<input type="hidden" name="xzssInfo.status" value="待办理" />
		
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
		
			<tr class="trcolor">      
	     		<td class="tdFormText" width="25%" >收案日期：</td>
			    <td class="tdFormInput" width="25%" >
				    <input name="xzssInfo.receive_date" type="text" class="inputTextNormal"  
				     value="${todate}" onClick="WdatePicker()" altname="收案日期" >
			    </td>
			    <td class="tdFormText">承办人</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.undertaker_name" value="${admit_name}" class="inputTextNormal" />
				</td>
	  		</tr>
		
			<tr class="trwhite">
				<td class="tdFormText">复议承办人</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.fyundertaker_name" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">原告姓名</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.app_name" value="" class="inputTextNormal" />
				</td>
			</tr>
		
			<tr class="trwhite">
				<td class="tdFormText">原告总数</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.app_num" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">原告类别</td>
				<td class="tdFormInput">
					<select name="xzssInfo.app_type"  >
				      <option value="0">----请选择----</option>
				      <option value="1">公民</option>
				      <option value="2">法人或其他组织</option>
				    </select>
				</td>
				
	
				
			</tr>

			
			<tr class="trwhite">
				<td class="tdFormText">被告姓名</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.defendant" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">代理人</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.agent" value="" class="inputTextNormal" />
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">应诉机关类别</td>
				<td class="tdFormInput">
				<!--<input type="text" name="xzssInfo.jiguan_type" value="" class="inputTextNormal" /> -->
					<select name="xzssInfo.jiguan_type"  >
				      <option value="0">----请选择----</option>
				      <option value="1">原具体行政行为机关</option>
				      <option value="2">复议机关</option>
				    </select>
				</td>
				<td class="tdFormText">应诉机关级别</td>
				<td class="tdFormInput">
					<!--<input type="text" name="xzssInfo.jiguan_level" value="" class="inputTextNormal" /> -->
					<select name="xzssInfo.jiguan_level"  >
				      <option value="0">----请选择----</option>
				      <option value="1">乡镇政府</option>
				      <option value="2">县级政府</option>
				      <option value="3">县级政府部门</option>
				      <option value="4">省部级行政机关</option>
				      <option value="5">省部级部门</option>
				      <option value="6">其他</option>				      
				    </select>
				</td>
			</tr>
			<tr class="trwhite">	
				<td class="tdFormText">应诉机关</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.jiguan" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">诉讼请求</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.request" value="" class="inputTextNormal" />
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">行政管理类别</td>
				<td class="tdFormInput">
				<!-- 
					<input type="text" name="xzssInfo.manage_type" value="" class="inputTextNormal" />
					-->
					
				 
					
							<select name="xzssInfo.manage_type"   id="ajsjfm1"  onchange="ajgllb()">
						        <option value=0>----请选择----</option>
								<option value="1">公安</option>
								<option value="2">国家安全</option>
								<option value="3">劳动和社会保障</option>
								<option value="4">司法行政</option>
								<option value="5">民政</option>
								<option value="6">农林环资</option>
								<option value="7">城建</option>
								<option value="8">工交商事</option>
								<option value="9">财政金融</option>
								<option value="10">教科文卫</option>
								<option value="11">其他</option>
						    </select>
						    
						    
						     <!--公安-->
						     <select name="xzssInfo.manage_type1" style="display:none"  id="ajgllbga"  ishidden="y">
						        <option value=0>----请选择----</option>
								<option value=1>治安</option>
								<option value=2>劳教</option>
								<option value=3>其他</option>
							 </select>
							 
						
							 
							 <!--农林环资-->	 
							 <select name="xzssInfo.manage_type1" style="display:none" id="ajgllbnlhz" ishidden="y">
							  	<option value=0>----请选择----</option>
								<option value=9>土地</option>
								<option value=10>地矿</option>
								<option value=11>环保</option>
								<option value=12>农业</option>
								<option value=13>水利</option>
								<option value=14>林业</option>
								<option value=15>其他</option>
							 </select>
							
						
							
							 <!--城建-->
							 <select name="xzssInfo.manage_type1" style="display:none" class="selectStyleNormal" id="ajgllbcj" altname="行政管理类别" ishidden="y">
							  	<option value=0>----请选择----</option>
								<option value=17>城市规划</option>
								<option value=18>房屋拆迁</option>
								<option value=19>房屋登记</option>
								<option value=20>其他</option>					
							</select>
						
							 <!--工交商事-->
							 <select name="xzssInfo.manage_type1" style="display:none" class="selectStyleNormal" id="ajgllbgjss" altname="行政管理类别" ishidden="y">
							  	<option value=0>----请选择----</option>
								<option value=22>工商</option>
								<option value=23>质监</option>
								<option value=24>商务</option>
								<option value=25>物价</option>
								<option value=26>能源</option>
								<option value=27>交通</option>
								<option value=28>信息产业</option>
								<option value=29>邮政</option>
								<option value=30>烟草专买</option>
							</select>
						
							 <!--财政金融-->
							 <select name="xzssInfo.manage_type1" style="display:none" class="selectStyleNormal" id="ajgllbczjr" altname="行政管理类别" ishidden="y">
							  	<option value=0>----请选择----</option>
								<option value=32>税务</option>
								<option value=33>人民银行</option>
								<option value=34>证监</option>
								<option value=35>保监</option>
								<option value=36>银监</option>
								<option value=37>外汇</option>
								<option value=38>财政</option>
								<option value=39>统计</option>
								<option value=40>审计</option>
								<option value=41>海关</option>
								<option value=42>商检</option>						
							</select>
							
							 <!--教科文卫-->
							 <select name="xzssInfo.manage_type1" style="display:none" class="selectStyleNormal" id="ajgllbjkww" altname="行政管理类别" ishidden="y">
							  	<option value=0>----请选择----</option>
								<option value=44>药监</option>
								<option value=45>卫生</option>
								<option value=46>计划生育</option>
								<option value=47>教育</option>
								<option value=48>文化</option>
								<option value=49>专利</option>
								<option value=50>商标</option>
								<option value=51>版权</option>
								<option value=52>旅游</option>
						     </select>
					
					
					
					
					
				</td>
				
				<td class="tdFormText">是否行政赔偿</td>
				<td class="tdFormInput">
					<input type="radio" name="xzssInfo.ismoney" value="是"  />  是
					<input type="radio" name="xzssInfo.ismoney" value="否"  />  否
				</td>
			</tr>
			
			
			
			<tr class="trwhite">
				<td class="tdFormText">被诉具体行政行为名称</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.action_name" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">被诉具体行政行为案号</td>
				<td class="tdFormInput">
					<input type="text" name="xzssInfo.action_id" value="" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">司法建议</td>
				<td class="tdFormInput">
					<textarea cols="30" rows="5" type="text" name="xzssInfo.issifajianyi" value="" class="inputTextNormal" />
					</textarea>
				</td>
				<td class="tdFormText">应诉通知</td>
				<td class="tdFormInput">
					<input type="file" name="upFile" value="" class="inputTextFile" />
				</td>
			</tr>
			<!--
			<tr class="trwhite">
				<td class="tdFormText">结案文书</td>
				<td class="tdFormInput">
					<input type="file" name="upFile1" value="" class="inputTextFile" />
				</td>
				<td class="tdFormText">结案日期</td>
				
				<td class="tdFormInput" width="25%" >
				    <input name="xzssInfo.jieandate" type="text" class="inputTextNormal"  
				     value="" onClick="WdatePicker()"  >
			    </td>
			</tr>
			-->
			<tr class="trwhite">
			
				<td class="tdFormText">是否已复议</td>
				<td class="tdFormInput">
					<!--xzssInfo.fuyi_id-->
					<!--<input type="hidden" name="xzssInfo.fuyi_id" value="tempfuyi_id" />-->
					<select name="xzssInfo.fuyi_id"   id="sffyselect"  onchange="sfxzfy()">
						<option value="">否</option>
						<option value="1">是</option>	
				   	</select>
					<input type="button" style="display:none"  id="sffybutton1"  value="关联" class="button" onclick="search();"/>
					<p align="center">
						<a href="javascript:opendg('../xzss/search.action?funcCode=${funcCode}',900,600)"  style="display:none" id="sffybutton" >关联</a>
					</p>
				</td>
				
				
				<td class="tdFormText">是否已一审</td>
				<td class="tdFormInput">
					<!--<input type="hidden" name="xzssInfo.shen1" value="tempshen1"  />-->
					<select name="ss"   id="sf1sselect"  onchange="sf1s()">
						<option value="">否</option>
						<option value="1">是</option>	
				   	</select>
				   	
				   		<input type="text" name="xzssInfo.shen1" id="shen1" value="" class="inputTextNormal" />
					
					<p align="center">
						<a href="javascript:opendg('../xzss/search.action?funcCode=${funcCode}&panduanGL=${"1"}',900,600)"  style="display:none" id="sf1sbutton" >关联</a>
					</p>
					
				</td>
			</tr>
			
			
			<tr class="trwhite">
				<td class="tdFormText">是否已二审</td>
				<td class="tdFormInput">
					<!--<input type="hiddden" name="xzssInfo.shen2" value="tempshen2"  />-->
					<select name="ss"   id="sf2sselect"  onchange="sf2s()">
						<option value="">否</option>
						<option value="1">是</option>	
				   	</select>
				   	
				   	<input type="text" name="xzssInfo.shen2" id="shen2" value="" class="inputTextNormal" />
				   	
					<p align="center">
						<a href="javascript:opendg('../xzss/search.action?funcCode=${funcCode}&panduanGL=${"2"}',900,600)"  style="display:none" id="sf2sbutton" >关联</a>
					</p>
				</td>
				<td class="tdFormText" style="display:none">是否三审</td>
				<td class="tdFormInput" style="display:none">
					<input type="text" name="xzssInfo.shen3" value="" class="inputTextNormal" />
				</td>
			</tr>
			
	
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<input type="button" id="sunbt" class="button" value="提 交" onclick="createXzss();" />
					
				</td>
			</tr>
			
		</form>
		</table>
	</body>
</html>


<script type="text/javascript">
	function createXzss(){
	alert(document.getElementById("shen1").value);
		if(confirm("确认提交？")){
		
			window.form1.action="saveXzss.action";
			window.form1.submit();
		}
	}
</script>

<script type="text/javascript">	
					男性：
					<input type="radio" name="Sex" value="male" />
					女性：
					<input type="radio" name="Sex" value="female" />
					<td class="tdFormInput">
						<select name="xzfyApp.sexy">
							<option value="1" >男</option>
							<option value="2" >女</option>
						</select>
					</td>
</script>

<script type="text/javascript">	
				function sfxzfy(){

					if(document.getElementById("sffyselect").value=="1"){
						//alert(1);
						document.getElementById("sffybutton").style.display="block";
					}
					else if(document.getElementById("sffyselect").value==""){
						//alert(0);
						document.getElementById("sffybutton").style.display="none";
					}
					else{
						alert(2);
					}
				}
				
				function sf1s(){

					if(document.getElementById("sf1sselect").value=="1"){
						//alert(1);
						document.getElementById("sf1sbutton").style.display="block";
					}
					else if(document.getElementById("sf1sselect").value==""){
						//alert(0);
						document.getElementById("sf1sbutton").style.display="none";
					}
					else{
						alert(2);
					}
				}
				
				function sf2s(){

					if(document.getElementById("sf2sselect").value=="1"){
						//alert(1);
						document.getElementById("sf2sbutton").style.display="block";
					}
					else if(document.getElementById("sf2sselect").value==""){
						//alert(0);
						document.getElementById("sf2sbutton").style.display="none";
					}
					else{
						alert(2);
					}
				}
				
				function opendg(dgurl,dgw,dgh)
				{
				//alert(1111);
				  $.dialog({ 
				    title:'申请人管理',
				    width: dgw,
				    height: dgh,
				    content:'url:'+ dgurl});
				}
</script>

<script type="text/javascript">	
				function ajgllb(){
				//alert(11);
					//document.getElementById("yxsw_n").checked=true;
					//document.getElementById("yxswlabel").style.display="none";
					//document.getElementById("yxswinput").style.display="none";
					//alert(document.getElementById("ajsjfm1").value);
					if(document.getElementById("ajsjfm1").value=="1"){
					//alert(1111);
						document.getElementById("ajgllbga").style.display="block";
						document.getElementById("ajgllbnlhz").style.display="none";
						document.getElementById("ajgllbcj").style.display="none";
						document.getElementById("ajgllbgjss").style.display="none";
						document.getElementById("ajgllbczjr").style.display="none";
						document.getElementById("ajgllbjkww").style.display="none";
						
						document.getElementById("ajgllbga").name="xzssInfo.manage_type1";
						document.getElementById("ajgllbnlhz").name="sss";
						document.getElementById("ajgllbcj").name="sss";
						document.getElementById("ajgllbgjss").name="sss";
						document.getElementById("ajgllbczjr").name="sss";
						document.getElementById("ajgllbjkww").name="sss";
				
						
					}
					if(document.getElementById("ajsjfm1").value=="6"){
						document.getElementById("ajgllbga").style.display="none";
						document.getElementById("ajgllbnlhz").style.display="block";
						document.getElementById("ajgllbcj").style.display="none";
						document.getElementById("ajgllbgjss").style.display="none";
						document.getElementById("ajgllbczjr").style.display="none";
						document.getElementById("ajgllbjkww").style.display="none";
						
						document.getElementById("ajgllbga").name="sss";
						document.getElementById("ajgllbnlhz").name="xzssInfo.manage_type1";
						document.getElementById("ajgllbcj").name="sss";
						document.getElementById("ajgllbgjss").name="sss";
						document.getElementById("ajgllbczjr").name="sss";
						document.getElementById("ajgllbjkww").name="sss";
				
				
				
					}
					if(document.getElementById("ajsjfm1").value=="7"){
						document.getElementById("ajgllbga").style.display="none";
						document.getElementById("ajgllbnlhz").style.display="none";
						document.getElementById("ajgllbcj").style.display="block";
						document.getElementById("ajgllbgjss").style.display="none";
						document.getElementById("ajgllbczjr").style.display="none";
						document.getElementById("ajgllbjkww").style.display="none";
						
						document.getElementById("ajgllbga").name="sss";
						document.getElementById("ajgllbnlhz").name="sss";
						document.getElementById("ajgllbcj").name="xzssInfo.manage_type1";
						document.getElementById("ajgllbgjss").name="sss";
						document.getElementById("ajgllbczjr").name="sss";
						document.getElementById("ajgllbjkww").name="sss";
					}
				
					if(document.getElementById("ajsjfm1").value=="8"){
						document.getElementById("ajgllbga").style.display="none";
						document.getElementById("ajgllbnlhz").style.display="none";
						document.getElementById("ajgllbcj").style.display="none";
						document.getElementById("ajgllbgjss").style.display="block";
						document.getElementById("ajgllbczjr").style.display="none";
						document.getElementById("ajgllbjkww").style.display="none";
						
						document.getElementById("ajgllbga").name="sss";
						document.getElementById("ajgllbnlhz").name="sss";
						document.getElementById("ajgllbcj").name="sss";
						document.getElementById("ajgllbgjss").name="xzssInfo.manage_type1";
						document.getElementById("ajgllbczjr").name="sss";
						document.getElementById("ajgllbjkww").name="sss";
					}
					if(document.getElementById("ajsjfm1").value=="9"){
						document.getElementById("ajgllbga").style.display="none";
						document.getElementById("ajgllbnlhz").style.display="none";
						document.getElementById("ajgllbcj").style.display="none";
						document.getElementById("ajgllbgjss").style.display="none";
						document.getElementById("ajgllbczjr").style.display="block";
						document.getElementById("ajgllbjkww").style.display="none";
						
						document.getElementById("ajgllbga").name="sss";
						document.getElementById("ajgllbnlhz").name="sss";
						document.getElementById("ajgllbcj").name="sss";
						document.getElementById("ajgllbgjss").name="sss";
						document.getElementById("ajgllbczjr").name="xzssInfo.manage_type1";
						document.getElementById("ajgllbjkww").name="sss";
					}
					if(document.getElementById("ajsjfm1").value=="10"){
						document.getElementById("ajgllbga").style.display="none";
						document.getElementById("ajgllbnlhz").style.display="none";
						document.getElementById("ajgllbcj").style.display="none";
						document.getElementById("ajgllbgjss").style.display="none";
						document.getElementById("ajgllbczjr").style.display="none";
						document.getElementById("ajgllbjkww").style.display="block";
						
						document.getElementById("ajgllbga").name="sss";
						document.getElementById("ajgllbnlhz").name="sss";
						document.getElementById("ajgllbcj").name="sss";
						document.getElementById("ajgllbgjss").name="sss";
						document.getElementById("ajgllbczjr").name="sss";
						document.getElementById("ajgllbjkww").name="xzssInfo.manage_type1";
					}
					/*
					if(document.getElementById("sffyselect").value=="是"){
						alert(aaaaa);
						document.getElementById("sffybutton").style.display="block";
					}
					*/
				
					if(!(document.getElementById("ajsjfm1").value=='1'||document.getElementById("ajsjfm1").value=="6"||document.getElementById("ajsjfm1").value=="7"||document.getElementById("ajsjfm1").value=="8"||document.getElementById("ajsjfm1").value=="9"||document.getElementById("ajsjfm1").value=="10"))
					{
						//alert(22222);
						document.getElementById("ajgllbga").style.display="none";
						document.getElementById("ajgllbnlhz").style.display="none";
						document.getElementById("ajgllbcj").style.display="none";
						document.getElementById("ajgllbgjss").style.display="none";
						document.getElementById("ajgllbczjr").style.display="none";
						document.getElementById("ajgllbjkww").style.display="none";
						document.getElementById("sffybutton").style.display="none";
						
						document.getElementById("ajgllbga").name="sss";
						document.getElementById("ajgllbnlhz").name="sss";
						document.getElementById("ajgllbcj").name="sss";
						document.getElementById("ajgllbgjss").name="sss";
						document.getElementById("ajgllbczjr").name="sss";
						document.getElementById("ajgllbjkww").name="ss";
					}
					//document.getElementById("divxzgllbinput").innerHTML='<input name="lawsuit.LReferOther" type="text" altname="行政管理类别" id="xzgllbinput" class="inputTextNormal">';
				}
				
				
					
</script>

