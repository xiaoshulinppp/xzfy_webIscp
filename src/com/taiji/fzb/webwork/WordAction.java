package com.taiji.fzb.webwork;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import com.opensymphony.webwork.ServletActionContext;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.service.XzfyService;
import com.taiji.fzb.utill.Word2PDF;
import com.taiji.waiwangTB.domain.XzfyInfo2;

/**
 * @Desc：生成word
 * @Author：张轮
 * @Date：2014-1-22下午04:52:03
 */
@SuppressWarnings("serial")
public class WordAction  extends ProtectedDetailAction{

 private String filePath; //文件路径
 private String fileName; //文件名称
 private String fileOnlyName; //文件唯一名称
 
 
 private String xzfyId; //
 private XzfyInfo xzfyInfo; //
 private XzfyInfo2 xzfyInfo2; //获取期事实与理由字段
 private XzfyService xzfyService = null; // 模板业务层方法
 private String sljg; //
 private String appdetail_cang;
 private String	agentDetail_cang;
 private String	require_fy_cang;
 private String xzfyInfo2id;
/**
  * @Desc：生成word文档
  * @Author：张轮
  * @Date：2014-1-22下午07:29:58
  * @return
 * @throws IOException 
  */
    public String createWord() throws IOException {
        /** 用于组装word页面需要的数据 */
        Map<String, Object> dataMap = new HashMap<String, Object>();
        
        /** 组装数据 */
        
       // xzfyInfo=xzfyService.getXzfyById(xzfyId);
        
        xzfyInfo2=xzfyService.getXzfyInfo2ById(xzfyInfo.getXzfyInfo2id());
        
        dataMap.put("jiansuom",xzfyInfo2.getJiansuom());
        
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日");
        dataMap.put("datenow",sdf.format(new Date()));
        
        dataMap.put("dlren",xzfyInfo.getAgent_name());
        dataMap.put("dlrendh",xzfyInfo2.getAgent_phone());
        dataMap.put("dbren",xzfyInfo.getDbrDetail());//dbrDetail
        dataMap.put("bsqren",xzfyInfo.getDefendant_name());//defendant_name
        
        //为否时
        dataMap.put("xwandwh",xzfyInfo.getIs_prof_detail());
        dataMap.put("nianyue",xzfyInfo.getBuzheng_from());//时间的拼接字段。
        dataMap.put("fagnshi",xzfyInfo.getXzfy_requset());
        
        dataMap.put("ssliyou",xzfyInfo2.getShishiyuly());//特别需要将外网的事实与理由字段带到这里来。其他使用当前页面最新信息。
        
        String sldanwei=xzfyService.getRootOrg(sljg).getName();
        
        dataMap.put("sldanwei",sldanwei);
        //ismanage   2是，0，否
        String	fuyiqq="";
        String 	fuyiqq_ly="";
        if(xzfyInfo.getIsmanage().equals("0")){//
        	//名称2$201601$2016-08-08$告知&
        	String bb=require_fy_cang.replace("&", "");
        	String bb1[]=bb.split("\\$");
        	
       	   fuyiqq="申请人不服被申请人作出的  "+bb1[0]+"("+bb1[1]+")"+"，请求撤销该具体行政行为。";
        	fuyiqq_ly="申请人于"+bb1[2]+"通过 "+bb1[3]+" 得知该具体行政行为，特申请行政复议";
        	 dataMap.put("fuyiqq",fuyiqq);
        	 dataMap.put("fuyiqq_ly",fuyiqq_ly);
        }else{//为否的时候才会有循环list
        	
        		fuyiqq="申请人曾经要求被申请人履行 "+xzfyInfo.getIs_prof_detail()+"，申请人请求责令被申请人履行该项法定职责。";
	        	fuyiqq_ly="申请人曾于"+xzfyInfo.getBuzheng_from()+"通过某方式要求被申请人履行法定职责而被申请人未依法履行，申请人特申请行政复议.";
	        	 dataMap.put("fuyiqq",fuyiqq);
	        	 dataMap.put("fuyiqq_ly",fuyiqq_ly);
        	
        }
        /*if(xzfyInfo.getIsmanage().equals("2")){//
        	dataMap.put("qingqiu","1");
        	
        	
        }else{//为否的时候才会有循环list
        	
        	
        	dataMap.put("qingqiu","2");
        	 List<Map<String, Object>> listfy  =new ArrayList<Map<String,Object>>();
             //require_fy_cang
             
             String fuyi=require_fy_cang;
             String fy[]=fuyi.split("&");
             for(int i=0;i<=fy.length-1;i++){
             	
             	//名称（文号）；知道时间：2013年3月18日（途径是偷偷知道的）；共1件
             	//名称$文号$2013-3-18$途径是偷偷知道的&
             	
              Map<String, Object> map=new HashMap<String, Object>();
              //撒旦法$2131$2013-1-18$撒旦法
              String bb[]=fy[i].split("\\$");
              String shujiawh="";
              shujiawh=bb[0]+"("+bb[1]+")";
              map.put("mcjiawh", shujiawh);
              map.put("nianyue", bb[2]);
              map.put("moufs", bb[3]);
              listfy.add(map);
             }
             dataMap.put("listfy",listfy);
           	
        	
        }*/
        
        
        
        List<Map<String, Object>> listsqr =new ArrayList<Map<String,Object>>();
        //判断公民或是法人？？？？
        //1公民，2法人
        String sqr="";
        if(xzfyInfo.getApp_type().equals("1")){//公民
        	//刘全成$男$身份证号130627198912084613$送达地址是打发点$邮编072358$电话99999999&
        	//刘全成，男，身份证号123，送达地址123123，邮编123，电话123123；
        	sqr=appdetail_cang;
        	String aa[]=sqr.split("&");
        	
        	for(int i=0;i<aa.length;i++){
        		
                Map<String, Object> map=new HashMap<String, Object>();
                
                String sqr22="";
            String  bb3[]= aa[i].split("\\$");
          //刘全成$男$身份证号130627198912084613$送达地址是打发点$邮编072358$电话99999999&
           
            sqr22="姓名:"+bb3[0]+"，性别:"+bb3[1]+"，身份证号:"+bb3[2]+"，送达地址:"+bb3[3]+"，邮编:"+bb3[4]+"，电话:"+bb3[5];
            
                map.put("sqr",sqr22);
                //刘全成$男$身份证号130627198912084613$送达地址盛大发售$邮编121212$电话12121212
                listsqr.add(map);
               }
               dataMap.put("listsqr",listsqr );
        	
        	
        }else{//faren 
        	
        	sqr=agentDetail_cang;
        	String aa[]=sqr.split("&");
        	//刘全成$由董事会以股份制企业名义提出申请$执行合伙事务的合伙人$张代表$北京海淀$333222$44443333&
        	//刘全成$0$法定代表人$张代表$南京$333222$44443333&
        	//(1)刘全成（由董事会以股份制企业名义提出申请），执行合伙事务的合伙人是：张代表，送达地址北京海淀，邮编333222，电话44443333；  共1 人
        	//(1)刘全成（由董事会以股份制企业名义提出申请），执行合伙事务的合伙人是：张代表，送达地址北京海淀，邮编333222，电话44443333；(2)刘全成2（由董事会以股份制企业名义提出申请），法定代表人是：张代表，送达地址河北保定，邮编333222，电话44443333；  共2 人
        	//刘全成$由董事会以股份制企业名义提出申请$执行合伙事务的合伙人$张代表$北京海淀$333222$44443333&刘全成2$由董事会以股份制企业名义提出申请$法定代表人$张代表$河北保定$333222$44443333&刘全成$0$法定代表人$张代表$南京$333222$44443333&
        	for(int i=0;i<aa.length;i++){
        		
                Map<String, Object> map=new HashMap<String, Object>();
                //"刘全成（由董事会以股份制企业名义提出申请），主要负责人是：张三，送达地址北京海淀，邮编333333，电话3333333；")
                String faren="";
                String bb[]=aa[i].split("\\$");
                String gudong="";
                if(bb[1].equals("0")){
                	gudong="";
                }else{
                	gudong="("+bb[1]+")";
                }
                faren=bb[0]+gudong+","+bb[2]+"是"+bb[3]+","+"送达地址:"+bb[4]+","+"邮编:"+bb[5];
                
                map.put("sqr",faren);
                
                listsqr.add(map);
               }
               dataMap.put("listsqr",listsqr );
       	
        }
        
        		
       //拆分从组。
        
        
       
         
        //dataMap.put("content","这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容");
    //    newList 
        
        
        /** 文件名称，唯一字符串 */
        Random r=new Random();
        SimpleDateFormat sdf1=new SimpleDateFormat("yyyyMMddHHmmssSSS");
        StringBuffer sb=new StringBuffer();
        sb.append(sdf1.format(new Date()));
        sb.append(r.nextInt(100));
        
        //文件路径
        filePath=ServletActionContext.getServletContext().getRealPath("/")+"upload";
        //ServletActionContext.getServletContext().getRealPath("/")+"upload
        //文件唯一名称
        fileOnlyName =sb+".doc";
        
        //文件名称
      //  fileName="申请书.doc";
      String   fileName2=sb+".pdf";
        /** 生成word */
      //该方法路径找不到
        WordUtil.createWord(this.getRequest(),dataMap,  filePath, fileOnlyName);
        //该方法直接弹窗下载
        WordUtil.createWord(dataMap,this.getRequest(),ServletActionContext.getResponse());
        
        /*boolean f = Word2Pdf.word2PDF(filePath+File.separator+fileName, filePath +File.separator+ fileName2,"诚信创建");
        if(f){
        	System.out.println("chenggong");
        }else{
        	System.out.println("shibai");
        }
        */
        System.out.println(filePath+File.separator+fileOnlyName+"   "+ filePath +File.separator+ fileName2);
      //  Word2PDF.wordToPDF(filePath+File.separator+fileOnlyName, filePath +File.separator+ fileName2);
      //  WordUtil.download(filePath +File.separator+ fileName2, ServletActionContext.getResponse());
        
     //   WordUtil.DeleteFolder(filePath+File.separator+fileOnlyName);
     //   WordUtil.DeleteFolder(filePath +File.separator+ fileName2);
        return "createWordSuccess";
    }
    public String createWord_pdf() throws IOException {
        /** 用于组装word页面需要的数据 */
        Map<String, Object> dataMap = new HashMap<String, Object>();
        
        /** 组装数据 */
        
       // xzfyInfo=xzfyService.getXzfyById(xzfyId);
        
        xzfyInfo2=xzfyService.getXzfyInfo2ById(xzfyId);
        
        dataMap.put("jiansuom",xzfyInfo2.getJiansuom());
        
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日");
        dataMap.put("datenow",sdf.format(new Date()));
        
        dataMap.put("dlren",xzfyInfo2.getAgent_name());
        dataMap.put("dlrendh",xzfyInfo2.getAgent_phone());
        dataMap.put("dbren",xzfyInfo2.getDbrDetail());//dbrDetail
        dataMap.put("bsqren",xzfyInfo2.getDefendant_name());//defendant_name
        
        //为否时
        dataMap.put("xwandwh",xzfyInfo2.getIs_prof_detail());
        dataMap.put("nianyue",xzfyInfo2.getBuzheng_from());//时间的拼接字段。
        dataMap.put("fagnshi",xzfyInfo2.getXzfy_requset());
        
        dataMap.put("ssliyou",xzfyInfo2.getShishiyuly());//特别需要将外网的事实与理由字段带到这里来。其他使用当前页面最新信息。
        
        String sldanwei=xzfyService.getRootOrg(xzfyInfo2.getCaseorg()).getName();
        
        dataMap.put("sldanwei",sldanwei);
        //ismanage   2是，0，否
        String	fuyiqq="";
        String 	fuyiqq_ly="";
        if(xzfyInfo2.getIsmanage().equals("0")){//
        	//名称2$201601$2016-08-08$告知&
        	String bb=xzfyInfo2.getRequire_fy_cang().replace("&", "");
        	String bb1[]=bb.split("\\$");
        	
       	   fuyiqq="申请人不服被申请人作出的  "+bb1[0]+"("+bb1[1]+")"+"，请求撤销该具体行政行为。";
        	fuyiqq_ly="申请人于"+bb1[2]+"通过 "+bb1[3]+" 得知该具体行政行为，特申请行政复议";
        	 dataMap.put("fuyiqq",fuyiqq);
        	 dataMap.put("fuyiqq_ly",fuyiqq_ly);
        }else{//为否的时候才会有循环list
        	
        		fuyiqq="申请人曾经要求被申请人履行 "+xzfyInfo2.getIs_prof_detail()+"，申请人请求责令被申请人履行该项法定职责。";
	        	fuyiqq_ly="申请人曾于"+xzfyInfo2.getBuzheng_from()+"通过某方式要求被申请人履行法定职责而被申请人未依法履行，申请人特申请行政复议.";
	        	 dataMap.put("fuyiqq",fuyiqq);
	        	 dataMap.put("fuyiqq_ly",fuyiqq_ly);
        	
        }
        /*if(xzfyInfo.getIsmanage().equals("2")){//
        	dataMap.put("qingqiu","1");
        	
        	
        }else{//为否的时候才会有循环list
        	
        	
        	dataMap.put("qingqiu","2");
        	 List<Map<String, Object>> listfy  =new ArrayList<Map<String,Object>>();
             //require_fy_cang
             
             String fuyi=require_fy_cang;
             String fy[]=fuyi.split("&");
             for(int i=0;i<=fy.length-1;i++){
             	
             	//名称（文号）；知道时间：2013年3月18日（途径是偷偷知道的）；共1件
             	//名称$文号$2013-3-18$途径是偷偷知道的&
             	
              Map<String, Object> map=new HashMap<String, Object>();
              //撒旦法$2131$2013-1-18$撒旦法
              String bb[]=fy[i].split("\\$");
              String shujiawh="";
              shujiawh=bb[0]+"("+bb[1]+")";
              map.put("mcjiawh", shujiawh);
              map.put("nianyue", bb[2]);
              map.put("moufs", bb[3]);
              listfy.add(map);
             }
             dataMap.put("listfy",listfy);
           	
        	
        }*/
        
        
        
        List<Map<String, Object>> listsqr =new ArrayList<Map<String,Object>>();
        //判断公民或是法人？？？？
        //1公民，2法人
        String sqr="";
        if(xzfyInfo2.getApp_type().equals("1")){//公民
        	//刘全成$男$身份证号130627198912084613$送达地址是打发点$邮编072358$电话99999999&
        	//刘全成，男，身份证号123，送达地址123123，邮编123，电话123123；
        	sqr=xzfyInfo2.getAppdetail_cang();
        	String aa[]=sqr.split("&");
        	
        	for(int i=0;i<aa.length;i++){
        		
                Map<String, Object> map=new HashMap<String, Object>();
                
                String sqr22="";
            String  bb3[]= aa[i].split("\\$");
          //刘全成$男$身份证号130627198912084613$送达地址是打发点$邮编072358$电话99999999&
           
            sqr22="姓名:"+bb3[0]+"，性别:"+bb3[1]+"，身份证号:"+bb3[2]+"，送达地址:"+bb3[3]+"，邮编:"+bb3[4]+"，电话:"+bb3[5];
            
                map.put("sqr",sqr22);
                //刘全成$男$身份证号130627198912084613$送达地址盛大发售$邮编121212$电话12121212
                listsqr.add(map);
               }
               dataMap.put("listsqr",listsqr );
        	
        	
        }else{//faren 
        	
        	sqr=xzfyInfo2.getAgentDetail_cang();
        	String aa[]=sqr.split("&");
        	//刘全成$由董事会以股份制企业名义提出申请$执行合伙事务的合伙人$张代表$北京海淀$333222$44443333&
        	//刘全成$0$法定代表人$张代表$南京$333222$44443333&
        	//(1)刘全成（由董事会以股份制企业名义提出申请），执行合伙事务的合伙人是：张代表，送达地址北京海淀，邮编333222，电话44443333；  共1 人
        	//(1)刘全成（由董事会以股份制企业名义提出申请），执行合伙事务的合伙人是：张代表，送达地址北京海淀，邮编333222，电话44443333；(2)刘全成2（由董事会以股份制企业名义提出申请），法定代表人是：张代表，送达地址河北保定，邮编333222，电话44443333；  共2 人
        	//刘全成$由董事会以股份制企业名义提出申请$执行合伙事务的合伙人$张代表$北京海淀$333222$44443333&刘全成2$由董事会以股份制企业名义提出申请$法定代表人$张代表$河北保定$333222$44443333&刘全成$0$法定代表人$张代表$南京$333222$44443333&
        	for(int i=0;i<aa.length;i++){
        		
                Map<String, Object> map=new HashMap<String, Object>();
                //"刘全成（由董事会以股份制企业名义提出申请），主要负责人是：张三，送达地址北京海淀，邮编333333，电话3333333；")
                String faren="";
                String bb[]=aa[i].split("\\$");
                String gudong="";
                if(bb[1].equals("0")){
                	gudong="";
                }else{
                	gudong="("+bb[1]+")";
                }
                //faren=bb[0]+gudong+","+bb[2]+"是"+bb[3]+","+"送达地址:"+bb[4]+","+"邮编:"+bb[5];
                faren=  xzfyInfo2.getAgentDetail();   
                
                map.put("sqr",faren);
                
                listsqr.add(map);
               }
               dataMap.put("listsqr",listsqr );
       	
        }
        
        		
       //拆分从组。
        
        
       
         
        //dataMap.put("content","这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容");
    //    newList 
        
        
        /** 文件名称，唯一字符串 */
        Random r=new Random();
        SimpleDateFormat sdf1=new SimpleDateFormat("yyyyMMddHHmmssSSS");
        StringBuffer sb=new StringBuffer();
        sb.append(sdf1.format(new Date()));
        sb.append(r.nextInt(100));
        
        //文件路径
        filePath=ServletActionContext.getServletContext().getRealPath("/")+"upload";
        //ServletActionContext.getServletContext().getRealPath("/")+"upload
        //文件唯一名称
        fileOnlyName =sb+".doc";
        
        //文件名称
      //  fileName="申请书.doc";
      String   fileName2=sb+".pdf";
        /** 生成word */
      //该方法路径找不到
        WordUtil.createWord(this.getRequest(),dataMap,  filePath, fileOnlyName);
        //该方法直接弹窗下载
       // WordUtil.createWord(dataMap,this.getRequest(),ServletActionContext.getResponse());
        
       /* boolean f = Word2Pdf.word2PDF(filePath+File.separator+fileName, filePath +File.separator+ fileName2,"诚信创建");
        if(f){
        	System.out.println("chenggong");
        }else{
        	System.out.println("shibai");
        }*/
        
        System.out.println(filePath+File.separator+fileOnlyName+"   "+ filePath +File.separator+ fileName2);
        Word2PDF.wordToPDF(filePath+File.separator+fileOnlyName, filePath +File.separator+ fileName2);
        WordUtil.download(filePath +File.separator+ fileName2, ServletActionContext.getResponse());
        
       WordUtil.DeleteFolder(filePath+File.separator+fileOnlyName);
       WordUtil.DeleteFolder(filePath +File.separator+ fileName2);
        return "createWordSuccess";
    }
    
