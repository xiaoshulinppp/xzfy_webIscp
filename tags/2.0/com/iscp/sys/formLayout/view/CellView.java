// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   CellView.java

package com.iscp.sys.formLayout.view;

import com.iscp.sys.formLayout.model.*;
import com.iscp.sys.formLayout.view.base.RectPattern;
import java.awt.*;
import java.net.URL;
import java.util.*;
import javax.swing.JComponent;
import javax.swing.text.html.HTMLDocument;

// Referenced classes of package com.iscp.sys.formLayout.view:
//			ItemSizeInfo, HTMLShower, TableView

public class CellView extends JComponent
{

	private TableView tableView;
	private static Cursor cursor_unselected = new Cursor(12);
	private static Cursor cursor_selected = new Cursor(13);
	private HTMLShower htmlShower;
	private CellModel model;
	private String lastText;
	private String texts_show[];
	private static ItemSizeInfo isi = new ItemSizeInfo();
	private static Color DEFAULTITEMBACK = new Color(251, 255, 234);
	private static Color DEFAULTITEMFORE;
	private static Color DEFAULTITEMBORDER = new Color(53, 125, 207);
	private boolean fontRenewed;
	private static Set CSS_ITEM_FIT_CELL;
	private static final int BORDERSIZE = 1;
	private static Color BACKCOLOR_UNSELECTED = new Color(128, 255, 192, 0);
	private static Color BORDERCOLOR_UNSELECTED = new Color(239, 238, 228);
	private static Color BACKCOLOR_SELECTED = new Color(128, 255, 255, 60);
	private static Color BORDERCOLOR_SELECTED = new Color(0, 128, 255);
	private static Color HIDDEN_BACKCOLOR_UNSELECTED = new Color(192, 192, 192, 64);
	private static Color HIDDEN_BORDERCOLOR_UNSELECTED = new Color(128, 128, 128);
	private static Color HIDDEN_BACKCOLOR_SELECTED = new Color(128, 128, 128, 64);
	private static Color HIDDEN_BORDERCOLOR_SELECTED = new Color(0, 128, 255);
	private static Color FIELDBACKCOLOR = new Color(0, 192, 255);
	private static Color FIELDFORECOLOR_LIGHT = new Color(255, 255, 255, 128);
	private static Color FIELDFORECOLOR_DARK = new Color(0, 0, 255);
	private static Color RELATEDFIELDBACKCOLOR = new Color(0, 255, 192);
	private static Color RELATEDFIELDFORECOLOR_LIGHT = new Color(255, 255, 255, 128);
	private static Color RELATEDFIELDFORECOLOR_DARK = new Color(255, 0, 0);
	private boolean selected;
	private Rectangle last_bounds;
	private int last_colspan;
	private int last_rowspan;
	private int last_left;
	private int last_top;

	public CellView(CellModel model, TableView tableView, URL url)
	{
		lastText = null;
		fontRenewed = false;
		selected = false;
		setModel(model);
		htmlShower = new HTMLShower(url);
		setCursor(cursor_unselected);
		((HTMLDocument)htmlShower.getDocument()).setBase(url);
	}

	public void setModel(CellModel model)
	{
		this.model = model;
	}

	public CellModel getModel()
	{
		return model;
	}

	public void divideText()
	{
		String text = model.getItemModel().getText();
		if (text.equals(lastText))
			return;
		int count = 0;
		int lastIndex;
		for (lastIndex = 0; lastIndex >= 0 && lastIndex < text.length();)
		{
			lastIndex = text.indexOf("\n", lastIndex + 1);
			count++;
		}

		texts_show = new String[count];
		lastIndex = 0;
		for (int i = 0; i < count; i++)
		{
			int lastIndex_ = lastIndex;
			lastIndex = text.indexOf("\n", lastIndex + 1);
			if (lastIndex < 0)
				texts_show[i] = text.substring(lastIndex_);
			else
				texts_show[i] = text.substring(lastIndex_, lastIndex);
		}

		lastText = text;
	}

