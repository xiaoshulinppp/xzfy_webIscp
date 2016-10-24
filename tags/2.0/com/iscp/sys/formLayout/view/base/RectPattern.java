// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   RectPattern.java

package com.iscp.sys.formLayout.view.base;

import java.awt.*;
import javax.swing.JComponent;

public class RectPattern
{

	private static Font defaultFont;
	public static final Color MYBLUE = new Color(128, 192, 255);
	public static final Color MYGREEN = new Color(0, 192, 0);
	public static final Color MYORANGE = new Color(255, 192, 128);
	public static final Color MYRED = new Color(255, 128, 192);
	public static final Color MYGRAYGREEN = new Color(128, 192, 128);
	public static final Color MYGRAYBLUE = new Color(128, 128, 192);
	public static final Color MYLIGHTGRAY = new Color(230, 230, 230);
	public static Color BUTTONBACKCOLOR = new Color(212, 208, 200);
	private static final int RED = 255;
	private static final int GREEN = 255;
	private static final int BLUE = 255;
	private static double RED_RATE = 2D;
	private static double GREEN_RATE = 1.0D;
	private static double BLUE_RATE = 0.0D;

	public RectPattern()
	{
	}

	public static Font getFont(Graphics g)
	{
		if (defaultFont == null)
		{
			Font font = g.getFont();
			if (font != null)
				defaultFont = new Font(font.getName(), font.getStyle(), 15);
		}
		return defaultFont;
	}

	private static void plastics(Graphics g, int x, int y, int w, int h)
	{
		for (int i = 0; i < h; i++)
		{
			int c = 32 - (i << 6) / h;
			g.setColor(getReducedColor(RED_RATE, GREEN_RATE, BLUE_RATE, c));
			g.drawLine(x, y + i, x + w, y + i);
		}

	}

	public static void plastics(Graphics g, int x, int y, int w, int h, Color c)
	{
		setColor(c);
		plastics(g, x, y, w, h);
	}

	public static void leftArrow(Graphics g, int x, int y, int w, int h)
	{
		y += h / 2;
		for (int i = 0; i < h / 2; i++)
		{
			int l = w - (w * i * 2) / h;
			g.drawLine(x, y + i, x + l, y + i);
			g.drawLine(x, y - i, x + l, y - i);
		}

	}

	public static void rightArrow(Graphics g, int x, int y, int w, int h)
	{
		y += h / 2;
		for (int i = 0; i < h / 2; i++)
		{
			int l = (w * i * 2) / h;
			g.drawLine(x + w, y + i, x + l, y + i);
			g.drawLine(x + w, y - i, x + l, y - i);
		}

	}

	private static void metal(Graphics g, int x, int y, int w, int h)
	{
		int mid = h / 3;
		for (int i = 0; i < mid; i++)
		{
			int c = (i << 6) / mid;
			g.setColor(getReducedColor(c));
			g.drawLine(x, y + i, x + w, y + i);
		}

		for (int i = mid; i < h; i++)
		{
			int c = 64 - (i << 6) / h;
			g.setColor(getReducedColor(c));
			g.drawLine(x, y + i, x + w, y + i);
		}

		for (int i = 0; i < 2; i++)
		{
			int c = 64 - (i << 5);
			g.setColor(getReducedColor(c));
			g.drawLine(x + i, y + i, (x + w) - i, y + i);
			g.drawLine((x + w) - i, y + i, (x + w) - i, h);
			g.drawLine(x + i, y + i, x + i, h);
		}

	}

	public static void metal(Graphics g, int x, int y, int w, int h, Color c)
	{
		setColor(c);
		metal(g, x, y, w, h);
	}

	public static void paintGlassBack(Graphics g, int x, int y, int w, int h, Color c, int alpha)
	{
		setColor(c);
		paintGlassBack(g, x, y, w, h, alpha);
	}

	private static void paintGlassBack(Graphics g, int x, int y, int w, int h, int alpha)
	{
		int mid = h / 3;
		for (int i = 0; i < mid; i++)
		{
			int c = (i << 6) / mid;
			g.setColor(getReducedGlassColor(c, alpha));
			g.drawLine(x, y + i, x + w, y + i);
		}

		for (int i = mid; i < h; i++)
		{
			int c = 64 - (i << 6) / h;
			g.setColor(getReducedGlassColor(c, alpha));
			g.drawLine(x, y + i, x + w, y + i);
		}

		for (int i = 0; i < 2; i++)
		{
			int c = 50 - (i << 4);
			g.setColor(getReducedGlassColor(c, alpha));
			g.drawLine(x + i, y + i, (x + w) - i, y + i);
			g.drawLine(x + i, (y + h) - i, (x + w) - i, (y + h) - i);
			g.drawLine((x + w) - i, y + i, (x + w) - i, (y + h) - i);
			g.drawLine(x + i, y + i, x + i, (y + h) - i);
		}

	}

