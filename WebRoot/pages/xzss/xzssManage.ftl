<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=7">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行政复议信息管理系统</title>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
<!--[if lte IE 6]>
<script src="script/png.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div, ul, img, li, input , a');
    </script>
<![endif]--> 
</head>
	<body>

	<form name="form0" id="form0" action="" method="post" >
	<#if panduanGL != "1" && panduanGL != "2" && panduanGL != "3" >
	<#include "../website/header.ftl">
	</#if>
		<div class="wal pageNow2">
	      <div class="fl">当前位置：<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页 </a>>
	      <#if listType="banli"> 行政诉讼案件列表
	      <#elseif listType="chaxun"><a href="../xzss/showUndertakerList.action?funcCode=${funcCode}">行政诉讼案件列表</a> >诉讼案件高级检索列表（本单位）
	      <#elseif listType="chaxunquanshi"><a href="../xzss/showUndertakerList.action?funcCode=${funcCode}">行政诉讼案件列表</a> >诉讼案件高级检索列表（全市）
	      </#if>
	      </div>
	      <div class="fr"></div>
		</div>
	<div class="pageBg1">
<div class="wal">
<#if panduanGL != "1" && panduanGL != "2" && panduanGL != "3">
      <div id="searchForm">
      <div class="pageBox">
            <div class="searchForm">
            <!--
                  <ul>
                    <li>
                       <div class="name">案号:</div>
                       <input class="ui-input-wdm" type="text" name="xzfyInfo.tjzfzh"/>
                   </li>
                   <li>  
                       <div class="name">收案日期:</div>
                       <input class="ui-input-wdm" type="text" onClick="WdatePicker()"  name="xzfyInfo.receive_date"/>
                    </li>
                 
                  </ul>
                -->
                  <span class="clear_f"></span>
                  <!--<div class="btnDiv">
                  <#if listType=="banli">
                      <input type="button" name="button" class="btn1" value="新增案件" onclick="xinzeng()" />
                      <input type="button" name="button" class="btn1" value="已结案" onclick="showJieanlist()" />
                      <input type="button" name="button" class="btn1" value="高级搜索（本单位）" onclick="searchDanwei()" />
                      <input type="button" name="button" class="btn1" value="高级搜索（全市）" onclick="searchQuanShi()" />
                      <input type="button" class="btn1 btn2" value="部门案件" onclick="showXzssList()" /> 
                  <#else>  
                  	  <input type="button" name="button" class="btn1" value="个人待办" onclick="daiban()" />  
                  </#if>              
                  </div>-->
                  <div class="btnDiv">
                  <input type="button" name="button" class="btn1" value="新增案件" onclick="xinzeng()" />
                  <input type="button" name="button" class="btn5" value="高级搜索（本单位）" onclick="searchDanwei()" />
                  <input type="button" name="button" class="btn5" value="高级搜索（全市）" onclick="searchQuanShi()" />
                  </div>
            </div>
      </div>
      <div class="pageBoxBg"></div>
      </div>
