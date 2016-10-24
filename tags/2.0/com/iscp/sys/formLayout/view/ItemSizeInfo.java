// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   CellView.java

package com.iscp.sys.formLayout.view;


class ItemSizeInfo
{

	int w[];
	int h[];
	int left[];
	int count;

	private void insert(int w, int h, int left)
	{
		this.w[count] = w;
		this.h[count] = h;
		this.left[count] = left;
		count++;
	}

	public ItemSizeInfo()
	{
		w = new int[11];
		h = new int[11];
		left = new int[11];
		count = 0;
		insert(15, 0, 0);
		insert(0, 0, -3);
		insert(0, 0, -3);
		insert(35, 0, 0);
		insert(0, 0, 0);
		insert(15, 0, 13);
		insert(15, 0, 13);
		insert(0, 0, 0);
	}
}
