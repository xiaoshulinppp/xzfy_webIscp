/*���ж�ȡtextarea����*/
 function getRange(num, areaId)      //�кţ��ı������ID
{ 
 var txtRange = document.all(areaId).createTextRange(); //��ȡ���
 var rect = txtRange.getClientRects();     //ѡ��Χ
 var left = rect[0].left;        //���λ��
 var oPostion = left-txtRange.offsetLeft;//���ҳ��λ��
 //alert(left-txtRange.offsetLeft);
 if(num > rect.length - 1)      //�����з�Χ
 return; 
 if(num == 0)        //����ǵ�һ��
 {
  
 var right = rect[0].right; 
 txtRange.moveEnd("character",-txtRange.text.length); //�ƶ�����β
 while(txtRange.offsetLeft + txtRange.boundingWidth +oPostion< right) //û�е���β,����222��left-txtRange.offsetLeft(δѡ����ʱ)�õ�
 { 
 txtRange.expand("character");    //��չ��ȵ���β
 } 
 return txtRange;  //����ѡ������
 } 
 else 
 { 
 var right = rect[num].right;   //�Ҳ෶Χ
 var txtRange = getRange(num-1, areaId);   //��ȡѡ����
 txtRange.moveStart("character",txtRange.text.length + 1); //�ƶ�����ʼλ��
 while(txtRange.offsetLeft + txtRange.boundingWidth +oPostion < right) //���û�е���β
 {
 txtRange.expand("character");  //��չ����β
 } 
 if(txtRange.offsetLeft +oPostion > left)
 {
    //alert(3);
 txtRange.moveStart("character",-1); 
 }  //��ʼλ��ǰ
 return txtRange; 
 } 
} 
 function getText(num,id)//�����кţ�����ѡ��
 { 
 var txtRange = getRange(num,id) 
 if(txtRange != null) 
 { 
 //txtRange.select();   //�����Ϊ�գ���ѡ��
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