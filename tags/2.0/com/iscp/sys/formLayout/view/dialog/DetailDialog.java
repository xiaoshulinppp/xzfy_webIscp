// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   DetailDialog.java

package com.iscp.sys.formLayout.view.dialog;

import com.iscp.sys.formLayout.model.FieldItemModel;
import com.iscp.sys.formLayout.view.MainPane;
import java.awt.Container;
import java.awt.Frame;
import java.awt.event.ActionEvent;
import javax.swing.*;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog:
//			InputDialog, InputContainer, StaticValueDialog, JavaScriptEditorDialog

public class DetailDialog extends InputDialog
{

	private FieldItemModel fim;
	private MainPane mainPane;
	public JTabbedPane detailPane;
	private String TYPES__[] = {
		"????", "???", "????????", "??????"
	};
	private String SHOWTYPES__[] = {
		"??-?งา?", "?????", "???????", "??????", "??????", "?????", "?????", "?????"
	};
	private String SHOWTYPES__SELECT[] = {
		"??-?งา?", "?????", "?????", "?????"
	};
	private String DICTTYPES__[] = {
		"??", "?งา?"
	};
	private String DICTVALGETTYPES__[] = {
		"?????", "??????"
	};
	private String DICTVALGETTYPES__VAL[] = {
		"leaf", "all"
	};
	private String DICTSHOWTYPES__[] = {
		"???", "???"
	};
	private String DICTSHOWTYPES__VAL[] = {
		"pickselect2", "pickselect1"
	};
	private JComboBox css_class_;
	private JTextField action_;
	private JTextField enu_;
	private JTextField length_;
	private JTextField default__;
	private JTextField dictListId_;
	private JComboBox dictvalGetType_;
	private JComboBox dictShowType_;
	private JComboBox type_;
	private JComboBox showType_;
	private JComboBox dictType_;
	private JCheckBox isNull_;
	private JCheckBox isDict_;
	private JButton staticValueEditButton;
	private JTextField onmousemove_;
	private JTextField onmouseout_;
	private JTextField onmouseenter_;
	private JTextField onmousedown_;
	private JTextField onmouseup_;
	private JTextField onchange_;
	private JTextField onclick_;
	private JButton b_event_edit[];
	private static String event_function_name[] = {
		"onclick", "onmousedown", "onmouseup", "onmousemove", "onmouseenter", "onmouseout", "onchange"
	};
	private static DefaultComboBoxModel CSS_CLASS_MODEL[];
	private Frame myFrame;

	public DetailDialog(Frame frame, FieldItemModel fim, MainPane mainPane, String title, boolean modal)
	{
		super(frame, title, modal);
		detailPane = new JTabbedPane();
		css_class_ = new JComboBox();
		action_ = new JTextField();
		enu_ = new JTextField();
		length_ = new JTextField();
		default__ = new JTextField();
		dictListId_ = new JTextField();
		dictvalGetType_ = new JComboBox(DICTVALGETTYPES__);
		dictShowType_ = new JComboBox(DICTSHOWTYPES__);
		type_ = new JComboBox(TYPES__);
		showType_ = new JComboBox(SHOWTYPES__);
		dictType_ = new JComboBox(DICTTYPES__);
		isNull_ = new JCheckBox();
		isDict_ = new JCheckBox();
		staticValueEditButton = new JButton("...");
		onmousemove_ = new JTextField();
		onmouseout_ = new JTextField();
		onmouseenter_ = new JTextField();
		onmousedown_ = new JTextField();
		onmouseup_ = new JTextField();
		onchange_ = new JTextField();
		onclick_ = new JTextField();
		b_event_edit = new JButton[7];
		this.fim = fim;
		this.mainPane = mainPane;
		init_css_classes();
		init();
	}

	private void init()
	{
		for (int i = 0; i < b_event_edit.length; i++)
			b_event_edit[i] = new JButton("...");

		InputContainer propertyContainer = new InputContainer();
		InputContainer eventContainer = new InputContainer();
		content = eventContainer;
		addItem_("onclick", onclick_, b_event_edit[0], 20);
		addItem_("onmousedown", onmousedown_, b_event_edit[1], 20);
		addItem_("onmouseup", onmouseup_, b_event_edit[2], 20);
		addItem_("onmousemove", onmousemove_, b_event_edit[3], 20);
		addItem_("onmouseenter", onmouseenter_, b_event_edit[4], 20);
		addItem_("onmouseout", onmouseout_, b_event_edit[5], 20);
		addItem_("onchange", onchange_, b_event_edit[6], 20);
		getContentPane().add(content);
		content = propertyContainer;
		getContentPane().add(content);
		addItem_("?????????", showType_);
		addItem_("???", isNull_);
		addItem_("???????", type_);
		addItem_("??????", action_);
		JButton b[] = new JButton[1];
		b[0] = staticValueEditButton;
		addItem_("????งา?", enu_, b, 20);
		addItem_("??ฆร???", length_);
		addItem_("???", default__);
		addItem_("css???", css_class_);
		addItem_("??????", isDict_);
		addItem_("?????", dictvalGetType_);
		addItem_("??????????", dictShowType_);
		addItem_("?????????", dictType_);
		Box box = Box.createVerticalBox();
		JTabbedPane jTabbedPane = detailPane;
		box.add(jTabbedPane);
		jTabbedPane.add(propertyContainer, "????");
		jTabbedPane.add(eventContainer, "?\274?");
		getContentPane().add(box);
		JPanel jPanel = new JPanel();
		box.add(jPanel);
		jPanel.add(b_ok);
		jPanel.add(b_cancel);
		setViewSize(410, 280);
		if (fim != null)
			setFieldItem(fim);
	}

