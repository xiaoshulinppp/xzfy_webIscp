// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ScriptEditor.java

package com.iscp.sys.formLayout.view.dialog.javascripteditor;

import java.awt.Container;
import java.util.Map;

public interface ScriptEditor
{

	public abstract int findFunctionPosition(String s);

	public abstract void focusToFunctionPosition(String s);

	public abstract void setScriptText(String s);

	public abstract String getScriptText();

	public abstract void setParentContainer(Container container);

	public abstract void setFormElementNames(String as[]);

	public abstract void setFormElementNamesType(Map map);

	public abstract void setEditable(boolean flag);

	public abstract void undo();

	public abstract void redo();

	public abstract void search();

	public abstract boolean canUndo();

	public abstract boolean canRedo();
}
