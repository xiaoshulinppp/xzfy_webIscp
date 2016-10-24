// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   TableModel.java

package com.iscp.sys.formLayout.model;

import java.io.PrintStream;
import java.io.Serializable;
import java.util.Vector;

// Referenced classes of package com.iscp.sys.formLayout.model:
//			RowTip, CellModel, FieldItemModel

public class TableModel
	implements Serializable
{

	public int rowCount;
	public int columnCount;
	public int height;
	public int width;
	public String logName;
	public String tabName;
	public String showName;
	public String tableDesc;
	public Vector javascripts;
	public String javaScript;
	public String formPath;
	public int rows[];
	public RowTip rowtips[];
	public int columns[];
	public String css_class;
	public Vector cells;
	private CellModel cellArrayMap[][];
	private Vector hiddenFieldItems;

	public TableModel()
	{
		this(800, 500, 20, 20, 0);
	}

	public TableModel(int width, int height, int rowCount, int columnCount, int leftSpace)
	{
		this.rowCount = 0;
		this.columnCount = 0;
		this.height = 0;
		this.width = 0;
		logName = null;
		tabName = null;
		showName = null;
		tableDesc = null;
		javascripts = new Vector();
		javaScript = "";
		formPath = "info";
		cells = new Vector();
		hiddenFieldItems = new Vector();
		this.width = width;
		this.height = height;
		this.rowCount = rowCount;
		this.columnCount = columnCount;
		rows = new int[rowCount];
		rowtips = new RowTip[rowCount];
		columns = new int[columnCount];
		for (int i = 0; i < rows.length; i++)
			rows[i] = (i * height) / (rows.length - 1);

		for (int i = 0; i < columns.length; i++)
			columns[i] = (i * width) / (columns.length - 1) + leftSpace;

	}

	private void insertBlankCells()
	{
		int size = cells.size();
		cellArrayMap = new CellModel[columnCount][rowCount];
		for (int i = 0; i < size; i++)
		{
			CellModel cell = (CellModel)cells.get(i);
			for (int y = cell.top; y < cell.rowspan + cell.top; y++)
			{
				for (int x = cell.left; x < cell.left + cell.colspan; x++)
					cellArrayMap[x][y] = cell;

			}

		}

		for (int y = 0; y < rowCount; y++)
		{
			for (int x = 0; x < columnCount; x++)
				if (cellArrayMap[x][y] == null)
				{
					CellModel blank = new CellModel(x, y, 0, 1);
					cells.add(blank);
					for (int i = 0; i < columnCount - x - 1; i++)
					{
						if (cellArrayMap[x + i][y] != null)
							break;
						cellArrayMap[x + i][y] = blank;
						blank.colspan = i + 1;
					}

				}

		}

	}

	private String toString_()
	{
		setAutoTabIndex();
		StringBuffer sb = new StringBuffer();
		int size = hiddenFieldItems.size();
		sb.append("[$formpath]");
		sb.append(formPath);
		sb.append("[/$formpath]\r\n");
		if (size > 0)
		{
			sb.append("[$hidden]\r\n");
			for (int i = 0; i < size; i++)
			{
				FieldItemModel fim = (FieldItemModel)hiddenFieldItems.get(i);
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
		if (css_class != null && css_class.length() > 0)
			sb.append((new StringBuilder(" class=\"")).append(css_class).append("\"").toString());
		sb.append("><tbody>\r\n");
		sb.append("   <tr class=\"trcolor\">\r\n");
		for (int x = 0; x < columnCount - 1; x++)
			sb.append((new StringBuilder("      <td width=\"")).append(((columns[x + 1] - columns[x]) * 100) / width).append("%\"></td>\r\n").toString());

		sb.append("   </tr>\r\n");
		for (int y = 0; y < rowCount - 1; y++)
		{
			RowTip tip = rowtips[y];
			if (tip != null)
			{
				sb.append("   </tbody><tbody");
				if (tip.id != null)
					sb.append((new StringBuilder(" id=\"")).append(tip.id).append("\" style=\"display:block\"").toString());
				sb.append(">");
			}
			sb.append("   <tr class=\"trcolor\">\r\n");
			for (int x = 0; x < columnCount - 1; x++)
			{
				CellModel cm = cellArrayMap[x][y];
				if (cm.left == x && cm.top == y)
					sb.append((new StringBuilder("      ")).append(cm.toString()).append("\r\n").toString());
			}

			sb.append("   </tr>\r\n");
		}

		sb.append("</tbody></table>\r\n");
		sb.append("<script>\r\n");
		sb.append(javaScript);
		sb.append("\r\n</script>");
		return sb.toString();
	}

	public String toString()
	{
		if (cells == null || cells.size() == 0)
			return "";
		else
			return getPressed().toString_();
	}

	public TableModel getPressed()
	{
		TableModel model = new TableModel();
		model.width = width;
		model.height = height;
		model.css_class = css_class;
		model.javaScript = javaScript;
		model.formPath = formPath;
		boolean row_valued[] = new boolean[rowCount];
		boolean column_valued[] = new boolean[columnCount];
		int row_index[] = new int[rowCount];
		int column_index[] = new int[columnCount];
		int size = cells.size();
		model.rowCount = 0;
		model.columnCount = 0;
		int minRow = rowCount;
		int maxRow = 0;
		for (int i = 0; i < size; i++)
		{
			CellModel cellModel = (CellModel)cells.get(i);
			if (cellModel != null && !cellModel.isHidden())
			{
				if (!row_valued[cellModel.top])
				{
					model.rowCount++;
					row_valued[cellModel.top] = true;
					if (minRow > cellModel.top)
						minRow = cellModel.top;
				}
				if (!row_valued[cellModel.top + cellModel.rowspan])
				{
					model.rowCount++;
					row_valued[cellModel.top + cellModel.rowspan] = true;
					if (maxRow < cellModel.top + cellModel.rowspan)
						maxRow = cellModel.top + cellModel.rowspan;
				}
				if (!column_valued[cellModel.left])
				{
					model.columnCount++;
					column_valued[cellModel.left] = true;
				}
				if (!column_valued[cellModel.left + cellModel.colspan])
				{
					model.columnCount++;
					column_valued[cellModel.left + cellModel.colspan] = true;
				}
			}
		}

		for (int i = minRow; i <= maxRow; i++)
			row_valued[i] = true;

		model.rowCount = (maxRow - minRow) + 1;
		int count = 0;
		model.rows = new int[model.rowCount];
		model.rowtips = new RowTip[model.rowCount];
		for (int i = 0; i < rowCount; i++)
		{
			row_index[i] = count;
			if (rowtips[i] != null)
				model.rowtips[count] = new RowTip(rowtips[i]);
			if (row_valued[i])
			{
				model.rows[count] = rows[i];
				count++;
			}
		}

		for (int i = 1; i < count; i++)
			model.rows[i] = model.rows[i] - model.rows[0];

		if (model.rows.length > 0)
		{
			model.rows[0] = 0;
			model.height = model.rows[model.rows.length - 1] - rows[0];
		}
		model.columns = new int[model.columnCount];
		count = 0;
		for (int i = 0; i < columnCount; i++)
		{
			column_index[i] = count;
			if (column_valued[i])
			{
				model.columns[count] = columns[i];
				count++;
			}
		}

		for (int i = 1; i < count; i++)
			model.columns[i] = model.columns[i] - model.columns[0];

		if (model.columns.length > 0)
		{
			model.columns[0] = 0;
			model.width = model.columns[model.columns.length - 1] - model.columns[0];
		}
		model.cells = new Vector();
		for (int i = 0; i < size; i++)
		{
			CellModel cellModel = new CellModel((CellModel)cells.get(i));
			if (!cellModel.isHidden())
			{
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
			} else
			{
				model.hiddenFieldItems.add(cellModel.item);
			}
		}

		model.insertBlankCells();
		return model;
	}

	private void sort()
	{
		int size = cells.size();
		boolean sortend = false;
		int i = 0;
		do
		{
			sortend = true;
			for (int j = 0; j < size - 1; j++)
			{
				CellModel cm1 = (CellModel)cells.get(j);
				CellModel cm2 = (CellModel)cells.get(j + 1);
				if (cm1.top > cm2.top || cm1.top == cm2.top && cm1.left > cm2.left)
				{
					cells.set(j + 1, cm1);
					cells.set(j, cm2);
					sortend = false;
				}
			}

			if (sortend)
				return;
			i++;
		} while (true);
	}

	public void setAutoTabIndex()
	{
		sort();
		int size = cells.size();
		int currentIndex = 2;
		for (int i = 0; i < size; i++)
		{
			ItemModel im = ((CellModel)cells.get(i)).getItemModel();
			if (im instanceof FieldItemModel)
			{
				FieldItemModel fim = (FieldItemModel)im;
				fim.tabIndex = 1;
			}
		}

		for (int i = 0; i < size; i++)
		{
			ItemModel im = ((CellModel)cells.get(i)).getItemModel();
			if (im instanceof FieldItemModel)
			{
				FieldItemModel fim = (FieldItemModel)im;
				if (fim.tabIndex == 1)
				{
					for (; fim.tabLast != null; fim = fim.tabLast);
					for (; fim != null; fim = fim.tabNext)
						fim.tabIndex = currentIndex++;

				}
			}
		}

	}

	public void addCell(CellModel cellModel)
	{
		cells.add(cellModel);
	}

	public boolean intersects(CellModel cellModel)
	{
		int size = cells.size();
		for (int i = 0; i < size; i++)
		{
			CellModel cm = (CellModel)cells.get(i);
			if (cellModel.intersects(cm))
				return true;
		}

		return false;
	}

	public boolean intersects(CellModel cellModels[])
	{
		for (int i = 0; i < cellModels.length; i++)
			if (intersects(cellModels[i]))
				return true;

		return false;
	}

	public void addNoPositionCells(CellModel cellModels[])
	{
		for (int i = 0; i < cellModels.length; i++)
		{
			cellModels[i].colspan = 1;
			cellModels[i].rowspan = 1;
			cellModels[i].left = i;
		}

		if (cellModels.length == 2)
		{
			cellModels[0].colspan = 2;
			cellModels[1].colspan = 3;
			cellModels[0].left = 0;
			cellModels[1].left = 2;
		}
		boolean addrow_needed = true;
		for (int r = 0; r < rowCount - 1; r++)
		{
			for (int i = 0; i < cellModels.length; i++)
				cellModels[i].top = r;

			if (intersects(cellModels))
				continue;
			addrow_needed = false;
			break;
		}

		if (addrow_needed)
		{
			addRow(1);
			for (int i = 0; i < cellModels.length; i++)
				cellModels[i].top = rowCount - 2;

		}
		FieldItemModel last = null;
		for (int i = 0; i < cells.size(); i++)
		{
			ItemModel im = ((CellModel)cells.get(i)).getItemModel();
			if (im instanceof FieldItemModel)
			{
				FieldItemModel fim = (FieldItemModel)im;
				if (fim.tabNext == null)
					last = fim;
			}
		}

		for (int i = 0; i < cellModels.length; i++)
		{
			addCell(cellModels[i]);
			ItemModel im = cellModels[i].getItemModel();
			if (im instanceof FieldItemModel)
			{
				FieldItemModel fim = (FieldItemModel)im;
				if (last != null)
					last.setTabNext(fim);
				last = fim;
			}
		}

	}

	public void insertRow(int rowCount, int position)
	{
		int newRows[] = new int[rows.length + rowCount];
		for (int i = 0; i < newRows.length; i++)
			if (i < position)
				newRows[i] = rows[i];
			else
			if (i - rowCount < position)
				newRows[i] = ((i - position) * rows[rows.length - 1]) / rows.length + rows[position];
			else
				newRows[i] = (rowCount * rows[rows.length - 1]) / rows.length + rows[i - rowCount];

		int size = cells.size();
		for (int i = 0; i < size; i++)
		{
			CellModel cm = (CellModel)cells.get(i);
			int y1 = cm.top;
			int y2 = cm.top + cm.rowspan;
			if (y1 > position)
				y1 += position;
			if (y2 > position)
				y2 += position;
			cm.top = y1;
			cm.setRowspan(y2 - y1);
		}

		this.rowCount += rowCount;
		rows = newRows;
		height = rows[rows.length - 1];
	}

	public void addRow(int rowCount)
	{
		insertRow(rowCount, rows.length - 1);
	}

	public static void main(String args[])
	{
		System.out.println(getTestModel());
	}

	public static TableModel getTestModel()
	{
		TableModel model = new TableModel();
		return model;
	}
}
