// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   InputDialog.java

package com.iscp.sys.coderClient.view.struct.dialog;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.util.Vector;
import javax.swing.*;

// Referenced classes of package com.iscp.sys.coderClient.view.struct.dialog:
//			InputContainer, InputDialog_ItemInputActionListener, MyOptionPane, InputDialog_InputActionListener

public class InputDialog extends JDialog
{

	private static int COMMAND_BUTTON_HEIGHT = 20;
	private static int COMMAND_BUTTON_HEIGHT_SPACE = 10;
	protected JButton b_cancel;
	protected JButton b_ok;
	private InputContainer content;
	private Vector notNullComponent;
	private Vector notNullMessage;
	boolean resized;
	private int view_height;
	private int view_width;

	public InputDialog(Frame frame, String title, boolean modal)
	{
		super(frame, title, modal);
		notNullComponent = new Vector();
		notNullMessage = new Vector();
		b_ok = new JButton("确定");
		b_cancel = new JButton("取消");
		resized = false;
		try
		{
			init();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	public JLabel addItem(String label, JComponent c, JButton b[], int buttonWidth)
	{
		JLabel l = content.add(label, c);
		c.setBounds(c.getBounds().x, c.getBounds().y, c.getBounds().width - buttonWidth * b.length, c.getBounds().height);
		for (int i = 0; i < b.length; i++)
		{
			content.add(b[i]);
			b[i].setFocusable(false);
			b[i].setBounds(c.getBounds().x + c.getBounds().width + buttonWidth * i, c.getBounds().y, buttonWidth, c.getBounds().height);
			b[i].addActionListener(new InputDialog_ItemInputActionListener(this, b[i]));
		}

		int h = content.getBounds().height;
		int w = content.getBounds().width;
		setViewSize(w, h);
		b_ok.setBounds(10, h + COMMAND_BUTTON_HEIGHT_SPACE, 60, COMMAND_BUTTON_HEIGHT);
		b_cancel.setBounds(10 + w / 2, h + COMMAND_BUTTON_HEIGHT_SPACE, 60, COMMAND_BUTTON_HEIGHT);
		return l;
	}

	public JLabel addItem(String label, JComponent c)
	{
		JLabel l = content.add(label, c);
		int h = content.getBounds().height;
		int w = content.getBounds().width;
		setViewSize(w, h);
		b_ok.setBounds((w / 2 - 60) / 2, h + COMMAND_BUTTON_HEIGHT_SPACE, 60, COMMAND_BUTTON_HEIGHT);
		b_cancel.setBounds((w / 2 - 60) / 2 + w / 2, h + COMMAND_BUTTON_HEIGHT_SPACE, 60, COMMAND_BUTTON_HEIGHT);
		return l;
	}

	public JLabel addItem(String label)
	{
		JLabel l = content.add(label);
		return l;
	}

	public JLabel addItemNOTNULL(String label, JComponent c, JButton b[], int buttonWidth)
	{
		JLabel l = addItem(label, c, b, buttonWidth);
		notNullComponent.add(c);
		notNullMessage.add((new StringBuilder(String.valueOf(label))).append("不能为空，请重新输入").toString());
		l.setForeground(Color.red);
		return l;
	}

	public JLabel addItemNOTNULL(String label, JComponent c)
	{
		JLabel l = addItem(label, c);
		notNullComponent.add(c);
		notNullMessage.add((new StringBuilder(String.valueOf(label))).append("不能为空，请重新输入").toString());
		l.setForeground(Color.red);
		return l;
	}

	public JLabel addItem_(String label, JComponent c)
	{
		JLabel l = addItem(label, c);
		if (c instanceof JCheckBox)
		{
			JCheckBox cb = (JCheckBox)c;
			cb.addActionListener(new InputDialog_ItemInputActionListener(this, cb));
		} else
		if (c instanceof JComboBox)
		{
			JComboBox cb = (JComboBox)c;
			cb.addActionListener(new InputDialog_ItemInputActionListener(this, cb));
		} else
		if (c instanceof JTextField)
		{
			JTextField cb = (JTextField)c;
			cb.addActionListener(new InputDialog_ItemInputActionListener(this, cb));
		}
		return l;
	}

	public JLabel addItem_(String label, JComponent c, JButton b[], int buttonWidth)
	{
		JLabel l = addItem(label, c, b, buttonWidth);
		if (c instanceof JCheckBox)
		{
			JCheckBox cb = (JCheckBox)c;
			cb.addActionListener(new InputDialog_ItemInputActionListener(this, cb));
		} else
		if (c instanceof JComboBox)
		{
			JComboBox cb = (JComboBox)c;
			cb.addActionListener(new InputDialog_ItemInputActionListener(this, cb));
		} else
		if (c instanceof JTextField)
		{
			JTextField cb = (JTextField)c;
			cb.addActionListener(new InputDialog_ItemInputActionListener(this, cb));
		}
		return l;
	}

	public JLabel addItem_NOTNULL(String label, JComponent c)
	{
		JLabel l = addItem_(label, c);
		notNullComponent.add(c);
		notNullMessage.add((new StringBuilder(String.valueOf(label))).append("不能为空，请重新输入").toString());
		l.setForeground(Color.red);
		return l;
	}

	public JLabel addItem_NOTNULL(String label, JComponent c, JButton b[], int buttonWidth)
	{
		JLabel l = addItem_(label, c, b, buttonWidth);
		notNullComponent.add(c);
		notNullMessage.add((new StringBuilder(String.valueOf(label))).append("不能为空，请重新输入").toString());
		l.setForeground(Color.red);
		return l;
	}

	protected boolean checkVaild()
	{
		int size = notNullComponent.size();
		for (int i = 0; i < size; i++)
		{
			JComponent c = (JComponent)notNullComponent.get(i);
			if (c.isEnabled())
			{
				String value = "default";
				if (c instanceof JTextField)
					value = ((JTextField)c).getText();
				else
				if (c instanceof JComboBox)
				{
					Object o = ((JComboBox)c).getSelectedItem();
					if (o != null)
						value = o.toString();
					else
						value = null;
				}
				if (value == null || value.length() == 0)
				{
					c.requestFocus();
					MyOptionPane.showMessageDialog(this, notNullMessage.get(i).toString());
					return false;
				}
			}
		}

		return true;
	}

	public void cmd_cancel()
	{
	}

	public void cmd_ok()
	{
	}

	private void init()
		throws Exception
	{
		content = new InputContainer();
		content.add(b_ok);
		content.add(b_cancel);
		b_ok.addActionListener(new InputDialog_InputActionListener(this, 0));
		b_cancel.addActionListener(new InputDialog_InputActionListener(this, 1));
		getContentPane().add(content);
	}

	public void itemActionPerformed(ActionEvent actionevent1, JComponent jcomponent1)
	{
	}

	public void paint(Graphics g)
	{
		super.paint(g);
		if (!resized)
		{
			resized = true;
			int height = (view_height << 1) - getContentPane().getSize().height;
			int width = (view_width << 1) - getContentPane().getSize().width;
			setSize(width, height);
			validate();
		}
	}

	protected void setLabelWidth(int width)
	{
		content.labelWidth = width;
	}

	protected void setTextWidth(int width)
	{
		content.textWidth = width;
	}

	private void setViewSize(int w, int h)
	{
		h += COMMAND_BUTTON_HEIGHT + COMMAND_BUTTON_HEIGHT_SPACE + 5;
		view_width = w;
		view_height = h;
		setSize(w, h);
	}

}
