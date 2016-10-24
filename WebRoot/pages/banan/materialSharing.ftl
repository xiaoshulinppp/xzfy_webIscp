<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

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


<style type="text/css">img,formDiv,.formDiv{behavior: url(../webstyle/style/ie-css3.htc);} </style> 
</head>

<body>
<div class="headDiv">
<div class="wal">
      <a href="" class="logo"><img src="../webstyle/image/logo.png"/></a>
      <div class="time">当前时间： 2013年10月28日 22点41分</div>
      <div class="nav">
            <ul>
               <li class="li_01"><a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页</a><>
               <li class="li_02"><a href="../website/showColumn.action?funcCode=${funcCode}&column=1">复议动态</a><>
               <li class="li_03"><a href="../website/showColumn.action?funcCode=${funcCode}&column=2">时政快递</a><>
               <li class="li_04"><a href="../website/showColumn.action?funcCode=${funcCode}&column=3">法律法规</a><>
               <li class="li_05"><a href="../website/showColumn.action?funcCode=${funcCode}&column=4">典型案例</a><>
               <li class="li_06"><a href="">资料库</a><>
               <li class="li_07"><a href="">工作建议</a><>
            </ul>
      </div>
</div>
</div>

<div class="wal">
<div class="pageBg">
<!--wal-->
<div class="fl w198">
      <div class="sideNav">
            <div class="title">请选择栏目</div>
            <ul>
            	 <li><a href="javascript:;" class="aNow" >案件信息</a></li>
            	
            	 
                 
            </ul>
      </div>
      <div class="sideTip">
            <h1 class="title">案件办理提示</h1>
            <div class="content">同一具体行政行为案件共<a href="">12</a>件<br />相关法律法规<a href="">8</a>项</div>
      </div>
</div>
<div class="fr w739">
      <div class="pageNow">
      		当前位置：案件办理 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </div>
    <form id="form1" name="form1" action="''" method="post" ENCTYPE="multipart/form-data">

			<input type="hidden" name="funcCode" value="${funcCode}" />
			

<!--=============================================================================================================================================-->				
<!--========-- start---资料上传---start ======================-- start---资料上传---start --======================-- start---资料上传---start --=========================================================================================-->
  	<div class="pageDiv" style="display:block" >         
		<div class="formDiv"  >
			<div class="btn">
				<div class="fl">
					<a href="javascript:save()"  >保存</a>
					<a href="javascript:gotoBack()">返 回</a>
				</div>
			</div>
			<table id="banan" width="100%" border="0" cellpadding="0" cellspacing="0" >			  						
				<tr>
					<th>文章名</th>
					<td>
						<input type="text" name="xzfySharing.name" value="" />
					</td>
					<th>关键词</th>
					<td>
						<p>多个关键词请以逗号隔开</p>
						<input type="text" name="xzfySharing.keyword" value="" />
					</td>
				</tr>
				<tr>
					<th>文章摘要</th>
					<td colspan=3>
						<textarea type="text" name="xzfySharing.summary" class="textarea"></textarea>
					</td>
				</tr>
				<tr>
					<th>是否公开</th>
					<td>
						<input type="radio" name="xzfySharing.isshare" value="0" />否
						<input type="radio" name="xzfySharing.isshare" value="1" />是
					</td>
					<th>附件上传</th>
					<td>
						<input type="file" name="upfile" />
					</td>
				</tr>  		
		  	</table><br/>
		  	<div class="btn">
				<div class="fl">
					<a href="javascript:save()" >保存</a>
					<a href="javascript:gotoBack()">返 回</a>
				</div>
			</div>
        </div>
  	</div>    
<!--========-- end---资料上传---end =======================-- end---资料上传---end --=======================-- end---资料上传---end --=======================================================================================-->		
<!--=============================================================================================================================================-->	
<!--========-- start---我的资料---start ======================-- start---我的资料---start --======================-- start---我的资料---start --=========================================================================================-->  
	          
            
<!--========-- end---我的资料---end =======================-- end---我的资料--end --=======================-- end---我的资料---end --=======================================================================================-->		
<!--=============================================================================================================================================-->	
<!--========-- start---共享资料---start ======================-- start---共享资料---start --======================-- start---共享资料---start --=========================================================================================-->  


<!--========-- end---共享资料---end =======================-- end---共享资料---end --=======================-- end---共享资料---end --=======================================================================================-->		
<!--=============================================================================================================================================-->	
  </form>
</div>
<span class="clear_f"></span>
<div class="h50"></div>
<!--walEnd-->
</div>
</div>

<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>
</body>
</html>


<script >	
	function gotoBack(){
		window.history.back();
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
</script>
<script>
	function save(){
		if(confirm("确认提交？")){	
			window.form1.action="savebanan.action?tempstatus=0";
			window.form1.submit();
			alert("操作已完成！");
		}
	}		
</script>
