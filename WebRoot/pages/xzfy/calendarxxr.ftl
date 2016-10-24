<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript" src="../js/16B/flashobj.js"></script>

<HTML><HEAD><TITLE>万年历查询</TITLE>
<META 
content="农历; 阳历; 月历; 节日; 时区; 节气; 八字; 干支; 生肖; gregorian solar; chinese lunar; calendar;" 
name=keywords>
<META content=All name=robots>
<META content="gregorian solar calendar and chinese lunar calendar" 
name=description>
<link href="../css/main.css" rel="stylesheet" type="text/css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
<style type="text/css">

p {fONT-FAMILY: 宋体; FONT-SIZE: 9pt;line-height:12pt:color:#000000}

TD {fONT-FAMILY: 宋体,simsun; FONT-SIZE: 9pt}
    
a:link{ color:#000000; text-decoration:none}     
a:visited{COLOR: #000000; TEXT-DECORATION: none} 
a:active{color:green;text-decoration:none}
a:hover{color:red;text-decoration:underline}  
</style>

<SCRIPT language=JavaScript>

<!--
/*****************************************************************************
                                   日期资料
*****************************************************************************/


var lunarInfo=new Array(
0x04bd8,0x04ae0,0x0a570,0x054d5,0x0d260,0x0d950,0x16554,0x056a0,0x09ad0,0x055d2,
0x04ae0,0x0a5b6,0x0a4d0,0x0d250,0x1d255,0x0b540,0x0d6a0,0x0ada2,0x095b0,0x14977,
0x04970,0x0a4b0,0x0b4b5,0x06a50,0x06d40,0x1ab54,0x02b60,0x09570,0x052f2,0x04970,
0x06566,0x0d4a0,0x0ea50,0x06e95,0x05ad0,0x02b60,0x186e3,0x092e0,0x1c8d7,0x0c950,
0x0d4a0,0x1d8a6,0x0b550,0x056a0,0x1a5b4,0x025d0,0x092d0,0x0d2b2,0x0a950,0x0b557,
0x06ca0,0x0b550,0x15355,0x04da0,0x0a5b0,0x14573,0x052b0,0x0a9a8,0x0e950,0x06aa0,
0x0aea6,0x0ab50,0x04b60,0x0aae4,0x0a570,0x05260,0x0f263,0x0d950,0x05b57,0x056a0,
0x096d0,0x04dd5,0x04ad0,0x0a4d0,0x0d4d4,0x0d250,0x0d558,0x0b540,0x0b6a0,0x195a6,
0x095b0,0x049b0,0x0a974,0x0a4b0,0x0b27a,0x06a50,0x06d40,0x0af46,0x0ab60,0x09570,
0x04af5,0x04970,0x064b0,0x074a3,0x0ea50,0x06b58,0x055c0,0x0ab60,0x096d5,0x092e0,
0x0c960,0x0d954,0x0d4a0,0x0da50,0x07552,0x056a0,0x0abb7,0x025d0,0x092d0,0x0cab5,
0x0a950,0x0b4a0,0x0baa4,0x0ad50,0x055d9,0x04ba0,0x0a5b0,0x15176,0x052b0,0x0a930,
0x07954,0x06aa0,0x0ad50,0x05b52,0x04b60,0x0a6e6,0x0a4e0,0x0d260,0x0ea65,0x0d530,
0x05aa0,0x076a3,0x096d0,0x04bd7,0x04ad0,0x0a4d0,0x1d0b6,0x0d250,0x0d520,0x0dd45,
0x0b5a0,0x056d0,0x055b2,0x049b0,0x0a577,0x0a4b0,0x0aa50,0x1b255,0x06d20,0x0ada0,
0x14b63);

var solarMonth=new Array(31,28,31,30,31,30,31,31,30,31,30,31);
var Gan=new Array("甲","乙","丙","丁","戊","己","庚","辛","壬","癸");
var Zhi=new Array("子","丑","寅","卯","辰","巳","午","未","申","酉","戌","亥");
var Animals=new Array("鼠","牛","虎","兔","龙","蛇","马","羊","猴","鸡","狗","猪");
var solarTerm = new Array("小寒","大寒","立春","雨水","惊蛰","春分","清明","谷雨","立夏","小满","芒种","夏至","小暑","大暑","立秋","处暑","白露","秋分","寒露","霜降","立冬","小雪","大雪","冬至");
var sTermInfo = new Array(0,21208,42467,63836,85337,107014,128867,150921,173149,195551,218072,240693,263343,285989,308563,331033,353350,375494,397447,419210,440795,462224,483532,504758);
var nStr1 = new Array('日','一','二','三','四','五','六','七','八','九','十');
var nStr2 = new Array('初','十','廿','卅','□');
var monthName = new Array("JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC");

//国历节日 *表示放假日
var sFtv = new Array(
"0101*元旦",
"0308 妇女节",
"0501*国际劳动节",
"0504 青年节",
"0531 世界无烟日", 
"0601 国际儿童节",
"0701 中共诞辰",
"0801 建军节",
"1001*国庆节",
"1016 世界粮食日")

//农历节日 *表示放假日
var lFtv = new Array(
"0101*春节",
"0115 元宵节",
"0505 端午节",
"0815 中秋节",
"0909 重阳节")

//某月的第几个星期几
var wFtv = new Array(
//一月的最后一个星期日（月倒数第一个星期日）
"0520 母亲节",
"0630 父亲节")



/*****************************************************************************
新加日期资料ByZyl
*****************************************************************************/
var txtFtv = new Array(); 
var txtFtv1 = new Array(); 

/*****************************************************************************
日期计算
*****************************************************************************/

//====================================== 返回农历 y年的总天数
function lYearDays(y) {
	var i, sum = 348;
	for(i=0x8000; i>0x8; i>>=1) sum += (lunarInfo[y-1900] & i)? 1: 0;
	return(sum+leapDays(y));
}

//====================================== 返回农历 y年闰月的天数
function leapDays(y) {
	if(leapMonth(y))  return((lunarInfo[y-1900] & 0x10000)? 30: 29);
	else return(0);
}

//====================================== 返回农历 y年闰哪个月 1-12 , 没闰返回 0
function leapMonth(y) {
	return(lunarInfo[y-1900] & 0xf);
}

//====================================== 返回农历 y年m月的总天数
function monthDays(y,m) {
	return( (lunarInfo[y-1900] & (0x10000>>m))? 30: 29 );
}


//====================================== 算出农历, 传入日期控件, 返回农历日期控件
//                                       该控件属性有 .year .month .day .isLeap
function Lunar(objDate) {//根据阳历算出农历
	var i, leap=0, temp=0;
	var offset   = (Date.UTC(objDate.getFullYear(),objDate.getMonth(),objDate.getDate()) - Date.UTC(1900,0,31))/86400000;

	for(i=1900; i<2050 && offset>0; i++) { temp=lYearDays(i); offset-=temp; }

	if(offset<0) { offset+=temp; i--; }

	this.year = i;

	leap = leapMonth(i); //闰哪个月
	this.isLeap = false;

	for(i=1; i<13 && offset>0; i++) {
		//闰月
		if(leap>0 && i==(leap+1) && this.isLeap==false)
			{ --i; this.isLeap = true; temp = leapDays(this.year); }
		else
			{ temp = monthDays(this.year, i); }

		//解除闰月
		if(this.isLeap==true && i==(leap+1)) this.isLeap = false;

		offset -= temp;
	}

	if(offset==0 && leap>0 && i==leap+1)
		if(this.isLeap)
			{ this.isLeap = false; }
		else
			{ this.isLeap = true; --i; }

	if(offset<0){ offset += temp; --i; }

	this.month = i;
	this.day = offset + 1;
}

//==============================返回公历 y年某m+1月的天数
function solarDays(y,m) {
	if(m==1)//每年的二月份，如果是闰年，返回29，如果不是返回28
		return(((y%4 == 0) && (y%100 != 0) || (y%400 == 0))? 29: 28);
	else//不是二月，直接从每月天数的数组里取出天数，每年天数，除二月外，都是固定的
		return(solarMonth[m]);
}
//============================== 传入 offset 返回干支, 0=甲子
function cyclical(num) {//返回年度的干支
	return(Gan[num%10]+Zhi[num%12]);
}

//============================== 阴历属性
function calElement(sYear,sMonth,sDay,week,lYear,lMonth,lDay,isLeap,cYear,cMonth,cDay) {

	this.isToday    = false;
	//瓣句
	this.sYear      = sYear;   //公元年4位数字
	this.sMonth     = sMonth;  //公元月数字
	this.sDay       = sDay;    //公元日数字
	this.week       = week;    //星期, 1个中文
	//农历
	this.lYear      = lYear;   //公元年4位数字
	this.lMonth     = lMonth;  //农历月数字
	this.lDay       = lDay;    //农历日数字
	this.isLeap     = isLeap;  //是否为农历闰月?
	//八字
	this.cYear      = cYear;   //年柱, 2个中文
	this.cMonth     = cMonth;  //月柱, 2个中文
	this.cDay       = cDay;    //日柱, 2个中文

	this.color      = '';

	this.lunarFestival = ''; //农历节日
	this.solarFestival = ''; //公历节日
	this.solarTerms    = ''; //节气
	//add by zyl at 2010-01-13 农业信息
	this.txtFestival = '';
}

//===== 某年的第n个节气为几日(从0小寒起算)
function sTerm(y,n) {//y年的第n个节日是几号
	var offDate = new Date( ( 31556925974.7*(y-1900) + sTermInfo[n]*60000  ) + Date.UTC(1900,0,6,2,5) );
	return(offDate.getUTCDate());
}




//============================== 返回阴历控件 (y年,m+1月)
/*
功能说明: 返回整个月的日期资料控件

使用方式: OBJ = new calendar(年,零起算月);

OBJ.length      返回当月最大日
OBJ.firstWeek   返回当月一日星期

由 OBJ[日期].属性名称 即可取得各项值

OBJ[日期].isToday  返回是否为今日 true 或 false

其他 OBJ[日期] 属性参见 calElement() 中的注解
*/
function calendar(y,m) {//年,零起算月

	var sDObj, lDObj, lY, lM, lD=1, lL, lX=0, tmp1, tmp2, tmp3;
	var cY, cM, cD; //年柱,月柱,日柱
	var lDPOS = new Array(3);
	var n = 0;
	var firstLM = 0;

	sDObj = new Date(y,m,1,0,0,0,0);    //当月一号的具体日期

	this.length    = solarDays(y,m);    //公历当月天数，y用来计算是不是闰年，根据是否是闰年及月份，到天数数组中找到一个月的天数
	this.firstWeek = sDObj.getDay();    //公历当月1日星期几  getDay()某日期是星期几

	////////年柱 1900年立春后为庚子年(60进制36)//根据年返回干支
	if(m<2) cY=cyclical(y-1900+36-1);
	else cY=cyclical(y-1900+36);
	
	var term2=sTerm(y,2); //立春日期

	////////月柱 1900年1月小寒以前为 丙子月(60进制12)
	var firstNode = sTerm(y,m*2) //返回当月「节」为几日开始
	cM = cyclical((y-1900)*12+m+12);

	//当月一日与 1900/1/1 相差天数
	//1900/1/1与 1970/1/1 相差25567日, 1900/1/1 日柱为甲戌日(60进制10)
	var dayCyclical = Date.UTC(y,m,1,0,0,0,0)/86400000+25567+10;

	for(var i=0;i<this.length;i++) {
		if(lD>lX) {
			sDObj = new Date(y,m,i+1);    //当月一日日期
			lDObj = new Lunar(sDObj);     //农历
			lY    = lDObj.year;           //农历年
			lM    = lDObj.month;          //农历月
			lD    = lDObj.day;            //农历日
			lL    = lDObj.isLeap;         //农历是否闰月
			lX    = lL? leapDays(lY): monthDays(lY,lM); //农历当月最后一天

			if(n==0) firstLM = lM;
			lDPOS[n++] = i-lD+1;
		}

		//依节气调整二月分的年柱, 以立春为界
		if(m==1 && (i+1)==term2) cY=cyclical(y-1900+36);
		//依节气月柱, 以「节」为界
		if((i+1)==firstNode) cM = cyclical((y-1900)*12+m+13);
		//日柱
		cD = cyclical(dayCyclical+i);

		//sYear,sMonth,sDay,week,
		//lYear,lMonth,lDay,isLeap,
		//cYear,cMonth,cDay
		this[i] = new calElement(y, m+1, i+1, nStr1[(i+this.firstWeek)%7],
		lY, lM, lD++, lL,
		cY ,cM, cD );
	}

	//节气
	tmp1=sTerm(y,m*2  )-1;
	tmp2=sTerm(y,m*2+1)-1;
	this[tmp1].solarTerms = solarTerm[m*2];
	this[tmp2].solarTerms = solarTerm[m*2+1];
//	if(m==3) this[tmp1].color = 'red'; //清明颜色

	//公历节日
	for(i in sFtv){
		if(sFtv[i].match(/^(\d{2})(\d{2})([\s\*])(.+)$/)){
			if(Number(RegExp.$1)==(m+1)) {
				this[Number(RegExp.$2)-1].solarFestival += RegExp.$4 + ' ';
				
			}
		}
	}

	//月周节日
	for(i in wFtv)
		if(wFtv[i].match(/^(\d{2})(\d)(\d)([\s\*])(.+)$/))
			if(Number(RegExp.$1)==(m+1)) {
				tmp1=Number(RegExp.$2);
				tmp2=Number(RegExp.$3);
				if(tmp1<5)
					this[((this.firstWeek>tmp2)?7:0) + 7*(tmp1-1) + tmp2 - this.firstWeek].solarFestival += RegExp.$5 + ' ';
				else {
					tmp1 -= 5;
					tmp3 = (this.firstWeek+this.length-1)%7; //当月最后一天星期?
					this[this.length - tmp3 - 7*tmp1 + tmp2 - (tmp2>tmp3?7:0) - 1 ].solarFestival += RegExp.$5 + ' ';
				}
			}

	//农历节日
	for(i in lFtv)
		if(lFtv[i].match(/^(\d{2})(.{2})([\s\*])(.+)$/)) {
			tmp1=Number(RegExp.$1)-firstLM;
			if(tmp1==-11) tmp1=1;
			if(tmp1 >=0 && tmp1<n) {
				tmp2 = lDPOS[tmp1] + Number(RegExp.$2) -1;
				if( tmp2 >= 0 && tmp2<this.length && this[tmp2].isLeap!=true) {
					this[tmp2].lunarFestival += RegExp.$4 + ' ';
					
				}
			}
		}
	
	
	// 案件信息
	var sCi1 = "${daoqi}";
	var txtdays=sCi1.split(", ");
	for(var i=0;i<txtdays.length;i++){
		var txtdayTemp=txtdays[i].split("@%");
		var temp1=txtdayTemp[0];
		var temp2=txtdayTemp[1];
		txtFtv[i]= temp1+" "+temp2;
	}	
	//把案件信息画到日历中
	for(i in txtFtv){
		if(txtFtv[i].match(/^(\d{2})(\d{2})([\s])(.+)$/)){
			if(Number(RegExp.$1)==(m+1)) {
				this[Number(RegExp.$2)-1].txtFestival += RegExp.$4 + ' ';
				if(RegExp.$3==' '){
					this[Number(RegExp.$2)-1].color = '#ff8e04';
				} 
			}
		}
	}
	
	
	// 行程信息
	var sCi2 = "${xingcheng}";
	var txtdays1=sCi2.split(", ");
	for(var i=0;i<txtdays1.length;i++){
		var txtdayTemp=txtdays1[i].split("：");
		var temp1=txtdayTemp[0];
		var temp2=txtdayTemp[1];
		txtFtv1[i]= temp1+" "+temp2;
	}	
	//把行程信息画到日历中
	for(i in txtFtv1){
		if(txtFtv1[i].match(/^(\d{2})(\d{2})([\s])(.+)$/)){
			if(Number(RegExp.$1)==(m+1)) {
				this[Number(RegExp.$2)-1].txtFestival += RegExp.$4 + ' ';
				if(RegExp.$3==' '){
					this[Number(RegExp.$2)-1].color = '#66ff00';
				} 
			}
		}
	}
	
	//今日

	if(y==tY1 && m==tM1) this[tD-1].isToday = true;
}

//====================== 中文日期
function cDay(d){
	var s;
	switch (d) {
		case 10:
			s = '初十'; break;
		case 20:
			s = '二十'; break;
		break;
		case 30:
		s = '三十'; break;
		break;
		default :
		s = nStr2[Math.floor(d/10)];
		s += nStr1[d%10];
	}
	return(s);
}

///////////////////////////////////////////////////////////////////////////////

var cld;

function drawCld(SY,SM) {
	var i,sD,s,size;
	cld = new calendar(SY,SM);

	for(i=0;i<42;i++) {//六行七列，42个格
	    gObj=eval('GD'+ i);
		sObj=eval('SD'+ i);
		lObj=eval('LD'+ i);
		sObj.className = '';

		sD = i - cld.firstWeek;
		if(i%7==0||i%7==6)
		   gObj.className='hasChoose';
		if(sD>-1 && sD<cld.length) { //日期内
			sObj.innerHTML = sD+1;

			if(cld[sD].isToday) {
				sObj.className = 'todayColor'; //今日颜色
			}

			sObj.style.color = cld[sD].color; //法定假日颜色
			var  nly;
			if(cld[sD].lMonth==1)nly='一';
			if(cld[sD].lMonth==2)nly='二';
			if(cld[sD].lMonth==3)nly='三';
			if(cld[sD].lMonth==4)nly='四';			
			if(cld[sD].lMonth==5)nly='五';
			if(cld[sD].lMonth==6)nly='六';			
			if(cld[sD].lMonth==7)nly='七';
			if(cld[sD].lMonth==8)nly='八';
			if(cld[sD].lMonth==9)nly='九';
			if(cld[sD].lMonth==10)nly='十';			
			if(cld[sD].lMonth==11)nly='十一';
			if(cld[sD].lMonth==12)nly='十二';
		}else { //非日期
			sObj.innerHTML = '';
			lObj.innerHTML = '';
		}
		if(sObj.innerHTML=='')
		   gObj.className=''
	}
	loadDays();
}

function changeCld() {
	var y,m;
	y=CLD.SY.selectedIndex+1900;
	m=CLD.SM.selectedIndex;

	 var u = "chooseXiuXiRi.action?funcCode=${funcCode}&years="+y+"&months="+m;
	    // alert(u);
		window.location= u;
}

function changeCld1() {
	var y,m;
	y=CLD.SY.selectedIndex+1900;
	m=CLD.SM.selectedIndex;
	drawCld(y,m);
}

function pushBtm(K) {
	switch (K){
		case 'YU' :
			if(CLD.SY.selectedIndex>0) CLD.SY.selectedIndex--;
			break;
		case 'YD' :
			if(CLD.SY.selectedIndex<150) CLD.SY.selectedIndex++;
			break;
		case 'MU' :
			if(CLD.SM.selectedIndex>0) {
				CLD.SM.selectedIndex--;
			}else {
				CLD.SM.selectedIndex=11;
				if(CLD.SY.selectedIndex>0) CLD.SY.selectedIndex--;
			}
			break;
		case 'MD' :
			if(CLD.SM.selectedIndex<11) {
				CLD.SM.selectedIndex++;
			}
			else {
				CLD.SM.selectedIndex=0;
				if(CLD.SY.selectedIndex<150) CLD.SY.selectedIndex++;
			}
			break;
		default :
		CLD.SY.selectedIndex=tY-1900;
		CLD.SM.selectedIndex=tM;
	}
	changeCld();
}

var Today = new Date();//日期函数Today:Mon Jan 11 11:01:11 UTC+0800 2010==>星期，月份，日期，时间，时区，年份
var tY = Today.getFullYear();//年：如，2010，指的是2010年
var tY1 = Today.getFullYear();
<#if years?has_content>
	tY=${years};
</#if>
var tM = Today.getMonth();//月：如，0，指的是1月
var tM1 = Today.getMonth();//月：如，0，指的是1月
<#if months?has_content>
	tM=${months};
</#if>

var tD = Today.getDate();//日：如，11，指的是11号
//////////////////////////////////////////////////////////////////////////////

var width = "130";
var offsetx = 2;
var offsety = 8;

var x = 0;
var y = 0;
var snow = 0;
var sw = 0;
var cnt = 0;

var dStyle;

//显示详细日期资料
function mOvr(v) {
	var s,festival,txt='';
	var sObj=eval('SD'+ v);
	var d=sObj.innerHTML-1;
	if(sObj.innerHTML!='') {
	
		sObj.style.cursor = 's-resize';

		if(cld[d].solarTerms == '' && cld[d].solarFestival == '' && cld[d].lunarFestival == '')
		festival = '';
		else
		festival = '<TABLE WIDTH=100% BORDER=0 CELLPADDING=2 CELLSPACING=0 BGCOLOR="#708d40"><TR><TD>'+
		'<FONT COLOR="#ffffff" STYLE="font-size:9pt;">'+cld[d].solarTerms + ' ' + cld[d].solarFestival + ' ' + cld[d].lunarFestival+'</FONT></TD>'+
		'</TR></TABLE>';
	
		if(cld[d].txtFestival == ''){ 
			txt = '';
		}else{
			var tempTxt = cld[d].txtFestival;
			var lineTxt = tempTxt.split("@@");
			for(var m=0;m<lineTxt.length;m++){
				txt += '<br><font color="#708d40">' + lineTxt[m] + '</font>';
			}
		}
		s= '<TABLE WIDTH="130" BORDER=0 CELLPADDING="6" CELLSPACING=0 BGCOLOR="#e6eed9" style="	border:1px solid #626d4f;"><TR><TD>' +
		'<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD><FONT COLOR="#708d40" STYLE="font-size:9pt;">'+
		cld[d].sYear+' 年 '+cld[d].sMonth+' 月 '+cld[d].sDay+' 日<br>'+
		'<font color="#708d40">农历'+(cld[d].isLeap?'闰 ':' ')+cld[d].lMonth+' 月 '+cld[d].lDay+' 日</font>'+ txt +
		'</FONT></TD></TR></TABLE>'+ festival +
		'</TD></TR></TABLE>';

		document.all["detail"].innerHTML = s;

		if (snow == 0) {
			dStyle.left = x+offsetx-(width/2);
			dStyle.top = y+offsety;
			dStyle.visibility = "visible";
			snow = 1;
		}
	}
}

//清除详细日期资料
function mOut() {
	if ( cnt >= 1 ) { sw = 0; }
	if ( sw == 0 ) { snow = 0; dStyle.visibility = "";}
	else cnt++;
}

function initial() {
   dStyle = detail.style;//浮动框样式
   CLD.SY.selectedIndex=tY-1900;//年份
   CLD.SM.selectedIndex=tM;//月份
   //alert(tY+" "+tM );
   drawCld(tY,tM);//根据年和月画出日历
 //  pushBtm('');
}
function getClass(tagname, className) { 
    if (document.getElementsByClassName) {   
         return document.getElementsByClassName(className);
    }
    else {
         var tagname = document.getElementsByTagName(tagname);
         var tagnameAll = [];
         for (var i = 0; i < tagname.length; i++) {
             if (tagname[i].className == className) {
                  tagnameAll[tagnameAll.length] = tagname[i];
              }
         }
         return tagnameAll;
     }
 }

function loadDays()
{
    var cld1 = new calendar(tY,tM);
    var firWeek= cld1.firstWeek;
    var vacDays = ${vacationsDaysList};
    for(var i=0;i<vacDays.length;i++)
    {
      var num = parseInt(vacDays[i])+firWeek-1;
      $("#SD"+num).parent().addClass("hasChoose");
	}
}

function choose(m){
	if($(m).hasClass('hasChoose')){
	   	$(m).removeClass('hasChoose');
	}
	else{
	    $(m).addClass('hasChoose');
	}
}
function gotoSubmit(){
    var y,m;
	y=CLD.SY.selectedIndex+1900;
	m=CLD.SM.selectedIndex;
	var days="";
	var r = getClass("td","hasChoose");
	for (var i = 0; i != r.length; i++) {
	    //alert(r[i].firstChild.innerHTML);
		days+=r[i].firstChild.innerHTML+",";
	}	
	$.ajax({
		url : "saveXiuXiRi.action",
			data : {
				years:y,
				months:m,
				days:days,
				funcCode:${funcCode}
			},
            //data:"years="+y&&"months="+m&&"",
			dataType : "text",
			type : "POST",
			success : function() {
				var u = "chooseXiuXiRi.action?funcCode=${funcCode}&years="+y+"&months="+m;
	            window.location= u;
			}
		});
}

//-->
</SCRIPT>
<script language="javascript">
/******************************************************
*  可拖动的浮动层提示窗口 Share JavaScript (http://www.ShareJS.com)
* 使用此脚本程序，请保留此声明
* 获取此脚本以及更多的JavaScript程序，请访问 http://www.ShareJS.com
******************************************************/
</script>

<STYLE>.todayColor {
	background-color:#FFFFF;
	font-size:14px;
	color:#66FF66;
	cursor:hand;
}
 .hasChoose{
background-color:yellow;
}
</STYLE>

<META content="MSHTML 6.00.2800.1505" name=GENERATOR></HEAD>
<BODY  onload=initial()>

<SCRIPT language=JavaScript>
   if(navigator.appName == "Netscape" || parseInt(navigator.appVersion) < 4)//
   document.write("<h1>你的浏览器无法执行此程序。</h1>此程序在 IE4 以后的版本才能执行!!")

</SCRIPT>

<SCRIPT language=JavaScript>

lck=0;
function r(hval){
	if ( lck == 0 )	{
		document.bgColor=hval; 
	}
}

</SCRIPT>

<DIV id=detail ></DIV>

<FORM name=CLD>

<input id="year"  type="hidden" value="${time}" id="timeCurrent">
<input id="month" type="hidden" value="${timem}" id="timeCurrentM">

<div  class="fl indexPart2_02" border="0" cellpadding="0" cellspacing="0">
<TABLE  width="99%" border="0" cellpadding="0" cellspacing="0" > 
<input id="submit" style="width:50px;height:30px;color:white;background:green" type="button" onclick="gotoSubmit()" value="保存"/>
  <TBODY>
  <TR>
    <TD >
    
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="contTitleMonth">
		    <tr>
		      <td  onclick="pushBtm('MU')" id='um'><a href="javascript:;" ><img src="../images/icon_rili_prev.png" alt="上一月" width="15" height="16" align="absmiddle" border="0" /> 上月 </a></td>
		      
		      <td  >
			  <SELECT onchange=changeCld() name=SY> 
              <SCRIPT language=JavaScript>
            	for(i=1900;i<2050;i++) {
            		document.write('<option>'+i+'</option>') 
            	}
            	//document.write(string):向当前文件写入一个字符串，string是一个字符串表达式
              </SCRIPT>
              </SELECT>年
		      <SELECT  onchange=changeCld() name=SM> 
              <SCRIPT language=JavaScript>
            	for(i=1;i<13;i++) document.write('<option>'+i)
            </SCRIPT>
            </SELECT>月</td>
		      <td class="nextPageTd" onclick="pushBtm('MD')"><a href="javascript:;" >下月 <img src="../images/icon_rili_next.png" alt="下一月" width="15" height="16" align="absmiddle" border="0"/></a></td>
		    </tr>
		  </table>
          <table width="100%" border="0" cellpadding="0" cellspacing="0" class="monthTab">
        <TR>
          <th  >星期日</th>
          <th  >星期一</th>
          <th  >星期二</th>
          <th  >星期三</th>
          <th  >星期四</th>
          <th  >星期五</th>
          <th  >星期六</th>
        </TR>
        
        <SCRIPT language=JavaScript>
            var gNum,msg,w,h;
            for(i=0;i<6;i++) {
               document.write('<tr >')
               for(j=0;j<7;j++) {
                  gNum = i*7+j
                  document.write('<td style="cursor:hand"  id="GD' + gNum +'" onclick="choose(this)"><font  id="SD' + gNum +'" style="font-size:12px;" face="Arial Black"')
                  document.write(' TITLE=""> </font><br><font id="LD' + gNum + '"  style="font-size:12px;"> </font></td>')
                 // if(gNum%7==0||gNum%7==6)
                   //   $("#SD"+gNum).parent().addClass("hasChoose");
               }
               document.write('</tr>')
            }
            
            </SCRIPT>  
        </table>    
        </TD>
  </TR>
  </TBODY></TABLE>
  </div>
  </FORM>

</BODY></HTML>
