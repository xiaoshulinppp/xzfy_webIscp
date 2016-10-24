// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   CellModel.java

package com.iscp.sys.formLayout.model;

import java.io.Serializable;

// Referenced classes of package com.iscp.sys.formLayout.model:
//			FieldItemModel, ItemModel

public class CellModel
	implements Serializable
{

	public static final int LEFT = 0;
	public static final int CENTER = 1;
	public static final int RIGHT = 2;
	public static final int TOP = 0;
	public static final int BOTTOM = 2;
	public int align;
	public int valign;
	public int left;
	public int top;
	public int rowspan;
	public int colspan;
	public ItemModel item;
	public String css_class;
	public int widthPercent;
	public int heightPercent;

	public CellModel(CellModel c)
	{
		align = 0;
		valign = 1;
		left = 0;
		top = 0;
		rowspan = 1;
		colspan = 1;
		css_class = "";
		widthPercent = 0;
		heightPercent = 0;
		rowspan = c.rowspan;
		colspan = c.colspan;
		top = c.top;
		left = c.left;
		item = c.item;
		css_class = c.css_class;
		align = c.align;
	}

	public CellModel()
	{
		align = 0;
		valign = 1;
		left = 0;
		top = 0;
		rowspan = 1;
		colspan = 1;
		css_class = "";
		widthPercent = 0;
		heightPercent = 0;
	}

	public CellModel(int left, int top, int colspan, int rowspan)
	{
		align = 0;
		valign = 1;
		this.left = 0;
		this.top = 0;
		this.rowspan = 1;
		this.colspan = 1;
		css_class = "";
		widthPercent = 0;
		heightPercent = 0;
		this.left = left;
		this.top = top;
		this.rowspan = rowspan;
		this.colspan = colspan;
	}

	public boolean isHidden()
	{
		if (item == null || !(item instanceof FieldItemModel))
			return false;
		else
			return ((FieldItemModel)item).hidden;
	}

	public void setAlign(int align)
	{
		this.align = align;
	}

	public int getAlign()
	{
		return align;
	}

	public void setValign(int valign)
	{
		this.valign = valign;
	}

	public int getValign()
	{
		return valign;
	}

	public void setRowspan(int rowspan)
	{
		this.rowspan = rowspan;
	}

	public int getRowspan()
	{
		return rowspan;
	}

	public void setColspan(int colspan)
	{
		this.colspan = colspan;
	}

	public int getColspan()
	{
		return colspan;
	}

	public void setItemModel(ItemModel item)
	{
		this.item = item;
	}

	public ItemModel getItemModel()
	{
		return item;
	}

	public void setCss_class(String css_class)
	{
		this.css_class = css_class;
		if (css_class.equals("tdFormText"))
			align = 2;
		else
			align = 0;
	}

	public String toString()
	{
		StringBuffer sb = new StringBuffer();
		sb.append("<td");
		String id = null;
		if (getItemModel() != null)
			id = getItemModel().getId();
		if (id != null && id.length() > 0)
			sb.append((new StringBuilder(" id=\"")).append(id).append("_cell\"").toString());
		if (colspan != 1)
			sb.append((new StringBuilder(" colspan=")).append(colspan).toString());
		if (rowspan != 1)
			sb.append((new StringBuilder(" rowspan=")).append(rowspan).toString());
		if (css_class != null && css_class.length() != 0)
			sb.append((new StringBuilder(" class=\"")).append(css_class).append("\"").toString());
		if (align == 1)
			sb.append(" align=\"center\"");
		else
		if (align == 2)
			sb.append(" align=\"right\"");
		if (valign == 0)
			sb.append(" valign=\"top\"");
		else
		if (valign == 2)
			sb.append(" valign=\"bottom\"");
		if (widthPercent > 0)
			sb.append((new StringBuilder(" width=\"")).append(widthPercent).append("%\"").toString());
		if (heightPercent > 0)
			sb.append((new StringBuilder(" height=\"")).append(heightPercent).append("%\"").toString());
		sb.append(">");
		if (item != null)
			sb.append(item.toString());
		sb.append("</td>");
		return sb.toString();
	}

	private static boolean intersects(int a, int b, int c, int d)
	{
		if (Math.max(a, b) <= Math.min(c, d))
			return false;
		return Math.max(c, d) > Math.min(a, b);
	}

	public boolean intersects(CellModel model)
	{
		return intersects(left, left + colspan, model.left, model.left + model.colspan) && intersects(top, top + rowspan, model.top, model.top + model.rowspan);
	}
}
