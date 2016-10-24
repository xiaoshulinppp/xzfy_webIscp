package com.taiji.fzb.domain;

import java.util.HashSet;
import java.util.Set;

import org.hibernate.*;
import org.hibernate.cfg.Configuration;

public class Test
{

    public Test() 
    {
    }

    public static void main(String args[])
    {
        SessionFactory sf = (new Configuration()).configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction tx = session.beginTransaction();
        XzfyInfo xzfy=new XzfyInfo();
        xzfy.setId("36");
        xzfy.setAdmit1("21");
        xzfy.setAgent("12");
        xzfy.setCheck_status("0");
        xzfy.setStatus("0");
        xzfy.setUser1_id("22");
        xzfy.setXzfy_org("31");
        
        XzfyApp xzfyapp=new XzfyApp();
        xzfyapp.setApp_name("test");
        xzfyapp.setIsdeputy("1");
        xzfyapp.setMail_address("mail");
        xzfyapp.setProxytype("1");
        xzfyapp.setEmail("email");
        xzfyapp.setXzfyInfo(xzfy);
        Set map=new HashSet();
        map.add(xzfyapp);
        xzfy.setXzfyApps(map);
        session.save(xzfy);
        
        /**
        Org pm = new Org();
        String hql = "from Org org where org.id=0";
        pm = (Org)session.createQuery(hql).list().get(0);
        System.out.println(pm.getName());
        Set pms = new HashSet();
        pms = pm.getChilds();
        System.out.println(pms.size());
        **/
        tx.commit();
        session.close();
    }
}
