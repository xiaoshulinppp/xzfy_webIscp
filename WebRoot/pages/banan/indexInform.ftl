
<style>
#show{background-color:#FFFAF0;width:500px;display:none;position:absolute;z-index:11;zoom:1;border-left:4px solid #1E90FF;border-right:4px solid #1E90FF;border-bottom:4px solid #1E90FF;border-top:4px solid #1E90FF;padding:0px;}
#bgbox{position:absolute;left:0;top:0;background:#000;filter:alpha(opacity=30);opacity:0.3;z-index:10}
</style>

<script type="text/javascript">


<#if informList1?has_content || informList2?has_content>
setTimeout('show()',1000)
</#if>
var iWidth = document.documentElement.clientWidth;
var iHeight = document.documentElement.clientHeight;
var div_width = 502;
var div_height = 302;

function show(){
//var div_x=(iWidth-div_width)*Math.random()
//var div_y=(iHeight-div_height)*Math.random()
var div_x=(iWidth-div_width)/2;
var div_y=(iHeight-div_height)/2;
var bgObj = document.createElement("div");
bgObj.setAttribute("id","bgbox");
bgObj.style.width = iWidth+"px";
bgObj.style.height =Math.max(document.body.clientHeight, iHeight)+"px";
document.body.appendChild(bgObj);
var oShow = document.getElementById('show');
oShow.style.display = 'block';
oShow.style.left = div_x+"px";
oShow.style.top = div_y+"px";
function oClose(){
oShow.style.display = 'none';
document.body.removeChild(bgObj);
}
bgObj.onclick = oClose;
document.getElementById("closebtn").onclick=oClose;

}
function hasRead(){
	var options = { 
				url:'../banan/hasInformed.action', 
				type:'POST', 
				success:null
			}; 
			$('#tanchuform').ajaxSubmit(options); 
			return ;
}
</script>

<!-- 弹出框开始 -->
<form id="tanchuform" name="tanchuform" method="post" ENCTYPE="multipart/form-data" >
<input type="hidden" name="funcCode" value="${funcCode}" />
<div id="show">
<div class="ui-list-title fn-clear">
    <h4><font class="font-orange">${admit_name}您好！</font>案件办理提示：</h4>
    <ul class="ui-btnbar fn-right">
          <li> <a  href="javascript:hasRead()" id="closebtn"  class="btn btn-orange fn-text-center">确定</a> </li>
    </ul>
</div>
<div class="ui-list fn-clear">
   <table class="ui-table ui-table-list table-fix" >
     <tbody >
     	<!--<tr>
            <th class="fn-text-center">日期</th>
            <th class="fn-text-center">申请人</th>
            <th class="fn-text-center">类型</th>-->
            <!--<th class="fn-text-center"><a href="javascript:void(0);" class="btn btn-list fn-left">操作</a> </th>-->
       <!-- </tr>-->
       <#if informList1?has_content>
     	<#list informList1 as i>
         <tr><!--
            <td class="fn-text-center">${i[2]?default('')}</td>
            <td class="fn-text-center">${i[1]?default('')}</td>
            <td class="fn-text-center"><font class="font-orange">【${i[4]?default('')}】</font></td>
            -->
            <td class="fn-text-center">${i[2]?default('')}，${i[1]?default('')} <font class="font-orange">${i[4]?default('')}</font>。详情可查看当日接待记录</td>
            <!--<td class="fn-text-center"><a href="javascript:void(0);" class="btn btn-list fn-left">查看</a> </td>-->
        </tr>
        	<input type="hidden" name="meetIds" value="${i[5]?default('')}" />
       </#list>
       </#if>
       <#if informList2?has_content>
       <#list informList2 as i>
         <tr><!--
            <td class="fn-text-center">${i[2]?default('')}</td>
            <td class="fn-text-center">${i[1]?default('')}</td>
            <td class="fn-text-center"><font class="font-orange">【${i[4]?default('')}】</font></td>
            -->
            <td class="fn-text-center">${i[2]?default('')}，${i[1]?default('')} 前来<font class="font-orange">补正复议申请</font>，请及时处理。详情可查看当日接待记录</td>
            <!--<td class="fn-text-center"><a href="javascript:void(0);" class="btn btn-list fn-left">查看</a> </td>-->
        </tr>
        	<input type="hidden" name="recieveIds" value="${i[0]?default('')}" />
       </#list>
       </#if>
       </tbody>
     </table>
 </div>
</div>
</form>
<!-- 弹出框结束 -->
