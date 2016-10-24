package com.iscp.sys.formLayout.model;
import java.util.*;

public class FieldItemModel implements ItemModel{
  public String table = "";
  public void setTable(String table){
    this.table = table;
  }
  public String getTable(){
    return table;
  }
  public boolean hidden = false;
  public String field = "";
  public void setField(){
    this.field = field;
  }
  public String getField(){
    return field;
  }
  public String action = "";
  public void setAction(){
    this.action = action;
  }
  public String getAction(){
    return action;
  }
  public String css_class;
  public int css_class_index = -1;
  public void setCss_class(String css_class){
    this.css_class = css_class;
    css_class_index = -1;
    for(int i = 0;i<this.SYSTEM_CSS_CLASSES.length;i++){
      if(SYSTEM_CSS_CLASSES[i].equals(css_class))
        css_class_index = i;
    }
  }
  public String getCss_class(){
    return this.css_class;
  }
  public String other_property_express;
  public FieldItemModel() {
  }
  public static void addp(StringBuffer sb,String name,String value){
    if(value != null){
      sb.append("[$" + name + "]");
      sb.append(value);
      sb.append("[/$" + name + "]");
    }
  }
  public String toString(){
    String tempstr="";
    StringBuffer sb = new StringBuffer();
    sb.append("[$element]");

    addp(sb,"table",table);
    addp(sb,"field",field);
    if(id != null && id.length()>0){
      addp(sb, "htmlid", id);
    }
    if(!hidden){
      addp(sb,"event",getEventString(this));
      addp(sb,"action",action);
      addp(sb,"css_class",css_class);
      addp(sb,"tab_index",tabIndex+"");
      addp(sb,"sourcetable",sourceTable);
      addp(sb,"sourceid",sourceId);
      addp(sb,"sourcename",sourceName);
      addp(sb,"fieldtype",this.getType());
      addp(sb,"fieldshowtype",this.getShowType());
      if(this.sourceTable != null){
        tempstr="relation";
      }
      else if(isDict){
        tempstr="dict";
      }
      else{
        tempstr="static";
      }
      addp(sb,"sourcetype",tempstr);
      addp(sb,"targetrelationtype",targetRelationType);
      addp(sb,"staticvalue",enu);
      addp(sb,"length",length);
      addp(sb,"default",default_);
      addp(sb,"isnull",isNull+"");
      addp(sb,"property_exp",this.other_property_express);
      if(isDict){
        addp(sb, "dictlistid", dictListId);
        addp(sb, "dicttype", this.getDictType());
        addp(sb, "dictshowtype", dictShowType);
        addp(sb, "dictvalgettype", dictvalGetType);
      }
    }
    sb.append("[/$element]");
    return sb.toString();
  }

  public String id;
  public String getId(){
    return id;
  }
  public void setId(String id){
    this.id = id;
  }
  public String getText(){
    if(sourceTable != null){
      return sourceTable;
    }
    return field;
  }

  public int tabIndex = 1;
  //��tab������һ����ý����Ԫ��
  public FieldItemModel tabNext;
  //��һ����ý����Ԫ�أ���tabNext�෴����this.tabNext.tabLast == this
  public FieldItemModel tabLast;
  public void setTabNext(FieldItemModel tabNext){
    //�����Ƿ����ڻ�
    FieldItemModel itemForCheck = this;
    while(itemForCheck != null){
      if(itemForCheck == tabNext){
        if(this.tabLast != null){
          this.tabLast.tabNext = null;
        }
        this.tabLast = null;
        break;
      }
      itemForCheck = itemForCheck.tabLast;
    }
    //�������
    if(this.tabNext != null){
      this.tabNext.tabLast = null;
    }
    this.tabNext = tabNext;
    if(tabNext.tabLast != null){
      tabNext.tabLast.tabNext = null;
    }
    tabNext.tabLast = this;
  }
  public String sourceTable;
  public String sourceId;
  public String sourceName;
  public String targetRelationType;

