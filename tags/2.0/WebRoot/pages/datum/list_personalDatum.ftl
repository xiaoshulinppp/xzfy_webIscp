<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>信息审核</title>
<meta http-equiv=="Pragma" CONTENT="no-cache">
<meta http-equiv="Window-target" CONTENT="_top">
<!-------样式文件调用注意不要改变顺序------>
<link href="../pages/datum/css/base.css" rel="stylesheet" type="text/css" />
<link href="../pages/datum/css/main_style.css" rel="stylesheet" type="text/css" />
<link href="../pages/datum/css/case.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 7]><link href="../pages/datum/css/ie7hack.css" rel="stylesheet" type="text/css" media="screen"/><![endif]--><!--不可删--->
</head>
<script>
	function gongxiao(entityid){
	 	if(confirm("您确定共享数据吗？"))
   		{
		window.location.href="../datum/shareData.action?funcCode=${funcCode}&entityid="+entityid;
		}
	}
	function shanchu(entityid){
	 	if(confirm("您确定删除数据吗？"))
   		{
		window.location.href="../datum/deleteData.action?funcCode=${funcCode}&entityid="+entityid;
		}
	}
</script>

<body>
<form name="" action=""  >
<!--标题开始-->
<div class="ui-title fn-clear">
     <span class="ui-title-icon fn-left"><img src="../sys_theme/images/icons/crumb.png"/></span>
      <h2 class="ui-title-cnt fn-left">资料管理 - 我的资料列表</h2>  
       <!--<span class="ui-searchbar-btn" id="search-box-btn">
    <a href="javascript:slideToggle('#search-general')" id="searchbar-icon" class="show-search"  ></a></span>-->
    </div>
           
<!--标题结束-->
<!--search start 搜索面板开始-->
<div class="ui-search fn-clear" >
    <div class="ui-search-general fn-clear  fn-hide" id="search-general">
    <table id=""class="ui-table ui-table-search  "  summary="这是一个1行4列的表格样式模板">
        <tbody class="">
        <tr>
          <td class="fn-text-right" >姓名</td>
          <td><input class="ui-input-wdm" type="text"   /></td>
         <td class="fn-text-right" >工作单位</td>
          <td ><input class="ui-input-wdm" type="text"   /></td>
         
        </tr>
        <tr>
          <td class="fn-text-right"  >单位隶属</td>
          <td ><select name="zhfl">
           <option>不限</option>
           <option>市直</option>
         </select></td>
          <td class="fn-text-right" >身份证号</td>
          <td  ><input class="ui-input-wdm" type="text"   /></td>
         </tr>
          <tr>
          <td class="fn-text-right" >技术职称级别</td>
          <td ><select name="zhfl">
           <option>不限</option>
           <option>副高</option>
         </select></td>
          <td class="fn-text-right" >所从事专业</td>
          <td  ><select name="zhfl">
           <option>不限</option>
           <option>农业</option>
         </select></td>
         </tr>
            <tr>
           <td class="fn-text-right" >状态</td>
          <td ><select name="zhfl">
           <option>不限</option>
           <option>待审核</option>
         </select></td>
           <td colspan="2" class="fn-text-center"><input  class="ui-btn ui-btn-yellow" type="button" name="button" id=""  value="搜索"  title="搜索" onclick=""/><input class="ui-btn ui-btn-normal" type="reset" value="重置" title="重新填写"/></td>
         </tr>
          </tbody>
        
    </table>
  </div>  
</div>
<!--search box end-->
<span class="x-line fn-clear"><img src="../pages/datum/images/pic_search_line.png"/></span><!--我是有箭头灰色的分割线-->
<!--列表信息概况开始-->

<!--<div class="case-table case-updown mt20">
<div class="case-title case-title-bg clearfix">					
	<a href="javascript:opendg('datum/gotoInsertDatum.action?funcCode=${funcCode}',800,500)" class="case-btn case-btn-blue fr">上传资料</a>
