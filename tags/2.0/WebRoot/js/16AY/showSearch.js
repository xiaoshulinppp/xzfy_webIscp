/*function showSearch(divId)
{
	if(divId.style.display == 'none'){
		divId.style.display = 'block';
		}else{
		divId.style.display = 'none';
		}	
}*/
/*20080616��firefox&ie6-7,��ͨ�á�ҳ�������Ҫ��'' onClick="showSearch('searchTop')"*/

function showSearch(divId)
{
	if(document.getElementById(divId).style.display == 'none'){
		document.getElementById(divId).style.display = 'block';
		}else{
		document.getElementById(divId).style.display = 'none';
		}	
}