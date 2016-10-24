// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   DetailPane.java

package com.iscp.sys.formLayout.view.dialog;

import com.iscp.sys.formLayout.model.FieldItemModel;
import com.iscp.sys.formLayout.msg.MsgDict;
import com.iscp.sys.formLayout.msg.MsgManager;
import com.iscp.sys.formLayout.view.MainPane;
import com.iscp.sys.formLayout.view.TableView;
import java.awt.*;
import java.awt.event.ActionEvent;
import javax.swing.*;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog:
//			PropertyTable, StaticValueDialog

public class DetailPane extends JTabbedPane
{

	private FieldItemModel fim;
	private MainPane mainPane;
	private boolean settingValue;
	public JTabbedPane detailPane;
	private String TYPES__[] = {
		"????", "???", "????????", "??????"
	};
	private static String SHOWTYPES__[] = {
		"??-?งา?", "?????", "???????", "??????", "??????", "?????", "?????", "?????"
	};
	private static DefaultComboBoxModel SHOWTYPES_COMBOBOXMODEL;
	private static String SHOWTYPES__SELECT[] = {
		"??-?งา?", "?????", "?????", "?????"
	};
	private static DefaultComboBoxModel SHOWTYPES_SELECT_COMBOBOXMODEL;
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
	private JTextField id_;
	private JComboBox css_class_;
	private JTextField action_;
	private JTextField enu_;
	private JTextField length_;
	private JTextField default__;
	private JTextField other_property_express_;
	private JComboBox dictListId_;
	private JComboBox dictvalGetType_;
	private JComboBox dictShowType_;
	private JComboBox type_;
	private JComboBox showType_;
	private JComboBox dictType_;
	private JCheckBox isNull_;
	private JCheckBox isDict_;
	private JButton staticValueEditButton;
	private JCheckBox event_check_[];
	private JButton b_event_edit[];
	private PropertyTable propertyContainer;
	private PropertyTable eventContainer;
	private static DefaultComboBoxModel CSS_CLASS_MODEL[];
	private Frame myFrame;
	private DefaultComboBoxModel dictListId_model;

	public DetailPane(FieldItemModel fim, MainPane mainPane)
	{
		settingValue = false;
		detailPane = new JTabbedPane();
		id_ = new JTextField();
		css_class_ = new JComboBox();
		action_ = new JTextField();
		enu_ = new JTextField();
		length_ = new JTextField();
		default__ = new JTextField();
		other_property_express_ = new JTextField();
		dictListId_ = new JComboBox();
		dictvalGetType_ = new JComboBox(DICTVALGETTYPES__);
		dictShowType_ = new JComboBox(DICTSHOWTYPES__);
		type_ = new JComboBox(TYPES__);
		showType_ = new JComboBox(SHOWTYPES__);
		dictType_ = new JComboBox(DICTTYPES__);
		isNull_ = new JCheckBox();
		isDict_ = new JCheckBox();
		staticValueEditButton = new JButton("...");
		event_check_ = new JCheckBox[FieldItemModel.eventName.length];
		b_event_edit = new JButton[FieldItemModel.eventName.length];
		propertyContainer = new PropertyTable(this);
		eventContainer = new PropertyTable(this);
		this.fim = fim;
		this.mainPane = mainPane;
		init_css_classes();
		init();
		setTabPlacement(3);
	}

	private void init()
	{
		for (int i = 0; i < b_event_edit.length; i++)
			event_check_[i] = new JCheckBox(FieldItemModel.eventName[i]);

		for (int i = 0; i < b_event_edit.length; i++)
			eventContainer.addItem_(FieldItemModel.eventIntr[i], event_check_[i]);

		propertyContainer.addItem_("ID", id_);
		propertyContainer.addItem_("?????????", showType_);
		propertyContainer.addItem_("???", isNull_);
		propertyContainer.addItem_("???????", type_);
		propertyContainer.addItem_("??????", action_);
		propertyContainer.addItem_("??ฆร???", length_);
		propertyContainer.addItem_("???", default__);
		propertyContainer.addItem_("?????????", other_property_express_);
		propertyContainer.addItem_("css???", css_class_);
		propertyContainer.addItem_("??????", isDict_);
		propertyContainer.addItem_("??????", dictListId_);
		propertyContainer.addItem_("?????", dictvalGetType_);
		propertyContainer.addItem_("??????????", dictShowType_);
		propertyContainer.addItem_("?????????", dictType_);
		addScrollPane(propertyContainer, "????");
		addScrollPane(eventContainer, "?\274?");
		setFieldItem(fim);
	}

	private void addScrollPane(Component c, String name)
	{
		JScrollPane __p = new JScrollPane();
		__p.getViewport().add(c);
		add(__p, name);
	}