	private static void paintBack(Graphics g, int x, int y, int w, int h)
	{
		int mid = h / 3;
		for (int i = 0; i < mid; i++)
		{
			int c = (i << 6) / mid;
			g.setColor(getReducedColor(c));
			g.drawLine(x, y + i, x + w, y + i);
		}

		for (int i = mid; i < h; i++)
		{
			int c = 64 - (i << 6) / h;
			g.setColor(getReducedColor(c));
			g.drawLine(x, y + i, x + w, y + i);
		}

		for (int i = 0; i < 2; i++)
		{
			int c = 50 - (i << 4);
			g.setColor(getReducedColor(c));
			g.drawLine(x + i, y + i, (x + w) - i, y + i);
			g.drawLine(x + i, (y + h) - i, (x + w) - i, (y + h) - i);
			g.drawLine((x + w) - i, y + i, (x + w) - i, (y + h) - i);
			g.drawLine(x + i, y + i, x + i, (y + h) - i);
		}

	}

	public static void paintLightBack(Graphics g, int x, int y, int w, int h)
	{
		g.setColor(Color.white);
		g.fillRect(x, y, w, h);
		g.setColor(new Color(215, 235, 255));
		g.drawRect(x + 1, y + 1, w - 3, h - 3);
	}

	public static void paintSelectedBack(Graphics g, int x, int y, int w, int h)
	{
		g.setColor(Color.white);
		g.fillRect(x, y, w, h);
		g.setColor(Color.green);
		g.drawRect(x, y, w - 1, h - 1);
		g.setColor(Color.yellow);
		g.drawRect(x + 1, y + 1, w - 3, h - 3);
	}

	public static void paintMouseInBack(Graphics g, int x, int y, int w, int h)
	{
		g.setColor(Color.white);
		g.fillRect(x, y, w, h);
		g.setColor(Color.green);
		g.drawRect(x, y, w - 1, h - 1);
		g.setColor(Color.yellow);
		g.drawRect(x + 1, y + 1, w - 3, h - 3);
	}

	public static void paintBack(Graphics g, int x, int y, int w, int h, Color c)
	{
		setColor(c);
		paintBack(g, x, y, w, h);
	}

	public static void paintBack(Graphics g, int x, int y, int w, int h, Color c, JComponent jc)
	{
		setColor(c);
		if (jc.isEnabled())
		{
			paintBack(g, x, y, w, h);
		} else
		{
			g.setColor(c);
			g.fillRect(x, y, w, h);
		}
	}

	public static void paintThumb_normal(Graphics g, int x, int y, int w, int h, Color color)
	{
		setColor(color);
		int mid = w / 2;
		for (int i = 1; i < mid; i++)
		{
			int c = (i << 6) / mid;
			g.setColor(getReducedColor(2D, 1.0D, 0.0D, c));
			g.drawLine(x + i, y, x + i, (y + h) - 1);
		}

		for (int i = mid; i < w - 1; i++)
		{
			int c = 64 - (i << 6) / w;
			g.setColor(getReducedColor(200, 230, 255, 2D, 1.0D, 0.0D, c));
			g.drawLine(x + i, y, x + i, (y + h) - 1);
		}

	}

	public static void paintThumb2_normal(Graphics g, int x, int y, int w, int h, Color color)
	{
		setColor(color);
		int mid = h / 2;
		for (int i = 1; i < mid; i++)
		{
			int c = (i << 6) / mid;
			g.setColor(getReducedColor(2D, 1.0D, 0.0D, c));
			g.drawLine(x, y + i, (x + w) - 1, y + i);
		}

		for (int i = mid; i < h - 1; i++)
		{
			int c = 64 - (i << 6) / h;
			g.setColor(getReducedColor(200, 230, 255, 2D, 1.0D, 0.0D, c));
			g.drawLine(x, y + i, (x + w) - 1, y + i);
		}

	}

	public static void paintTrack_normal(Graphics g, int x, int y, int w, int h, Color color)
	{
		setColor(color);
		int mid = w / 3;
		for (int i = 1; i < mid; i++)
		{
			int c = (i << 6) / mid;
			g.setColor(getReducedColor(c));
			g.drawLine(x + i, y, x + i, (y + h) - 1);
		}

		for (int i = mid; i < w - 1; i++)
		{
			int c = 64 - (i << 6) / w;
			g.setColor(getReducedColor(c));
			g.drawLine(x + i, y, x + i, (y + h) - 1);
		}

	}

	public static void paintTrack2_normal(Graphics g, int x, int y, int w, int h, Color color)
	{
		setColor(color);
		int mid = h / 3;
		for (int i = 1; i < mid; i++)
		{
			int c = (i << 6) / mid;
			g.setColor(getReducedColor(c));
			g.drawLine(x, y + i, (x + w) - 1, y + i);
		}

		for (int i = mid; i < h - 1; i++)
		{
			int c = 64 - (i << 6) / h;
			g.setColor(getReducedColor(c));
			g.drawLine(x, y + i, (x + w) - 1, y + i);
		}

	}