</div>
</div>-->
<div class="list-survey fn-clear">
	 <table class="ui-table table-survey" >
    
      <tr>
      <td><span style="color:orange"><h4>存储资料</h4><font>${totalnum}</font></span></td>
      <td><span style="color:green"><h4>已共享</h4><font>${publicnum}</font></span></td>
      <td><a href="javascript:opendg('datum/gotoInsertDatum.action?funcCode=${funcCode}',800,500)" class="case-btn case-btn-blue fr">上传资料</a></td>
      </tr>
    </table>
</div>
<!--列表信息概况结束-->
<!--list start 列表样式-->
<!--列表开始-->
 <div class="ui-list-nobtnbar fn-clear ">
 <table class="ui-table  ui-table-list  list-fixed  ">
       <thead class=""  id="" name="" >
 	   <tr>
	       <th width="5%">序号</th>
	       
   		  <th width="20%">资料名称</th>
   		  <th width="15%">资料类型</th>
   		  <th width="10%">上传人</th>
   		  <th width="10%">上传时间</th>
   		  
   		  <th width="10%">点击量</th>
   		  <th width="10%">共享状态</th>
   		   <th width="15%">操作</th>
   		  
 	     </tr>
      </thead>
      <tbody class="discolor">
      <#assign count =0>
      <#list displayInfo.fieldValueList as recordValueList >  
   		<#assign keyColumn = recordValueList[0]>
         <tr>
         <#assign seq = 1>           
           <td>${count+1}</td>
           <#list recordValueList as field>
    		<#if seq != 1>
           <td>
           <#if field?has_content>
         	<font color="${tagProcessList.get(count)}">${field}</font>
       		<#else>
         	&nbsp;
       		</#if>
           </td>
           </#if>
           <#assign seq = seq +1>
    		</#list>
           <td ><a href="#" onclick="gongxiao(${keyColumn})"  class="ui-btn ui-btn-normal" >共享</a>
           				 <a href="#" onclick="shanchu(${keyColumn})" class="ui-btn ui-btn-normal" >删除</a>
           </td>

       </tr>
       <#assign count = count +1>
  </#list>
             
  <#assign countNum = 9>
   <#if count<countNum >
  	<#assign temp=countNum-count>
  	<#list 1..temp as x>
        <tr>
        <#assign seq1 = 1>
           <td></td>
           <#list displayInfo.fieldNameList as field> 
           <td>&nbsp;</td>
           <#assign seq1 = seq1 +1>
           </#list>  
           <td></td>
       </tr>
       </#list>
  	</#if>
    <!--<tr>
           <td>3</td>
           <td>某某某</td>
           <td>男</td>
           <td>副高</td>
           <td>大专</td>
           <td>农业</td>
           <td>林业</td>
           <td>2013-03-23</td>
           <td>-</td>
           <td><font color="orange">[ 待审核 ]</font></td>
           <td><a href="xxsh_form.html"  class="ui-btn ui-btn-normal">查看</a><a href="xxsh_form.html"  class="ui-btn ui-btn-normal">审核</a></td>
       </tr>
        <tr>
           <td>4</td>
           <td>某某某</td>
           <td>男</td>
           <td>副高</td>
           <td>大专</td>
           <td>农业</td>
           <td>林业</td>
           <td>2013-03-23</td>
           <td>-</td>
           <td><font color="orange">[ 待审核 ]</font></td>
           <td><a href="xxsh_form.html"  class="ui-btn ui-btn-normal">查看</a><a href="xxsh_form.html"  class="ui-btn ui-btn-normal">审核</a></td>
       </tr>
         <tr>
           <td>5</td>
           <td>某某某</td>
           <td>男</td>
           <td>副高</td>
           <td>大专</td>
           <td>农业</td>
           <td>林业</td>
           <td>2013-03-23</td>
           <td>2013-03-23</td>
           <td><font color="blue">[ 审核中 ]</font></td>
           <td><a href="xxsh_form.html"  class="ui-btn ui-btn-normal">查看</a></td>
       </tr>
        <tr>
           <td>6</td>
           <td>某某某</td>
           <td>男</td>
           <td>副高</td>
           <td>大专</td>
           <td>农业</td>
           <td>林业</td>
           <td>2013-03-23</td>
           <td>2013-03-23</td>
           <td><font color="green">[ 已审核 ]</font></td>
           <td><a href="xxsh_form.html"  class="ui-btn ui-btn-normal">查看</a></td>
       </tr>
        <tr>
           <td>7</td>
           <td>某某某</td>
           <td>男</td>
           <td>副高</td>
           <td>大专</td>
           <td>农业</td>
           <td>林业</td>
           <td>2013-03-23</td>
           <td>2013-03-23</td>
           <td><font color="red">[ 退回 ]</font></td>
           <td><a href="xxsh_form.html"  class="ui-btn ui-btn-normal">查看</a></td>
       </tr>
         <tr>
           <td>8</td>
           <td>某某某</td>
           <td>男</td>
           <td>副高</td>
           <td>大专</td>
           <td>农业</td>
           <td>林业</td>
           <td>2013-03-23</td>
           <td>2013-03-23</td>
           <td><font color="green">[ 已审核 ]</font></td>
           <td><a href="xxsh_form.html"  class="ui-btn ui-btn-normal">查看</a></td>
       </tr>
         <tr>
           <td>9</td>
           <td>某某某</td>
           <td>男</td>
           <td>副高</td>
           <td>大专</td>
           <td>农业</td>
           <td>林业</td>
            <td>2013-03-23</td>
           <td>2013-03-23</td>
           <td><font color="green">[ 已审核 ]</font></td>
           <td><a href="xxsh_form.html"  class="ui-btn ui-btn-normal">查看</a></td>
       </tr>
        <tr>
           <td>10</td>
           <td>某某某</td>
           <td>男</td>
           <td>副高</td>
           <td>大专</td>
           <td>农业</td>
           <td>林业</td>
           <td>2013-03-23</td>
           <td>2013-03-23</td>
           <td><font color="red">[ 退回 ]</font></td>
           <td><a href="xxsh_form.html"  class="ui-btn ui-btn-normal">查看</a></td>
       </tr>-->
     </tbody>
     </table> 
   