 private HttpServletRequest getRequest() {
	 HttpServletRequest request = ServletActionContext.getRequest();
	return request;
}


/**
  * @Desc：下载生成的word文档，入口，用来跳转至struts XML配置
  * @Author：张轮
  * @Date：2014-1-22下午07:36:29
  * @return
  */
    public String dowloadWord() {
        /** 先判断文件是否已生成  */
        try {
         //解决中文乱码
         filePath = URLDecoder.decode(filePath, "UTF-8");
         fileOnlyName = URLDecoder.decode(fileOnlyName, "UTF-8");
         fileName = URLDecoder.decode(fileName, "UTF-8");
         
         //如果文件不存在，则会跳入异常，然后可以进行异常处理
            new FileInputStream(filePath + File.separator +  fileOnlyName);
        } catch (Exception e) {
         e.printStackTrace();
         return "error";
        }
        return "dowloadWord";
    }
    
    /**
     * @Desc：下载生成的word文档
     * 该方法是struts.xml文件中的： <param name="inputName">wordFile</param> 中自动对应的get方法，该方法自动调用
     * @Author：张轮
     * @Date：2014-1-22下午07:36:29
     * @return 返回最终生成的word文档 文件流
     */
    public InputStream getWordFile(){
        try {
         //解决中文乱码
         fileName = URLDecoder.decode(fileName, "UTF-8");
         
            /** 返回最终生成的word文件流  */
            return new FileInputStream(filePath + File.separator + fileOnlyName);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


 public String getAppdetail_cang() {
		return appdetail_cang;
	}


	public void setAppdetail_cang(String appdetail_cang) {
		this.appdetail_cang = appdetail_cang;
	}


	public String getXzfyInfo2id() {
		return xzfyInfo2id;
	}


	public void setXzfyInfo2id(String xzfyInfo2id) {
		this.xzfyInfo2id = xzfyInfo2id;
	}


	public String getAgentDetail_cang() {
		return agentDetail_cang;
	}


	public void setAgentDetail_cang(String agentDetail_cang) {
		this.agentDetail_cang = agentDetail_cang;
	}


	public String getRequire_fy_cang() {
		return require_fy_cang;
	}


	public void setRequire_fy_cang(String require_fy_cang) {
		this.require_fy_cang = require_fy_cang;
	}


public XzfyInfo2 getXzfyInfo2() {
		return xzfyInfo2;
	}


	public void setXzfyInfo2(XzfyInfo2 xzfyInfo2) {
		this.xzfyInfo2 = xzfyInfo2;
	}


	public String getSljg() {
		return sljg;
	}


	public void setSljg(String sljg) {
		this.sljg = sljg;
	}


public String getFilePath() {
  return filePath;
 }


 public void setFilePath(String filePath) {
  this.filePath = filePath;
 }


 public String getFileName() {
  return fileName;
 }


 public void setFileName(String fileName) {
  this.fileName = fileName;
 }


 public String getFileOnlyName() {
  return fileOnlyName;
 }


 public void setFileOnlyName(String fileOnlyName) {
  this.fileOnlyName = fileOnlyName;
 }


public String getXzfyId() {
	return xzfyId;
}


public void setXzfyId(String xzfyId) {
	this.xzfyId = xzfyId;
}


@Override
public Class getPersistentClass() {
	// TODO Auto-generated method stub
	return null;
}

public XzfyInfo getXzfyInfo() {
	return xzfyInfo;
}


public void setXzfyInfo(XzfyInfo xzfyInfo) {
	this.xzfyInfo = xzfyInfo;
}


public XzfyService getXzfyService() {
	return xzfyService;
}


public void setXzfyService(XzfyService xzfyService) {
	this.xzfyService = xzfyService;
}


}