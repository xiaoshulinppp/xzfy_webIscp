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
		<input type="text" name="xzcjInfo.id" value="${xzcjId}" />
		<input type="text" name="xzcjId" value="${xzcjId}" />
		<input type="hidden" name="xzcjInfo.status" value="待办理" />
		
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
		
			<tr class="trcolor">      
	     		<td class="tdFormText" width="25%" >收案日期：</td>
			    <td class="tdFormInput" width="25%" >
				    <input name="xzcjInfo.receive_date" type="text" class="inputTextNormal"  
				     value="${todate}" onClick="WdatePicker()" altname="收案日期" >
			    </td>
			    <td class="tdFormText">承办人</td>
				<td class="tdFormInput">
					<input type="text" name="xzcjInfo.undertaker_name" value="${admit_name}" class="inputTextNormal" />
				</td>
	  		</tr>
		
			<tr class="trwhite">
				<td class="tdFormText">复议承办人</td>
				<td class="tdFormInput">
					<input type="text" name="xzcjInfo.fyundertaker_name" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">申请人类别</td>
				<td class="tdFormInput">
					<select name="xzcjInfo.app_type" id="apptype" onchange="checkapptype()">
				      <option value="0">----请选择----</option>
				      <option value="1">公民</option>
				      <option value="2">法人或其他组织</option>
				    </select>
				</td>			
			</tr>
			
			<tr class="trcolor" id="shenqingren1">
			  	<td class="tdFormText">申请人：</td>
			    <td class="tdFormInput" colspan=3>
			    
				    <a href="javascript:opendg('../xzcj/addApp.action?xzcjId=${xzcjId}&funcCode=${funcCode}&protype=1&textId=shenqingren&countId=rencount',900,600)" style="display:none" id="appspan1">添加</a>
				    <a href="javascript:opendg('../xzcj/addLegal.action?xzcjId=${xzcjId}&funcCode=${funcCode}&protype=2&textId=shenqingren&countId=rencount',900,600)"  style="display:none" id="appspan2">添加</a>
				    <textarea name="app_face.shenqingren" type="text" class="textarea" id="shenqingren" ischeck="y" altname="申请人" ></textarea>
			   
			    </td>
		    </tr>
		
			<tr class="trwhite">		
				<td class="tdFormText">原告总数</td>
				<td class="tdFormInput">
					<input type="text" name="xzcjInfo.app_num" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">被申请人类别</td>
				<td class="tdFormInput">
				<!--<input type="text" name="xzssInfo.jiguan_type" value="" class="inputTextNormal" /> -->
					<select name="xzcjInfo.jiguan_type"  >
				      <option value="0">----请选择----</option>
				      <option value="1">原具体行政行为机关</option>
				      <option value="2">复议机关</option>
				    </select>
				</td>				
			</tr>

			
			<tr class="trwhite">
				<td class="tdFormText">被申请人名称</td>
				<td class="tdFormInput">
					<input type="text" name="xzcjInfo.jiguan" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">代理人</td>
				<td class="tdFormInput">
					<input type="text" name="xzcjInfo.agent" value="" class="inputTextNormal" />
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">答复通知</td>
				<td class="tdFormInput">
				                  <!-- 需要在action里赋值-->
					<input type="file" name="upFile" value="" class="inputTextFile" />
				</td>
				<td class="tdFormText">裁决请求</td>
				<td class="tdFormInput">
					<textarea cols="30" rows="5" type="text" name="xzcjInfo.request" value="" class="inputTextNormal" />
					</textarea>
				</td>
			</tr>
			<tr class="trwhite">			
				<td class="tdFormText">是否行政赔偿</td>
				<td class="tdFormInput">
					<input type="radio" name="xzcjInfo.ismoney" value="是"  />  是
					<input type="radio" name="xzcjInfo.ismoney" value="否"  />  否
				</td>
				<td class="tdFormText">被裁决具体行政行为名称</td>
				<td class="tdFormInput">
					<input type="text" name="xzcjInfo.action_name" value="" class="inputTextNormal" />
				</td>
			</tr>
			
			<tr class="trwhite">			
				<td class="tdFormText">被裁决具体行政行为案号</td>
				<td class="tdFormInput">
					<input type="text" name="xzcjInfo.action_id" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">行政管理类别</td>
				<td class="tdFormInput">
				<!-- 
					<input type="text" name="xzssInfo.manage_type" value="" class="inputTextNormal" />
					-->					
							<select name="xzcjInfo.manage_type"   id="ajsjfm1"  onchange="ajgllb()">
						        <option value="0">----请选择----</option>
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
						     <select name="xzcjInfo.manage_type1" style="display:none"  id="ajgllbga"  ishidden="y">
						        <option value="0">----请选择----</option>
								<option value="1">治安</option>
								<option value="2">劳教</option>
								<option value="3">其他</option>
							 </select>
	 
							 <!--农林环资-->	 
							 <select name="xzcjInfo.manage_type1" style="display:none" id="ajgllbnlhz" ishidden="y">
							  	<option value="0">----请选择----</option>
								<option value="9">土地</option>
								<option value="10">地矿</option>
								<option value="11">环保</option>
								<option value="12">农业</option>
								<option value="13">水利</option>
								<option value="14">林业</option>
								<option value="15">其他</option>
							 </select>
							
						
							
							 <!--城建-->
							 <select name="xzcjInfo.manage_type1" style="display:none" class="selectStyleNormal" id="ajgllbcj" altname="行政管理类别" ishidden="y">
							  	<option value="0">----请选择----</option>
								<option value="17">城市规划</option>
								<option value="18">房屋拆迁</option>
								<option value="19">房屋登记</option>
								<option value="20">其他</option>					
							</select>
						
							 <!--工交商事-->
							 <select name="xzcjInfo.manage_type1" style="display:none" class="selectStyleNormal" id="ajgllbgjss" altname="行政管理类别" ishidden="y">
							  	<option value="0">----请选择----</option>
								<option value="22">工商</option>
								<option value="23">质监</option>
								<option value="24">商务</option>
								<option value="25">物价</option>
								<option value="26">能源</option>
								<option value="27">交通</option>
								<option value="28">信息产业</option>
								<option value="29">邮政</option>
								<option value="30">烟草专买</option>
							</select>
						
							 <!--财政金融-->
							 <select name="xzcjInfo.manage_type1" style="display:none" class="selectStyleNormal" id="ajgllbczjr" altname="行政管理类别" ishidden="y">
							  	<option value="0">----请选择----</option>
								<option value="32">税务</option>
								<option value="33">人民银行</option>
								<option value="34">证监</option>
								<option value="35">保监</option>
								<option value="36">银监</option>
								<option value="37">外汇</option>
								<option value="38">财政</option>
								<option value="39">统计</option>
								<option value="40">审计</option>
								<option value="41">海关</option>
								<option value="42">商检</option>						
							</select>
							
							 <!--教科文卫-->
							 <select name="xzcjInfo.manage_type1" style="display:none" class="selectStyleNormal" id="ajgllbjkww" altname="行政管理类别" ishidden="y">
							  	<option value="0">----请选择----</option>
								<option value="44">药监</option>
								<option value="45">卫生</option>
								<option value="46">计划生育</option>
								<option value="47">教育</option>
								<option value="48">文化</option>
								<option value="49">专利</option>
								<option value="50">商标</option>
								<option value="51">版权</option>
								<option value="52">旅游</option>
						     </select>
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">复议文书</td>
				<td class="tdFormInput">
								<!-- 需要在action里赋值-->
					<input type="file" name="upFile1" value="" class="inputTextFile" />
				</td>
				<td class="tdFormText">复议结论</td>
				<td class="tdFormInput">
					<textarea cols="30" rows="5" type="text" name="xzcjInfo.fuyijielun" value="" class="inputTextNormal" />
					</textarea>
				</td>			
			</tr>

			<tr class="trwhite">
				<td class="tdFormText">裁决文书</td>
				<td class="tdFormInput">
								<!-- 需要在action里赋值-->
					<input type="file" name="upFile2" value="" class="inputTextFile" />
				</td>
				<td class="tdFormText">裁决结论</td>
				<td class="tdFormInput">
					<textarea cols="30" rows="5" type="text" name="xzcjInfo.caijuejielun" value="" class="inputTextNormal" />
					</textarea>
				</td>	
				
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">结案日期</td>			
				<td class="tdFormInput" width="25%" >
				    <input name="xzcjInfo.jieandate" type="text" class="inputTextNormal"  
				     value="" onClick="WdatePicker()"  >
			    </td>
			</tr>
			
		<!--	
			<tr class="trwhite">	
				<td class="tdFormText">是否已复议</td>
				<td class="tdFormInput">
					
					<select name="xzssInfo.fuyi_id"   id="sffyselect"  onchange="sfxzfy()">
						<option value="">否</option>
						<option value="1">是</option>	
				   	</select>
					<input type="button" style="display:none"  id="sffybutton1"  value="关联" class="button" onclick="search();"/>
					<p align="center">
						<a href="javascript:opendg('../xzss/search.action?funcCode=${funcCode}',900,600)"  style="display:none" id="sffybutton" >关联</a>
					</p>
				</td>
			</tr>
		-->
			
	
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<input type="button" id="sunbt" class="button" value="提 交" onclick="createXzcj();" />
					
				</td>
			</tr>			
		</form>
		</table>
	</body>