</div>
<div class="ui-page">
<#assign totalPage = displayInfo.totalPage >
    <span class="ui-page-item ui-page-item-info">共${totalnum}条记录，第${pageNum}/${totalPage}页，共${totalPage}页</span>
    <span class="ui-page-item ui-item-link">
    <a href="../datum/gotoPersonalList.action?funcCode=${funcCode}&pageNum=1" class="ui-page-item ui-page-item-first">首页</a>
    <#assign upPage = pageNum -1>
    <#if upPage <1 >
          <#assign upPage = 1>
        </#if>  
    <a href="../datum/gotoPersonalList.action?funcCode=${funcCode}&pageNum=${upPage}" class="ui-page-item ui-page-item-prev">上一页</a>
    <#assign downPage = pageNum +1>
    <#if (downPage > totalPage)>
          <#assign downPage = totalPage >
        </#if>
    <!--<a href="#" class="ui-page-item ui-page-item-current ">1</a>
    <a href="#" class="ui-page-item">2</a>
    <a href="#" class="ui-page-item">3</a>
    <span class="ui-page-item">...</span>
    <a href="#" class="ui-page-item">40</a>
    <a href="#" class="ui-page-item">41</a>-->
    <a href="../datum/gotoPersonalList.action?funcCode=${funcCode}&pageNum=${downPage}" class="ui-page-item ui-page-next">下一页</a>
    <a href="../datum/gotoPersonalList.action?funcCode=${funcCode}&pageNum=${totalPage}" class="ui-page-item ui-page-last">尾页</a></span>
    
</div> 
<!-- .ui-page -->

</form>
<!--列表结束-->
<script type="text/javascript" src="../pages/datum/js/jquery-1.8.2.min.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../pages/datum/js/tpl.base.js"></script>
<!-- 弹出遮罩层-->
<script type="text/javascript" src="../pages/datum/lhgdialog/lhgdialog.min.js"></script>
<script type="text/javascript" >
function opendg(dgurl,dgw,dgh)
{

  $.dialog({ 

    title:'弹出视窗',
    width: dgw,
    height: dgh,
    content:'url:'+ dgurl});
   
}
</script>
</html>