</#if>  
     <input type="hidden" name="funcCode" value="${funcCode}">
	 <input type="hidden" name="pNum" value="${pNum}" id="pageNum">
	 <input type="hidden" name="xzssInfo.shen_level" value="<#if xzssInfo.shen_level?has_content>${xzssInfo.shen_level}</#if>" />
	 <input type="hidden" name="xzssInfo.case_num" <#if xzssInfo.case_num?has_content>value="${xzssInfo.case_num}"</#if> />
     <input type="hidden" name="xzssInfo.notice_receiptDate" <#if xzssInfo.notice_receiptDate?has_content>value="${xzssInfo.notice_receiptDate}"</#if> />
     <input type="hidden" name="xzssInfo.app_type" <#if xzssInfo.app_type?has_content>value="${xzssInfo.app_type}"</#if> />
     <input type="hidden" name="xzssInfo.app_name" <#if xzssInfo.app_name?has_content>value="${xzssInfo.app_name}"</#if> />
     <input type="hidden" name="xzssInfo.defendant" <#if xzssInfo.defendant?has_content>value="${xzssInfo.defendant}"</#if> />
     <input type="hidden" name="xzssInfo.ysundertaker_name" <#if xzssInfo.ysundertaker_name?has_content>value="${xzssInfo.ysundertaker_name}"</#if> />
     <input type="hidden" name="xzssInfo.manage_type" <#if xzssInfo.manage_type?has_content>value="${xzssInfo.manage_type}"</#if> />
     <input type="hidden" name="xzssInfo.case_type" <#if xzssInfo.case_type?has_content>value="${xzssInfo.case_type}"</#if> />
     <input type="hidden" name="xzssInfo.court" <#if xzssInfo.court?has_content>value="${xzssInfo.court}"</#if> />
     <input type="hidden" name="xzssInfo.ismoney" <#if xzssInfo.ismoney?has_content>value="${xzssInfo.ismoney}"</#if> />
     <input type="hidden" name="xzssInfo.case_cause" <#if xzssInfo.case_cause?has_content>value="${xzssInfo.case_cause}"</#if> />
     
      <div class="pageBox">
            <div class="searchList">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
					<tr>  
					<th width="3%" rowspan="2">序号</th>
					<!--
					<th width="8%">收案日期</th>
					<th>承办人</th>
					<th>原告类别</th>
					<th>被告类别</th>
					<th>原告姓名</th>
					<th>被告姓名</th>
					<th>应诉机关</th>
					
					<th width="" >答辩日期</th>-->
					<th width="" rowspan="2">案号</th>
					<th width="4%" rowspan="2">审级</th>
					<th width="8%" rowspan="2">审理法院</th>
					<th width="8%" rowspan="2">原告</th>
					<th width="8%" rowspan="2">被告</th>
					<!--
					<th width="15%">行政行为名称</th>
					<th width="15%">行政行为文号</th>
					<th width="7%">项目状态</th>
					-->
					<th width="7%" rowspan="2">应诉承办人</th>
					<th width="7%" rowspan="2">应诉日期</th>
					<th width="7%" rowspan="2">答辩截止日期</th>
					<th width="7%" rowspan="2">结案日期</th>
					<th width="7%" colspan="3" style="height:20px">结案方式</th>
					<th width="9%" rowspan="2">操作</th>
					<#if listType=="banli">
					<th width="4%" rowspan="2">专报号</th>
					</#if>
					</tr>
					<tr>
					<th width="6%" style="height:20px">判决</th>
					<th width="8%" style="height:20px">裁定</th>
					<th width="5%" style="height:20px">调解</th>
					</tr>
					<#assign account=pNum*pageSize-pageSize+1>
					<#list xzssList as xzssInfo>
					<tr>
					<td>&nbsp;${account}</td>	
								
					<!--
					<td>&nbsp;<#if xzssInfo.receive_date?has_content>${xzssInfo.receive_date}</#if></td>
					<td>&nbsp;<#if xzssInfo.undertaker_name?has_content>${xzssInfo.undertaker_name}</#if></td>
					<#assign apptype=xzssInfo.app_type?default('')>
					<td>&nbsp;<#if apptype=='1'>公民<#elseif apptype=='2'>法人或其他组织<#else>未选择</#if></td>	
					<#assign jiguanlevel=xzssInfo.jiguan_level?default('')>
					<td>&nbsp;<#if jiguanlevel=='1'>乡镇政府<#elseif jiguanlevel=='2'>县级政府<#elseif jiguanlevel=='3'>县级政府部门<#elseif jiguanlevel=='4'>省部级行政机关<#elseif jiguanlevel=='5'>省部级部门<#elseif jiguanlevel=='6'>其他<#else>未选择</#if></td>	
					<td>&nbsp;<#if xzssInfo.app_name?has_content>${xzssInfo.app_name}</#if></td>
					<td>&nbsp;<#if xzssInfo.defendant?has_content>${xzssInfo.defendant}</#if></td>
					<td>&nbsp;<#if xzssInfo.jiguan?has_content>${xzssInfo.jiguan}</#if></td>
					
					<td>&nbsp;</td>
					<td>&nbsp;<#if xzssInfo.action_name?has_content>${xzssInfo.action_name}</#if></td>
					<td>&nbsp;<#if xzssInfo.action_id?has_content>${xzssInfo.action_id}</#if></td>
					<td>&nbsp;<#if xzssInfo.app_name?has_content>${xzssInfo.app_name}</#if></td>
					<td>&nbsp;<#if xzssInfo.beigao1?has_content>${xzssInfo.beigao1}</#if></td>
					<td>&nbsp;<#if xzssInfo.beigao2?has_content>${xzssInfo.beigao2}</#if></td>
					<td>&nbsp;<#if xzssInfo.undertaker_name?has_content>${xzssInfo.undertaker_name}</#if></td>
					<td>&nbsp;
					<#assign shenli=xzssInfo.shen1Orshen2?default('')>
					<#if shenli=='1'>一审<#elseif shenli=='2'>二审</#if>
					</td>
					<td>&nbsp;
						<#assign status=xzssInfo.status?default('0')>
						<#if status=='4'>办理中<#elseif status=='12'>已结案</#if>
					</td>
					<td id="cxs" style="display:block" >
						<a href="../xzss/updatexzss.action?tempid=${xzssInfo.id}&funcCode=${funcCode}&isView=0">查看</a>&nbsp;
				<#if panduanGL != "1" && panduanGL != "2">		
						<#assign user_id=Session['_USER_LOGIN_'].id?string>
						<#assign undertaker_id=xzssInfo.undertaker_id?default('')>
					<#if user_id==undertaker_id>
						<a href="../xzss/updatexzss.action?tempid=${xzssInfo.id}&funcCode=${funcCode}">修改</a>&nbsp;
						<a href="javascript:gotoDelete('${xzssInfo.id}')">删除</a>&nbsp;
					</#if>
				</#if>
						<#if panduanGL == "1" || panduanGL == "2">
						<a href="#" onclick="contactPeople('${xzssInfo.id}')"  id="guanlian" >关联</a>&nbsp;	
						</#if>	
						<#if panduanGL == "3">
						<a href="javascript:toAdd()" id="tiqu" >关联</a>&nbsp
						</#if>
					</td>
					<input type="hidden" id="panduanGL" name="panduanGL" value="${panduanGL}" />
					-->
					<td>&nbsp;<#if xzssInfo.case_num?has_content>${xzssInfo.case_num}</#if></td>
					<td>&nbsp;<#if xzssInfo.shen_level?has_content><#if xzssInfo.shen_level=="1">一审<#elseif xzssInfo.shen_level=="2">二审
					<#elseif xzssInfo.shen_level=="3">再审</#if></#if>
					</td>
					<td>&nbsp;
					<#if xzssInfo.court?has_content>
					<#if xzssInfo.court=="1">北京市高级人民法院
					<#elseif xzssInfo.court=="2">北京市第一中级人民法院
					<#elseif xzssInfo.court=="3">北京市第二中级人民法院
					<#elseif xzssInfo.court=="4">北京市第三中级人民法院
					<#elseif xzssInfo.court=="5">北京市第四中级人民法院（铁中院）
					<#elseif xzssInfo.court=="6">北京市东城区法院
					<#elseif xzssInfo.court=="7">北京市西城区法院
					<#elseif xzssInfo.court=="8">北京市朝阳区法院
					<#elseif xzssInfo.court=="9">北京市海淀区法院
					<#elseif xzssInfo.court=="10">北京市平谷区法院
					<#elseif xzssInfo.court=="11">北京市石景山区法院
					<#elseif xzssInfo.court=="12">北京市门头沟区法院
					<#elseif xzssInfo.court=="13">北京市房山区法院
					<#elseif xzssInfo.court=="14">北京市大兴区法院
					<#elseif xzssInfo.court=="15">北京市通州区法院
					<#elseif xzssInfo.court=="16">北京市昌平区法院
					<#elseif xzssInfo.court=="17">北京市顺义区法院
					<#elseif xzssInfo.court=="18">北京市怀柔区法院
					<#elseif xzssInfo.court=="19">北京市平谷区法院
					<#elseif xzssInfo.court=="20">北京市密云县法院
					<#elseif xzssInfo.court=="21">北京市延庆县法院
					<#elseif xzssInfo.court=="22">北京市铁路运输法院
					</#if>
					</#if>
					</td>
					<td>&nbsp;<#if xzssInfo.app_name?has_content>${xzssInfo.app_name}</#if></td>
					<td>&nbsp;<#if xzssInfo.defendant?has_content>${xzssInfo.defendant}</#if></td>
					<!--
					<td>&nbsp;<#if xzssInfo.action_name?has_content>${xzssInfo.action_name}</#if></td>
					<td>&nbsp;<#if xzssInfo.action_id?has_content>${xzssInfo.action_id}</#if></td>
					<td>&nbsp;</td>-->
					<td>&nbsp;<#if xzssInfo.ysundertaker_name?has_content>${xzssInfo.ysundertaker_name}</#if></td>
					<td>&nbsp;<#if xzssInfo.notice_receiptDate?has_content>${xzssInfo.notice_receiptDate}</#if></td>
					<td>&nbsp;<#if xzssInfo.dabian_endDate?has_content>${xzssInfo.dabian_endDate}</#if></td>
					<td>&nbsp;<#if xzssInfo.jieandate?has_content>${xzssInfo.jieandate}</#if></td>
					<td>
					<#if xzssInfo.panjue?has_content>
					<#if xzssInfo.panjue=="1">
					<#elseif xzssInfo.panjue=="1">驳回上诉，维持原判决
					<#elseif xzssInfo.panjue=="2">驳回诉讼请求
					<#elseif xzssInfo.panjue=="3">全部撤销
					<#elseif xzssInfo.panjue=="4">全部撤销并重作
					<#elseif xzssInfo.panjue=="5">部分撤销
					<#elseif xzssInfo.panjue=="6">部分撤销并重作
					<#elseif xzssInfo.panjue=="7">履行法定职责
					<#elseif xzssInfo.panjue=="8">履行给付义务
					<#elseif xzssInfo.panjue=="9">确认违法
					<#elseif xzssInfo.panjue=="10">确认无效
					<#elseif xzssInfo.panjue=="11">变更
					<#elseif xzssInfo.panjue=="12">行政协议履行
					<#elseif xzssInfo.panjue=="13">行政协议补偿
					</#if>
					</#if>
					&nbsp;
					</td>
					<td>
					<#if xzssInfo.caiding?has_content>
					<#if xzssInfo.caiding=="1">驳回上诉，维持原裁定
					<#elseif xzssInfo.caiding=="2">撤销原判，发回重审
					<#elseif xzssInfo.caiding=="3">驳回起诉
					<#elseif xzssInfo.caiding=="4">准许原告主动撤诉
					<#elseif xzssInfo.caiding=="5">准许原告因被告改变原行政行为撤诉
					<#elseif xzssInfo.caiding=="6">终结诉讼
					<#elseif xzssInfo.caiding=="7">其他
					</#if>
					</#if>
					&nbsp;
					</td>
					<td>
					<#if xzssInfo.tiaojie?has_content>
					<#if xzssInfo.tiaojie=="1">调解
					<#elseif xzssInfo.tiaojie=="2">其他
					</#if>
					</#if>
					&nbsp;
					</td>
					<td>
					<a href="../xzss/xzssguanli.action?xzssId=${xzssInfo.id}&funcCode=${funcCode}&isxinzeng=0">查看</a>
					<#if isdeleteuser?has_content&&isdeleteuser=="1">
					<a href="javascript:gotoDelete('${xzssInfo.id}')">删除</a>
					</#if>
                    <#if xzssInfo.status?has_content&&xzssInfo.status=="1">
                    &nbsp;<img src="../webstyle/images/jiean.png" alt="已保存结案信息"/>
                    <#else>&nbsp;&nbsp;&nbsp;
                    </#if>
                    </td>
                    <#if listType=="banli">
                    <td id="${xzssInfo.id}">
                    <#if xzssInfo.zhuanbaohao?has_content>${xzssInfo.zhuanbaohao}
                    <#else>&nbsp;
                    </#if>
                    </td>
                    </#if>
					</tr>
					<#assign account=account+1>
					</#list>
		</table>
		<br/>
		<#if listType=="banli">
        <div id="getzhuanbao1" align="right" style="display:block">
        <input type="button" value="获取专报号" onclick="getzhuanbao()" style="border:1px solid;color:white;background:green;padding:3px;"/>
        </div>
        <div id="getzhuanbao2" align="right" style="display:none">
        <input type="button" value="获取" onclick="getzhuanbao2()" style="border:1px solid;color:white;background:green;padding:3px;"/>
        <input type="button" value="取消" onclick="dotogetzhuanbao()" style="border:1px solid;color:white;background:green;padding:3px;"/>
        
        </div>
        
        </#if>
		            <div class="pageNum">
               第${pNum}/${totalPage}页   共${totalCount}条
					<#assign upPage = pNum -1>
					<#if upPage lt 1 >
					<#assign upPage = 1>
					</#if>
					<#assign downPage = pNum +1>
					<#if (downPage gt totalPage)>
					<#assign downPage = totalPage>
					</#if>
				<#if listType="banli">　
				<a href="../xzss/showUndertakerList.action?pNum=1&funcCode=${funcCode}" class="ui-page-item ui-page-item-first">首页</a>
			    <a href="../xzss/showUndertakerList.action?pNum=${upPage}&funcCode=${funcCode}" class="ui-page-item ui-page-item-prev">上一页</a>
		     	<a href="../xzss/showUndertakerList.action?pNum=${downPage}&funcCode=${funcCode}" class="ui-page-item ui-page-next">下一页</a>
			    <a href="../xzss/showUndertakerList.action?pNum=${totalPage}&funcCode=${funcCode}" class="ui-page-item ui-page-last">尾页</a>　
				<span>到<input class="input1"  name="gotoPageNum" id="gotoPageNum" />页</span>　<a href="#" onclick="gotoPage()" class="ui-button ui-button-go">Go</a>
                <#elseif listType="jiean">
                <a href="../xzss/showJieanlist.action?pNum=1&funcCode=${funcCode}" class="ui-page-item ui-page-item-first">首页</a>
			    <a href="../xzss/showJieanlist.action?pNum=${upPage}&funcCode=${funcCode}" class="ui-page-item ui-page-item-prev">上一页</a>
		     	<a href="../xzss/showJieanlist.action?pNum=${downPage}&funcCode=${funcCode}" class="ui-page-item ui-page-next">下一页</a>
			    <a href="../xzss/showJieanlist.action?pNum=${totalPage}&funcCode=${funcCode}" class="ui-page-item ui-page-last">尾页</a>　
				<span>到<input class="input1"  name="gotoPageNum" id="gotoPageNum" />页</span>　<a href="#" onclick="gotoPage()" class="ui-button ui-button-go">Go</a>
                <#elseif listType="bumen">
                <a href="../xzss/xzssManage.action?pNum=1&funcCode=${funcCode}" class="ui-page-item ui-page-item-first">首页</a>
			    <a href="../xzss/xzssManage.action?pNum=${upPage}&funcCode=${funcCode}" class="ui-page-item ui-page-item-prev">上一页</a>
		     	<a href="../xzss/xzssManage.action?pNum=${downPage}&funcCode=${funcCode}" class="ui-page-item ui-page-next">下一页</a>
			    <a href="../xzss/xzssManage.action?pNum=${totalPage}&funcCode=${funcCode}" class="ui-page-item ui-page-last">尾页</a>　
				<span>到<input class="input1"  name="gotoPageNum" id="gotoPageNum" />页</span>　<a href="#" onclick="gotoPage()" class="ui-button ui-button-go">Go</a>
                <#elseif listType="chaxun">
                <a href="javascript:goChaXunPage(1)" class="ui-page-item ui-page-item-first">首页</a>
			    <a href="javascript:goChaXunPage(${upPage})" class="ui-page-item ui-page-item-prev">上一页</a>
		     	<a href="javascript:goChaXunPage(${downPage})" class="ui-page-item ui-page-next">下一页</a>
			    <a href="javascript:goChaXunPage(${totalPage})" class="ui-page-item ui-page-last">尾页</a>　
				<span>到<input class="input1"  name="gotoPageNum" id="gotoPageNum" />页</span>　<a href="#" onclick="gotoPage()" class="ui-button ui-button-go">Go</a>
                <#elseif listType="chaxunquanshi">
                <a href="javascript:goChaXunQuanshi(1)" class="ui-page-item ui-page-item-first">首页</a>
			    <a href="javascript:goChaXunQuanshi(${upPage})" class="ui-page-item ui-page-item-prev">上一页</a>
		     	<a href="javascript:goChaXunQuanshi(${downPage})" class="ui-page-item ui-page-next">下一页</a>
			    <a href="javascript:goChaXunQuanshi(${totalPage})" class="ui-page-item ui-page-last">尾页</a>　
				<span>到<input class="input1"  name="gotoPageNum" id="gotoPageNum" />页</span>　<a href="#" onclick="gotoPage()" class="ui-button ui-button-go">Go</a>
                </#if>
            </div>
            </div>
      </div>
      <div class="pageBoxBg"></div>