	public void setFieldItem(FieldItemModel fim)
	{
		this.fim = fim;
		if (fim.sourceTable != null && fim.sourceTable.length() > 0)
			showType_.setModel(new DefaultComboBoxModel(SHOWTYPES__SELECT));
		action_.setText(fim.action);
		default__.setText(fim.default_);
		if (fim.dictShowType != null && fim.dictShowType.equals("pickselect2"))
			dictShowType_.setSelectedItem("???");
		else
			dictShowType_.setSelectedItem("???");
		dictType_.setSelectedIndex(fim.dictType);
		if (fim.dictvalGetType != null && fim.dictvalGetType.equals("leaf"))
			dictvalGetType_.setSelectedItem("?????");
		else
			dictvalGetType_.setSelectedItem("??????");
		enu_.setText(fim.enu);
		showType_.setSelectedItem(SHOWTYPES__[fim.showType]);
		isDict_.setSelected(fim.isDict);
		isNull_.setSelected(fim.isNull);
		length_.setText(fim.length);
		type_.setSelectedIndex(fim.type);
		css_class_.setSelectedItem(fim.css_class);
		resetEditor();
	}

	private void init_css_classes()
	{
		if (CSS_CLASS_MODEL == null)
		{
			CSS_CLASS_MODEL = new DefaultComboBoxModel[SHOWTYPES__.length];
			for (int i = 0; i < SHOWTYPES__.length; i++)
			{
				int indexes[] = FieldItemModel.getSelectableCss(i);
				String s[] = new String[indexes.length];
				for (int j = 0; j < indexes.length; j++)
					s[j] = FieldItemModel.SYSTEM_CSS_CLASSES[indexes[j]];

				CSS_CLASS_MODEL[i] = new DefaultComboBoxModel(s);
			}

		}
	}

	private void resetCssEditor()
	{
		javax.swing.ComboBoxModel model = CSS_CLASS_MODEL[getShowTypes()];
		if (model != css_class_.getModel())
		{
			css_class_.setModel(model);
			css_class_.setSelectedIndex(0);
		}
	}

	public void resetEditor()
	{
		int showType = getShowTypes();
		boolean selectableItem = showType == 5 || showType == 6 || showType == 0;
		if ((selectableItem || showType == 7) && isDict_.isSelected())
			isDict_.setSelected(false);
		isDict_.setEnabled(!selectableItem);
		dictvalGetType_.setEnabled(isDict_.isSelected());
		dictShowType_.setEnabled(isDict_.isSelected());
		dictType_.setEnabled(isDict_.isSelected());
		resetCssEditor();
	}

	private Frame getMyFrame()
	{
		if (myFrame == null)
		{
			for (Container c = this; c != null; c = c.getParent())
			{
				if (!(c instanceof Frame))
					continue;
				myFrame = (Frame)c;
				break;
			}

		}
		return myFrame;
	}

	public void itemActionPerformed(ActionEvent e, JComponent c)
	{
		if (c == staticValueEditButton)
		{
			enu_.setText(StaticValueDialog.editStaticValue(getMyFrame(), enu_.getText()));
			return;
		}
		for (int i = 0; i < b_event_edit.length; i++)
			if (c == b_event_edit[i])
			{
				String functionStr = (new StringBuilder(String.valueOf(fim.getTable()))).append("_").append(fim.getField()).append("_").append(event_function_name[i]).toString();
				(new JavaScriptEditorDialog(getMyFrame(), true, functionStr, mainPane)).setVisible(true);
				return;
			}

		resetEditor();
	}

	public void cmd_cancel()
	{
		setVisible(false);
	}

	private int getShowTypes()
	{
		for (int j = 0; j < SHOWTYPES__.length; j++)
			if (SHOWTYPES__[j].equals(showType_.getSelectedItem()))
				return j;

		return 0;
	}

	public void cmd_ok()
	{
		fim.action = action_.getText();
		fim.default_ = default__.getText();
		fim.dictShowType = DICTSHOWTYPES__VAL[dictShowType_.getSelectedIndex()];
		fim.dictType = dictType_.getSelectedIndex();
		fim.dictvalGetType = DICTVALGETTYPES__VAL[dictvalGetType_.getSelectedIndex()];
		fim.enu = enu_.getText();
		fim.showType = getShowTypes();
		fim.hidden = fim.showType == 7;
		fim.isDict = isDict_.isSelected();
		fim.isNull = isNull_.isSelected();
		fim.setCss_class((String)css_class_.getSelectedItem());
		fim.length = length_.getText();
		fim.type = type_.getSelectedIndex();
		setVisible(false);
	}

}
