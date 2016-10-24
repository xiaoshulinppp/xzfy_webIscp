package com.iscp.sys.formLayout.model;
import java.io.Serializable;
import java.util.*;

public class TableModel implements Serializable{
  public int rowCount = 0;
  public int columnCount = 0;
  public int height = 0;
  public int width = 0;
  public String logName = null;
  public String tabName = null;
  public String showName = null;
  public String tableDesc = null;
  public Vector javascripts = new Vector();
  public String javaScript = "";
  //���������
  //+--+--+--+--+  ��0������
  //|  |  |  |  |
  //+--+--+--+--+  ��1������
  //|  |  |  |  |
  //+--+--+--+--+  ��2������
  //|  |  |  |  |
  //+--+--+--+--+  ...
  //rows[i]��ʾ����е�i�����ߵ�����,rows[0] = 0
  public int[] rows;
  public RowTip[] rowtips;//�м��Ϸָ��
  //column[i]�Ķ�������rows[i]
  public int[] columns;
  //�����ʽ
  public String css_class;
  public TableModel(){
    this(800,500,20,20,0);
  }
  public TableModel(int width,int height,int rowCount,int columnCount,int leftSpace) {
    this.width = width;
    this.height = height;
    this.rowCount = rowCount;
    this.columnCount = columnCount;
    this.rows = new int[rowCount];
    this.rowtips = new RowTip[rowCount];
    this.columns = new int[columnCount];
    for (int i = 0; i < rows.length; i++) {
      rows[i] = i*height / (rows.length-1);
    }
    for (int i = 0; i < columns.length; i++) {
      columns[i] = i*width / (columns.length-1)+leftSpace;
    }
  }
  //��Ԫ��
  public Vector cells = new Vector();
  //�зָ��
  private CellModel[][] cellArrayMap;
  /**
   * ����հ׸���
   */
  private void insertBlankCells(){
    int size = cells.size();
    cellArrayMap = new CellModel[this.columnCount][this.rowCount];
    for (int i = 0; i < size; i++) {
      CellModel cell = (CellModel) cells.get(i);
      for (int y = cell.top; y < cell.rowspan + cell.top; y++) {
        for (int x = cell.left; x < cell.left + cell.colspan; x++) {
          cellArrayMap[x][y] = cell;
        }
      }
    }
    for(int y = 0;y< rowCount;y++){
      for (int x = 0; x < columnCount; x++) {
        if(cellArrayMap[x][y] == null){
          CellModel blank = new CellModel(x,y,0,1);
          cells.add(blank);
          for(int i = 0;i<columnCount-x-1;i++){
            if(cellArrayMap[x+i][y] == null){
              cellArrayMap[x+i][y] = blank;
            }
            else{
              break;
            }
            blank.colspan = i+1;
          }
        }
      }
    }
  }

