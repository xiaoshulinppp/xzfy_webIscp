//ѡ��������
selector = [ "s1", "s2", "s3" ];

 

//ѡ����: "����", "ֵ", ��ѡ��
menu = [
"����","BJ",
 [
 "ֱϽ��","BJ-1",
  [
  "������","BJ-1-a",null,
	    "������","BJ-1-b",null,
	    "������","BJ-1-c",null
   
  ],
 "��","BJ-2",
  [
  "ƽ����","BJ-2-a",null,
		"˳����","BJ-2-b",null,
	    "��ƽ��","BJ-2-c",null
   
  ]
 ],
"���","TJ",
 [
 "ֱϽ��","TJ-1",
  [
  "�Ӷ���","TJ-1-a",null,
		 "������","TJ-1-b",null,
		 "��ƽ��","TJ-1-c",null
  ],
  "��","BJ-2",
  [
  "������","BJ-2-a",null,
		"������","BJ-2-b",null,
	    "��","BJ-2-c",null
   
  ]
 ]
];


function wizz(level)
{
 if( level == 0 )
  a = menu;
 else
 {
  str = "menu";
  for( i=0; i<level; i++ )
   str += "[" + (document.all[selector[i]].selectedIndex * 3 + 2)  + "]";
  a = eval(str);
 }
 if( a == null ) return;
 
 s = document.all[selector[level]];
 i = s.length;
 while( i > 0 ) s.options[--i] = null;
 while( i < Math.floor(a.length/3) )
  s.options[i] = Option( a[i*3], a[i++*3+1] );
 s.onchange = Function("wizz(" + (level+1) + ")");
 wizz(level+1);
}

wizz(0);