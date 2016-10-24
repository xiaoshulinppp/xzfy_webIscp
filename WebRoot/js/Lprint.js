/*分行读取textarea内容*/
 function getRange(num, areaId)      //行号，文本区域的ID
{ 
 var txtRange = document.all(areaId).createTextRange(); //获取鼠标
 var rect = txtRange.getClientRects();     //选择范围
 var left = rect[0].left;        //左侧位置
 var oPostion = left-txtRange.offsetLeft;//相对页面位置
 //alert(left-txtRange.offsetLeft);
 if(num > rect.length - 1)      //超出行范围
 return; 
 if(num == 0)        //如果是第一行
 {
  
 var right = rect[0].right; 
 txtRange.moveEnd("character",-txtRange.text.length); //移动到结尾
 while(txtRange.offsetLeft + txtRange.boundingWidth +oPostion< right) //没有到结尾,其中222由left-txtRange.offsetLeft(未选内容时)得到
 { 
 txtRange.expand("character");    //扩展宽度到结尾
 } 
 return txtRange;  //返回选择区域
 } 
 else 
 { 
 var right = rect[num].right;   //右侧范围
 var txtRange = getRange(num-1, areaId);   //获取选择域
 txtRange.moveStart("character",txtRange.text.length + 1); //移动到开始位置
 while(txtRange.offsetLeft + txtRange.boundingWidth +oPostion < right) //如果没有到结尾
 {
 txtRange.expand("character");  //扩展到结尾
 } 
 if(txtRange.offsetLeft +oPostion > left)
 {
    //alert(3);
 txtRange.moveStart("character",-1); 
 }  //开始位置前
 return txtRange; 
 } 
} 
 function getText(num,id)//根据行号，返回选择
 { 
 var txtRange = getRange(num,id) 
 if(txtRange != null) 
 { 
 //txtRange.select();   //如果不为空，则选择
 return txtRange.htmlText;
 } 
};
function newtext(start,end,id){
 var str="";
 for(var i=start-1;i<end;i++)
 {
  str+=getText(i,id)+'\n';
 }
 return str;
};