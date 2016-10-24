// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   CoderServer.java

package com.iscp.sys.coderServer;

import com.iscp.sys.coder.model.TemplateCoder;
import com.iscp.sys.coderMsg.Answer;
import com.iscp.sys.coderMsg.Command;
import java.io.*;
import java.util.Enumeration;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;

// Referenced classes of package com.iscp.sys.coderServer:
//			Execute

public class CoderServer extends HttpServlet
{

	private static final String CONTENT_TYPE = "text/html; charset=GBK";
	private SessionFactory factory;
	private Execute execute;

	public CoderServer()
	{
		execute = new Execute();
	}

	public void init()
		throws ServletException
	{
		String url = TemplateCoder.getBasePath();
		Configuration cfg = (new Configuration()).configure(new File((new StringBuilder(String.valueOf(url))).append("/hibernate.cfg.xml").toString()));
		cfg.addResource("com/iscp/sys/coderMsg/RelModel.hbm.xml");
		factory = cfg.buildSessionFactory();
		execute.setCfg(cfg);
		String name;
		for (Enumeration e = cfg.getProperties().propertyNames(); e.hasMoreElements(); System.out.println((new StringBuilder(String.valueOf(name))).append(" = ").append(cfg.getProperties().getProperty(name)).toString()))
			name = e.nextElement().toString();

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		response.setContentType("text/html; charset=GBK");
		Command command = null;
		Answer answer = new Answer();
		try
		{
			ObjectInputStream commandStream = new ObjectInputStream(request.getInputStream());
			command = (Command)commandStream.readObject();
			commandStream.close();
		}
		catch (Exception e)
		{
			answer = new Answer();
			answer.error = e;
			e.printStackTrace();
		}
		try
		{
			if (answer.error == null)
				answer = execute(command);
		}
		catch (Exception e)
		{
			answer.error = e;
			e.printStackTrace();
		}
		ObjectOutputStream answerStream = new ObjectOutputStream(response.getOutputStream());
		answerStream.writeObject(answer);
		answerStream.flush();
	}

	public void destroy()
	{
	}

	public Answer execute(Command command)
		throws Exception
	{
		Answer answer = null;
		if (answer != null)
			return answer;
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		if (command.isCommandSet())
		{
			answer = new Answer();
			do
			{
				Command cmd = command.remove();
				if (cmd == null)
					break;
				answer.addAnswer(execute.execute(session, cmd));
			} while (true);
		} else
		{
			answer = execute.execute(session, command);
		}
		tx.commit();
		session.close();
		return answer;
	}
}
