// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   GrayImageFilter.java

package com.iscp.sys.formLayout.view.base;

import java.awt.Component;
import java.awt.Image;
import java.awt.image.*;

public class GrayImageFilter extends RGBImageFilter
{

	private DirectColorModel cm;
	private static ImageFilter filter = new GrayImageFilter();

	public GrayImageFilter()
	{
		cm = (DirectColorModel)ColorModel.getRGBdefault();
	}

	public int filterRGB(int x, int y, int rgb)
	{
		int alpha = cm.getAlpha(rgb);
		int red = cm.getRed(rgb);
		int green = cm.getGreen(rgb);
		int blue = cm.getBlue(rgb);
		int light = (red + green + blue) / 3;
		alpha >>= 1;
		return alpha << 24 | light << 16 | light << 8 | light;
	}

	public static Image getImage(Image source, Component component)
	{
		FilteredImageSource fis = new FilteredImageSource(source.getSource(), filter);
		return component.createImage(fis);
	}

}
