// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ScriptEditorComboPopupMenuUI.java

package com.iscp.sys.formLayout.view.dialog.javascripteditor;

import javax.swing.plaf.basic.BasicComboBoxEditor;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog.javascripteditor:
//			HiddenTextField

class ScriptEditorComboEditor extends BasicComboBoxEditor
{
	public static class UIResource extends ScriptEditorComboEditor
		implements javax.swing.plaf.UIResource
	{

		public UIResource()
		{
		}
	}


	public ScriptEditorComboEditor()
	{
		editor = new HiddenTextField();
	}
}
