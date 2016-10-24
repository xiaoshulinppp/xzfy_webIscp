package com.taiji.fzb.service;

import com.taiji.fzb.service.XzfyService;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import junit.framework.TestCase;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.InputStreamResource;

public class TestUser extends TestCase
{

    XmlBeanFactory ctx;
    XzfyService cc;

    public TestUser(String name)
    {
        super(name);
        ctx = null;
        cc = null;
    }

    public void setUp()
    {
        String paths = "E:\\taiji\\iscp\\webIscp\\src\\applicationContext.xml";
        try
        {
            java.io.InputStream ios = new FileInputStream(paths);
            ctx = new XmlBeanFactory(new InputStreamResource(ios));
            cc = (XzfyService)ctx.getBean("xzfyService");
        }
        catch(FileNotFoundException e)
        {
            e.printStackTrace();
        }
    }

    public void testUser()
    {
        //List list = new ArrayList();
        //cc.getXzfyList(1, 1);
       // cc.getUserList(5, list);
    }
}