</div>
</div>
	</form>
	<#if panduanGL != "1" && panduanGL != "2" && panduanGL != "3">
		<div class="foot">
		版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
		电话：65193431
		</div>
	</#if>
</body>
</html>
		
	
	<script>
	function gotoDelete(id){
	    if(confirm("确定删除吗？")){
	         <#if listType="bumen">
	         document.form0.action="../xzss/deletexzssBuMen.action?tempid="+id;
	         <#elseif listType="banli">
	         document.form0.action="../xzss/deletexzssBanLi.action?tempid="+id;
	         <#elseif listType="jiean">
	         document.form0.action="../xzss/deletexzssJieAn.action?tempid="+id;
	         <#elseif listType="chaxun">
	         document.form0.action="../xzss/deletexzssChaXUn.action?tempid="+id;
	         <#elseif listType="chaxunquanshi">
	         document.form0.action="../xzss/deletexzssChaXunQuanShi.action?tempid="+id
	         </#if>
	         document.form0.submit();
	         alert("删除成功！");
	    }
	}
	function xinzeng(){       //新增案件
	    /*if(confirm("是否进行案件关联")){
	       window.open('../xzss/searchxzfy.action?funcCode=${funcCode}&panduanGL=${"3"}',"_top");
	       return true;
	    }
	    else{
	    window.open("XzssAction.action?funcCode=${funcCode}","_top");
	    return true;
	    }*/
	    opendg("../xzss/chooseShenHeLevel.action?funcCode=${funcCode}",300,180);
	}
	function opendg(dgurl,dgw,dgh)
		{
			//alert(1111);
			$.dialog({ 
			title:'',
			width: dgw,
			height: dgh,
			content:'url:'+ dgurl});
		}
	function showJieanlist(){                   //已结案
		window.open("showJieanlist.action?funcCode=${funcCode}","_top");
	}
	function showXzssList(){                   //部门案件
		window.open("xzssManage.action?funcCode=${funcCode}","_top");
	}
	function daiban(){                         //代办案件
		window.open("showUndertakerList.action?funcCode=${funcCode}","_top");
	}
	function searchDanwei(){                         //高级搜索(本单位)
		window.open("search.action?funcCode=${funcCode}","_top");
	}
	function searchQuanShi(){								//高级搜素(全市)
	    window.open("searchQuanShi.action?funcCode=${funcCode}","_top");
	}
	function toAdd(){
	    self.location='XzssAction.action?funcCode=${funcCode}';
	}
		function contactPeople(peopleId){
		var api = frameElement.api, W = api.opener, D = W.document; // api.opener 为载加lhgdialog.min.js文件的页面的window对象
			if(document.getElementById("panduanGL").value == "1"){
				parent.document.getElementById("shen1").value=peopleId;
				parent.document.getElementById("sf1sselect").style.display="none";
				parent.document.getElementById("yiguanlian1").style.display="block";
				parent.document.getElementById("yiguanlian1").innerHTML="已关联";
			}
			else{
				parent.document.getElementById("shen2").value=peopleId;
				parent.document.getElementById("sf2sselect").style.display="none";
				parent.document.getElementById("yiguanlian2").style.display="block";
				parent.document.getElementById("yiguanlian2").innerHTML="已关联";
			}
			api.close();
		}
			function updatexzss(id){
				//document.getElementById("tempid").value=id;
				tempid = id;
				document.Form1.action="updatexzss.action";
				document.Form1.submit();
		}
	function goPage(pNum){		
			document.getElementById("pageNum").value=pNum;
			document.Form1.submit();
		}
		
	function goChaXunPage(pNums){
	    document.getElementById("pageNum").value=pNums;
	    document.form0.action="../xzss/dosearch.action";
		document.form0.submit();
	}
	function goChaXunQuanshi(pNums){
	    document.getElementById("pageNum").value=pNums;
	    document.form0.action="../xzss/dosearchQuanShi.action";
		document.form0.submit();
	}
		function gotoPage(){
				var inputPage = window.document.getElementById("gotoPageNum").value;
				if(!inputPage.match("[\\d+]+")){
					alert("页数必须为整数！");
					return;
				}else{
					for(var i=0;i<inputPage.length;i++){
						if(inputPage.charCodeAt(i)>57 || inputPage.charCodeAt(i)<48){
							alert("页数必须为整数！");
							return;
						}
					}
				}
				if(inputPage > ${totalPage}){
					alert("输入的页数不能超过总页数！");
				}else if(inputPage < 1){
					alert("输入的页数不能少于1页！");
				}else{
				    <#if listType="banli">
					window.location = "../xzss/showUndertakerList.action?funcCode=${funcCode}&pNum=" + inputPage;
					<#elseif listType="jiean">
					window.location = "../xzss/showJieanlist.action?funcCode=${funcCode}&pNum=" + inputPage;
					<#elseif listType="bumen">
					window.location = "../xzss/xzssManage.action?funcCode=${funcCode}&pNum=" + inputPage;
					<#elseif listType="chaxun">
					document.getElementById("pageNum").value=inputPage;
				    document.form0.action="../xzss/dosearch.action";
					document.form0.submit();
					//window.location = "../xzss/dosearch.action?funcCode=${funcCode}&pNum=" + inputPage;
					<#elseif listType="chaxunquanshi">
					document.getElementById("pageNum").value=inputPage;
				    document.form0.action="../xzss/dosearchQuanShi.action";
					document.form0.submit();
					</#if>
				}
				return;
			}
		 function getzhuanbao(){
		 //document.getElementById("zhuanbao").style.display="block";
		 document.getElementById("getzhuanbao1").style.display="none";
		 document.getElementById("getzhuanbao2").style.display="block";
		 <#list xzssList as xzssInfo>
		 <#if xzssInfo.zhuanbaohao?has_content>
		 <#else>
		 document.getElementById("${xzssInfo.id}").innerHTML="<input type=\"checkbox\" name=\"zhuanidList\" value=\"${xzssInfo.id}\"/>"
		 </#if>
		 </#list>
		 }
		 function dotogetzhuanbao(){
		 <#list xzssList as xzssInfo>
		 <#if xzssInfo.zhuanbaohao?has_content>
		 <#else>
		 document.getElementById("${xzssInfo.id}").innerHTML="&nbsp;";
		 </#if>
		 </#list>
		 document.getElementById("getzhuanbao1").style.display="block";
		 document.getElementById("getzhuanbao2").style.display="none";
		 }
		 function getzhuanbao2(){
		 if(!isSelect()){
				alert("请选择要获取专报号的案件！");
				return;	
			}
			var ids=getIds();
			//window.location = "../xzss/getZhuanBaoHao.action?funcCode=${funcCode}&pNum=${pNum}" ;
		 	if(confirm("下一个专报号是： ${zhuanbaohao}")){
		 		alert("已获取专报号：${zhuanbaohao}");
		 		window.location="../xzss/saveZhuanBaoHao.action?funcCode=${funcCode}&pNum=${pNum}&zhuanbaohao=${zhuanbaohao}&zhuanbaoids="+ids;
		 	}
		 }
		 function isSelect(){
			var check=document.getElementsByName("zhuanidList");
			b=false;
			for(var i=0;i<check.length;i++){
				if(check[i].checked==true){
					b=true;
				}
			}
			return b;	
		}
		 function getIds(){
			var check=document.getElementsByName("zhuanidList");
			var id="";
			for(var i=0;i<check.length;i++){
				if(check[i].checked==true){
					if(id=="")
					id+=check[i].value;
					else
					id+=","+check[i].value;
				}
			}
			return id;
		}
		
	</script>
	