  //���չ�����
  ///////////////////
  //     type      //
  ///////////////////
  public static final int INT = 0;
  public static final int STRING = 1;
  public static final int DATE = 2;
  public static final int FLOAT = 3;
  public static final String[] TYPES__ = {"int","string","date","float"};
  public int type;//�ֶ�ֵ���ͣ�Ϊint��string��date
  public String getType(){
    return TYPES__[type];
  }
  public void setType(String type){
    for(int i = 0;i<TYPES__.length;i++){
      if(TYPES__[i].equals(type)){
        this.type = i;
        return;
      }
    }
  }
  ///////////////////
  //   showType    //
  ///////////////////
  public static final int SELECT = 0;//�����б�
  public static final int INPUT = 1;//�ı���
  public static final int TEXTAREA = 2;//�ı�����
  public static final int INPUTFILE = 3;//�ϴ��ļ�
  public static final int INPUTWIN = 4;//�ı���ť
  public static final int RADIO = 5;//��ѡ��
  public static final int CHECKBOX = 6;//��ѡ��
  public static final int INVISIBLE = 7;//����ʾ

  public static final String[] SHOWTYPES__={
      "select","input","textarea","inputfile","inputwin","radio",
      "checkbox","invisible"};
  public int showType;//�ֶ���ʾ���ͣ�Ϊinput��radio��textarea�ȵ�
  public String getShowType(){
    return SHOWTYPES__[showType];
  }
  public void setShowType(String showType){
    for(int i = 0;i<SHOWTYPES__.length;i++){
      if(SHOWTYPES__[i].equals(showType)){
        this.showType = i;
        return;
      }
    }
  }
  public String enu;//��̬�б�
  public String length;//����
  public String default_;//ȱʡֵ
  public boolean isNull;//�Ƿ�ɿգ�����ѡtrue��false
  public void setIsNull(String isNull){
    this.isNull = isNull == null || (isNull.equals("true")||isNull.equals("1"));
  }
  public String getIsNull(){
    return isNull+"";
  }
  public boolean isDict;//�Ƿ�ʹ�������ֵ�
  public void setIsDict(String isDict){
    this.isDict = isDict != null && (isDict.equals("true") || isDict.equals("1"));
  }
  public String dictListId;//�����ֵ���
  ////////////////
  //  dictType  //
  ////////////////
  public static final int DICT_TREE = 0;
  public static final int DICT_RADIO = 1;
  public static final String[] DICTTYPES__ = {"tree","radio"};
  public int dictType;//�����ֵ�����
  public String getDictType(){
    return DICTTYPES__[dictType];
  }
  public void setDictType(String dictType){
    for(int i = 0;i<DICTTYPES__.length;i++){
      if(DICTTYPES__[i].equals(dictType)){
        this.dictType = i;
        return;
      }
    }
  }
  //ϵͳ�ṩ��css��ʽ
  public static String[] SYSTEM_CSS_CLASSES = {
      "selectStyleLong","selectStyleNormal",
      "inputTextLong","inputTextNormal","inputTextNumber",
      "textarea",
      "button",
      "fieldsetNormal",
      ""
  };
  private static int[][] SYSTEM_CSS_SELECTABLE;
  //�������type���Ӧ��css
  public static int[] getSelectableCss(int type){
    if(SYSTEM_CSS_SELECTABLE == null){
      SYSTEM_CSS_SELECTABLE = new int[SHOWTYPES__.length][];
      //�����б�
      int i = SELECT;
      SYSTEM_CSS_SELECTABLE[i] = new int[] {0, 1};
      //�ı���
      i = INPUT;
      SYSTEM_CSS_SELECTABLE[i] = new int[] {2, 3, 4};
      //�ı�����
      i = TEXTAREA;
      SYSTEM_CSS_SELECTABLE[i] = new int[] {5};
      //�ϴ��ļ�
      i = INPUTFILE;
      SYSTEM_CSS_SELECTABLE[i] = new int[] {2,3,4};
      //�ı���ť
      i = INPUTWIN;
      SYSTEM_CSS_SELECTABLE[i] = new int[] {6};
      //��ѡ��
      i = RADIO;
      SYSTEM_CSS_SELECTABLE[i] = new int[] {7};
      //��ѡ��
      i = CHECKBOX;
      SYSTEM_CSS_SELECTABLE[i] = new int[] {7};
      //����ʾ
      i = INVISIBLE;
      SYSTEM_CSS_SELECTABLE[i] = new int[] {8};
    }
    return SYSTEM_CSS_SELECTABLE[type];
  }
  public String dictvalGetType;
  public String dictShowType;
  public static String[] eventIntr;
  public static String[] eventName;
  private static int counterForEventInit = 0;
  private static void addEventForInit(String _eventName,String _eventIntr){
    eventName[counterForEventInit] = _eventName;
    eventIntr[counterForEventInit] = _eventIntr;
    counterForEventInit++;
  };
  static{
    counterForEventInit = 0;
    eventIntr = new String[14];
    eventName = new String[14];

    addEventForInit("onblur","ʧȥ����");
    addEventForInit("onchange","�ı�");
    addEventForInit("onclick","��굥��");
    addEventForInit("ondblclick","���˫��");
    addEventForInit("onfocus","��ý���");
    addEventForInit("onkeydown","���̼�����");
    addEventForInit("onkeypress","������ͨ������");
    addEventForInit("onkeyup","���̼�����");
    addEventForInit("onmousedown","��갴��");
    addEventForInit("onmousemove","����ƶ�");
    addEventForInit("onmouseout", "����Ƴ�");
    addEventForInit("onmouseover","�������");
    addEventForInit("onmouseup","��������");
    addEventForInit("onselect", "��ѡ");
  }
/*   public static String[] eventName = new String[]{
      //һ���¼�
      "onclick","ondblclick","onmousedown","onmouseup",
      "onmouseover","onmousemove","onmouseout","onkeypress",
      "onkeydown","onkeyup",
      //ҳ������¼�
      "onabort","onbeforeunload","onerror","onload",
      "onmove","onresize","onscroll","onstop","onunload",
      //������¼�
      "onblur","onchange","onfocus","onreset","onsubmit",
      //������Ļ�¼�
      "onbounce","onfinish","onstart",
      //�༭�¼�
      "onbeforecopy","onbeforecut","onbeforeeditfocus",
      "onbeforepaste","onbeforeupdate","oncontextmenu",
      "oncopy","oncut","ondrag","ondragdrop","ondragend",
      "ondragenter","ondragleave","ondragover","ondragstart",
      "ondrop","onlosecapture","onpaste","onselect","onselectstart",
      //���ݰ�
      "onafterupdate","oncellchange","ondataavailable",
      "ondatasetchanged","ondatasetcomplete","onerrorupdate",
      "onrowenter","onrowexit","onrowsdelete","onrowsinserted",
      //�ⲿ�¼�
      "onafterprint","onbeforeprint","onfilterchange","onhelp",
      "onpropertychange","onreadystatechange"};*/
  public boolean[] event = new boolean[eventName.length];

  public static String getFunction(FieldItemModel fim,String event){
    return fim.getTable()+"_"+fim.getField()+"_"+event+"(this)";
  }
  public static String getEventString(FieldItemModel fim,String event){
    return event + "=\""+getFunction(fim,event)+"\"";
  }
  public static String getEventString(FieldItemModel fim){
    StringBuffer sb = new StringBuffer();
    for(int i =0;i<eventName.length;i++){
      if(fim.event[i]){
        sb.append(" ");
        sb.append(getEventString(fim, eventName[i]));
      }
    }
    sb.append(" ");
    String result = sb.toString();
    if(result.length() == 0)result = null;
    return result;
  }
}