	public void setFieldItem(FieldItemModel fim)
	{
		settingValue = true;
		propertyContainer.setAllEnable(fim != null && mainPane.Ability_FieldItemPropertyEdit);
		eventContainer.setAllEnable(fim != null && mainPane.Ability_JavaScriptEdit && mainPane.Ability_FieldItemEventEdit);
		if (fim == null)
			return;
		this.fim = fim;
		id_.setText(fim.getId());
		if (fim.sourceTable != null && fim.sourceTable.length() > 0)
			showType_.setModel(SHOWTYPES_SELECT_COMBOBOXMODEL);
		else
			showType_.setModel(SHOWTYPES_COMBOBOXMODEL);
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
		other_property_express_.setText(fim.other_property_express);
		css_class_.setSelectedItem(fim.css_class);
		for (int i = 0; i < b_event_edit.length; i++)
			event_check_[i].setSelected(fim.event[i]);

		if (dictListId_model != null)
		{
			int size = dictListId_model.getSize();
			if (size > 0)
				dictListId_model.setSelectedItem(dictListId_model.getElementAt(0));
			for (int i = 0; i < size; i++)
			{
				MsgDict dict = (MsgDict)dictListId_model.getElementAt(i);
				if (!(new StringBuilder(String.valueOf(dict.getId()))).toString().toString().equals(fim.dictListId))
					continue;
				dictListId_model.setSelectedItem(dict);
				break;
			}

		}
		resetEditor();
		settingValue = false;
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
		dictListId_.setEnabled(isDict_.isSelected());
		dictvalGetType_.setEnabled(isDict_.isSelected());
		dictShowType_.setEnabled(isDict_.isSelected());
		dictType_.setEnabled(isDict_.isSelected());
		resetCssEditor();
		propertyContainer.repaint();
		eventContainer.repaint();
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

	public void doAction(ActionEvent e, JComponent c)
	{
		mainPane.setChanged(true);
		if (c == staticValueEditButton)
		{
			enu_.setText(StaticValueDialog.editStaticValue(getMyFrame(), enu_.getText()));
			return;
		}
		for (int i = 0; i < b_event_edit.length; i++)
			if (c == event_check_[i] && event_check_[i].isSelected())
			{
				String functionStr = (new StringBuilder(String.valueOf(fim.getTable()))).append("_").append(fim.getField()).append("_").append(FieldItemModel.eventName[i]).toString();
				mainPane.showScript(functionStr);
				return;
			}

		resetEditor();
	}

	public void itemActionPerformed(ActionEvent e, JComponent c)
	{
		if (settingValue || fim == null)
		{
			return;
		} else
		{
			doAction(e, c);
			cmd_ok();
			mainPane.getTableView().repaint();
			return;
		}
	}

	public void paint(Graphics g)
	{
		initDictList();
		super.paint(g);
	}

	private void initDictList()
	{
		if (dictListId_model == null)
			try
			{
				MsgDict dictlist[] = MsgManager.getDictList(this);
				dictListId_model = new DefaultComboBoxModel();
				for (int i = 0; i < dictlist.length; i++)
					dictListId_model.addElement(dictlist[i]);

				dictListId_.setModel(dictListId_model);
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
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
		fim.id = id_.getText();
		if (id_.getText() == null || id_.getText().length() == 0)
			fim.id = null;
		fim.action = action_.getText();
		fim.default_ = default__.getText();
		fim.dictShowType = DICTSHOWTYPES__VAL[dictShowType_.getSelectedIndex()];
		fim.dictType = dictType_.getSelectedIndex();
		fim.dictvalGetType = DICTVALGETTYPES__VAL[dictvalGetType_.getSelectedIndex()];
		fim.enu = enu_.getText();
		fim.showType = getShowTypes();
		fim.hidden = fim.showType == 7;
		if (dictListId_model != null && dictListId_model.getSize() > 0)
			fim.dictListId = (new StringBuilder(String.valueOf(((MsgDict)dictListId_model.getSelectedItem()).getId()))).toString();
		fim.isDict = isDict_.isSelected();
		fim.isNull = isNull_.isSelected();
		fim.setCss_class((String)css_class_.getSelectedItem());
		fim.length = length_.getText();
		fim.type = type_.getSelectedIndex();
		fim.other_property_express = other_property_express_.getText();
		for (int i = 0; i < b_event_edit.length; i++)
			fim.event[i] = event_check_[i].isSelected();

	}

	static 
	{
		SHOWTYPES_COMBOBOXMODEL = new DefaultComboBoxModel(SHOWTYPES__);
		SHOWTYPES_SELECT_COMBOBOXMODEL = new DefaultComboBoxModel(SHOWTYPES__SELECT);
	}
}