  /**
   * ���ģ����ʽ
   * @return String
   */
  private String toString_(){
    setAutoTabIndex();
    StringBuffer sb = new StringBuffer();
    int size = hiddenFieldItems.size();
    if(size>0){
      sb.append("[$hidden]\r\n");
      for (int i = 0; i < size; i++) {
        FieldItemModel fim = (FieldItemModel) hiddenFieldItems.get(i);
        String tempAction = fim.action;
        int tempTabIndex = fim.tabIndex;
        fim.action = null;
        fim.tabIndex = -1;
        sb.append(fim.toString());
        sb.append("\r\n");
        fim.action = tempAction;
        fim.tabIndex = tempTabIndex;
      }
      sb.append("[/$hidden]\r\n");
    }
    sb.append("<table width=\"100%\"");
    if(css_class !=null && css_class.length()>0){
      sb.append(" class=\""+css_class+"\"");
    }
    sb.append("><tbody>\r\n");
//    sb.append("<table width=\""+width+"\" height=\""+height+"\">\r\n");
    sb.append("   <tr height=\"1\"><td></td>\r\n");
    for(int x=0;x<columnCount-1;x++){
      sb.append("      <td width=\""+(columns[x+1]-columns[x])*100/width+"%\"></td>\r\n");
    }
    sb.append("   </tr>\r\n");
    for(int y = 0;y< rowCount-1;y++){
//      sb.append("   <tr height = \""+(rows[y+1]-rows[y])*100/height+"%\">\r\n");
      RowTip tip = rowtips[y];
      if(tip!=null){
        sb.append("   </tbody><tbody");
        if(tip.id!=null){
          sb.append(" id=\""+tip.id+"\" style=\"display:block\"");
        }
        sb.append(">");
      }
      sb.append("   <tr height = \""+(rows[y+1]-rows[y])+"\">\r\n");
      sb.append("   <td></td>\r\n");
      for (int x = 0; x < columnCount-1; x++) {
        CellModel cm = cellArrayMap[x][y];
        if (cm.left == x && cm.top == y) {
//          cm.widthPercent = (columns[1+x]-columns[x])*100/width;
          sb.append("      "+cm.toString()+"\r\n");
        }
      }
      sb.append("   </tr>\r\n");
    }
    sb.append("</tbody></table>\r\n");
    sb.append("<script>\r\n");
    sb.append(javaScript);
    sb.append("\r\n</script>");
    return sb.toString();
  }
  /**
   * ѹ�������ģ����ʽ
   * @return String
   */
  public String toString(){
    if(cells == null || cells.size() == 0){
      return "";
    }
    return getPressed().toString_();
  }
  /**
   * ���һ����Ϣ��ѹ��������ո���ʵ��
   * @return TableModel
   */
  public TableModel getPressed(){
    TableModel model = new TableModel();
    //��������
    model.width = width;
    model.height = height;
    model.css_class = css_class;
    model.javaScript = javaScript;
    //������������
    boolean[] row_valued = new boolean[rowCount];
    boolean[] column_valued = new boolean[columnCount];
    int[] row_index = new int[rowCount];
    int[] column_index = new int[columnCount];
    int size = cells.size();
    //�ҳ�ѹ������Щ���ߺ����߻������õ�
    model.rowCount = 0;
    model.columnCount = 0;
    int minRow = rowCount;
    int maxRow = 0;
    for(int i =0;i<size;i++){
      CellModel cellModel = (CellModel)cells.get(i);
      if(cellModel != null && !cellModel.isHidden()){
        if (!row_valued[cellModel.top]) {
          model.rowCount++;
          row_valued[cellModel.top] = true;
          if(minRow>cellModel.top)minRow = cellModel.top;
        }
        if (!row_valued[cellModel.top + cellModel.rowspan]) {
          model.rowCount++;
          row_valued[cellModel.top + cellModel.rowspan] = true;
          if(maxRow<cellModel.top + cellModel.rowspan)maxRow = cellModel.top + cellModel.rowspan;
        }
        if (!column_valued[cellModel.left]) {
          model.columnCount++;
          column_valued[cellModel.left] = true;
        }
        if (!column_valued[cellModel.left + cellModel.colspan]) {
          model.columnCount++;
          column_valued[cellModel.left + cellModel.colspan] = true;
        }
      }
    }
    //�رն��е�ѹ��
    for(int i =minRow;i<=maxRow;i++){
      row_valued[i] = true;
    }
    model.rowCount = maxRow-minRow+1;
    //���µĺ��߸�ֵ
    int count = 0;
    model.rows = new int[model.rowCount];
    model.rowtips = new RowTip[model.rowCount];
    for(int i = 0; i <rowCount;i++){
      row_index[i] = count;
      if(rowtips[i]!=null){
        model.rowtips[count] = new RowTip(rowtips[i]);
      }
      if(row_valued[i]){
        model.rows[count] = rows[i];
        count ++;
      }
    }
    for(int i = 1;i<count;i++){
      model.rows[i] = model.rows[i]-model.rows[0];
    }
    if(model.rows.length>0){
      model.rows[0] = 0;
      model.height = model.rows[model.rows.length - 1] - rows[0];
    }
    //���µ����߸�ֵ
    model.columns = new int[model.columnCount];
    count = 0;
    for(int i = 0; i <columnCount;i++){
      column_index[i] = count;
      if (column_valued[i]) {
        model.columns[count] = columns[i];
        count++;
      }
    }
    for(int i = 1;i<count;i++){
      model.columns[i] = model.columns[i]-model.columns[0];
    }
    if(model.columns.length>0){
      model.columns[0] = 0;
      model.width = model.columns[model.columns.length - 1] - model.columns[0];
    }
    //����cellModel��model�в���������������
    model.cells = new Vector();
    for(int i = 0;i<size;i++){
      CellModel cellModel = new CellModel(((CellModel)cells.get(i)));
      if(!cellModel.isHidden()){
        int x1 = cellModel.left;
        int x2 = cellModel.left + cellModel.colspan;
        int y1 = cellModel.top;
        int y2 = cellModel.top + cellModel.rowspan;
        x1 = column_index[x1];
        x2 = column_index[x2];
        y1 = row_index[y1];
        y2 = row_index[y2];
        cellModel.left = x1;
        cellModel.top = y1;
        cellModel.colspan = x2 - x1;
        cellModel.rowspan = y2 - y1;
        model.cells.add(cellModel);
      }
      else{
        model.hiddenFieldItems.add(cellModel.item);
      }
    }
    model.insertBlankCells();
    return model;
  }
  private Vector hiddenFieldItems = new Vector();
  /**
   * ����λ�öԵ�Ԫ�����򣬴����ң����ϵ���
   */
  private void sort(){
    int size = cells.size();
    boolean sortend = false;
    for(int i = 0;true;i++){
//    for(int i = 0;i<size;i++){
      sortend = true;
      for(int j = 0;j<size-1;j++){
        CellModel cm1 = (CellModel)cells.get(j);
        CellModel cm2 = (CellModel)cells.get(j+1);
        if(cm1.top>cm2.top || (cm1.top==cm2.top && cm1.left>cm2.left)){
          cells.set(j+1,cm1);
          cells.set(j,cm2);
          sortend = false;
        }
      }
      if(sortend){
        return;
      }
    }
  }