	private static void paintItemBack(Graphics g, int type, int w, int h)
	{
		java.awt.Component c = null;
		Color back = DEFAULTITEMBACK;
		Color fore = DEFAULTITEMFORE;
		Color border = DEFAULTITEMBORDER;
		w -= isi.w[type];
		if (type == 0)
			paintSelect(g, w, h, back, fore, border);
		else
		if (type == 1)
			paintInput(g, w, h, back, fore, border);
		else
		if (type == 2)
			paintTextArea(g, w, h, back, fore, border);
		else
		if (type == 3)
			paintInputFile(g, w, h, back, fore, border);
		else
		if (type == 4)
			paintInputWin(g, w, h, back, fore, border);
		else
		if (type == 5)
			paintRadio(g, w, h, back, fore, border);
		else
		if (type == 6)
		{
			paintCheckBox(g, w, h, back, fore, border);
		} else
		{
			if (type == 7)
				return;
			paintOther(g, w, h);
		}
	}

	private static void paintCheckBox(Graphics g, int w, int h, Color back, Color fore, Color border)
	{
		w += isi.w[6];
		g.setColor(back);
		g.fillRect(0, 0, w, h);
		g.setColor(border);
		g.drawRect(0, 0, w, h);
		g.setColor(Color.black);
		g.draw3DRect(3, (h >> 1) - 3, 7, 7, false);
	}

	private static void paintRadio(Graphics g, int w, int h, Color back, Color fore, Color border)
	{
		w += isi.w[5];
		g.setColor(back);
		g.fillRect(0, 0, w, h);
		g.setColor(border);
		g.drawRect(0, 0, w, h);
		g.setColor(Color.black);
		g.drawArc(3, (h >> 1) - 3, 7, 7, 0, 360);
	}

	private static void paintNone(Graphics g, int w, int h, Color back, Color fore, Color border)
	{
		paintInput(g, w, h, back, fore, border);
	}

	private static void paintInput(Graphics g, int w, int h, Color back, Color fore, Color border)
	{
		g.setColor(back);
		g.fillRect(0, 0, w, h);
		g.setColor(border);
		g.drawRect(0, 0, w, h);
	}

	private static void paintOther(Graphics g, int w, int h)
	{
		RectPattern.paintButtonBack(g, 1, 1, w, h);
	}

	private static void paintInputFile(Graphics g, int w, int h, Color back, Color fore, Color border)
	{
		paintInput(g, w, h, back, fore, border);
		int buttonWidth = isi.w[3];
		RectPattern.paintButtonBack(g, w + 2, 0, buttonWidth - 2, h, "???");
	}

	private static void paintInputWin(Graphics g, int w, int h, Color back, Color fore, Color border)
	{
		RectPattern.paintButtonBack(g, 0, 0, w, h);
		g.draw3DRect(0, 0, w, h, true);
	}

	private static void paintTextArea(Graphics g, int w, int h, Color back, Color fore, Color border)
	{
		paintInput(g, w, h, back, fore, border);
	}

	private static void paintSelect(Graphics g, int w, int h, Color back, Color fore, Color border)
	{
		int buttonWidth = isi.w[0];
		g.setColor(back);
		g.fillRect(0, 0, w, h);
		g.setColor(RectPattern.BUTTONBACKCOLOR);
		g.draw3DRect(0, 0, w + isi.w[0], h, false);
		RectPattern.paintButtonBack(g, w + 1, 1, buttonWidth - 1, h - 2);
		int xc = w + (buttonWidth >> 1) + 1;
		int yc = h >> 1;
		int x[] = {
			xc - 4, xc, xc + 4
		};
		int y[] = {
			yc - 2, yc + 2, yc - 2
		};
		g.setColor(fore);
		g.fillPolygon(x, y, 3);
	}

	private static void paintHTML(Graphics g, int w, int h, String html, CellView cv)
	{
		int align = cv.getModel().align;
		int valign = cv.getModel().valign;
		if (cv.htmlShower.getBackground().equals(Color.white))
			cv.htmlShower.setBackground(new Color(239, 238, 228));
		String alignStr = "";
		String valignStr = "";
		if (valign == 2)
			valignStr = "bottom";
		if (valign == 1)
			valignStr = "center";
		if (valign == 0)
			valignStr = "top";
		if (align == 0)
			alignStr = "left";
		if (align == 1)
			alignStr = "center";
		if (align == 2)
			alignStr = "right";
		cv.htmlShower.setHtml(html);
		cv.htmlShower.revalidate();
		Dimension d = cv.htmlShower.getPreferredSize();
		int x = w - d.width >> 1;
		int y = h - d.height >> 1;
		if (valign == 2)
			y = h - d.height;
		else
		if (valign == 0)
			y = 0;
		if (align == 0)
			x = 0;
		else
		if (align == 2)
			x = w - d.width;
		x = 0;
		cv.htmlShower.setBounds(0, 0, w, d.height);
		g.translate(x, y);
		cv.htmlShower.paint(g);
		g.translate(-x, -y);
	}

