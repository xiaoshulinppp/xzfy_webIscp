<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="utf-8" />
	<title>行政复议信息管理系统</title>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>
</head>
<body onload="startTime()">
<form name="form" action ="saveReply.action" validate="true" method="post">
<#include "../website/header.ftl">

<div class="wal pageNow2">
      <div class="fl">当前位置：<a href="../wyxx/showQustnPage.action?funcCode=${funcCode}&column=7">在线调查</a></div>
</div>


<input type="hidden" name="funcCode" value="${funcCode}" />
<input type="hidden" name="id" value="${id}">
<div class="pageBg1">
	<div class="wal">
    	<div class="h10"></div>
	  		<div class="pageBg3"></div>
      		<div class="pageBg5 commentList">
      		<ul>
      			<li>
      				<div class="name"><span>楼主<span></div><br>  	
	  				<div class="name">${xzfyOtherSuggest.fullName}：${xzfyOtherSuggest.opinion}（${xzfyOtherSuggest.submitTime}）</div>
	  			</li>
	  			
      			<#list opinionList as op>
      			<li>
      				<div class="name"><span>${op_index+1}楼<span></div><br>	
	  				<div class="name">${op.fullName}&nbsp;:&nbsp;${op.opinion}（${op.submitTime}）</div>
	  				
	  			</li>  			
	  			</#list>
	  			
	  </ul>
	  <div class="msg">共有 ${opinionList.size()}条回复</div>
	  </div>
      <div class="pageBg4"></div>
      <div class="h25"></div>
      <div class="commentTitle">文明社会，从理性发贴开始。</div>
      <div class="pageBg5 commentForm">
      <div class="bg">
      <textarea name="reply.opinion" id="opinion" class="textarea"></textarea>
            
            <div class="fr">
            <input type="button" class="btn1" onclick="reply()"/></div>
            <span class="clear_f"></span>
		</div>
        </div>
        <div class="pageBg4"></div>
	</div>
</div>	
</div>
</form>
<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>

</body>
<script>
	function reply(){
		if(document.getElementById("opinion").value==""){
			alert("回复不可为空");
		}else{
			if(confirm("确认回复")){
				document.form.submit();
			}
		}
	}

</script>
</html>