</html>


<script type="text/javascript">
	function createXzcj(){
	//alert(document.getElementById("shen1").value);
		if(confirm("确认提交？")){	
			window.form1.action="saveFace.action";
			window.form1.submit();
		}
	}
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
				
				function opendg(dgurl,dgw,dgh)
				{
				//alert(1111);
				  $.dialog({ 
				    title:'申请人管理',
				    width: dgw,
				    height: dgh,
				    content:'url:'+ dgurl});
				}
				
				function checkapptype(){
					if(document.getElementById("apptype").value==1){
						document.getElementById("appspan1").style.display="block"
						document.getElementById("appspan2").style.display="none"
					}
					else if(document.getElementById("apptype").value==2){
						document.getElementById("appspan2").style.display="block"
						document.getElementById("appspan1").style.display="none"		
					}
					else{
						document.getElementById("appspan2").style.display="none"
						document.getElementById("appspan1").style.display="none"		
					}
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
						
						document.getElementById("ajgllbga").name="xzcjInfo.manage_type1";
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
						document.getElementById("ajgllbnlhz").name="xzcjInfo.manage_type1";
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
						document.getElementById("ajgllbcj").name="xzcjInfo.manage_type1";
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
						document.getElementById("ajgllbgjss").name="xzcjInfo.manage_type1";
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
						document.getElementById("ajgllbczjr").name="xzcjInfo.manage_type1";
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
						document.getElementById("ajgllbjkww").name="xzcjInfo.manage_type1";
					}
				
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
						
						document.getElementById("ajgllbga").name="xzcjInfo.manage_type1";
						document.getElementById("ajgllbnlhz").name="xzcjInfo.manage_type1";
						document.getElementById("ajgllbcj").name="xzcjInfo.manage_type1";
						document.getElementById("ajgllbgjss").name="xzcjInfo.manage_type1";
						document.getElementById("ajgllbczjr").name="xzcjInfo.manage_type1";
						document.getElementById("ajgllbjkww").name="xzcjInfo.manage_type1";
					}
					//document.getElementById("divxzgllbinput").innerHTML='<input name="lawsuit.LReferOther" type="text" altname="行政管理类别" id="xzgllbinput" class="inputTextNormal">';
				}
				
				
					
</script>