	public void paint(Graphics g)
	{
		Shape oldClip = g.getClip();
		Color _backColor_unselected = BACKCOLOR_UNSELECTED;
		Color _borderColor_unselected = BORDERCOLOR_UNSELECTED;
		Color _backColor_selected = BACKCOLOR_SELECTED;
		Color _borderColor_selected = BORDERCOLOR_SELECTED;
		if (!fontRenewed && g.getFont() != null)
		{
			setFont(new Font(g.getFont().getName(), 0, 12));
			fontRenewed = true;
		}
		int w = getBounds().width;
		int h = getBounds().height;
		g.setClip(oldClip.getBounds().createIntersection((new Rectangle(0, 0, w + 1, h + 1)).getBounds2D()));
		w -= 2;
		h -= 2;
		g.setColor(Color.white);
		g.translate(1, 1);
		g.fillRect(0, 0, w, h);
		divideText();
		Font font = getFont();
		g.setFont(font);
		FontMetrics fm = g.getFontMetrics();
		int text_h = fm.getHeight() * (texts_show.length - 1);
		int y;
		if (model.valign == 0)
			y = g.getFont().getSize() + 1;
		else
		if (model.valign == 1)
			y = ((h + g.getFont().getSize()) - text_h) / 2;
		else
			y = h - text_h - 1;
		if (model.getItemModel() instanceof FieldItemModel)
		{
			FieldItemModel fim = (FieldItemModel)model.getItemModel();
			int sw = fm.stringWidth(texts_show[0]) + 6 + isi.w[fim.showType];
			if (CSS_ITEM_FIT_CELL.contains(fim.css_class))
				sw = (w * 9) / 10;
			int x;
			if (model.align == 1)
				x = w - sw >> 1;
			else
			if (model.align == 2)
				x = w - sw - 1;
			else
				x = 1;
			Color fieldForeColor_light = FIELDFORECOLOR_LIGHT;
			Color fieldForeColor_dark = FIELDFORECOLOR_DARK;
			if (fim.sourceTable != null)
			{
				fieldForeColor_light = RELATEDFIELDFORECOLOR_LIGHT;
				fieldForeColor_dark = RELATEDFIELDFORECOLOR_DARK;
			}
			int tranx = x;
			int trany = y - g.getFont().getSize();
			g.translate(tranx - 1, trany - 2);
			paintItemBack(g, fim.showType, sw + 1, text_h + g.getFont().getSize() + 3);
			g.translate(1, 2);
			g.setColor(fieldForeColor_light);
			g.drawString(fim.getText(), isi.left[fim.showType] + 5, g.getFont().getSize() - 1);
			g.setColor(fieldForeColor_dark);
			g.drawString(fim.getText(), isi.left[fim.showType] + 4, g.getFont().getSize() - 2);
			g.translate(-tranx, -trany);
			if (fim.hidden)
			{
				_backColor_unselected = HIDDEN_BACKCOLOR_UNSELECTED;
				_borderColor_unselected = HIDDEN_BORDERCOLOR_UNSELECTED;
				_backColor_selected = HIDDEN_BACKCOLOR_SELECTED;
				_borderColor_selected = HIDDEN_BORDERCOLOR_SELECTED;
			}
		} else
		if (getModel().getItemModel() instanceof FieldTextItemModel)
		{
			g.setColor(Color.white);
			g.fillRect(0, 0, w, h);
			g.setColor(Color.black);
			for (int i = 0; i < texts_show.length; i++)
			{
				int x;
				if (model.align == 1)
					x = (w - fm.stringWidth(texts_show[i])) / 2;
				else
				if (model.align == 2)
					x = w - fm.stringWidth(texts_show[i]) - 1;
				else
					x = 1;
				g.drawString(texts_show[i], x, y);
				y += fm.getHeight();
			}

		} else
		{
			g.setColor(new Color(239, 238, 228));
			g.fillRect(1, 1, w + 1 + 1, h + 1 + 1);
			paintHTML(g, w, h, getModel().getItemModel().getText(), this);
			g.setColor(Color.black);
			g.drawRect(0, 0, w, h);
		}
		g.translate(-1, -1);
		w += 2;
		h += 2;
		if (selected)
		{
			g.setColor(_backColor_selected);
			g.fillRect(0, 0, w, h);
			g.setColor(_borderColor_selected);
			g.drawRect(0, 0, w, h);
		} else
		{
			g.setColor(_backColor_unselected);
			g.fillRect(0, 0, w, h);
			g.setColor(_borderColor_unselected);
			g.drawRect(0, 0, w, h);
		}
		g.setClip(oldClip);
	}

