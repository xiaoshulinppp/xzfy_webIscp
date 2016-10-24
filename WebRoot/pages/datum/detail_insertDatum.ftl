<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>工作记录管理</title>
<meta http-equiv=="Pragma" CONTENT="no-cache">
<meta http-equiv="Window-target" CONTENT="_top">
<!-------样式文件调用注意不要改变顺序------>
<link href="../pages/datum/css/base.css" rel="stylesheet" type="text/css" />
<link href="../pages/datum/css/main_style.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 7]><link href="../pages/datum/css/ie7hack.css" rel="stylesheet" type="text/css" media="screen"/><![endif]--><!--不可删--->
</head>
<script>
var api = frameElement.api, W = api.opener, D = W.document; 
			
	function tijiao(){
	 	if(confirm("您确定提交数据吗？"))
   		{
		window.inputForm.action="../datum/insertDatum.action";
		window.inputForm.submit();
		alert("资料保存成功！");
		window.parent.parent.document.getElementById("mainframe").src="datum/gotoPersonalList.action?funcCode=${funcCode}";
			api.close();
		}
	}
	
	
	function closewin(){
		//window.parent.location.href="../datum/gotoPersonalList.action?funcCode=${funcCode}"; 
		window.parent.location.reload();
    	//window.close();   
	}
</script>
<body>
<form name="inputForm"   method="post" enctype="multipart/form-data" id="inputForm">
<input type="hidden" name="funcCode" value="${funcCode}"  />
<!--标题开始-->
<div class="ui-title fn-clear">
     <span class="ui-title-icon fn-left"><img src="../pages/datum/images/icons/crumb.png"/></span>
      <h2 class="ui-title-cnt fn-left">资料管理 - 资料上传</h2>  </div>       
<!--标题结束-->
<span class="x-line fn-clear"><img src="../pages/datum/images/pic_search_line.png"/></span><!--我是有箭头灰色的分割线-->
<div class="ui-form fn-clear">
	<table  id=""class="ui-table ui-table-form "  summary="这是一个1行2列的表格样式模板" >
    <tbody class="discolor_form">
    		<tr>
                 <td  class="fn-text-right">资料名称</td>
                 <td ><input type="text" name="appDatum.title" value=""  /></td>
           </tr>
    		<tr>
                 <td  class="fn-text-right">资料类型</td>
                 <td ><select name="appDatum.type">
                 <option value="999">请选择</option>
                 <#if dictList?has_content>
                 <#list dictList as dl>
                 
                  <option value="${dl.value}">${dl.name}</option>
                  
                  </#list>
                  </#if>
                 </select></td>
          </tr>
          <tr>
                 <td  class="fn-text-right">关键词</td>
                 <td ><textarea name="appDatum.keyword" id="textarea"></textarea>(关键词填写1-5个，用“,”号分隔)</td>
           </tr>
            <tr>
                 <td  class="fn-text-right">资料摘要</td>
                 <td ><textarea name="appDatum.summary" id="textarea"></textarea></td>
           </tr>
             <tr>
                 <td  class="fn-text-right">填写人</td>
                 <td ><input type="text" name="appDatum.uploadpeople" value="${userName?default('')}"  /></td>
           </tr>
            <tr>
                 <td  class="fn-text-right">填写日期</td>
                 <td ><input type="text" name="appDatum.uploadtime" value="${currenttime?default('')}"  /></td>
           </tr>
           <tr>
                 <td  class="fn-text-right">添加附件</td>
                 <td ><input type="file" name="files"   /></td>
           </tr>
    </tbody>
    <tfoot>
      <tr>
        <td colspan="2"  >
        <input class="ui-btn ui-btn-yellow" type="button" name="button" id="" onclick="tijiao()" value="提交"  title="提交" /><input class="ui-btn ui-btn-normal" onclick="document.inputForm.reset();" type="reset" value="重置" title="重置"/>
        </td>
      </tr>
    </tfoot>
    </table>
</div>	   
</form>
</body>
</html>
