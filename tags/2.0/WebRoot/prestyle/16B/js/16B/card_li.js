//ͨ��ѡ�����루���л���������
function changeCard(cardName,clsName)
{
 var cardList = cardName.parentNode.getElementsByTagName("li");
  for(i=0;i<cardList.length;i++){
   if(cardName == cardList[i]) {
		cardList[i].className = clsName + "On";
   }
   else{
		cardList[i].className = clsName + "Off";
    }
	}
}

//ͨ��ѡ���в��л����� 
//infoid Ϊѡ����������DIV��ID��cardid��this��������ע�⡮����ʹ�á�
function showCard(cardid,infoid,clsName)
{
 var cardList = cardid.parentNode.getElementsByTagName("li");
  for(i=0;i<cardList.length;i++){
   if(cardid == cardList[i]) {
		cardList[i].className = clsName + "On";
		eval(infoid + i + ".style.display=\"block\";"); 
   }
   else{
		cardList[i].className = clsName + "Off";
		eval(infoid + i + ".style.display=\"none\";"); 
    }
	}
}