	public void setSelected(boolean selected)
	{
		if (selected)
			setCursor(cursor_selected);
		else
			setCursor(cursor_unselected);
		this.selected = selected;
	}

	public boolean isSelected()
	{
		return selected;
	}

	public void setFittedBounds(int x, int y, int w, int h)
	{
		setBounds(x, y, w, h);
		last_bounds = getBounds();
		last_colspan = model.colspan;
		last_rowspan = model.rowspan;
		last_left = model.left;
		last_top = model.top;
	}

	public void recoverBounds()
	{
		if (last_bounds != null)
		{
			setBounds(last_bounds);
			model.colspan = last_colspan;
			model.rowspan = last_rowspan;
			model.left = last_left;
			model.top = last_top;
		}
	}

	public String[][] getDetailMsg()
	{
		ItemModel im = getModel().getItemModel();
		Vector v_title = new Vector();
		Vector v_value = new Vector();
		if (im instanceof FieldItemModel)
		{
			FieldItemModel fim = (FieldItemModel)im;
			v_title.add("?????:");
			v_value.add(fim.getTable());
			v_title.add("??????:");
			v_value.add(fim.getField());
			if (fim.sourceTable != null && fim.sourceTable.length() > 0)
			{
				v_title.add("??j??:");
				v_value.add(fim.sourceTable);
			}
			if (fim.sourceId != null && fim.sourceId.length() > 0)
			{
				v_title.add("??j???:");
				v_value.add(fim.sourceId);
			}
			if (fim.sourceName != null && fim.sourceName.length() > 0)
			{
				v_title.add("??????:");
				v_value.add((new StringBuilder(String.valueOf(fim.sourceTable))).append(".").append(fim.sourceName).toString());
			}
			if (fim.css_class != null && fim.css_class.length() > 0)
			{
				v_title.add("??????:");
				v_value.add(fim.css_class);
			}
		} else
		if (im instanceof FieldTextItemModel)
		{
			FieldTextItemModel fim = (FieldTextItemModel)im;
			v_title.add("?????:");
			v_value.add(fim.table);
			v_title.add("??????:");
			v_value.add(fim.field);
		}
		if (getModel().css_class != null && getModel().css_class.length() > 0)
		{
			v_title.add("????????:");
			v_value.add(getModel().css_class);
		}
		String id = getModel().getItemModel().getId();
		if (id != null && id.length() > 0)
		{
			v_title.add("???ID:");
			v_value.add(id);
		}
		int size = v_title.size();
		String msg[][] = new String[2][size];
		for (int i = 0; i < size; i++)
		{
			msg[0][i] = (String)v_title.get(i);
			msg[1][i] = (String)v_value.get(i);
		}

		if (msg[0].length == 0)
			return null;
		else
			return msg;
	}

	static 
	{
		DEFAULTITEMFORE = Color.darkGray;
		CSS_ITEM_FIT_CELL = new HashSet();
		CSS_ITEM_FIT_CELL.add("selectStyleLong");
		CSS_ITEM_FIT_CELL.add("inputTextLong");
		CSS_ITEM_FIT_CELL.add("textarea");
		CSS_ITEM_FIT_CELL.add("fieldsetNormal");
	}
}
