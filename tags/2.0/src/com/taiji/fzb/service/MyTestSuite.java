package com.taiji.fzb.service;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

// Referenced classes of package com.taiji.fzb.spring.test:
//            TestUser

public class MyTestSuite
{



	public MyTestSuite()
    {
    }

    public static Test suite()
    {
        TestSuite suite = new TestSuite();
        suite.addTestSuite(TestUser.class);
        return suite;
    }
}