	public static void paintTabBackOn(Graphics g, int x, int y, int w, int h, Color shadow, Color color)
	{
		setColor(color);
		int mid = h / 3;
		for (int i = 1; i < mid; i++)
		{
			int c = (i << 6) / mid;
			g.setColor(getReducedColor(c));
			g.drawLine(x, y + i, (x + w) - 1, y + i);
		}

		y += mid;
		h -= mid;
		for (int i = 0; i < h - 1; i++)
		{
			int c = 50 - (i << 6) / h;
			g.setColor(getReducedColor(c));
			g.drawLine(x, y + i, (x + w) - 1, y + i);
		}

	}

	public static void paintTabBackOff(Graphics g, int x, int y, int w, int h, Color shadow, Color color)
	{
		setColor(color);
		int mid = h / 3;
		for (int i = 1; i < mid; i++)
		{
			int c = (i << 6) / mid;
			g.setColor(getReducedColor(c).darker());
			g.drawLine(x, y + i, (x + w) - 1, y + i);
		}

		for (int i = mid; i < h - 1; i++)
		{
			int c = 64 - (i << 6) / h;
			g.setColor(getReducedColor(c).darker());
			g.drawLine(x, y + i, (x + w) - 1, y + i);
		}

	}

	public static void setColor(Color c)
	{
		boolean flag;
		if (c == null)
			flag = true;
		RED_RATE = (256D - (double)c.getRed()) / 64D;
		GREEN_RATE = (256D - (double)c.getGreen()) / 64D;
		BLUE_RATE = (256D - (double)c.getBlue()) / 64D;
	}

	public static Color getMixedColor(Color a, Color b)
	{
		int r = a.getRed() + b.getRed();
		int g = a.getGreen() + b.getGreen();
		int bl = a.getBlue() + b.getBlue();
		return new Color(r >> 1, g >> 1, bl >> 1);
	}

	public static Color getGrayColor(Color a)
	{
		int r = (a.getRed() + a.getGreen() + a.getBlue()) / 3;
		return new Color(r, r, r);
	}

	public static void paintButtonBack(Graphics g, int x, int y, int w, int h)
	{
		paintButtonBack(g, x, y, w, h, null);
	}

	public static void paintButtonBack(Graphics g, int x, int y, int w, int h, String text)
	{
		paintButtonBack(g, x, y, w, h, text, BUTTONBACKCOLOR);
	}

	public static void paintButtonBack(Graphics g, int x, int y, int w, int h, String text, Color c)
	{
		g.setColor(c);
		g.fill3DRect(x, y, w, h, true);
		if (text != null)
		{
			java.awt.Shape oldClip = g.getClip();
			g.setClip(x, y, w, h);
			FontMetrics fm = g.getFontMetrics();
			int w_ = fm.stringWidth(text);
			int h_ = g.getFont().getSize();
			g.setColor(Color.BLACK);
			g.drawString(text, x + (w - w_ >> 1), y + (h + h_ >> 1));
			g.setClip(oldClip);
		}
	}

	public static Color getReducedColor(int c)
	{
		return getReducedColor(RED_RATE, GREEN_RATE, BLUE_RATE, c);
	}

	private static Color getReducedColor(double red_rate, double green_rate, double blue_rate, int c)
	{
		return getReducedColor(255, 255, 255, red_rate, green_rate, blue_rate, c);
	}

	private static Color getReducedColor(int r, int g, int b, double red_rate, double green_rate, double blue_rate, int c)
	{
		int red = (int)((double)r - (double)c * red_rate);
		int green = (int)((double)g - (double)c * green_rate);
		int blue = (int)((double)b - (double)c * blue_rate);
		if (red < 0)
			red = 0;
		if (green < 0)
			green = 0;
		if (blue < 0)
			blue = 0;
		if (red > 255)
			red = 255;
		if (green > 255)
			green = 255;
		if (blue > 255)
			blue = 255;
		return new Color(red, green, blue);
	}

	public static Color getReducedGlassColor(int c, int alpha)
	{
		return getReducedGlassColor(RED_RATE, GREEN_RATE, BLUE_RATE, c, alpha);
	}

	private static Color getReducedGlassColor(double red_rate, double green_rate, double blue_rate, int c, int alpha)
	{
		return getReducedGlassColor(255, 255, 255, red_rate, green_rate, blue_rate, c, alpha);
	}

	private static Color getReducedGlassColor(int r, int g, int b, double red_rate, double green_rate, double blue_rate, int c, int alpha)
	{
		int red = (int)((double)r - (double)c * red_rate);
		int green = (int)((double)g - (double)c * green_rate);
		int blue = (int)((double)b - (double)c * blue_rate);
		if (red < 0)
			red = 0;
		if (green < 0)
			green = 0;
		if (blue < 0)
			blue = 0;
		if (red > 255)
			red = 255;
		if (green > 255)
			green = 255;
		if (blue > 255)
			blue = 255;
		return new Color(red, green, blue, alpha);
	}

}
