<!DOCTYPE html>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" href="../pages/xzfy/css/style_anju1.css">
<script type="text/javascript" src="../pages/xzfy/js/html5.js"></script>
<script type="text/javascript" src="../pages/xzfy/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../pages/xzfy/js/treeJs.js"></script>
<title>立案信息</title>

<style type="text/css">img,z_wrap_info,.z_wrap_info{behavior: url(../pages/xzfy/css/ie-css3.htc);} </style> 
<style>
.btn{border:none;cursor:pointer;border-radius:3px}
.btn-blue{display:block; width:107px; height:27px;<!--background: url(../images/sideNavBg.gif);-->line-height:27px; text-align:center; border:#eeeded solid 1px; margin-left:36px;margin-top:10px;float:left;}
.btn-blue:link,.btn-blue:visited{color:#000;}
</style>
</head>
<body>

<form name="form" id="form" method="post" ENCTYPE="multipart/form-data">
	<input type="hidden" name="funcCode" value="${funcCode}">
	
	
	<div class="z_wrap_info">
		<br/>&nbsp;
		<div class="z_info">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">

			  <tr>
				<th width="4%" rowspan="6">当<br><br><br>事<br><br><br>人</th>
				<th colspan="4">
<textarea   rows="3"  style="width:96%;font-size:14px;font-family:仿宋"><#if xzfyInfo.app_type=='1'>${xzfyInfo.appdetail?default('')}<#elseif xzfyInfo.app_type=='2'>${xzfyInfo.agentDetail?default('')}</#if></textarea>
</td>
			  </tr>
			  <tr>
                <th width="24%">类别</th>
                <th width="24%"><#if xzfyInfo.app_type?default('1')=='1'>公民<#else>法人或其他组织</#if></td>
                <th width="24%">数量</th>
                <th width="24%">${xzfyInfo.renCount?default('')}</td>
			  </tr>

			  <tr>
                <th>代表人</th>
                <th colspan="3">${xzfyInfo.dbrDetail?default('无')}</td>
			  </tr>

            <tr>
                <th>代理人</th>
                <th>${xzfyInfo.agent_name?default('无')}</th>
                <th>被申请人种类</th>
                <th>
	                <#list zlList as zl>
					<#if zl.value==xzfyInfo.defendant_type>${zl.name}</#if>
				    </#list>
			    </th>
             </tr>
            <tr>
                <th>被申请人</th>
                <th colspan="3">${xzfyInfo.defendant_name?default('')}</th>
            </tr>
            <tr>
                <th>第三人</th>
                <th>${xzfyInfo.third?default('无')}</th>
                <th>代理人</th>
                <th>${xzfyInfo.third_agent?default('无')}</th>
            </tr>

            <tr>
                <th <#if xzfyInfo.ismanage?default('')=='2'>rowspan="6"<#else>rowspan="7"</#if>>复<br><br><br>议<br><br><br>事<br><br><br>项</th>
                <#if xzfyInfo.ismanage?default('')=='2'><#else>
	                <th>具体行政行为</th>
	                <th colspan="3">
	                	<textarea   cols="" rows="1"  style="width:96%;font-size:14px;font-family:仿宋">${xzfyInfo.xwname?default('')}</textarea>
	                </td>
                </#if>
             </tr>
             <#if xzfyInfo.ismanage?default('')=='2'><#else>
            <tr>
                <th>文号</th>
                <th colspan="3">${xzfyInfo.xwnum?default('')}</th>
             </tr>
             </#if>
             <tr  id="mingan">
		    	<th>是否行政不作为：</th>
			    <th>
			    	<#if xzfyInfo.ismanage?default('')=='2'>是<#else>否</#if>
				</td>
		     
			    <th><div id="bzwshixiang" <#if xzfyInfo.ismanage?default('')=='2'><#else>style="display:none"</#if>>不作为事项：</div></td>
		   		<td>
			   		<div id="bzwshixiang1" <#if xzfyInfo.ismanage?default('')=='2'><#else>style="display:none"</#if>>
					  ${xzfyInfo.matter_detail?default('')}
				  	</div>
			  	</td>   
   			</tr>
            <tr>
                <th>行政复议请求</th>
                <th colspan="3"><textarea   cols="" rows="3"  style="width:96%;font-size:14px;font-family:仿宋">${xzfyInfo.xzfy_requset_retail?default('')}</textarea></th>
             </tr>
            <tr>
                <th>附带审查文件</th>
                <th>${xzfyInfo.ischeck?default('')}</th>
                <th>复议前置</th>
                <th>${xzfyInfo.isfront?default('')}</th>
             </tr>
            <tr>
                <th>行政管理类别</th>
                <th >
					<#if xzfyInfo.refer?default('0')=="1">公安</#if>
					<#if xzfyInfo.refer?default('0')=="2">国家安全</#if>
					<#if xzfyInfo.refer?default('0')=="3">劳动和社会保障</#if>
					<#if xzfyInfo.refer?default('0')=="4">司法行政</#if>
					<#if xzfyInfo.refer?default('0')=="5">民政</#if>
					<#if xzfyInfo.refer?default('0')=="6">土地</#if>
					<#if xzfyInfo.refer?default('0')=="7">地矿</#if>
					<#if xzfyInfo.refer?default('0')=="8">环保</#if>
					<#if xzfyInfo.refer?default('0')=="9">农业</#if>
					<#if xzfyInfo.refer?default('0')=="10">水利</#if>
					<#if xzfyInfo.refer?default('0')=="11">林业</#if>
					<#if xzfyInfo.refer?default('0')=="12">城市规划</#if>
					<#if xzfyInfo.refer?default('0')=="13">房屋拆迁</#if>
					<#if xzfyInfo.refer?default('0')=="14">房屋登记</#if>
					<#if xzfyInfo.refer?default('0')=="15">工商</#if>
					<#if xzfyInfo.refer?default('0')=="16">质监</#if>
					<#if xzfyInfo.refer?default('0')=="17">商务</#if>
					<#if xzfyInfo.refer?default('0')=="18">物价</#if>
					<#if xzfyInfo.refer?default('0')=="19">能源</#if>
					<#if xzfyInfo.refer?default('0')=="20">交通</#if>
					<#if xzfyInfo.refer?default('0')=="21">信息产业</#if>
					<#if xzfyInfo.refer?default('0')=="22">邮政</#if>
				    <#if xzfyInfo.refer?default('0')=="23">烟草专卖</#if>
					<#if xzfyInfo.refer?default('0')=="24">税务</#if>
					<#if xzfyInfo.refer?default('0')=="25">人民银行</#if>
					<#if xzfyInfo.refer?default('0')=="26">证监</#if>
					<#if xzfyInfo.refer?default('0')=="27">保监</#if>
					<#if xzfyInfo.refer?default('0')=="28">银监</#if>
					<#if xzfyInfo.refer?default('0')=="29">外汇</#if>
					<#if xzfyInfo.refer?default('0')=="30">财政</#if>
					<#if xzfyInfo.refer?default('0')=="31">统计</#if>
					<#if xzfyInfo.refer?default('0')=="32">审计</#if>
					<#if xzfyInfo.refer?default('0')=="33">海关</#if>
					<#if xzfyInfo.refer?default('0')=="34">商检</#if>
					<#if xzfyInfo.refer?default('0')=="35">药监</#if>
					<#if xzfyInfo.refer?default('0')=="36">卫生</#if>
					<#if xzfyInfo.refer?default('0')=="37">计划生育</#if>
					<#if xzfyInfo.refer?default('0')=="38">教育</#if>
					<#if xzfyInfo.refer?default('0')=="39">文化</#if>
					<#if xzfyInfo.refer?default('0')=="40">专利</#if>
					<#if xzfyInfo.refer?default('0')=="41">商标</#if>
					<#if xzfyInfo.refer?default('0')=="42">版权</#if>	
					<#if xzfyInfo.refer?default('0')=="43">旅游</#if>	
					<#if xzfyInfo.refer?default('0')=="44">其他</#if>
				</th>
              <th>自定义统计</th>
               <th >
               		 <#list keywordList as xzfyKeyword>
					  	 <#if xzfyKeyword.keyword==keywordChecked>${xzfyKeyword.keyword?default('')}</#if>
				  	 </#list>
				</th>
             </tr>
            <tr>
                <th>案件类型</th>
				<th>
					<#assign caseType=xzfyInfo.casetype?default('0')>
					<#if caseType=="1">行政处罚</#if>
	 				 <#if caseType=="2">行政强制措施</#if>
	 				 <#if caseType=="3">行政征收</#if>
	 				 <#if caseType=="4">行政许可</#if>
	 				 <#if caseType=="5">行政确权</#if>
	 				 <#if caseType=="6">干预经营自主权</#if>
	 				 <#if caseType=="7">信息公开</#if>
	 				 <#if caseType=="8">行政不作为</#if>
	 				 <#if caseType=="9">其他</#if>
	 				  <#if caseType=="10">行政确认</#if>
	 				 <#if caseType=="11">举报投诉处理</#if>
				</th>
                <th  colspan="2">
                	<#assign caseType2=xzfyInfo.casetype2?default('0')>
					<#if caseType=="1">
						<#if caseType2=="1">拘留</#if>
						 <#if caseType2=="2">没收</#if>
						 <#if caseType2=="3">罚款</#if>
						 <#if caseType2=="4">其他</#if>
					<#elseif caseType=="2">
						<#if caseType2=="5">对人身的强制措施</#if>
						 <#if caseType2=="6">对不动产的强制措施</#if>
						 <#if caseType2=="7">对其它财产的强制措施</#if>
					<#elseif caseType=="3">
						<#if caseType2=="8">征收土地</#if>
						 <#if caseType2=="9">版税</#if>
						 <#if caseType2=="10">收费</#if>
						 <#if caseType2=="11">要求履行其他义务</#if>
					</#if>
				</td>
             </tr>


            <tr>
                <th rowspan="6">立<br><br><br>案<br><br><br>审<br><br><br>查</th>
                <th>收案时间</th>
                <th >${xzfyInfo.receive_date?default('')}</td>
				<th>序列号</th>
                <th >20140123001001</td>
             </tr>
            <tr>
                <th>经过补正</th>
                <th ><#if xzfyInfo.isBuzheng?default('0')=="1">是<#else>否</#if></td>
				<th>补正过期</th>
                <th ><#if xzfyInfo.buzhengDelay?default('0')=="1">是<#else>否</#if></td>
             </tr>
            <tr>
                <th>通知补正时间</th>
                <th >${xzfyInfo.bzTongzhiriqi?default('')}</td>
				<th>补正时间</th>
                <th >${xzfyInfo.bzBuqiriqi?default('')}</td>
             </tr>

            <tr>
                <th>立案意见</th>
                <th ><#assign handleReason=xzfyInfo.handleReason?default('0')> 
					<#assign sdResult=xzfyInfo.stadardResult?default('0')>
					<#if sdResult=='1'>受理</#if>
				  	<#if sdResult=='2'>告知</#if>
				  	<#if sdResult=='3'>不予受理</#if>
				  	<#if sdResult=='5'>其他处理</#if>
				</td>
				<th><#if sdResult=='1'>立案时间<#elseif (sdResult=='2' || sdResult=='3' || sdResult=='5')&&xzfyInfo.caseorg =="0000">未受理原因</#if></th>
                <th ><#if sdResult=='1'>${xzfyInfo.lian_date?default('')}
					<#elseif (sdResult=='2' || sdResult=='3' || sdResult=='5')&&xzfyInfo.caseorg =="0000">
						<#if handleReason=="1">无明确的申请人和符合规定的被申请人</#if>
					 	<#if handleReason=="2">申请人与具体行政行为无利害关系</#if>
					 	<#if handleReason=="3">超过法定复议申请期限</#if>
					 	<#if handleReason=="4">不属于本机构的职责范围</#if>
					 	<#if handleReason=="5">无具体的行政复议请求和理由</#if>
					 	<#if handleReason=="6">其他机关受理同一申请法院受理同一诉讼</#if>
					 	<#if handleReason=="7">抽象行政行为</#if>
					 	<#if handleReason=="8">行政处分人事处理决定</#if>
					 	<#if handleReason=="9">行政机关对民事纠纷调解、处理</#if>
					 	<#if handleReason=="10">国防外交行为</#if>
					 	<#if handleReason=="11">交通医疗事故责任认定</#if>
					 	<#if handleReason=="12">司法鉴定</#if>
					 	<#if handleReason=="13">刑事司法行为</#if>
					 	<#if handleReason=="14">民事行为</#if>
					 	<#if handleReason=="15">信访行为</#if>
					 	<#if handleReason=="16">行政机关内部行为</#if>
					 	<#if handleReason=="17">不具有强制力的行政指导</#if>
					 	<#if handleReason=="18">其他其他复议机关对复议申请的处理</#if>
					 	<#if handleReason=="19">其他</#if>
					</#if>
				</td>
             </tr>
            <tr>
                <th>案件号</th>
                <#assign caseNum=''>
				   <#if xzfyInfo.tjzfzh?has_content>
				   		<#assign caseNum=xzfyInfo.tjzfzh>
				   	<#else>
				   		<#assign caseNum=xzfyCom.caseNum?default('')+'〔'+year+'〕'+'  号'>
				   	</#if>
                <th colspan="3">${caseNum?default('')}</th>
             </tr>
         <tr>
                <th>审查人</th>
                <th >${xzfyInfo.user1_name?default('')}</td>
				<th>未受理文书</th>
                <th ></td>
             </tr>

            <tr>
                <th rowspan="5">案<br><br><br>件<br><br><br>审<br><br><br>理</th>
                <#assign isdelay=xzfyInfo.isdelay?default('0')>
				<#assign isstop=xzfyInfo.isstop?default('0')>
                <th>延期审理</th>
                <th ><#if isdelay=="1">是<#else>否</#if></td>
				<th>中止审理</th>
                <th ><#if isstop=="1">是<#else>否</#if></td>
             </tr>
            <tr>
                <th>中止日期</th>
                <th >${xzfyInfo.isstop_from?default('未中止')}</td>
				<th>恢复审理日期</th>
                <th >${xzfyInfo.breakTo?default('未中止或未恢复')}</td>
             </tr>

            <tr>
                <th>审理结果</th>
                <th >
                	<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="0"></#if>
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="1">驳回</#if> 
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="2">维持</#if> 
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="3">确认违法</#if> 
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="4">撤销</#if> 
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="5">变更</#if>
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="6">责令履行</#if> 
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="7">调解</#if> 
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="8">终止</#if> 
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="9">其他</#if> 
                </td>
				<th>结案日期</th>
                <th ><#if appString?has_content>${appString}<#elseif xzfyInfo.finish_date?has_content>${xzfyInfo.finish_date?default('')}</#if></td>
             </tr>

         <tr>
         		<#assign nationMoney=xzfyInfo.nationMoney?default('0')>
                <th>国家赔偿</th>
                <th ><#if  nationMoney == "1" >是<#else>否</#if></td>
				<th>赔偿金额</th>
                <th ><#if xzfyInfo.nationMoneyDetail?has_content>${xzfyInfo.nationMoneyDetail}</#if></td>
             </tr>

         <tr>
                <th>承办人</th>
                <th >${xzfyInfo.user2_name?default('')} ${xzfyInfo.user3_name?default('')}</td>
				<th title="建议到案卷管理中查看、上传结案文书">结案文书</th>
                <th title="建议到案卷管理中查看、上传结案文书" ><#if xzfyInfo.jieanwenshu?has_content>
					&nbsp;&nbsp;&nbsp;&nbsp;<a href="${xzfyInfo.jieanwenshu}">下载</a>
					</#if>
					<#if jieandocsize != 0>
						<a href="javascript:getjieanDoc()">查看在线文书</a>
					</#if>
					<script>
						function getjieanDoc(){
							var url="../viewJiean.jsp?&d_filetype=doc&caseId=${xzfyInfo.id}&mstype=${jieandoctype}&d_username=${Session['_USER_LOGIN_'].id}&actiontype=yuedu";
							window.open(url);
						}
					</script>
				</td>
             </tr>
			</table>
		</div>
		<br/>
		
		
	</div>
	
	</form>
</body>
</html>
