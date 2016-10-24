package com.taiji.fzb.utill;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.ComThread;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;
  
public class Word2PDF {  
	
    static final int wdFormatPDF = 17;// PDF 格式    
    public static void wordToPDF(String sfileName,String toFileName){    
            
        System.out.println("启动Word...");      
        long start = System.currentTimeMillis();      
        ActiveXComponent app = null;  
        Dispatch doc = null;  
        try {      
        	ComThread.InitSTA();// 
            app = new ActiveXComponent("Word.Application");      
            app.setProperty("Visible", new Variant(false));  
            Dispatch docs = app.getProperty("Documents").toDispatch();   
//          doc = Dispatch.call(docs,  "Open" , sourceFile).toDispatch();   
            doc = Dispatch.invoke(docs,"Open",Dispatch.Method,new Object[] {                    
               sfileName, new Variant(false),new Variant(true) }, new int[1]).toDispatch();               
            System.out.println("打开文档..." + sfileName);  
            System.out.println("转换文档到PDF..." + toFileName);      
            File tofile = new File(toFileName);      
            if (tofile.exists()) {      
                tofile.delete();      
            }        
//          Dispatch.call(doc, "SaveAs",  destFile,  17);                    
            Dispatch.invoke(doc, "SaveAs", Dispatch.Method, new Object[] {                
                toFileName, new Variant(17) }, new int[1]);    
            long end = System.currentTimeMillis();      
            System.out.println("转换完成..用时：" + (end - start) + "ms.");                
        } catch (Exception e) {  
            e.printStackTrace();  
            System.out.println("========Error:文档转换失败：" + e.getMessage());      
        } finally {  
            Dispatch.call(doc,"Close",false);  
            System.out.println("关闭文档");  
            if (app != null)      
                app.invoke("Quit", new Variant[] {});      
            }  
          //如果没有这句话,winword.exe进程将不会关闭  
           ComThread.Release();     
    }  
    public static void main(String[] args) {  
        Word2PDF d = new Word2PDF();  
      //  d.wordToPDF("d:\\ftp\\aaa.docx", "d:\\ftp\\aaa.pdf");  
        //System.exit(0);
        d.word2PDF("d:\\ftp\\aaa.docx", "d:\\ftp\\ffd.pdf", "");
        
    }  
    public static boolean word2PDF(String filename, String toFilename,
			String waterMarkStr) {
		boolean f = true;
		System.out.println("启动Word");
		long start = System.currentTimeMillis();
		ActiveXComponent app = null;
		Dispatch doc = null;
		try {
			ComThread.InitSTA();// 
			app = new ActiveXComponent("Word.Application");
			app.setProperty("Visible", false);

			Dispatch docs = app.getProperty("Documents").toDispatch();
			System.out.println("打开文档" + filename);
			doc = Dispatch.call(docs,//
					"Open", //
					filename,// FileName
					false,// ConfirmConversions
					true // ReadOnly
					).toDispatch();

			/**
			 * 添加水印
			 */
			// 取得窗口活动体
			// Dispatch activeWindow = app.getProperty("ActiveWindow")
			// .toDispatch();
			// Dispatch docSelection = Dispatch.get(app,
			// "Selection").toDispatch();
			// setWaterMark(activeWindow, docSelection, waterMarkStr);
			System.out.println("转换文档到PDF" + toFilename);
			File tofile = new File(toFilename);
			if (tofile.exists()) {
				tofile.delete();
			}
			Dispatch.call(doc,//
					"SaveAs", //
					toFilename, // FileName
					wdFormatPDF);

//			Dispatch.call(doc, "Close", false);
//			if (app != null)      
//                app.invoke("Quit", new Variant[] {});      
//           
//			ComThread.Release();//
			long end = System.currentTimeMillis();
			System.out.println("转换完成..用时：" + (end - start) + "ms.");
		} catch (Exception e) {
			f = false;
			System.out.println("Error:文档转换失败：" + e.getMessage());
			e.printStackTrace();
		}finally {  
            Dispatch.call(doc,"Close",false);  
            System.out.println("关闭文档");  
            if (app != null)      
                app.invoke("Quit", new Variant[] {});      
            //如果没有这句话,winword.exe进程将不会关闭  
            ComThread.Release();     
        }  
		return f;
	}

    public HttpServletResponse download(String path, HttpServletResponse response) {
    	try {
    		
    	// path是指欲下载的文件的路径。
    	File file = new File(path);
    	// 取得文件名。
    	String filename = file.getName();
    	// 取得文件的后缀名。
    	String ext = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase();
    	// 以流的形式下载文件。
    	InputStream fis = new BufferedInputStream(new FileInputStream(path));
    	byte[] buffer = new byte[fis.available()];
    	fis.read(buffer);
    	fis.close();
    	// 清空response
    	response.reset();
    	// 设置response的Header
    	response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes()));
    	response.addHeader("Content-Length", "" + file.length());
    	OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
    	response.setContentType("application/octet-stream");
    	toClient.write(buffer);
    	toClient.flush();
    	toClient.close();
    	} catch (IOException ex) {
    	ex.printStackTrace();
    	}
    	return response;
    	}
	public static void wdFormatPDF(String string, String string2) {
		// TODO Auto-generated method stub
		
	}
    
  
}  