  /**
   * ����FieldItemModel.tabNext��������Tab��˳��
   */
  public void setAutoTabIndex(){
    //����λ������
    sort();
    //����TabIndex
    int size = cells.size();
    int currentIndex = 2;
    for(int i = 0;i<size;i++){
      ItemModel im = ((CellModel)cells.get(i)).getItemModel();
      if(im instanceof FieldItemModel){
        FieldItemModel fim = (FieldItemModel) im;
        if(fim.tabIndex == 1){
          while (fim.tabLast != null) {//�ҵ���һ��
            fim = fim.tabLast;
          }
          while (fim != null) {
            fim.tabIndex = currentIndex ++;
            fim = fim.tabNext;
          }
        }
/*        else{
          fim.tabIndex = currentIndex ++;
        }*/
      }
    }
  }

  public void addCell(CellModel cellModel){
    this.cells.add(cellModel);
  }

  /**
   * cellModel�͵�ǰ�ı���Ԫ�ز����ص�����
   * @param cellModel CellModel
   * @return boolean
   */
  public boolean intersects(CellModel cellModel){
    int size = cells.size();
    for (int i = 0; i < size; i++) {
      CellModel cm = (CellModel)cells.get(i);
      if(cellModel.intersects(cm))return true;
    }
    return false;
  }

  /**
   * cellModel�͵�ǰ�ı���Ԫ�ز����ص�����
   * @param cellModels CellModel[]
   * @return boolean
   */
  public boolean intersects(CellModel[] cellModels){
    for (int i = 0; i < cellModels.length; i++) {
      if(intersects(cellModels[i]))return true;
    }
    return false;
  }

  public void addNoPositionCells(CellModel[] cellModels){
    for(int i = 0;i<cellModels.length;i++){
      cellModels[i].colspan = 1;
      cellModels[i].rowspan = 1;
      cellModels[i].left = i;
    }
    if(cellModels.length == 2){
      cellModels[0].colspan = 2;
      cellModels[1].colspan = 3;
      cellModels[0].left = 0;
      cellModels[1].left = 2;
    }
    boolean addrow_needed = true;
    for(int r = 0;r<rowCount-1;r++){
      for(int i = 0;i<cellModels.length;i++){
        cellModels[i].top = r;
      }
      if(!intersects(cellModels)){
        addrow_needed = false;
        break;
      }
    }
    if(addrow_needed){
      this.addRow(1);
      for(int i = 0;i<cellModels.length;i++){
        cellModels[i].top = rowCount-2;
      }
    }
    FieldItemModel last = null;
    for(int i = 0;i<cells.size();i++){
      ItemModel im = ((CellModel)cells.get(i)).getItemModel();
      if(im instanceof FieldItemModel){
        FieldItemModel fim = (FieldItemModel)im;
        if(fim.tabNext == null){
          last = fim;
        }
      }
    }
    for(int i = 0;i<cellModels.length;i++){
      addCell(cellModels[i]);
      ItemModel im = cellModels[i].getItemModel();
      if(im instanceof FieldItemModel){
        FieldItemModel fim = (FieldItemModel)im;
        if(last != null){
          last.setTabNext(fim);
        }
        last = fim;
      }
    }
  }

  /**
   * �ڵ�position��ǰ����rowCount��
   * @param rowCount int
   * @param position int
   */
  public void insertRow(int rowCount,int position){
    int[] newRows = new int[rows.length+rowCount];

    for(int i = 0;i<newRows.length;i++){
      if(i<position){
        newRows[i] = rows[i];
      }
      else if(i-rowCount<position){
        newRows[i] = (i-position)*rows[rows.length-1]/rows.length+rows[position];
      }
      else{
        newRows[i] = rowCount*rows[rows.length-1]/rows.length+rows[i-rowCount];
      }
    }
    int size = cells.size();
    for(int i=0;i<size;i++){
      CellModel cm = (CellModel)cells.get(i);
      int y1 = cm.top;
      int y2 = cm.top + cm.rowspan;
      if(y1 > position)y1 += position;
      if(y2 > position)y2 += position;
      cm.top = y1;
      cm.setRowspan(y2-y1);
    }
    this.rowCount +=rowCount;
    this.rows = newRows;
    this.height = rows[rows.length-1];
  }
  /**
   * ��β������rowCount��
   * @param rowCount int
   */
  public void addRow(int rowCount){
    insertRow(rowCount,rows.length-1);
  }

  public static void main(String[] args){
    System.out.println(getTestModel());
  }

  public static TableModel getTestModel(){
    TableModel model = new TableModel();
/*    CellModel c1 = new CellModel(5,5,2,2);
    CellModel c2 = new CellModel(6,2,3,2);
    CellModel c3 = new CellModel(2,2,3,2);
    c2.setItemModel(new TextItemModel("c < \"d\""));
    FieldItemModel fm = new FieldItemModel();
    fm.table = "table";
    fm.field = "�ֶ�";
    FieldItemModel fm1 = new FieldItemModel();
    fm1.table = "table";
    fm1.field = "�ֶ�";
//    fm1.setTabNext(fm);
    c1.setItemModel(fm1);
    c3.setItemModel(fm);
    model.addCell(c1);
    model.addCell(c2);
    model.addCell(c3);*/
    return model;
  }
}
