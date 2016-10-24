package com.taiji.datum.action;

import java.util.ArrayList;
import java.util.List;

public class DisplayInfoUtil {

	public static List getDisplayInfo(){
		List listDisplay = new ArrayList();
		listDisplay.add("TITLE");
		listDisplay.add("TYPE");
		listDisplay.add("UPLOADPEOPLE");
		listDisplay.add("UPLOADTIME");
		//listDisplay.add("LASTREADTIME");
		listDisplay.add("READNUM");
		listDisplay.add("STATUS");
		return listDisplay;
	}
	
	public static List getDisplayInfo1(){
		List listDisplay = new ArrayList();
		listDisplay.add("TITLE");
		listDisplay.add("TYPE");
		listDisplay.add("KEYWORD");
		listDisplay.add("UPLOADPEOPLE");
		listDisplay.add("UPLOADTIME");
		//listDisplay.add("LASTREADTIME");
		listDisplay.add("READNUM");
		listDisplay.add("STATUS");
		return listDisplay;
	}
}
