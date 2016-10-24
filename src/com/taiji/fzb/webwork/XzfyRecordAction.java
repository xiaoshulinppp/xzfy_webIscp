package com.taiji.fzb.webwork;

import com.dataSync.model.InfoDto;
import com.dataSync.service.Services;
import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionContext;
import com.taiji.core.service.ICoreService;
import com.taiji.core.util.ApplicationPath;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.Beishenqingren;
import com.taiji.fzb.domain.Xw;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyCompany;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.domain.XzfyInfoFile;
import com.taiji.fzb.domain.XzfyKeyword;
import com.taiji.fzb.domain.XzfyShenpi;
import com.taiji.fzb.service.RecordService;
import com.taiji.fzb.service.XzfyService;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;
import com.taiji.waiwangTB.domain.XzfyInfo2;
import com.util.FileUtil;

import localhost.zxfy.services.datesent.DatesentProxy;

import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import slime.util.IOStream.IOStream;

public class XzfyRecordAction extends ProtectedDetailAction
{
  private static final long serialVersionUID = 1L;
  private RecordService recordService;
  private String[] bzContent;
  private List<XzfyApp> xzfyApp;
  private String[] app;
  private String buzhengcontentType;
  private XzfyInfo xzfyInfo;
  private XzfyInfo2 xzfyInfo2;
  private String bzCon;
  private String xzfyId;
  private String xzfyId_w;
  private String appString;
  private User user;
  private String admit_name;
  private Integer pNum = Integer.valueOf(1);
  private List userList;
  private List fileList;
  private String textId;
  private XzfyShenpi xzfyShenpi;
  private List xzfyCheckList;
  private List xzfyCheckList_la;
  private List xzfyCheckList_ja;
  private String checkDocType = "0";
  private String isView = "0";
  private String userId;
  private List<Xw> xwList;
  private String localBm;
  private String localName;
  private List<Beishenqingren> zlList = new ArrayList();
  private List<Beishenqingren> bList = new ArrayList();
  private File upFile0;
  private String upFile0FileName;
  private File[] upFile02;
  private String other;
  private String[] upFile02FileName;
  private int checkSize;
  private int la_checkSize;
  private int ja_checkSize;
  private int xzfyStatus;
  public int pageSize = 15;
  public int pageNum = 1;
  public int totalPage = 1;
  public int totalCount = 0;
  private PaginationSupport pageList = new PaginationSupport();
  private List<XzfyInfo> shenpiList;
  private int totalCount1 = 1;
  private int totalCount2 = 1;
  private int totalCount3 = 1;
  private int totalCount4 = 1;
  private List totalList1;
  private List totalList2;
  private List totalList3;
  private List totalList4;
  private int pageNum1 = 1;
  private int pageNum2 = 1;
  private int pageNum3 = 1;
  private int pageNum4 = 1;
  private int totalPage1 = 1;
  private int totalPage2 = 1;
  private int totalPage3 = 1;
  private int totalPage4 = 1;
  public String listkeyword = "8";
  private List keywordCheckedList;
  private List keywordList;
  private XzfyCompany xzfyCom;
  public String year = "";
  public String keywordChecked = "";
  private String userIdString = "";
  private int jieandocsize = 0;
  private String jieandoctype = "";
  private String checkDate = "";
  private String shenpiDate = "";
  public String pizhunDate;
  private String upFile1FileName;
  private File upFile1 = new File("upFile");
  private String upFile2FileName;
  private File upFile2 = new File("upFile2");
  private String upFile3FileName;
  private File upFile3 = new File("upFile3");
  private String resultType = "0";
  private int isGaojijiansuo = 0;
  private String fileId;
  private String[] keyword = new String[0];
  private XzfyKeyword xzfyKeyword = new XzfyKeyword();
  private String shenpiren;
  private String shenpiyijian;
  private String typeId;
  private String lashenpiren;
  private String lashenpiyijian;
  private String jashenpiren;
  private String jashenpiyijian;
  public String buzhengId = "";
  public List docList;
  public List docList2;
  public List docList3;
  public List docList4;
  public List docList5;
  public List docList6;
  private String todate;
  public PaginationSupport list = new PaginationSupport();
  private List<XzfyInfo> xzfyList = new ArrayList();
  public String column = "1";
  String[] xzfyStr = new String[0];
  String[] personInfo = new String[0];
  private String fileId1;
  private String message;
  private String firstDay;
  private String ids;
  public String selectedPerson;
  private String suggestion;
  private XzfyService xzfyService = null;
  private String treeDiv = "";
  private String elementId;
private String name1;
 

public String getName1() {
	return name1;
}

public void setName1(String name1) {
	this.name1 = name1;
}

public String getXzfyId_w() {
	return xzfyId_w;
}

public void setXzfyId_w(String xzfyId_w) {
	this.xzfyId_w = xzfyId_w;
}

public Integer getpNum()
  {
    return this.pNum;
  }

  public void setpNum(Integer pNum) {
    this.pNum = pNum;
  }

  public List getFileList()
  {
    return this.fileList;
  }

  public void setFileList(List fileList) {
    this.fileList = fileList;
  }

  public String getOther()
  {
    return this.other;
  }

  public void setOther(String other) {
    this.other = other;
  }

  public File getUpFile0() {
    return this.upFile0;
  }

  public void setUpFile0(File upFile0) {
    this.upFile0 = upFile0;
  }

  public String getUpFile0FileName() {
    return this.upFile0FileName;
  }

  public void setUpFile0FileName(String upFile0FileName) {
    this.upFile0FileName = upFile0FileName;
  }

  public File[] getUpFile02() {
    return this.upFile02;
  }

  public void setUpFile02(File[] upFile02) {
    this.upFile02 = upFile02;
  }

  public String[] getUpFile02FileName() {
    return this.upFile02FileName;
  }

  public void setUpFile02FileName(String[] upFile02FileName) {
    this.upFile02FileName = upFile02FileName;
  }

  public String getUserId()
  {
    return this.userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

  public String getIsView() {
    return this.isView;
  }

  public void setIsView(String isView) {
    this.isView = isView;
  }

  public String getCheckDocType() {
    return this.checkDocType;
  }

  public void setCheckDocType(String checkDocType) {
    this.checkDocType = checkDocType;
  }

  public List getXzfyCheckList_ja() {
    return this.xzfyCheckList_ja;
  }

  public void setXzfyCheckList_ja(List xzfyCheckList_ja) {
    this.xzfyCheckList_ja = xzfyCheckList_ja;
  }

  public List getXzfyCheckList_la() {
    return this.xzfyCheckList_la;
  }

  public void setXzfyCheckList_la(List xzfyCheckList_la) {
    this.xzfyCheckList_la = xzfyCheckList_la;
  }

  public int getJa_checkSize()
  {
    return this.ja_checkSize;
  }

  public void setJa_checkSize(int ja_checkSize) {
    this.ja_checkSize = ja_checkSize;
  }

  public int getXzfyStatus()
  {
    return this.xzfyStatus;
  }

  public void setXzfyStatus(int xzfyStatus) {
    this.xzfyStatus = xzfyStatus;
  }

  public int getLa_checkSize() {
    return this.la_checkSize;
  }

  public void setLa_checkSize(int la_checkSize) {
    this.la_checkSize = la_checkSize;
  }

  public int getPageSize()
  {
    return this.pageSize;
  }

  public void setPageSize(int pageSize) {
    this.pageSize = pageSize;
  }

  public int getPageNum() {
    return this.pageNum;
  }

  public void setPageNum(int pageNum) {
    this.pageNum = pageNum;
  }

  public int getTotalPage() {
    return this.totalPage;
  }

  public void setTotalPage(int totalPage) {
    this.totalPage = totalPage;
  }

  public int getTotalCount() {
    return this.totalCount;
  }

  public void setTotalCount(int totalCount) {
    this.totalCount = totalCount;
  }

  public int getCheckSize() {
    return this.checkSize;
  }

  public void setCheckSize(int checkSize) {
    this.checkSize = checkSize;
  }

  public List getXzfyCheckList() {
    return this.xzfyCheckList;
  }

  public void setXzfyCheckList(List xzfyCheckList) {
    this.xzfyCheckList = xzfyCheckList;
  }

  public XzfyShenpi getXzfyShenpi() {
    return this.xzfyShenpi;
  }

  public void setXzfyShenpi(XzfyShenpi xzfyShenpi) {
    this.xzfyShenpi = xzfyShenpi;
  }

  public String getTextId() {
    return this.textId;
  }

  public void setTextId(String textId) {
    this.textId = textId;
  }

  public List getUserList() {
    return this.userList;
  }

  public void setUserList(List userList) {
    this.userList = userList;
  }

  public User getUser() {
    return this.user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  public String getAdmit_name() {
    return this.admit_name;
  }

  public void setAdmit_name(String admit_name) {
    this.admit_name = admit_name;
  }

  public String getXzfyId() {
    return this.xzfyId;
  }

  public void setXzfyId(String xzfyId) {
    this.xzfyId = xzfyId;
  }

  public XzfyInfo getXzfyInfo() {
    return this.xzfyInfo;
  }

  public void setXzfyInfo(XzfyInfo xzfyInfo) {
    this.xzfyInfo = xzfyInfo;
  }

  public RecordService getRecordService() {
    return this.recordService;
  }

  public void setRecordService(RecordService recordService) {
    this.recordService = recordService;
  }

  public String saveToDoc() {
    if ((this.xzfyInfo.getCheck_id() != null) && 
      (!(this.xzfyInfo.getCheck_id().equals("0")))) {
      this.user = this.recordService.getUserById(this.xzfyInfo.getCheck_id());
      this.xzfyInfo.setCheck_name(this.user.getName());
    }

    XzfyInfo newXzfyInfo = this.recordService.getXzfyById(this.xzfyInfo.getId());
    checkInfo check = new checkInfo();
    newXzfyInfo = check.check_xzfyInfo(newXzfyInfo, this.xzfyInfo);
    String op = "进行了保存并生成文书操作";
    this.recordService.save_log(this.xzfyInfo.getStatus(), op, this.xzfyInfo.getId(), 
      newXzfyInfo);
    this.recordService.update(newXzfyInfo);
    return "success";
  }

  public String addBzContent() {
    String hqlApp = "select a from XzfyInfo i, XzfyApp a where i=a.xzfyInfo and i.id='" + 
      this.xzfyId + "'";
    this.xzfyApp = this.recordService.find(hqlApp);

    this.xzfyInfo = this.recordService.getXzfyById(this.xzfyId);
    return "success";
  }

  public PaginationSupport getPageList()
  {
    return this.pageList;
  }

  public void setPageList(PaginationSupport pageList) {
    this.pageList = pageList;
  }

  public List<XzfyInfo> getShenpiList() {
    return this.shenpiList;
  }

  public void setShenpiList(List<XzfyInfo> shenpiList) {
    this.shenpiList = shenpiList;
  }

  public String getCheckListById() {
    try {
      this.xzfyInfo = new XzfyInfo();
      this.user = new User();
      this.user = 
        ((User)ActionContext.getContext().getSession().get(
        "_USER_LOGIN_"));
      this.admit_name = this.user.getName();
      this.pageList = this.recordService.getShenpiListById(
        super.getPageNum(), this.pageSize, this.user.getId().toString());
      this.shenpiList = this.pageList.getItems();
      this.totalPage = this.pageList.getTotalPage();
      this.totalCount = this.pageList.getTotalCount();
      return "success";
    }
    catch (Exception e) {
      e.printStackTrace(); }
    return "error";
  }

  public String getCheckList()
  {
    this.user = new User();
    this.user = 
      ((User)ActionContext.getContext().getSession().get(
      "_USER_LOGIN_"));
    this.admit_name = this.user.getName();
    this.pageList = this.recordService.getCheckList(super.getPageNum(), 
      this.pageSize, this.xzfyInfo, this.user.getId().toString());
    this.shenpiList = this.pageList.getItems();
    this.totalPage = this.pageList.getTotalPage();
    this.totalCount = this.pageList.getTotalCount();
    return "success";
  }

  public int getTotalPage1()
  {
    return this.totalPage1;
  }

  public void setTotalPage1(int totalPage1) {
    this.totalPage1 = totalPage1;
  }

  public int getTotalPage2() {
    return this.totalPage2;
  }

  public void setTotalPage2(int totalPage2) {
    this.totalPage2 = totalPage2;
  }

  public int getTotalPage3() {
    return this.totalPage3;
  }

  public void setTotalPage3(int totalPage3) {
    this.totalPage3 = totalPage3;
  }

  public int getTotalPage4() {
    return this.totalPage4;
  }

  public void setTotalPage4(int totalPage4) {
    this.totalPage4 = totalPage4;
  }

  public int getPageNum1()
  {
    return this.pageNum1;
  }

  public void setPageNum1(int pageNum1) {
    this.pageNum1 = pageNum1;
  }

  public int getPageNum2() {
    return this.pageNum2;
  }

  public void setPageNum2(int pageNum2) {
    this.pageNum2 = pageNum2;
  }

  public int getPageNum3() {
    return this.pageNum3;
  }

  public void setPageNum3(int pageNum3) {
    this.pageNum3 = pageNum3;
  }

  public int getPageNum4() {
    return this.pageNum4;
  }

  public void setPageNum4(int pageNum4) {
    this.pageNum4 = pageNum4;
  }

  public String totalPage_index1() {
    this.user = new User();
    this.user = 
      ((User)ActionContext.getContext().getSession().get(
      "_USER_LOGIN_"));
    if (this.xzfyInfo == null)
      this.xzfyInfo = new XzfyInfo();

    PaginationSupport pageList1 = this.recordService.getTotalList(this.pageNum1, 5, 
      this.xzfyInfo, this.user);
    this.totalList1 = pageList1.getItems();
    this.totalCount1 = pageList1.getTotalCount();
    this.totalPage1 = pageList1.getTotalPage();
    return "success";
  }

  public String returnTotalPage() {
    return "success";
  }

  public String showLogList() {
    this.totalList1 = this.recordService.getLogList(this.xzfyId);
    
    this.totalCount1 = this.totalList1.size();
    xzfyInfo=this.recordService.getXzfyById(this.xzfyId);
    xzfyInfo2=this.recordService.getXzfyById_w((this.recordService.getXzfyById(this.xzfyId)).getXzfyInfo2id());
    return "success";
  }
  
  public String showLogList2() {
	    this.totalList1 = this.recordService.getLogList(this.xzfyId);
	    this.totalCount1 = this.totalList1.size();
	    return "success";
	  }

  public String showTotalPage()
  {
    this.user = new User();
    this.user = 
      ((User)ActionContext.getContext().getSession().get(
      "_USER_LOGIN_"));
    if (this.xzfyInfo == null)
      this.xzfyInfo = new XzfyInfo();

    PaginationSupport pageList1 = this.recordService.getTotalList(1, 5, 
      this.xzfyInfo, this.user);
    this.totalList1 = pageList1.getItems();
    this.totalCount1 = pageList1.getTotalCount();
    this.totalPage1 = pageList1.getTotalPage();

    PaginationSupport pageList2 = this.recordService.getUserShenChaList(1, 5, 
      this.xzfyInfo, this.user.getId().toString());
    this.totalList2 = pageList2.getItems();
    this.totalCount2 = pageList2.getTotalCount();

    PaginationSupport pageList3 = this.recordService.getUserBanLiList(1, 5, 
      this.xzfyInfo, this.user.getId().toString());
    this.totalList3 = pageList3.getItems();
    this.totalCount3 = pageList3.getTotalCount();

    PaginationSupport pageList4 = this.recordService.getCheckList(1, 5, 
      this.xzfyInfo, this.user.getId().toString());
    this.totalList4 = pageList4.getItems();
    this.totalCount4 = pageList4.getTotalCount();

    return "success";
  }

  public String getListkeyword()
  {
    return this.listkeyword;
  }

  public void setListkeyword(String listkeyword) {
    this.listkeyword = listkeyword;
  }

  public int getTotalCount1() {
    return this.totalCount1;
  }

  public void setTotalCount1(int totalCount1) {
    this.totalCount1 = totalCount1;
  }

  public int getTotalCount2() {
    return this.totalCount2;
  }

  public void setTotalCount2(int totalCount2) {
    this.totalCount2 = totalCount2;
  }

  public int getTotalCount3() {
    return this.totalCount3;
  }

  public void setTotalCount3(int totalCount3) {
    this.totalCount3 = totalCount3;
  }

  public int getTotalCount4() {
    return this.totalCount4;
  }

  public void setTotalCount4(int totalCount4) {
    this.totalCount4 = totalCount4;
  }

  public List getTotalList1() {
    return this.totalList1;
  }

  public void setTotalList1(List totalList1) {
    this.totalList1 = totalList1;
  }

  public List getTotalList2() {
    return this.totalList2;
  }

  public void setTotalList2(List totalList2) {
    this.totalList2 = totalList2;
  }

  public List getTotalList3() {
    return this.totalList3;
  }

  public void setTotalList3(List totalList3) {
    this.totalList3 = totalList3;
  }

  public List getTotalList4() {
    return this.totalList4;
  }

  public void setTotalList4(List totalList4) {
    this.totalList4 = totalList4;
  }

  public String showTotalList() {
    this.user = new User();
    this.user = 
      ((User)ActionContext.getContext().getSession().get(
      "_USER_LOGIN_"));
    this.admit_name = this.user.getName();
    this.pageList = this.recordService.getTotalList(super.getPageNum(), 
      this.pageSize, this.xzfyInfo, this.user);
    this.shenpiList = this.pageList.getItems();
    this.totalPage = this.pageList.getTotalPage();
    this.totalCount = this.pageList.getTotalCount();
    if (this.xzfyInfo == null)
      this.xzfyInfo = new XzfyInfo();
    return "success";
  }

  public String showUserShenChaList() {
    this.user = new User();
    this.user = 
      ((User)ActionContext.getContext().getSession().get(
      "_USER_LOGIN_"));
    this.admit_name = this.user.getName();
    this.pageList = this.recordService.getUserShenChaList(
      super.getPageNum(), this.pageSize, this.xzfyInfo, 
      this.user.getId().toString());
    this.shenpiList = this.pageList.getItems();
    this.totalPage = this.pageList.getTotalPage();
    this.totalCount = this.pageList.getTotalCount();
    if (this.xzfyInfo == null)
      this.xzfyInfo = new XzfyInfo();
    return "success";
  }

  private XzfyInfo setInfo(XzfyInfo x) {
    int i;
    int j;
    String[] arrayOfString1;
    String[] info;
    XzfyApp xzfyApp;
    this.xzfyService.deleteAppById(x.getId());
    String appShow = "";

    if (x.getApp_type().equals("1")) {
      String[] apps = x.getAppdetail().split("；");
      j = (arrayOfString1 = apps).length; for (i = 0; i < j; ++i) { String app = arrayOfString1[i];
        info = app.split("，");
        xzfyApp = new XzfyApp();
        x = this.xzfyService.getXzfyById(x.getId());
        this.coreService.evict(x);
        for (i = 0; i < info.length; ++i)
          if (i == 0) {
            if (info[i].equals("")) break; if (info[i] == null)
              break;

            xzfyApp.setApp_name(info[i]);
            if (appShow.equals(""))
              appShow = info[i];
            else
              appShow = appShow + "," + info[i];
          }
          else if (i == 1) {
            xzfyApp.setSexy(info[i]);
          } else {
            xzfyApp = splitInfo(info[i], xzfyApp);
          }

        xzfyApp.setProxytype(x.getApp_type());
        xzfyApp.setXzfyInfo(x);
        this.coreService.saveOrUpdate(xzfyApp);
      }
    }

    if (x.getApp_type().equals("2")) {
      String[] agents = x.getAgentDetail().split("；");
      j = (arrayOfString1 = agents).length; for (i = 0; i < j; ++i) { String agent = arrayOfString1[i];
        info = agent.split("，");
        xzfyApp = new XzfyApp();
        x = this.xzfyService.getXzfyById(x.getId());
        for (i = 0; i < info.length; ++i)
          if (i == 0) {
            if ((info[i].equals("")) || (info[i] == null)) break;
            if (info[i].equals(", "))
              break;

            if (info[i].indexOf("（") != -1) {
              String[] a = info[i].split("（");
              xzfyApp.setApp_name(a[0]);
              xzfyApp.setOtherType(a[1].replaceAll("）", ""));
              if (appShow.equals(""))
                appShow = a[0];
              else
                appShow = appShow + "," + a[0];
            }
            else {
              xzfyApp.setApp_name(info[i]);
              if (appShow.equals(""))
                appShow = info[i];
              else
                appShow = appShow + "," + info[i];
            }
          }
          else {
            xzfyApp = splitInfo(info[i], xzfyApp);
          }

        xzfyApp.setProxytype(x.getApp_type());
        xzfyApp.setXzfyInfo(x);
        this.xzfyService.saveOrUpdate(xzfyApp);
      }
    }

    x.setApp_show(appShow);
    return x;
  }

  public XzfyApp splitInfo(String r, XzfyApp xzfyApp)
  {
    if (r.startsWith("身")) {
      r = r.substring(4);
      xzfyApp.setApp_id(r);
    } else if (r.startsWith("送")) {
      r = r.substring(4);
      xzfyApp.setMail_address(r);
    } else if (r.startsWith("邮")) {
      r = r.substring(2);
      xzfyApp.setPostcode(r);
    } else if (r.startsWith("电")) {
      r = r.substring(2);
      xzfyApp.setTelephone(r);
    } else {
      String[] a = r.split("：");
      xzfyApp.setDeputyType(a[0].replace("是", ""));
      xzfyApp.setDeputyName(a[1]);
    }
    return xzfyApp;
  }

  public List getKeywordList() {
    return this.keywordList;
  }

  public void setKeywordList(List keywordList) {
    this.keywordList = keywordList;
  }

  public List getKeywordCheckedList() {
    return this.keywordCheckedList;
  }

  public void setKeywordCheckedList(List keywordCheckedList) {
    this.keywordCheckedList = keywordCheckedList;
  }

  public XzfyCompany getXzfyCom()
  {
    return this.xzfyCom;
  }

  public void setXzfyCom(XzfyCompany xzfyCom) {
    this.xzfyCom = xzfyCom;
  }

  public String getYear()
  {
    Date date = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy");
    this.year = dateFormat.format(date);
    return this.year;
  }

  public void setYear(String year) {
    this.year = year;
  }

  public String getKeywordChecked()
  {
    return this.keywordChecked;
  }

  public void setKeywordChecked(String keywordChecked) {
    this.keywordChecked = keywordChecked;
  }

  public String editCailiao() {
    this.xzfyInfo = this.recordService.getXzfyById(this.xzfyId);
    String hql = "from XzfyInfoFile file where file.xzfyInfo.id='" + 
      this.xzfyInfo.getId() + "'";
    this.fileList = this.recordService.find(hql);
    return "success";
  }

  public String editlian()
  {
    int i;
    Beishenqingren b;
    this.xzfyInfo = this.recordService.getXzfyById(this.xzfyId);

    String docjieanSql = "select d_type from (select * from eweboffice_t_document where caseid='" + 
      this.xzfyId + 
      "' and (d_type='buyushouligaozhishushu' or d_type='buyushouligaozhishu' or d_type='xingzhengfuyijuedingshu' or d_type='xingzhengfuyitiaojie' or d_type='xingzhengfuyizhongzhi') order by d_id desc ) where rownum=1";
    List listdocjiean = this.recordService.findListBySQL(docjieanSql);
    this.jieandocsize = listdocjiean.size();
    if (this.jieandocsize != 0)
      this.jieandoctype = ((String)listdocjiean.get(0));

    this.jashenpiyijian = "0";
    String sql = "select * from (select * from eweboffice_t_document t where t.caseid='" + 
      this.xzfyId + 
      "' and (t.d_type='xingzhengfuyizelinglvxing' or t.d_type='xingzhengfuyizhongzhi' or t.d_type='xingzhengfuyitiaojie' or t.d_type='xingzhengfuyijuedingshu') and d_iszuizhong='1' order by d_id desc ) where rownum=1";
    List list1 = this.recordService.findListBySQL(sql);
    if (list1.size() > 0) {
      this.jashenpiyijian = "1";
    }

    if ((this.xzfyInfo.getCheck_status().equals("0")) && 
      (this.xzfyInfo.getStatus().equals("11"))) {
      this.appString = "";
      if (this.xzfyInfo.getFinish_date() == null) {
        String hqlcheck = "from XzfyShenpi shenpi where shenpi.xzfyInfo.id='" + 
          this.xzfyInfo.getId() + 
          "' and shenpi.check_type='11' order by shenpi.id desc";
        List list = this.recordService.find(hqlcheck);
        if (list.size() > 0) {
          XzfyShenpi shenpi = (XzfyShenpi)list.get(0);
          this.appString = shenpi.getCheck_date();
        }
      } else {
        this.appString = this.xzfyInfo.getFinish_date();
      }
    }

    String hql = "from XzfyInfoFile file where file.xzfyInfo.id='" + 
      this.xzfyInfo.getId() + "'";
    this.fileList = this.recordService.find(hql);
    String hql1 = "from XzfyKeyword xzfyKeyword where xzfyKeyword.xzfy_id ='" + 
      this.xzfyInfo.getId() + "'";
    this.keywordCheckedList = this.recordService.find(hql1);
    if (this.keywordCheckedList.size() > 0) {
      XzfyKeyword xzfyKey = (XzfyKeyword)this.keywordCheckedList.get(0);
      this.keywordChecked = xzfyKey.getKeyword();
    }
    Org org = this.recordService.getOrg();
    this.xzfyCom = this.recordService.getXzfyComById(org.getLocbm(), 
      org.getName());
    Date date = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy");
    this.year = dateFormat.format(date);
    String HQL2 = "";
    HQL2 = HQL2 + " from XzfyKeyword xzfyKeyword ";
    HQL2 = HQL2 + " where xzfyKeyword.status = '0' and xzfyKeyword.locbm = '" + 
      org.getLocbm() + "' ";
    this.keywordList = this.recordService.find(HQL2);

    if (this.xzfyInfo.getIsBuzheng() == null)
      this.xzfyInfo.setIsBuzheng("0");
    this.user = new User();
    this.user = 
      ((User)ActionContext.getContext().getSession().get(
      "_USER_LOGIN_"));
    this.admit_name = this.user.getName();
    this.userIdString = this.user.getId().toString();
    this.localBm = org.getLocbm();
    this.localName = org.getName();

    if (this.localBm.equals("0000"))
    {
      for (int j = 0; j < 5; ++j) {
        Beishenqingren bb = new Beishenqingren();
        if (j == 0) {
          bb.setName("区县政府");
          bb.setValue("5");
        } else if (j == 1) {
          bb.setName("省级政府部门");
          bb.setValue("7");
        } else if (j == 2) {
          bb.setName("省级行政机关");
          bb.setValue("6");
        } else if (j == 3) {
          bb.setName("其他");
          bb.setValue("8");
        }else if (j == 4) {
        	bb.setName("国务院部门");
        	bb.setValue("11");
          }
        
        
       
        this.zlList.add(bb);
      }

      this.bList = this.xzfyService.getBsqrName("5", this.localBm, this.bList);
      this.bList = this.xzfyService.getBsqrName("7", this.localBm, this.bList);
      this.bList = this.xzfyService.getBsqrName("6", this.localBm, this.bList);
    }

    int lb = Integer.parseInt(this.localBm.substring(0, 2));
    if ((this.localBm.length() == 4) && ("00".equals(this.localBm.substring(2, 4))) && 
      (lb < 19) && (lb != 0))
    {
      for (i = 0; i < 5; ++i) {
        b = new Beishenqingren();
        if (i == 0) {
          b.setName("区县政府部门");
          b.setValue("4");
        } else if (i == 1) {
          b.setName("区县政府部门派出机构");
          b.setValue("9");
        } else if (i == 2) {
          b.setName("县级政府");
          b.setValue("3");
        } else if (i == 3) {
          b.setName("其他");
          b.setValue("8");
        }
        else if (i == 4) {
        	b.setName("国务院部门");
        	b.setValue("11");
          }
        this.zlList.add(b);
      }

      this.bList = this.xzfyService.getBsqrName("4", this.localBm, this.bList);
      this.bList = this.xzfyService.getBsqrName("3", this.localBm, this.bList);
      this.bList = this.xzfyService.getBsqrName("9", this.localBm, this.bList);
    }

    if ((this.localBm.length() == 4) && (!("00".equals(this.localBm.substring(2, 4)))))
    {
      for (i = 0; i < 3; ++i) {
        b = new Beishenqingren();
        if (i == 0) {
          b.setName("区县政府部门派出机构");
          b.setValue("9");
        } else if (i == 1) {
          b.setName("其他");
          b.setValue("8");
        }
        else if (i == 2) {
        	b.setName("国务院部门");
        	b.setValue("11");
          }
        this.zlList.add(b);
      }

      this.bList = this.xzfyService.getBsqrName("9", this.localBm, this.bList);
    }

    if ((this.localBm.length() == 4) && ("00".equals(this.localBm.substring(2, 4))) && 
      (lb > 18))
    {
      for (i = 0; i < 3; ++i) {
        b = new Beishenqingren();
        if (i == 0) {
          b.setName("区县政府部门");
          b.setValue("4");
        } else if (i == 1) {
          b.setName("其他");
          b.setValue("8");
        }
        else if (i == 2) {
        	b.setName("国务院部门");
        	b.setValue("11");
          }
        
        
        
        
        
        this.zlList.add(b);
      }

      this.bList = this.xzfyService.getBsqrName("4", this.localBm, this.bList);
    }

    String hqlApp = "select a from XzfyInfo i, XzfyApp a where i=a.xzfyInfo and i.id='" + 
      this.xzfyId + "'";
    
    
    
    this.xzfyApp = this.recordService.find(hqlApp);
    if (this.isView.equals("1"))
      return "success";

    return "chakan";
  }

  public String viewlian()
  {
    this.xzfyInfo = this.recordService.getXzfyById(this.xzfyId);
    if (this.xzfyInfo.getIsBuzheng() == null)
      this.xzfyInfo.setIsBuzheng("0");
    this.user = new User();
    this.user = 
      ((User)ActionContext.getContext().getSession().get(
      "_USER_LOGIN_"));
    this.admit_name = this.user.getName();

    this.userList = this.recordService.getUserListById(this.user.getOrg().getId().toString());

    this.xzfyCheckList = this.recordService.getCheckListByXzfyID(this.xzfyId, "2");
    this.xzfyCheckList_la = this.recordService.getCheckListByXzfyID(this.xzfyId, "3");
    this.xzfyCheckList_ja = this.recordService.getCheckListByXzfyID(this.xzfyId, "11");
    this.checkSize = 0;
    this.checkSize = this.xzfyCheckList.size();
    this.la_checkSize = 0;
    this.la_checkSize = this.xzfyCheckList_la.size();
    this.ja_checkSize = 0;
    this.ja_checkSize = this.xzfyCheckList_ja.size();
    if (this.la_checkSize > 0)
      this.xzfyShenpi = 
        ((XzfyShenpi)this.xzfyCheckList_la.get(
        this.la_checkSize - 1));
    if ((this.xzfyInfo.getStatus() != null) && (!(this.xzfyInfo.getStatus().equals(""))))
      this.xzfyStatus = Integer.parseInt(this.xzfyInfo.getStatus());
    return "success";
  }

  public String showUserBanLiList()
  {
    this.user = new User();
    this.user = 
      ((User)ActionContext.getContext().getSession().get(
      "_USER_LOGIN_"));
    this.admit_name = this.user.getName();
    this.pageList = this.recordService.getUserBanLiList(super.getPageNum(), 
      this.pageSize, this.xzfyInfo, this.user.getId().toString());
    this.shenpiList = this.pageList.getItems();
    this.totalPage = this.pageList.getTotalPage();
    this.totalCount = this.pageList.getTotalCount();
    if (this.xzfyInfo == null)
      this.xzfyInfo = new XzfyInfo();
    return "success";
  }

  public String handleOpreator() {
    this.user = new User();
    this.user = 
      ((User)ActionContext.getContext().getSession().get(
      "_USER_LOGIN_"));
    this.userList = this.recordService.getUserListById(this.user.getOrg().getId().toString());

    return "success";
  }

  public String handleOpreatorXinShou()
  {
    this.user = new User();
    this.user = 
      ((User)ActionContext.getContext().getSession().get(
      "_USER_LOGIN_"));
    this.userList = this.recordService.getUserListById(this.user.getOrg().getId().toString(), 
      "");
    return "success";
  }

  public String setHandleUser()
    throws UnsupportedEncodingException
  {
    String[] idStr;
    String op;
    User user1;
    User user2;
    this.xzfyInfo = this.recordService.getXzfyById(this.xzfyId);
    if (this.typeId.equals("1"))
    {
      idStr = this.userId.replaceAll(" ", "").split(",");
      if (idStr.length == 1) {
        this.user = this.recordService.getUserById(idStr[0]);
        this.xzfyInfo.setUser1_id(this.user.getId().toString());
        this.xzfyInfo.setUser1_name(this.user.getName());
        this.other = new String(this.other.getBytes("iso-8859-1"), "utf-8");
        this.xzfyInfo.setUser4_name(this.other);
        this.xzfyInfo.setUser4_id("");
        op = "指定立案审查人为：" + this.user.getName() + " " + this.other;
        this.recordService.save_log(this.xzfyInfo.getStatus(), op, 
          this.xzfyInfo.getId(), this.recordService.getXzfyById(this.xzfyId));
      } else {
        user1 = new User();
        user2 = new User();
        user1 = this.recordService.getUserById(idStr[0]);
        user2 = this.recordService.getUserById(idStr[1]);
        this.xzfyInfo.setUser1_id(user1.getId().toString());
        this.xzfyInfo.setUser1_name(user1.getName());
        this.xzfyInfo.setUser4_id(user2.getId().toString());
        this.xzfyInfo.setUser4_name(user2.getName());
        op = "指定立案审查人为：" + user1.getName() + " " + 
          user2.getName();
        this.recordService.save_log(this.xzfyInfo.getStatus(), op, 
          this.xzfyInfo.getId(), this.recordService.getXzfyById(this.xzfyId));
      }
      this.recordService.update(this.xzfyInfo);
    } else if (this.typeId.equals("2"))
    {
      idStr = this.userId.replaceAll(" ", "").split(",");
      if (idStr.length == 1) {
        this.user = this.recordService.getUserById(idStr[0]);
        this.xzfyInfo.setUser2_id(this.user.getId().toString());
        this.xzfyInfo.setUser2_name(this.user.getName());
        this.other = new String(this.other.getBytes("iso-8859-1"), "utf-8");
        this.xzfyInfo.setUser3_name(this.other);
        this.xzfyInfo.setUser3_id("");

        String loglog = "";
        loglog = "指定承办人为：" + this.user.getName() + " " + this.other;
        this.recordService.save_log(this.xzfyInfo.getStatus(), loglog, 
          this.xzfyInfo.getId(), this.recordService.getXzfyById(this.xzfyId));
      } else {
        user1 = new User();
        user2 = new User();
        user1 = this.recordService.getUserById(idStr[0]);
        user2 = this.recordService.getUserById(idStr[1]);
        this.xzfyInfo.setUser2_id(user1.getId().toString());
        this.xzfyInfo.setUser2_name(user1.getName());
        this.xzfyInfo.setUser3_id(user2.getId().toString());
        this.xzfyInfo.setUser3_name(user2.getName());
        op = "指定承办人为：" + user1.getName() + " " + user2.getName();
        this.recordService.save_log(this.xzfyInfo.getStatus(), op, 
          this.xzfyInfo.getId(), this.recordService.getXzfyById(this.xzfyId));
      }
      this.recordService.update(this.xzfyInfo);
    } else if (this.typeId.equals("3")) {
      this.user = this.recordService.getUserById(this.userId);
      this.xzfyInfo.setCheck_id(this.user.getId().toString());
      this.xzfyInfo.setCheck_name(this.user.getName());
      String opop = "指定审批人为：" + this.user.getName();
      this.recordService.save_log(this.xzfyInfo.getStatus(), opop, this.xzfyInfo.getId(), 
        this.recordService.getXzfyById(this.xzfyId));
      this.recordService.update(this.xzfyInfo);
    }
    return "success";
  }

  public String getCheckDate()
  {
    return this.checkDate;
  }

  public void setCheckDate(String checkDate) {
    this.checkDate = checkDate;
  }

  public String shenpiSubmit() {
    this.user = new User();
    this.user = 
      ((User)ActionContext.getContext().getSession().get(
      "_USER_LOGIN_"));
    User user1 = new User();

    String check_id = this.xzfyInfo.getCheck_id();

    this.xzfyInfo = this.recordService.getXzfyById(this.xzfyId);
    if (!(check_id.equals("0"))) {
      user1 = this.recordService.getUserById(check_id);
      this.xzfyInfo.setCheck_id(user1.getId().toString());
      this.xzfyInfo.setCheck_name(user1.getName());
    } else {
      this.xzfyInfo.setCheck_id("0");
      this.xzfyInfo.setCheck_status("0");
    }
    String op = "执行审批操作";
    this.recordService.save_log(this.xzfyInfo.getStatus(), op, this.xzfyInfo.getId(), 
      this.xzfyInfo);
    this.recordService.update(this.xzfyInfo);
    
  //加入案件识别及状态推送代码(新)
    
    
    
    Date date = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String currentTime = dateFormat.format(date);
    this.xzfyShenpi.setCheck_date(this.checkDate);
    this.xzfyShenpi.setCheck_result("1");
    this.xzfyShenpi.setSqspren_id("0");
    this.xzfyShenpi.setXzfyInfo(this.xzfyInfo);
    this.xzfyShenpi.setCheck_type(this.xzfyInfo.getStatus());
    this.xzfyShenpi.setCheck_id(this.user.getId().toString());
    this.xzfyShenpi.setCheck_name(this.user.getName());
    this.recordService.save(this.xzfyShenpi);
    return "success";
  }

  public String returnSubmit() {
    this.user = new User();
    this.user = 
      ((User)ActionContext.getContext().getSession().get(
      "_USER_LOGIN_"));

    this.xzfyInfo = this.recordService.getXzfyById(this.xzfyId);

    this.xzfyInfo.setCheck_id("0");
    this.xzfyInfo.setCheck_status("0");
    if (this.xzfyInfo.getStatus().equals("2"))
    {
      this.xzfyInfo.setStatus("1");
      if ((this.xzfyInfo.getIsBuzhengshenpi() != null) && (this.xzfyInfo.getIsBuzhengshenpi().equals("1")))
      {
        this.xzfyInfo.setIsBuzhengshenpi("0");
      }
    }
    if (this.xzfyInfo.getStatus().equals("3"))
    {
      this.xzfyInfo.setStatus("1");
      this.xzfyInfo.setStadardResult("0");
    }
    if (this.xzfyInfo.getStatus().equals("5"))
    {
      this.xzfyInfo.setStatus("4");
    }
    if (this.xzfyInfo.getStatus().equals("7"))
    {
      this.xzfyInfo.setStatus("4");
    }
    if (this.xzfyInfo.getStatus().equals("9"))
    {
      this.xzfyInfo.setStatus("8");
    }
    if (this.xzfyInfo.getStatus().equals("11"))
    {
      if (this.xzfyInfo.getStadardResult().equals("1"))
      {
        this.xzfyInfo.setStatus("4");
      }
      else {
        this.xzfyInfo.setStatus("1");
        this.xzfyInfo.setStadardResult("0");
      }
    }
    String op = "执行退回操作";
    
  
    
    this.recordService.save_log(this.xzfyInfo.getStatus(), op, this.xzfyInfo.getId(), 
      this.xzfyInfo);
    this.recordService.update(this.xzfyInfo);
    Date date = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String currentTime = dateFormat.format(date);
    this.xzfyShenpi.setCheck_date(currentTime);
    this.xzfyShenpi.setCheck_result("2");
    this.xzfyShenpi.setSqspren_id("0");
    this.xzfyShenpi.setXzfyInfo(this.xzfyInfo);
    this.xzfyShenpi.setCheck_type(this.xzfyInfo.getStatus());
    this.xzfyShenpi.setCheck_id(this.user.getId().toString());
    this.xzfyShenpi.setCheck_name(this.user.getName());
    this.recordService.save(this.xzfyShenpi);
    return "success";
  }

  public String lianTiqu() {
    this.xzfyInfo = this.recordService.getXzfyById(this.xzfyId);
    if (this.xzfyInfo.getIsBuzheng() == null)
      this.xzfyInfo.setIsBuzheng("0");
    this.user = new User();
    this.user = 
      ((User)ActionContext.getContext().getSession().get(
      "_USER_LOGIN_"));
    this.admit_name = this.user.getName();
    if ((this.xzfyInfo.getUser1_id() == null) || (this.xzfyInfo.getUser1_id().equals(""))) {
      this.xzfyInfo.setUser1_name(this.user.getName());
      this.xzfyInfo.setUser1_id(this.user.getId().toString());
      this.recordService.save(this.xzfyInfo);
    } else if ((this.xzfyInfo.getUser1_name() == null) || 
      (this.xzfyInfo.getUser1_name().equals(""))) {
      this.xzfyInfo.setUser1_name(this.user.getName());
      this.xzfyInfo.setUser1_id(this.user.getId().toString());
      this.recordService.save(this.xzfyInfo);
    }
    this.admit_name = this.user.getName();

    String endDate = this.recordService.getOutOfDate(this.xzfyId);
    String sql = "select floor(to_date('" + endDate + 
      "','yyyy-mm-dd')-sysdate+1) from dual";
    if ((this.xzfyInfo.getBzBuqiriqi() != null) && 
      (!(this.xzfyInfo.getBzBuqiriqi().equals(""))))
      sql = "select floor(to_date('" + 
        endDate + 
        "','yyyy-mm-dd')-sysdate+1) +floor(to_date(bzbuqiriqi,'yyyy-mm-dd')-to_date(bztongzhiriqi,'yyyy-mm-dd')+1) from xzfy_info t " + 
        "where t.id='" + this.xzfyId + "' and bzbuqiriqi is not null";
    this.xzfyCheckList_la = this.recordService.findListBySQL(sql);

    this.checkSize = 0;

    this.la_checkSize = 0;

    this.ja_checkSize = 0;

    if ((this.xzfyInfo.getStatus() != null) && (!(this.xzfyInfo.getStatus().equals(""))))
      this.xzfyStatus = Integer.parseInt(this.xzfyInfo.getStatus());
    return "success";
  }

  public String buzhengSubmit() {
    if ((this.xzfyInfo.getCheck_id() != null) && 
      (!(this.xzfyInfo.getCheck_id().equals("0"))))
      this.user = this.recordService.getUserById(this.xzfyInfo.getCheck_id());

    this.xzfyInfo.setStatus("2");
    this.xzfyInfo.setIsBuzhengshenpi("1");
    String hql = "update XzfyShenpi sp set sp.sqspren_id=1 where sp.xzfyInfo.id='" + 
      this.xzfyId + "' and sp.check_type='2'";
    this.recordService.updateAll(hql);
    XzfyInfo newXzfyInfo = this.recordService.getXzfyById(this.xzfyId);

    newXzfyInfo.setJdBzContent(this.xzfyInfo.getJdBzContent());
    newXzfyInfo.setStatus("2");
    newXzfyInfo.setIsBuzheng("1");
    newXzfyInfo.setIsBuzhengshenpi("1");

    newXzfyInfo.setBzAdvice(this.xzfyInfo.getBzAdvice());
    if (this.xzfyInfo.getContent_abstract() != null)
      newXzfyInfo.setContent_abstract(this.xzfyInfo.getContent_abstract());
    newXzfyInfo.setCheck_id(this.user.getId().toString());
    newXzfyInfo.setCheck_status("1");
    newXzfyInfo.setCheck_name(this.user.getName());
    Date date = new Date();

    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String currentTime = dateFormat.format(date);
    newXzfyInfo.setBuzhengspdate(this.shenpiDate);
    String op = "提交审批";
    this.recordService.save_log("2", op, this.xzfyId, newXzfyInfo);
    
  
    
    this.recordService.update(newXzfyInfo);
    return "success";
  }

  public String buzhengSave()
  {
    XzfyInfo newXzfyInfo = this.recordService.getXzfyById(this.xzfyId);
    if (this.xzfyInfo.getBzTongzhiriqi() != null)
      newXzfyInfo.setBzTongzhiriqi(this.xzfyInfo.getBzTongzhiriqi());
    if (this.xzfyInfo.getBzBuqiriqi() != null)
      newXzfyInfo.setBzBuqiriqi(this.xzfyInfo.getBzBuqiriqi());
    if (this.xzfyInfo.getBzAdvice() != null)
      newXzfyInfo.setBzAdvice(this.xzfyInfo.getBzAdvice());
    if (this.xzfyInfo.getJdBzContent() != null)
      newXzfyInfo.setJdBzContent(this.xzfyInfo.getJdBzContent());
    if (this.xzfyInfo.getContent_abstract() != null)
      newXzfyInfo.setContent_abstract(this.xzfyInfo.getContent_abstract());
    if (this.xzfyInfo.getRemark() != null)
      newXzfyInfo.setRemark(this.xzfyInfo.getRemark());
    String op = "生成文书";
    this.recordService.save_log("2", op, this.xzfyId, newXzfyInfo);
    this.recordService.update(newXzfyInfo);
    return "success";
  }

  public String buzhengFinish() {
    if ((this.xzfyInfo.getCheck_id() != null) && 
      (!(this.xzfyInfo.getCheck_id().equals("0"))))
      this.user = this.recordService.getUserById(this.xzfyInfo.getCheck_id());

    this.xzfyInfo.setStatus("1");
    this.xzfyInfo.setIsBuzhengshenpi("1");
    XzfyInfo newXzfyInfo = this.recordService.getXzfyById(this.xzfyId);

    newXzfyInfo.setIsBuzhengshenpi("1");

    newXzfyInfo.setStatus("1");

    newXzfyInfo.setBzAdvice(this.xzfyInfo.getBzAdvice());
    newXzfyInfo.setIsBuzheng("1");
    newXzfyInfo.setCheck_id("0");
    if (this.xzfyInfo.getJdBzContent() != null)
      newXzfyInfo.setJdBzContent(this.xzfyInfo.getJdBzContent());
    newXzfyInfo.setCheck_status("0");
    newXzfyInfo.setCheck_name("");
    String op = "结束审批";
    this.recordService.save_log("2", op, this.xzfyId, newXzfyInfo);
    
  //加入案件识别及状态推送代码
  		/*if(newXzfyInfo.getXzfyInfo2id()!=null&&!newXzfyInfo.getXzfyInfo2id().equals("")){
  			//判断是否有外网ID，如果有则为外网案件，进行状态为推送。  改变状态为的地方很多，不能只靠在外网保存方法中加
  			try{
  				DatesentProxy da =new DatesentProxy();  
  				String c3=da.updateStatus(newXzfyInfo.getXzfyInfo2id(), newXzfyInfo.getStatus(),newXzfyInfo.getCheck_status());
  				//返回值全部用大写“SUCCESS”
  				if(c3.equals("SUCCESS")){
  					//行政复议表增加同步标志位字段。statechange
  					newXzfyInfo.setStatechange("1");
  				}else{
  					newXzfyInfo.setStatechange("0");
  				}
  			}catch(Exception e){
  				System.out.println(e);
  				newXzfyInfo.setStatechange("0");//服务端有问题同步失败
  			}
  			//同步标志位，外网的改自己的表tb_flag，内网的改自己的xzfyInfo表的tb_flag，不该同一张表，消除影响。
  		}*/
    
    this.recordService.update(newXzfyInfo);
    return "success";
  }

  public String buzhengCancle()
  {
    return cancleCheckCase();
  }

  public String subCheckCase()
  {
    if ((this.xzfyInfo.getCheck_id() != null) && 
      (!(this.xzfyInfo.getCheck_id().equals("0")))) {
      this.user = this.recordService.getUserById(this.xzfyInfo.getCheck_id());
      this.xzfyInfo.setCheck_name(this.user.getName());
    }

    Date date = new Date();

    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String currentTime = dateFormat.format(date);

    if (this.xzfyInfo.getStadardResult().equals("1")) {
      this.xzfyInfo.setStatus("3");
      this.xzfyInfo.setLianspdate(this.shenpiDate);
    } else {
      this.xzfyInfo.setStatus("11");
      this.xzfyInfo.setJieanspdate(this.shenpiDate);
    }
    String hql = "update XzfyShenpi sp set sp.sqspren_id=1 where sp.xzfyInfo.id='" + 
      this.xzfyId + "' and sp.check_type='" + this.xzfyInfo.getStatus() + "'";
    this.recordService.updateAll(hql);
    this.xzfyInfo.setId(this.xzfyId);
    this.xzfyInfo.setCheck_status("1");
    XzfyInfo newXzfyInfo = this.recordService.getXzfyById(this.xzfyId);
    checkInfo check = new checkInfo();
    newXzfyInfo = check.check_xzfyInfo(newXzfyInfo, this.xzfyInfo);
    if (this.xzfyInfo.getStadardResult().equals("1"))
      newXzfyInfo.setLianspdate(this.xzfyInfo.getLianspdate());
    else
      newXzfyInfo.setJieanspdate(this.xzfyInfo.getJieanspdate());
    String op = "提交审批";
    
  //加入案件识别及状态推送代码
  		/*if(newXzfyInfo.getXzfyInfo2id()!=null&&!newXzfyInfo.getXzfyInfo2id().equals("")){
  			//判断是否有外网ID，如果有则为外网案件，进行状态为推送。  改变状态为的地方很多，不能只靠在外网保存方法中加
  			try{
  				DatesentProxy da =new DatesentProxy();  
  				String c3=da.updateStatus(newXzfyInfo.getXzfyInfo2id(), newXzfyInfo.getStatus(),newXzfyInfo.getCheck_status());
  				//返回值全部用大写“SUCCESS”
  				if(c3.equals("SUCCESS")){
  					//行政复议表增加同步标志位字段。statechange
  					newXzfyInfo.setStatechange("1");
  				}else{
  					newXzfyInfo.setStatechange("0");
  				}
  			}catch(Exception e){
  				System.out.println(e);
  				newXzfyInfo.setStatechange("0");//服务端有问题同步失败
  			}
  			//同步标志位，外网的改自己的表tb_flag，内网的改自己的xzfyInfo表的tb_flag，不该同一张表，消除影响。
  		}*/
    
    this.recordService.save_log(this.xzfyInfo.getStatus(), op, this.xzfyId, newXzfyInfo);
    this.recordService.update(newXzfyInfo);

    return "success";
  }

  public String getPizhunDate()
  {
    return this.pizhunDate;
  }

  public void setPizhunDate(String pizhunDate) {
    this.pizhunDate = pizhunDate;
  }

  public String saveCase() {
    XzfyInfo newXzfyInfo = this.recordService.getXzfyById(this.xzfyId);
    checkInfo check = new checkInfo();
    newXzfyInfo = check.check_xzfyInfo(newXzfyInfo, this.xzfyInfo);
    String op = "生成文书";
    this.recordService.save_log(
      newXzfyInfo.getStatus(), op, this.xzfyId, newXzfyInfo);

    this.recordService.update(newXzfyInfo);
    return "success";
  }

  public String finishLian() {
    if ((this.xzfyInfo.getCheck_id() != null) && 
      (!(this.xzfyInfo.getCheck_id().equals("0")))) {
      this.user = this.recordService.getUserById(this.xzfyInfo.getCheck_id());
    }

    if (this.xzfyInfo.getStadardResult().equals("1")) {
      this.xzfyInfo.setStatus("4");
    }
    else {
      this.xzfyInfo.setStatus("12");
    }

    this.xzfyInfo.setId(this.xzfyId);
    this.xzfyInfo.setCheck_status("0");

    XzfyInfo newXzfyInfo = this.recordService.getXzfyById(this.xzfyId);
    checkInfo check = new checkInfo();
    newXzfyInfo = check.check_xzfyInfo(newXzfyInfo, this.xzfyInfo);
    newXzfyInfo.setCheck_id("");
    newXzfyInfo.setCheck_name("");
    newXzfyInfo.setIsdelay_from(this.pizhunDate);
    newXzfyInfo.setIsdelay_to(this.user.getName());
    String op = "完成立案审批";
    if (this.xzfyInfo.getStatus().equals("12"))
      op = "完成结案审批";
    
  //加入案件识别及状态推送代码
  		/*if(newXzfyInfo.getXzfyInfo2id()!=null&&!newXzfyInfo.getXzfyInfo2id().equals("")){
  			//判断是否有外网ID，如果有则为外网案件，进行状态为推送。  改变状态为的地方很多，不能只靠在外网保存方法中加
  			try{
  				DatesentProxy da =new DatesentProxy();  
  				String c3=da.updateStatus(newXzfyInfo.getXzfyInfo2id(), newXzfyInfo.getStatus(),newXzfyInfo.getCheck_status());
  				//返回值全部用大写“SUCCESS”
  				if(c3.equals("SUCCESS")){
  					//行政复议表增加同步标志位字段。statechange
  					newXzfyInfo.setStatechange("1");
  				}else{
  					newXzfyInfo.setStatechange("0");
  				}
  			}catch(Exception e){
  				System.out.println(e);
  				newXzfyInfo.setStatechange("0");//服务端有问题同步失败
  			}
  			//同步标志位，外网的改自己的表tb_flag，内网的改自己的xzfyInfo表的tb_flag，不该同一张表，消除影响。
  		}*/
    
    this.recordService.save_log(this.xzfyInfo.getStatus(), op, this.xzfyId, newXzfyInfo);

    this.recordService.update(newXzfyInfo);

    return "success";
  }

  public String getUpFile2FileName()
  {
    return this.upFile2FileName;
  }

  public void setUpFile2FileName(String upFile2FileName) {
    this.upFile2FileName = upFile2FileName;
  }

  public File getUpFile2() {
    return this.upFile2;
  }

  public void setUpFile2(File upFile2) {
    this.upFile2 = upFile2;
  }

  public String getUpFile3FileName() {
    return this.upFile3FileName;
  }

  public void setUpFile3FileName(String upFile3FileName) {
    this.upFile3FileName = upFile3FileName;
  }

  public File getUpFile3() {
    return this.upFile3;
  }

  public void setUpFile3(File upFile3) {
    this.upFile3 = upFile3;
  }

  public String getResultType()
  {
    return this.resultType;
  }

  public void setResultType(String resultType) {
    this.resultType = resultType;
  }

  public File getUpFile1() {
    return this.upFile1;
  }

  public void setUpFile1(File upFile1) {
    this.upFile1 = upFile1;
  }

  public String getUpFile1FileName() {
    return this.upFile1FileName;
  }

  public void setUpFile1FileName(String upFile1FileName) {
    this.upFile1FileName = upFile1FileName;
  }

  public int getIsGaojijiansuo()
  {
    return this.isGaojijiansuo;
  }

  public void setIsGaojijiansuo(int isGaojijiansuo) {
    this.isGaojijiansuo = isGaojijiansuo;
  }

  public String saveJiean()
  {
    String webRootPath1;
    String extension;
    String fileName1;
    String fileFlod1;
    File path;
    File outFile1;
    IOStream stream;
    if ((this.upFile1FileName != null) && (!("".equals(this.upFile1FileName)))) {
      webRootPath1 = ApplicationPath.getRootPath().replaceAll(
        "\\\\", "\\\\\\\\");

      extension = this.upFile1FileName.substring(this.upFile1FileName.lastIndexOf(
        "."));
      fileName1 = this.xzfyInfo.getId() + extension;
      fileFlod1 = webRootPath1 + "uploadfiles/jiean_doc/";
      path = new File(fileFlod1);
      if (!(path.exists()))
        path.mkdir();
      outFile1 = new File(fileFlod1 + fileName1);
      this.xzfyInfo.setJieanwenshu("../uploadfiles/jiean_doc/" + fileName1);
      stream = new IOStream();
      stream.writeFileStream(this.upFile1, outFile1);
    }

    if ((this.upFile2FileName != null) && (!("".equals(this.upFile2FileName)))) {
      webRootPath1 = ApplicationPath.getRootPath().replaceAll(
        "\\\\", "\\\\\\\\");
      extension = this.upFile2FileName.substring(this.upFile2FileName.lastIndexOf(
        "."));
      fileName1 = "yijianshu" + this.xzfyInfo.getId() + extension;
      fileFlod1 = webRootPath1 + "uploadfiles/jiean_doc/";
      path = new File(fileFlod1);
      if (!(path.exists()))
        path.mkdir();
      outFile1 = new File(fileFlod1 + fileName1);
      this.xzfyInfo.setYijian_file("../uploadfiles/jiean_doc/" + fileName1);
      stream = new IOStream();
      stream.writeFileStream(this.upFile2, outFile1);
    }

    if ((this.upFile3FileName != null) && (!("".equals(this.upFile3FileName)))) {
      webRootPath1 = ApplicationPath.getRootPath().replaceAll(
        "\\\\", "\\\\\\\\");
      extension = this.upFile3FileName.substring(this.upFile3FileName.lastIndexOf(
        "."));
      fileName1 = "jianyishu" + this.xzfyInfo.getId() + extension;
      fileFlod1 = webRootPath1 + "uploadfiles/jiean_doc/";
      path = new File(fileFlod1);
      if (!(path.exists()))
        path.mkdir();
      outFile1 = new File(fileFlod1 + fileName1);
      this.xzfyInfo.setJianyi_file("../uploadfiles/jiean_doc/" + fileName1);
      stream = new IOStream();
      stream.writeFileStream(this.upFile3, outFile1);
    }

    this.xzfyId = this.xzfyInfo.getId();
    String content = "";
    if ((this.xzfyInfo.getDefendant_name() != null) && 
      (!(this.xzfyInfo.getDefendant_name().equals(""))))
      content = "申请人不服" + this.xzfyInfo.getDefendant_name();
    if ((this.xzfyInfo.getIsmanage() != null) && 
      (this.xzfyInfo.getIsmanage().equals("2")))
      if ((this.xzfyInfo.getMatter_type() != null) && 
        (!(this.xzfyInfo.getMatter_type().equals("")))) {
        content = content + this.xzfyInfo.getMatter_type() + "，";
      } else {
        if ((this.xzfyInfo.getXwname() != null) && 
          (!(this.xzfyInfo.getXwname().equals(""))))
          content = content + this.xzfyInfo.getXwname();
        if ((this.xzfyInfo.getXwnum() != null) && 
          (!(this.xzfyInfo.getXwnum().equals(""))))
          content = content + "（" + this.xzfyInfo.getXwnum() + "），";
      }
    if ((this.xzfyInfo.getXzfy_requset_retail() != null) && 
      (!(this.xzfyInfo.getXzfy_requset_retail().equals(""))))
      content = content + this.xzfyInfo.getXzfy_requset_retail();

    if (content.lastIndexOf("。") != content.length() - 1)
      content = content + "。";
    this.xzfyInfo.setContent_abstract(content);
    String hql = "delete from XzfyKeyword xzfyKeyword where xzfyKeyword.xzfy_id = '" + 
      this.xzfyId + "'";
    this.recordService.deleteAll(hql);
    for (int i = 0; i < this.keyword.length; ++i) {
      this.xzfyKeyword = new XzfyKeyword();
      this.xzfyKeyword.setKeyword(this.keyword[i]);
      this.xzfyKeyword.setXzfy_id(this.xzfyId);
      this.xzfyKeyword.setStatus("1");
      this.xzfyKeyword.setLocbm(this.recordService.getOrg().getLocbm());
      this.recordService.save(this.xzfyKeyword);
    }
    XzfyInfo newXzfyInfo = this.recordService.getXzfyById(this.xzfyId);

    if ((newXzfyInfo.getStadardResult() != null) && 
      (!(newXzfyInfo.getStadardResult().equals("1"))) && 
      (newXzfyInfo.getStatus().equals("11")) && 
      (this.xzfyInfo.getStadardResult().equals("1"))) {
      this.xzfyInfo.setStatus("3");
    }

    if (this.xzfyInfo.getStatus().equals("12")) {
      String sql = "select * from (select * from eweboffice_t_document t where t.caseid='" + 
        this.xzfyId + 
        "' and t.d_type='xingzhengfuyiyijianshu' order by d_id desc ) where rownum=1";
      List list = this.recordService.findListBySQL(sql);
      if (list.size() > 0)
        this.xzfyInfo.setYijian_file("1");

      String sql1 = "select * from (select * from eweboffice_t_document t where t.caseid='" + 
        this.xzfyId + 
        "' and t.d_type='xingzhengfuyijianyishu' order by d_id desc ) where rownum=1";
      List list1 = this.recordService.findListBySQL(sql1);
      if (list1.size() > 0)
        this.xzfyInfo.setJianyi_file("1");

    }

    checkInfo check = new checkInfo();

    this.user = 
      ((User)ActionContext.getContext().getSession().get(
      "_USER_LOGIN_"));

    newXzfyInfo = check.check_xzfyInfo(newXzfyInfo, this.xzfyInfo);

    Date date = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String currentTime = dateFormat.format(date);
    newXzfyInfo.setJieanwenshu(this.xzfyInfo.getJieanwenshu());
    newXzfyInfo.setFinish_real_date(currentTime);
    String op = "保存结案信息";
    if (this.xzfyInfo.getId().length() > 10) {
      newXzfyInfo = setInfo(newXzfyInfo);

      if ((newXzfyInfo.getDbrDetail() != null) && 
        (!(newXzfyInfo.getDbrDetail().equals(""))))
        saveDeputy(newXzfyInfo.getDbrDetail());
    }

    saveFile(newXzfyInfo);
    
  //加入案件识别及状态推送代码(新)
    if(newXzfyInfo.getXzfyInfo2id()!=null&&!newXzfyInfo.getXzfyInfo2id().equals("")){
		//判断是否有外网ID，如果有则为外网案件，进行状态为推送。  改变状态为的地方很多，不能只靠在外网保存方法中加
		try{
			
			 XzfyInfo2 newXzfyInfo2 = this.recordService.getXzfyById_w(newXzfyInfo.getXzfyInfo2id());
			DatesentProxy da =new DatesentProxy();  
			String c3=da.updateStatus(
					newXzfyInfo.getXzfyInfo2id(),        //1案件id
					newXzfyInfo2.getReceive_real_date(), //2保存时间
					newXzfyInfo.getReceive_date(),//3收案时间
					newXzfyInfo.getIsBuzheng(),//4是否补正
					newXzfyInfo.getBzTongzhiriqi(),//5通知补正时间
					newXzfyInfo.getBzBuqiriqi(),//6补正时间
					newXzfyInfo.getLian_date(),//7立案时间
					newXzfyInfo.getTjzfzh(),//8案件号
					newXzfyInfo.getIsstop(),// 9是否中止
					newXzfyInfo.getIsstop_from(),//10中止时间
					newXzfyInfo.getBreakTo(),//11恢复审理日期
					
					newXzfyInfo.getIsdelay(),//12延期审理时间
				
					newXzfyInfo.getFinish_date(),//13结案日期
					newXzfyInfo.getFinish_type());//14审理结果
					//finish_type
					//finish_date
					//newXzfyInfo.getStatus(),
					//newXzfyInfo.getCheck_status()
			//返回值全部用大写“SUCCESS”
			if(c3.equals("SUCCESS")){
				//行政复议表增加同步标志位字段。statechange
				newXzfyInfo.setStatechange("1");
			}else{
				newXzfyInfo.setStatechange("0");
			}
		}catch(Exception e){
			System.out.println(e);
			newXzfyInfo.setStatechange("0");//服务端有问题同步失败
		}
		//同步标志位，外网的改自己的表tb_flag，内网的改自己的xzfyInfo表的tb_flag，不该同一张表，消除影响。
	}
    
    
    this.recordService.save_log(this.xzfyInfo.getStatus(), op, this.xzfyInfo.getId(), 
      newXzfyInfo);
    this.recordService.update(newXzfyInfo);

    return "success";
  }

  public String finishLianInfo()
  {
    this.xzfyId = this.xzfyInfo.getId();
    XzfyInfo newXzfyInfo = this.recordService.getXzfyById(this.xzfyId);

    checkInfo check = new checkInfo();
    this.xzfyInfo.setStatus("4");
    this.user = 
      ((User)ActionContext.getContext().getSession().get(
      "_USER_LOGIN_"));
    Date date = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String currentTime = dateFormat.format(date);
    if ((!(this.xzfyInfo.getLian_date().equals(""))) || 
      (this.xzfyInfo.getLian_date() != null))
      this.xzfyInfo.setLian_date(currentTime);
    String content = "";
    if ((this.xzfyInfo.getDefendant_name() != null) && 
      (!(this.xzfyInfo.getDefendant_name().equals(""))))
      content = "申请人不服" + this.xzfyInfo.getDefendant_name();
    if ((this.xzfyInfo.getIsmanage() != null) && 
      (this.xzfyInfo.getIsmanage().equals("2")))
      if ((this.xzfyInfo.getMatter_type() != null) && 
        (!(this.xzfyInfo.getMatter_type().equals("")))) {
        content = content + this.xzfyInfo.getMatter_type() + "，";
      } else {
        if ((this.xzfyInfo.getXwname() != null) && 
          (!(this.xzfyInfo.getXwname().equals(""))))
          content = content + this.xzfyInfo.getXwname();
        if ((this.xzfyInfo.getXwnum() != null) && 
          (!(this.xzfyInfo.getXwnum().equals(""))))
          content = content + "（" + this.xzfyInfo.getXwnum() + "），";
      }
    if ((this.xzfyInfo.getXzfy_requset_retail() != null) && 
      (!(this.xzfyInfo.getXzfy_requset_retail().equals(""))))
      content = content + this.xzfyInfo.getXzfy_requset_retail();

    if (content.lastIndexOf("。") != content.length() - 1)
      content = content + "。";
    this.xzfyInfo.setContent_abstract(content);
    newXzfyInfo = check.check_xzfyInfo(newXzfyInfo, this.xzfyInfo);
    newXzfyInfo.setUser2_id(this.user.getId().toString());
    newXzfyInfo.setUser2_name(this.user.getName());

    newXzfyInfo.setLian_real_date(currentTime);

    String hql = "delete from XzfyKeyword xzfyKeyword where xzfyKeyword.xzfy_id = '" + 
      this.xzfyId + "'";
    this.recordService.deleteAll(hql);
    for (int i = 0; i < this.keyword.length; ++i) {
      this.xzfyKeyword = new XzfyKeyword();
      this.xzfyKeyword.setKeyword(this.keyword[i]);
      this.xzfyKeyword.setXzfy_id(this.xzfyId);
      this.xzfyKeyword.setStatus("1");
      this.xzfyKeyword.setLocbm(this.recordService.getOrg().getLocbm());
      this.recordService.save(this.xzfyKeyword);
    }
    String op = "完成立案审查，提交办理";
    if (this.xzfyInfo.getId().length() > 10) {
      newXzfyInfo = setInfo(newXzfyInfo);
      if ((newXzfyInfo.getDbrDetail() != null) && 
        (!(newXzfyInfo.getDbrDetail().equals(""))))
        saveDeputy(newXzfyInfo.getDbrDetail());
    }

    saveFile(newXzfyInfo);
    
  //加入案件识别及状态推送代码(新)
    if(newXzfyInfo.getXzfyInfo2id()!=null&&!newXzfyInfo.getXzfyInfo2id().equals("")){
		//判断是否有外网ID，如果有则为外网案件，进行状态为推送。  改变状态为的地方很多，不能只靠在外网保存方法中加
		try{
			
			 XzfyInfo2 newXzfyInfo2 = this.recordService.getXzfyById_w(newXzfyInfo.getXzfyInfo2id());
			DatesentProxy da =new DatesentProxy();  
			String c3=da.updateStatus(
					newXzfyInfo.getXzfyInfo2id(),        //1案件id
					newXzfyInfo2.getReceive_real_date(), //2保存时间
					newXzfyInfo.getReceive_date(),//3收案时间
					newXzfyInfo.getIsBuzheng(),//4是否补正
					newXzfyInfo.getBzTongzhiriqi(),//5通知补正时间
					newXzfyInfo.getBzBuqiriqi(),//6补正时间
					newXzfyInfo.getLian_date(),//7立案时间
					newXzfyInfo.getTjzfzh(),//8案件号
					newXzfyInfo.getIsstop(),// 9是否中止
					newXzfyInfo.getIsstop_from(),//10中止时间
					newXzfyInfo.getBreakTo(),//11恢复审理日期
					
					newXzfyInfo.getIsdelay(),//12延期审理时间
				
					newXzfyInfo.getFinish_date(),//13结案日期
					newXzfyInfo.getFinish_type());//14审理结果
					//finish_type
					//finish_date
					//newXzfyInfo.getStatus(),
					//newXzfyInfo.getCheck_status()
			//返回值全部用大写“SUCCESS”
			if(c3.equals("SUCCESS")){
				//行政复议表增加同步标志位字段。statechange
				newXzfyInfo.setStatechange("1");
			}else{
				newXzfyInfo.setStatechange("0");
			}
		}catch(Exception e){
			System.out.println(e);
			newXzfyInfo.setStatechange("0");//服务端有问题同步失败
		}
		//同步标志位，外网的改自己的表tb_flag，内网的改自己的xzfyInfo表的tb_flag，不该同一张表，消除影响。
	}
    
    
    this.recordService.save_log(this.xzfyInfo.getStatus(), op, this.xzfyInfo.getId(), 
      newXzfyInfo);
    this.recordService.update(newXzfyInfo);

    return "success";
  }

  public String getFileId()
  {
    return this.fileId;
  }

  public void setFileId(String fileId) {
    this.fileId = fileId;
  }

  public String deleteFile() {
    String hql = "delete from XzfyInfoFile file where file.id=" + this.fileId;
    this.recordService.deleteAll(hql);
    return "success";
  }

  public String finishLianInfo1() {
    XzfyInfo newXzfyInfo = this.recordService.getXzfyById(this.xzfyId);
    this.xzfyInfo.setId(this.xzfyId);

    checkInfo check = new checkInfo();
    this.xzfyInfo.setStatus("4");
    this.user = 
      ((User)ActionContext.getContext().getSession().get(
      "_USER_LOGIN_"));
    Date date = new Date();

    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String currentTime = dateFormat.format(date);
    this.xzfyInfo.setLian_real_date(currentTime);

    String content = "";
    if ((this.xzfyInfo.getDefendant_name() != null) && 
      (!(this.xzfyInfo.getDefendant_name().equals(""))))
      content = "申请人不服" + this.xzfyInfo.getDefendant_name();
    if ((this.xzfyInfo.getIsmanage() != null) && 
      (this.xzfyInfo.getIsmanage().equals("2")))
      if ((this.xzfyInfo.getMatter_type() != null) && 
        (!(this.xzfyInfo.getMatter_type().equals("")))) {
        content = content + this.xzfyInfo.getMatter_type() + "，";
      } else {
        if ((this.xzfyInfo.getXwname() != null) && 
          (!(this.xzfyInfo.getXwname().equals(""))))
          content = content + this.xzfyInfo.getXwname();
        if ((this.xzfyInfo.getXwnum() != null) && 
          (!(this.xzfyInfo.getXwnum().equals(""))))
          content = content + "（" + this.xzfyInfo.getXwnum() + "），";
      }
    if ((this.xzfyInfo.getXzfy_requset_retail() != null) && 
      (!(this.xzfyInfo.getXzfy_requset_retail().equals(""))))
      content = content + this.xzfyInfo.getXzfy_requset_retail();

    if (content.lastIndexOf("。") != content.length() - 1)
      content = content + "。";
    this.xzfyInfo.setContent_abstract(content);

    if ((!(this.xzfyInfo.getLian_date().equals(""))) || 
      (this.xzfyInfo.getLian_date() != null))
      this.xzfyInfo.setLian_date(currentTime);
    newXzfyInfo = check.check_xzfyInfo(newXzfyInfo, this.xzfyInfo);
    String hql = "delete from XzfyKeyword xzfyKeyword where xzfyKeyword.xzfy_id = '" + 
      this.xzfyId + "'";
    this.recordService.deleteAll(hql);
    for (int i = 0; i < this.keyword.length; ++i) {
      this.xzfyKeyword = new XzfyKeyword();
      this.xzfyKeyword.setKeyword(this.keyword[i]);
      this.xzfyKeyword.setXzfy_id(this.xzfyId);
      this.xzfyKeyword.setStatus("1");
      this.xzfyKeyword.setLocbm(this.recordService.getOrg().getLocbm());
      this.recordService.save(this.xzfyKeyword);
    }
    String op = "完成立案审查，提交办理";
    if (this.xzfyInfo.getId().length() > 10) {
      newXzfyInfo = setInfo(newXzfyInfo);
      if ((newXzfyInfo.getDbrDetail() != null) && 
        (!(newXzfyInfo.getDbrDetail().equals(""))))
        saveDeputy(newXzfyInfo.getDbrDetail());

    }

    saveFile(newXzfyInfo);
    
  //加入案件识别及状态推送代码(新)
    if(newXzfyInfo.getXzfyInfo2id()!=null&&!newXzfyInfo.getXzfyInfo2id().equals("")){
		//判断是否有外网ID，如果有则为外网案件，进行状态为推送。  改变状态为的地方很多，不能只靠在外网保存方法中加
		try{
			
			 XzfyInfo2 newXzfyInfo2 = this.recordService.getXzfyById_w(newXzfyInfo.getXzfyInfo2id());
			DatesentProxy da =new DatesentProxy();  
			String c3=da.updateStatus(
					newXzfyInfo.getXzfyInfo2id(),        //1案件id
					newXzfyInfo2.getReceive_real_date(), //2保存时间
					newXzfyInfo.getReceive_date(),//3收案时间
					newXzfyInfo.getIsBuzheng(),//4是否补正
					newXzfyInfo.getBzTongzhiriqi(),//5通知补正时间
					newXzfyInfo.getBzBuqiriqi(),//6补正时间
					newXzfyInfo.getLian_date(),//7立案时间
					newXzfyInfo.getTjzfzh(),//8案件号
					newXzfyInfo.getIsstop(),// 9是否中止
					newXzfyInfo.getIsstop_from(),//10中止时间
					newXzfyInfo.getBreakTo(),//11恢复审理日期
					
					newXzfyInfo.getIsdelay(),//12延期审理时间
				
					newXzfyInfo.getFinish_date(),//13结案日期
					newXzfyInfo.getFinish_type());//14审理结果
					//finish_type
					//finish_date
					//newXzfyInfo.getStatus(),
					//newXzfyInfo.getCheck_status()
			//返回值全部用大写“SUCCESS”
			if(c3.equals("SUCCESS")){
				//行政复议表增加同步标志位字段。statechange
				newXzfyInfo.setStatechange("1");
			}else{
				newXzfyInfo.setStatechange("0");
			}
		}catch(Exception e){
			System.out.println(e);
			newXzfyInfo.setStatechange("0");//服务端有问题同步失败
		}
		//同步标志位，外网的改自己的表tb_flag，内网的改自己的xzfyInfo表的tb_flag，不该同一张表，消除影响。
	}
    
    
    this.recordService.save_log("3", op, this.xzfyInfo.getId(), newXzfyInfo);
    this.recordService.update(newXzfyInfo);

    return "success";
  }

  public String finishJieanInfo1()
  {
    XzfyInfo newXzfyInfo = this.recordService.getXzfyById(this.xzfyId);
    this.xzfyInfo.setId(this.xzfyId);

    checkInfo check = new checkInfo();
    this.xzfyInfo.setStatus("12");
    this.user = 
      ((User)ActionContext.getContext().getSession().get(
      "_USER_LOGIN_"));
    Date date = new Date();

    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String currentTime = dateFormat.format(date);
    this.xzfyInfo.setLian_date(currentTime);
    newXzfyInfo = check.check_xzfyInfo(newXzfyInfo, this.xzfyInfo);

  //加入案件识别及状态推送代码
		/*if(newXzfyInfo.getXzfyInfo2id()!=null&&!newXzfyInfo.getXzfyInfo2id().equals("")){
			//判断是否有外网ID，如果有则为外网案件，进行状态为推送。  改变状态为的地方很多，不能只靠在外网保存方法中加
			try{
				DatesentProxy da =new DatesentProxy();  
				String c3=da.updateStatus(newXzfyInfo.getXzfyInfo2id(), newXzfyInfo.getStatus(),newXzfyInfo.getCheck_status());
				//返回值全部用大写“SUCCESS”
				if(c3.equals("SUCCESS")){
					//行政复议表增加同步标志位字段。statechange
					newXzfyInfo.setStatechange("1");
				}else{
					newXzfyInfo.setStatechange("0");
				}
			}catch(Exception e){
				System.out.println(e);
				newXzfyInfo.setStatechange("0");//服务端有问题同步失败
			}
			//同步标志位，外网的改自己的表tb_flag，内网的改自己的xzfyInfo表的tb_flag，不该同一张表，消除影响。
		}*/
    
    
    String op = "完成结案审批，案件结案";
    this.recordService.save_log("11", op, this.xzfyInfo.getId(), newXzfyInfo);
    this.recordService.update(newXzfyInfo);

    return "success";
  }

  public String[] getKeyword()
  {
    return this.keyword;
  }

  public void setKeyword(String[] keyword) {
    this.keyword = keyword;
  }

  public XzfyKeyword getXzfyKeyword()
  {
    return this.xzfyKeyword;
  }

  public void setXzfyKeyword(XzfyKeyword xzfyKeyword) {
    this.xzfyKeyword = xzfyKeyword;
  }

  public String saveLianshencha1() {
    this.xzfyId = this.xzfyInfo.getId();
    XzfyInfo newXzfyInfo = this.recordService.getXzfyById(this.xzfyId);
    String hql = "delete from XzfyKeyword xzfyKeyword where xzfyKeyword.xzfy_id = '" + 
      this.xzfyId + "'";
    this.recordService.deleteAll(hql);
    for (int i = 0; i < this.keyword.length; ++i) {
      this.xzfyKeyword = new XzfyKeyword();
      this.xzfyKeyword.setKeyword(this.keyword[i]);
      this.xzfyKeyword.setXzfy_id(this.xzfyId);
      this.xzfyKeyword.setStatus("1");
      this.xzfyKeyword.setLocbm(this.recordService.getOrg().getLocbm());
      this.recordService.save(this.xzfyKeyword);
    }

    checkInfo check = new checkInfo();

    this.user = 
      ((User)ActionContext.getContext().getSession().get(
      "_USER_LOGIN_"));
    if (newXzfyInfo.getStatus().equals("11"))
      this.xzfyInfo.setStatus("3");

    String content = "";
    if ((this.xzfyInfo.getDefendant_name() != null) && 
      (!(this.xzfyInfo.getDefendant_name().equals(""))))
      content = "申请人不服" + this.xzfyInfo.getDefendant_name();
    if ((this.xzfyInfo.getIsmanage() != null) && 
      (this.xzfyInfo.getIsmanage().equals("2")))
      if ((this.xzfyInfo.getMatter_type() != null) && 
        (!(this.xzfyInfo.getMatter_type().equals("")))) {
        content = content + this.xzfyInfo.getMatter_type() + "，";
      } else {
        if ((this.xzfyInfo.getXwname() != null) && 
          (!(this.xzfyInfo.getXwname().equals(""))))
          content = content + this.xzfyInfo.getXwname();
        if ((this.xzfyInfo.getXwnum() != null) && 
          (!(this.xzfyInfo.getXwnum().equals(""))))
          content = content + "（" + this.xzfyInfo.getXwnum() + "），";
      }
    if ((this.xzfyInfo.getXzfy_requset_retail() != null) && 
      (!(this.xzfyInfo.getXzfy_requset_retail().equals(""))))
      content = content + this.xzfyInfo.getXzfy_requset_retail();

    if (content.lastIndexOf("。") != content.length() - 1)
      content = content + "。";
    this.xzfyInfo.setContent_abstract(content);
    newXzfyInfo = check.check_xzfyInfo(newXzfyInfo, this.xzfyInfo);
    String op = "修改立案信息";
    if (this.xzfyInfo.getId().length() > 10) {
      newXzfyInfo = setInfo(newXzfyInfo);
      if ((newXzfyInfo.getDbrDetail() != null) && 
        (!(newXzfyInfo.getDbrDetail().equals(""))))
        saveDeputy(newXzfyInfo.getDbrDetail());
    }

  //加入案件识别及状态推送代码(新)
		if(newXzfyInfo.getXzfyInfo2id()!=null&&!newXzfyInfo.getXzfyInfo2id().equals("")){
			//判断是否有外网ID，如果有则为外网案件，进行状态为推送。  改变状态为的地方很多，不能只靠在外网保存方法中加
			try{
				
				 XzfyInfo2 newXzfyInfo2 = this.recordService.getXzfyById_w(newXzfyInfo.getXzfyInfo2id());
				DatesentProxy da =new DatesentProxy();  
				String c3=da.updateStatus(
						newXzfyInfo.getXzfyInfo2id(),        //1案件id
						newXzfyInfo2.getReceive_real_date(), //2保存时间
						newXzfyInfo.getReceive_date(),//3收案时间
						newXzfyInfo.getIsBuzheng(),//4是否补正
						newXzfyInfo.getBzTongzhiriqi(),//5通知补正时间
						newXzfyInfo.getBzBuqiriqi(),//6补正时间
						newXzfyInfo.getLian_date(),//7立案时间
						newXzfyInfo.getTjzfzh(),//8案件号
						newXzfyInfo.getIsstop(),// 9是否中止
						newXzfyInfo.getIsstop_from(),//10中止时间
						newXzfyInfo.getBreakTo(),//11恢复审理日期
						
						newXzfyInfo.getIsdelay(),//12延期审理时间
					
						newXzfyInfo.getFinish_date(),//13结案日期
						newXzfyInfo.getFinish_type());//14审理结果
						//finish_type
						//finish_date
						//newXzfyInfo.getStatus(),
						//newXzfyInfo.getCheck_status()
				//返回值全部用大写“SUCCESS”
				if(c3.equals("SUCCESS")){
					//行政复议表增加同步标志位字段。statechange
					newXzfyInfo.setStatechange("1");
				}else{
					newXzfyInfo.setStatechange("0");
				}
			}catch(Exception e){
				System.out.println(e);
				newXzfyInfo.setStatechange("0");//服务端有问题同步失败
			}
			//同步标志位，外网的改自己的表tb_flag，内网的改自己的xzfyInfo表的tb_flag，不该同一张表，消除影响。
		}
    
    saveFile(newXzfyInfo);
    this.recordService.save_log(this.xzfyInfo.getStatus(), op, this.xzfyInfo.getId(), 
      newXzfyInfo);
    newXzfyInfo.setBuzhengContentType(this.bzCon);
    this.recordService.update(newXzfyInfo);

    ApplicationContext context = new ClassPathXmlApplicationContext(
      "applicationContext.xml");
    Services services = (Services)context.getBean("client");
    InfoDto infoDto = new InfoDto();
    infoDto.setId(this.xzfyId);
    infoDto.setIsBuZheng("1");
    infoDto.setBuzhengContentType(this.bzCon);

    return "success";
  }

  public String saveCailiao() {
    this.xzfyId = this.xzfyInfo.getId();
    XzfyInfo newXzfyInfo = this.recordService.getXzfyById(this.xzfyId);

    checkInfo check = new checkInfo();

    this.user = 
      ((User)ActionContext.getContext().getSession().get(
      "_USER_LOGIN_"));

    String op = "上传电子材料";

    saveFile(newXzfyInfo);
    newXzfyInfo.setShouju_flag("1");
    this.recordService.save_log("2", op, this.xzfyInfo.getId(), newXzfyInfo);

    this.recordService.update(newXzfyInfo);

    return "success";
  }

  private void saveDeputy(String deputy)
  {
    String[] arrayOfString1;
    String[] dpName = deputy.split("，");
    int j = (arrayOfString1 = dpName).length; for (int i = 0; i < j; ++i) { String name = arrayOfString1[i];
      String sql = "update xzfy_app set ISDEPUTY = '1' where APP_NAME = '" + 
        name + "'";
      this.recordService.updateAllBySQL(sql);
    }
  }

  public String getWordList() {
    return "success";
  }

  public XzfyInfo2 getXzfyInfo2() {
	return xzfyInfo2;
}

public void setXzfyInfo2(XzfyInfo2 xzfyInfo2) {
	this.xzfyInfo2 = xzfyInfo2;
}

public String getShenpiren()
  {
    return this.shenpiren;
  }

  public void setShenpiren(String shenpiren) {
    this.shenpiren = shenpiren;
  }

  public String getShenpiyijian() {
    return this.shenpiyijian;
  }

  public void setShenpiyijian(String shenpiyijian) {
    this.shenpiyijian = shenpiyijian;
  }

  public String getTypeId()
  {
    return this.typeId;
  }

  public void setTypeId(String typeId) {
    this.typeId = typeId;
  }

  public String finishCheckCase() {
    XzfyShenpi shenpiModel = new XzfyShenpi();
    XzfyInfo newXzfyInfo = this.recordService.getXzfyById(this.xzfyInfo.getId());
    checkInfo check = new checkInfo();
    newXzfyInfo = check.check_xzfyInfo(newXzfyInfo, this.xzfyInfo);
    String op = "执行完成补正操作";
    this.recordService.save_log("2", op, this.xzfyInfo.getId(), newXzfyInfo);
    this.recordService.update(newXzfyInfo);
    if ((this.shenpiren != null) && (!(this.shenpiren.equals("")))) {
      shenpiModel.setCheck_name(this.shenpiren);
      shenpiModel.setCheck_result("1");
      shenpiModel.setCheck_type("2");
      shenpiModel.setCheck_advise(this.shenpiyijian);
      Date date = new Date();

      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
      String currentTime = dateFormat.format(date);
      shenpiModel.setCheck_date(currentTime);
      shenpiModel.setXzfyInfo(this.xzfyInfo);
    }

    return "success";
  }

  public String getJashenpiren()
  {
    return this.jashenpiren;
  }

  public void setJashenpiren(String jashenpiren) {
    this.jashenpiren = jashenpiren;
  }

  public String getJashenpiyijian()
  {
    return this.jashenpiyijian;
  }

  public void setJashenpiyijian(String jashenpiyijian) {
    this.jashenpiyijian = jashenpiyijian;
  }

  public String getLashenpiren() {
    return this.lashenpiren;
  }

  public void setLashenpiren(String lashenpiren) {
    this.lashenpiren = lashenpiren;
  }

  public String getLashenpiyijian() {
    return this.lashenpiyijian;
  }

  public void setLashenpiyijian(String lashenpiyijian) {
    this.lashenpiyijian = lashenpiyijian;
  }

  public String cancleCheckCase() {
    XzfyInfo newXzfyInfo = this.recordService.getXzfyById(this.xzfyId);
    newXzfyInfo.setCheck_status("0");
    newXzfyInfo.setCheck_id("");
    newXzfyInfo.setCheck_name("");
    if (newXzfyInfo.getStatus().equals("2"))
    {
      newXzfyInfo.setStatus("1");
      if ((newXzfyInfo.getIsBuzhengshenpi() != null) && (newXzfyInfo.getIsBuzhengshenpi().equals("1")))
      {
        newXzfyInfo.setIsBuzhengshenpi("0");
      }
    }
    if (newXzfyInfo.getStatus().equals("3"))
    {
      newXzfyInfo.setStatus("1");
      newXzfyInfo.setStadardResult("0");
    }
    if (newXzfyInfo.getStatus().equals("5"))
    {
      newXzfyInfo.setStatus("4");
    }
    if (newXzfyInfo.getStatus().equals("7"))
    {
      newXzfyInfo.setStatus("4");
    }
    if (newXzfyInfo.getStatus().equals("9"))
    {
      newXzfyInfo.setStatus("8");
    }
    if (newXzfyInfo.getStatus().equals("11"))
    {
      if (newXzfyInfo.getStadardResult().equals("1"))
      {
        newXzfyInfo.setStatus("4");
      }
      else {
        newXzfyInfo.setStatus("1");
        newXzfyInfo.setStadardResult("0");
      }
    }

  //加入案件识别及状态推送代码
		/*if(newXzfyInfo.getXzfyInfo2id()!=null&&!newXzfyInfo.getXzfyInfo2id().equals("")){
			//判断是否有外网ID，如果有则为外网案件，进行状态为推送。  改变状态为的地方很多，不能只靠在外网保存方法中加
			try{
				DatesentProxy da =new DatesentProxy();  
				String c3=da.updateStatus(newXzfyInfo.getXzfyInfo2id(), newXzfyInfo.getStatus(),newXzfyInfo.getCheck_status());
				//返回值全部用大写“SUCCESS”
				if(c3.equals("SUCCESS")){
					//行政复议表增加同步标志位字段。statechange
					newXzfyInfo.setStatechange("1");
				}else{
					newXzfyInfo.setStatechange("0");
				}
			}catch(Exception e){
				System.out.println(e);
				newXzfyInfo.setStatechange("0");//服务端有问题同步失败
			}
			//同步标志位，外网的改自己的表tb_flag，内网的改自己的xzfyInfo表的tb_flag，不该同一张表，消除影响。
		}*/
    
    
    
    this.recordService.update(newXzfyInfo);
    String op = "取消审批";
    this.recordService.save_log(
      newXzfyInfo.getStatus(), op, this.xzfyId, newXzfyInfo);
    return "success";
  }

  public String finishLianCase() {
    XzfyShenpi shenpiModel = new XzfyShenpi();
    XzfyInfo newXzfyInfo = this.recordService.getXzfyById(this.xzfyInfo.getId());
    checkInfo check = new checkInfo();
    newXzfyInfo = check.check_xzfyInfo(newXzfyInfo, this.xzfyInfo);
    String op = "执行立案操作";
    this.recordService.save_log("2", op, this.xzfyInfo.getId(), newXzfyInfo);
    this.recordService.update(newXzfyInfo);
    if ((this.lashenpiren != null) && (!(this.lashenpiren.equals("")))) {
      shenpiModel.setCheck_name(this.lashenpiren);
      shenpiModel.setCheck_result("1");
      shenpiModel.setCheck_type("3");
      shenpiModel.setCheck_advise(this.lashenpiyijian);
      Date date = new Date();

      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
      String currentTime = dateFormat.format(date);
      shenpiModel.setCheck_date(currentTime);
      shenpiModel.setXzfyInfo(this.xzfyInfo);
      this.recordService.save(shenpiModel);
    }

    return "success";
  }

  
  
  
  
  public String viewCase() {
	 // (applicant != null) && (!(applicant.equals("")
	  if(xzfyId_w !=null&&(!(xzfyId_w.equals("")))){
		  
		  this.xzfyInfo = this.recordService.getXzfyByw_ID(xzfyId_w);
		  this.xzfyId=xzfyInfo.getId();
	  }else{
		  this.xzfyInfo = this.recordService.getXzfyById(this.xzfyId);
			  
		  
	  }
   
    
    Org org = this.recordService.getOrg();
    this.localBm = org.getLocbm();
    return "success";
  }
  public String viewCase_w() {
	    this.xzfyInfo2 = this.recordService.getXzfyById_w(this.xzfyId_w);
	    Org org = this.recordService.getOrg();
	    this.localBm = org.getLocbm();
	    return "success";
	  }

  public List getDocList4()
  {
    return this.docList4;
  }

  public void setDocList4(List docList4) {
    this.docList4 = docList4;
  }

  public List getDocList5() {
    return this.docList5;
  }

  public void setDocList5(List docList5) {
    this.docList5 = docList5;
  }

  public List getDocList6() {
    return this.docList6;
  }

  public void setDocList6(List docList6) {
    this.docList6 = docList6;
  }

  public List getDocList2() {
    return this.docList2;
  }

  public void setDocList2(List docList2) {
    this.docList2 = docList2;
  }

  public List getDocList3() {
    return this.docList3;
  }

  public void setDocList3(List docList3) {
    this.docList3 = docList3;
  }

  public List getDocList() {
    return this.docList;
  }

  public void setDocList(List docList) {
    this.docList = docList;
  }

  public String getTodate()
  {
    Date dt = new Date();
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    this.todate = df.format(dt);
    return this.todate;
  }

  public void setTodate(String todate) {
    this.todate = todate;
  }

  public String shenpiInfo() {
    this.xzfyInfo = this.recordService.getXzfyById(this.xzfyId);
    this.user = new User();
    this.user = 
      ((User)ActionContext.getContext().getSession().get(
      "_USER_LOGIN_"));
    this.admit_name = this.user.getName();
    this.userList = this.recordService.getUserListById(this.user.getOrg().getId().toString());

    this.checkSize = 0;

    Org org = this.recordService.getOrg();
    this.xzfyCom = this.recordService.getXzfyComById(org.getLocbm(), 
      org.getName());

    this.xzfyCheckList = this.recordService.getCheckListByXzfyID(
      this.xzfyId, this.checkDocType);
    this.checkSize = this.xzfyCheckList.size();
    this.docList = new ArrayList();
    this.docList2 = new ArrayList();
    this.docList3 = new ArrayList();
    String sql = "select * from (select * from eweboffice_t_document where caseid='" + 
      this.xzfyId + 
      "' and d_type='shoulitongzhishu' order by d_id desc ) where rownum=1";

    String sql2 = "select * from (select * from eweboffice_t_document where caseid='" + 
      this.xzfyId + 
      "' and d_type='buyushouligaozhishu' order by d_id desc ) where rownum=1";
    if ((this.xzfyInfo.getStadardResult() != null) && 
      (this.xzfyInfo.getStadardResult().equals("2")))
      sql2 = "select * from (select * from eweboffice_t_document where caseid='" + 
        this.xzfyId + 
        "' and d_type='buyushouligaozhishushu' order by d_id desc ) where rownum=1";

    String sql3 = "select * from (select * from eweboffice_t_document where caseid='" + 
      this.xzfyId + 
      "' and d_type='buzhengtongzhishu' order by d_id desc ) where rownum=1";
    this.docList = this.recordService.findListBySQL(sql);
    this.docList2 = this.recordService.findListBySQL(sql2);
    this.docList3 = this.recordService.findListBySQL(sql3);

    this.docList4 = new ArrayList();
    this.docList5 = new ArrayList();
    this.docList6 = new ArrayList();
    String sql4 = "";
    String sql5 = "";
    String sql6 = "";
    if (this.checkDocType.equals("5"))
      sql4 = "select * from (select * from eweboffice_t_document where caseid='" + 
        this.xzfyId + 
        "' and d_type='yanqishenlitongzhishu' order by d_id desc ) where rownum=1";

    if (this.checkDocType.equals("7"))
      sql4 = "select * from (select * from eweboffice_t_document where caseid='" + 
        this.xzfyId + 
        "' and d_type='zhongzhishenlitongzhishu' order by d_id desc ) where rownum=1";

    if (this.checkDocType.equals("9"))
      sql4 = "select * from (select * from eweboffice_t_document where caseid='" + 
        this.xzfyId + 
        "' and d_type='huifushenlitongzhishu' order by d_id desc ) where rownum=1";

    if ((this.checkDocType.equals("11")) && (this.xzfyInfo.getFinish_type() != null)) {
      if (this.xzfyInfo.getFinish_type().equals("7"))
        sql4 = "select * from (select * from eweboffice_t_document where caseid='" + 
          this.xzfyId + 
          "' and d_type='xingzhengfuyitiaojie' order by d_id desc ) where rownum=1";
      else if (this.xzfyInfo.getFinish_type().equals("8"))
        sql4 = "select * from (select * from eweboffice_t_document where caseid='" + 
          this.xzfyId + 
          "' and d_type='xingzhengfuyizhongzhi' order by d_id desc ) where rownum=1";
      else
        sql4 = "select * from (select * from eweboffice_t_document where caseid='" + 
          this.xzfyId + 
          "' and d_type='xingzhengfuyijuedingshu' order by d_id desc ) where rownum=1";
      sql5 = "select * from (select * from eweboffice_t_document where caseid='" + 
        this.xzfyId + 
        "' and d_type='xingzhengfuyiyijianshu' order by d_id desc ) where rownum=1";
      this.docList5 = this.recordService.findListBySQL(sql5);
      sql6 = "select * from (select * from eweboffice_t_document where caseid='" + 
        this.xzfyId + 
        "' and d_type='xingzhengfuyijianyishu' order by d_id desc ) where rownum=1";
      this.docList6 = this.recordService.findListBySQL(sql6);
    }
    if (!(sql4.equals(""))) {
      this.docList4 = this.recordService.findListBySQL(sql4);
    }

    return "success";
  }

  public String shenpiInfoView() {
    this.xzfyInfo = this.recordService.getXzfyById(this.xzfyId);
    this.user = new User();
    this.user = 
      ((User)ActionContext.getContext().getSession().get(
      "_USER_LOGIN_"));
    this.admit_name = this.user.getName();
    this.userList = this.recordService.getUserListById(this.user.getOrg().getId().toString());

    this.xzfyCheckList = this.recordService.getCheckListByXzfyID(
      this.xzfyId, this.checkDocType);
    this.checkSize = 0;
    this.checkSize = this.xzfyCheckList.size();

    return "success";
  }

  public String finishJieanCase() {
    XzfyShenpi shenpiModel = new XzfyShenpi();
    XzfyInfo newXzfyInfo = this.recordService.getXzfyById(this.xzfyInfo.getId());
    checkInfo check = new checkInfo();
    newXzfyInfo = check.check_xzfyInfo(newXzfyInfo, this.xzfyInfo);
    String op = "执行结案操作";
    this.recordService.save_log("11", op, this.xzfyInfo.getId(), newXzfyInfo);
    this.recordService.update(newXzfyInfo);
    if ((this.jashenpiren != null) && (!(this.jashenpiren.equals("")))) {
      shenpiModel.setCheck_name(this.jashenpiren);
      shenpiModel.setCheck_result("1");
      shenpiModel.setCheck_type("11");
      shenpiModel.setCheck_advise(this.jashenpiyijian);
      Date date = new Date();
      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
      String currentTime = dateFormat.format(date);
      shenpiModel.setCheck_date(currentTime);
      shenpiModel.setXzfyInfo(this.xzfyInfo);
      this.recordService.save(shenpiModel);
    }

    return "success";
  }

  public PaginationSupport getList()
  {
    return this.list;
  }

  public void setList(PaginationSupport list) {
    this.list = list;
  }

  public List<XzfyInfo> getXzfyList() {
    return this.xzfyList;
  }

  public void setXzfyList(List<XzfyInfo> xzfyList) {
    this.xzfyList = xzfyList;
  }

  public String getCaseList() throws Exception {
    this.list = this.recordService.getXzfyListByStatus(this.pageNum, this.pageSize);
    this.totalPage = this.list.getTotalPage();
    setXzfyList(this.list.getItems());
    return "success";
  }

  public String openReceive()
  {
    return "success";
  }

  public String getColumn()
  {
    return this.column;
  }

  public void setColumn(String column) {
    this.column = column;
  }

  public String getHead() {
    return "success";
  }

  public String appAnjuView() {
    this.xzfyInfo = this.recordService.getXzfyById(this.xzfyId);
    Set appSet = new HashSet();
    appSet = this.xzfyInfo.getXzfyApps();
    Iterator it = appSet.iterator();
    int i = 0;
    while (it.hasNext()) {
      XzfyApp xzfyApp = new XzfyApp();
      xzfyApp = (XzfyApp)it.next();
      if (i == 0)
        this.appString = xzfyApp.getApp_name();
      else
        this.appString = this.appString + "、" + xzfyApp.getApp_name();
      ++i;
    }

    return "success";
  }

  public String viewMulu() {
    this.xzfyInfo = this.recordService.getXzfyById(this.xzfyId);
    return "success";
  }

  public String getAppString() {
    return this.appString;
  }

  public void setAppString(String appString) {
    this.appString = appString;
  }

  public Class<XzfyInfo> getPersistentClass()
  {
    return XzfyInfo.class;
  }

  public String batchOperation()
  {
    this.user = new User();
    this.user = 
      ((User)ActionContext.getContext().getSession().get(
      "_USER_LOGIN_"));
    this.admit_name = this.user.getName();
    this.userList = this.recordService.getUserListById(this.user.getOrg().getId().toString());

    return "success";
  }

  public String finishOperation()
    throws Exception
  {
    String[] arrayOfString;
    this.xzfyStr = this.ids.replaceAll(" ", "").split(",");

    int j = (arrayOfString = this.xzfyStr).length; for (int i = 0; i < j; ++i) { String id = arrayOfString[i];
      this.xzfyInfo = this.xzfyService.getXzfyById(id);

      this.xzfyShenpi = new XzfyShenpi();
      this.xzfyShenpi.setXzfyInfo(this.xzfyInfo);
      this.xzfyShenpi.setCheck_advise(this.suggestion);
      this.xzfyShenpi.setCheck_result("1");
      this.xzfyShenpi.setCheck_type(this.xzfyInfo.getStatus());
      this.xzfyShenpi.setCheck_date(getCurrentTime());
      this.xzfyShenpi.setCheck_id(getCurrentUser().getId().toString());
      this.xzfyShenpi.setCheck_name(getCurrentUser().getName());
      this.recordService.save(this.xzfyShenpi);

      this.xzfyInfo.setCheck_status("0");
      this.xzfyService.saveXzfyInfo(this.xzfyInfo);
      String op = "完成审批";
      this.recordService.save_log(this.xzfyInfo.getStatus(), op, this.xzfyInfo.getId(), 
        this.recordService.getXzfyById(id));
    }
    return "success";
  }

  public String getFirstDay()
  {
    return this.firstDay;
  }

  public void setFirstDay(String firstDay) {
    this.firstDay = firstDay;
  }

  public String form2Search() {
    Date date = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    this.year = dateFormat.format(date);
    this.firstDay = new SimpleDateFormat("yyyy").format(new Date()) + 
      "-01-01";
    User user = new User();
    user = 
      (User)ActionContext.getContext().getSession().get(
      "_USER_LOGIN_");
    this.userList = this.recordService.getUserListById(user.getOrg().getId().toString());

    this.fileId1 = this.recordService.getOrg().getLocbm();
    this.message = this.recordService.getRootOrg(this.fileId1).getName();
    return "success";
  }

  public String submitOperation()
    throws Exception
  {
    String[] arrayOfString;
    this.xzfyStr = this.ids.replaceAll(" ", "").split(",");

    this.personInfo = this.selectedPerson.replaceAll(" ", "").split(",");
    int j = (arrayOfString = this.xzfyStr).length; for (int i = 0; i < j; ++i) { String id = arrayOfString[i];
      this.xzfyInfo = this.xzfyService.getXzfyById(id);

      this.xzfyShenpi = new XzfyShenpi();
      this.xzfyShenpi.setXzfyInfo(this.xzfyInfo);
      this.xzfyShenpi.setCheck_advise(this.suggestion);
      this.xzfyShenpi.setCheck_result("1");
      this.xzfyShenpi.setCheck_type(this.xzfyInfo.getStatus());
      this.xzfyShenpi.setCheck_date(getCurrentTime());
      this.xzfyShenpi.setCheck_id(getCurrentUser().getId().toString());
      this.xzfyShenpi.setCheck_name(getCurrentUser().getName());
      this.recordService.save(this.xzfyShenpi);

      this.xzfyInfo.setCheck_id(this.personInfo[1]);
      this.xzfyInfo.setCheck_name(this.personInfo[0]);
      this.xzfyService.saveXzfyInfo(this.xzfyInfo);
      String op = "将案件提交给" + this.personInfo[0] + "审批";
      this.recordService.save_log(this.xzfyInfo.getStatus(), op, this.xzfyInfo.getId(), 
        this.recordService.getXzfyById(id));
    }
    return "success";
  }

  public String sendBack()
    throws Exception
  {
    String[] arrayOfString;
    this.xzfyStr = this.ids.replaceAll(" ", "").split(",");

    int j = (arrayOfString = this.xzfyStr).length; for (int i = 0; i < j; ++i) { String id = arrayOfString[i];
      this.xzfyInfo = this.xzfyService.getXzfyById(id);

      this.xzfyShenpi = new XzfyShenpi();
      this.xzfyShenpi.setXzfyInfo(this.xzfyInfo);
      this.xzfyShenpi.setCheck_advise(this.suggestion);
      this.xzfyShenpi.setCheck_result("2");
      this.xzfyShenpi.setCheck_type(this.xzfyInfo.getStatus());
      this.xzfyShenpi.setCheck_date(getCurrentTime());
      this.xzfyShenpi.setCheck_id(getCurrentUser().getId().toString());
      this.xzfyShenpi.setCheck_name(getCurrentUser().getName());
      this.recordService.save(this.xzfyShenpi);

      this.xzfyInfo.setCheck_status("0");
      this.xzfyService.saveXzfyInfo(this.xzfyInfo);
      String op = "将案件退回";
      this.recordService.save_log(this.xzfyInfo.getStatus(), op, this.xzfyInfo.getId(), 
        this.recordService.getXzfyById(id));
    }

    return "success";
  }

  public String getIds()
  {
    return this.ids;
  }

  public void setIds(String ids) {
    this.ids = ids;
  }

  public String getSelectedPerson()
  {
    return this.selectedPerson;
  }

  public void setSelectedPerson(String selectedPerson) {
    this.selectedPerson = selectedPerson;
  }

  public String getSuggestion()
  {
    return this.suggestion;
  }

  public void setSuggestion(String suggestion) {
    this.suggestion = suggestion;
  }

  public XzfyService getXzfyService()
  {
    return this.xzfyService;
  }

  public void setXzfyService(XzfyService xzfyService) {
    this.xzfyService = xzfyService;
  }

  public User getCurrentUser() {
    this.user = new User();
    this.user = 
      ((User)ActionContext.getContext().getSession().get(
      "_USER_LOGIN_"));
    return this.user;
  }

  public String getCurrentTime() {
    Date date = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String currentTime = dateFormat.format(date);
    return currentTime;
  }

  public List<Xw> getXwList() {
    return this.xwList;
  }

  public void setXwList(List<Xw> xwList) {
    this.xwList = xwList;
  }

  public void saveFile(XzfyInfo xzfyInfo) {
    String webRootPath1 = ApplicationPath.getRootPath().replaceAll("\\\\", 
      "\\\\\\\\");

    String fileFlod0 = webRootPath1 + "download";
    File path = new File(fileFlod0);
    if (!(path.exists()))
      path.mkdir();
    File path1 = new File(fileFlod0 + "\\file");
    if (!(path1.exists()))
      path1.mkdir();

    String fnn = "";
    if (this.upFile0 != null)
      try {
        fnn = FileUtil.fileSave(this.upFile0, this.upFile0FileName);
        XzfyInfoFile xif = new XzfyInfoFile();
        xif.setXzfyInfo(xzfyInfo);
        xif.setFileName(this.upFile0FileName);
        xif.setStoredName(fnn);

        xif.setStoredLocation("/download/file/");
        xif.setType("1");
        this.xzfyService.saveOrUpdate(xif);
      } catch (Exception e) {
        e.printStackTrace();
        System.out.println("上传文件出错");
      }


    if ((this.upFile02 != null) && (this.upFile02.length != 0))
      for (int i = 0; i < this.upFile02.length; ) {
        try {
          fnn = FileUtil.fileSave(this.upFile02[i], this.upFile02FileName[i]);
          XzfyInfoFile xif = new XzfyInfoFile();
          xif.setXzfyInfo(xzfyInfo);
          xif.setFileName(this.upFile02FileName[i]);
          xif.setStoredName(fnn);
          xif.setStoredLocation("/download/file/");
          xif.setType("2");
          this.xzfyService.saveOrUpdate(xif);
        } catch (Exception e) {
          e.printStackTrace();
          System.out.println("上传文件出错");
        }
        ++i;
      }
  }

  public String getLocalBm()
  {
    return this.localBm;
  }

  public void setLocalBm(String localBm) {
    this.localBm = localBm;
  }

  public String getLocalName() {
    return this.localName;
  }

  public void setLocalName(String localName) {
    this.localName = localName;
  }

  public List<Beishenqingren> getZlList() {
    return this.zlList;
  }

  public void setZlList(List<Beishenqingren> zlList) {
    this.zlList = zlList;
  }

  public List<Beishenqingren> getbList() {
    return this.bList;
  }

  public void setbList(List<Beishenqingren> bList) {
    this.bList = bList;
  }

  public String getElementId()
  {
    return this.elementId;
  }

  public void setElementId(String elementId) {
    this.elementId = elementId;
  }

  public String getTreeDiv() {
    return this.treeDiv;
  }

  public void setTreeDiv(String treeDiv) {
    this.treeDiv = treeDiv;
  }

  public String getOrgTree() {
    this.treeDiv = this.recordService.getOrgTree();
    return "success";
  }

  public String getOrgTree1() {
    this.treeDiv = this.recordService.getOrgTree1();
    return "success";
  }

  public String getOrgTree2() {
    this.treeDiv = this.recordService.getOrgTree2();
    return "success";
  }

  public String getFileId1() {
    return this.fileId1;
  }

  public void setFileId1(String fileId1) {
    this.fileId1 = fileId1;
  }

  public String getMessage() {
    return this.message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public String getShenpiDate() {
    return this.shenpiDate;
  }

  public void setShenpiDate(String shenpiDate) {
    this.shenpiDate = shenpiDate;
  }

  public String getUserIdString() {
    return this.userIdString;
  }

  public void setUserIdString(String userIdString) {
    this.userIdString = userIdString;
  }

  public int getJieandocsize() {
    return this.jieandocsize;
  }

  public void setJieandocsize(int jieandocsize) {
    this.jieandocsize = jieandocsize;
  }

  public String getJieandoctype() {
    return this.jieandoctype;
  }

  public void setJieandoctype(String jieandoctype) {
    this.jieandoctype = jieandoctype;
  }

  public String changeBuzheng()
    throws IOException
  {
    int i;
    XzfyInfo xzfyInfo = this.recordService.getXzfyById(this.xzfyId);
    String s = "";
    if (this.bzContent != null)
      for (i = 0; i < this.bzContent.length; ++i)
        s = s + this.bzContent[i] + ",";


    s = s + "|";
    if (this.app != null)
      for (i = 0; i < this.app.length; ++i)
        s = s + this.app[i] + ",";


    xzfyInfo.setBuzhengContentType(s);
    this.coreService.update(xzfyInfo);

    ApplicationContext context = new ClassPathXmlApplicationContext(
      "applicationContext.xml");
    Services services = (Services)context.getBean("client");
    InfoDto infoDto = new InfoDto();
    infoDto.setId(this.xzfyId);
    infoDto.setIsBuZheng("1");
    infoDto.setBuzhengContentType(s);

    return "success";
  }

  public void isContent() throws IOException {
    XzfyInfo xzfyInfo = this.recordService.getXzfyById(this.xzfyId);
    this.buzhengcontentType = xzfyInfo.getBuzhengContentType();
    HttpServletResponse response = ServletActionContext.getResponse();
    PrintWriter printWriter = response.getWriter();
    printWriter.print(this.buzhengcontentType);
    printWriter.flush();
    printWriter.close();
  }

  public String[] getBzContent() {
    return this.bzContent;
  }

  public void setBzContent(String[] bzContent) {
    this.bzContent = bzContent;
  }

  public List<XzfyApp> getXzfyApp() {
    return this.xzfyApp;
  }

  public void setXzfyApp(List<XzfyApp> xzfyApp) {
    this.xzfyApp = xzfyApp;
  }

  public String[] getApp() {
    return this.app;
  }

  public void setApp(String[] app) {
    this.app = app;
  }

  public String getBuzhengcontentType() {
    return this.buzhengcontentType;
  }

  public void setBuzhengcontentType(String buzhengcontentType) {
    this.buzhengcontentType = buzhengcontentType;
  }

  public String getBzCon() {
    return this.bzCon;
  }

  public void setBzCon(String bzCon) {
    this.bzCon = bzCon;
  }
  
  /********************邮单套打***********************/
	private String emsStyle;//EMS样式类别
	private String currentYear = new SimpleDateFormat("yyyy").format(new Date());
	private String addedCaseNO = "京政复字〔"+currentYear+"〕 号";
	private String mailDescription;//内件品名
	
	private String sender;//寄件人
	private String senderPhone;//寄件人电话
	private String senderFirm;//寄件人单位
	private String senderAddress;//寄件人地址
	private String senderPostcode;//寄件人邮编
	private String systemDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	
	private String receiver;//收件人
	private String receiverAddress;//寄件人地址
	List<String> appsList;//收件人列表
	List<String> appsDetailList;//收件人信息详细列表
	
	private String corpName;//法人公司名称
	
	public String gotoChooseEMSStyle(){
//		System.out.println(xzfyId);
		return SUCCESS;
	}
	
	public String styleChoseReaction(){
		try{
			user = (User) ActionContext.getContext().getSession()
			.get("_USER_LOGIN_");
			
			sender = user.getName();
			
			senderFirm = "北京市人民政府法制办公室";
			senderAddress = "北京市西城区槐柏树街2号";
			senderPostcode = "100053";
			
			xzfyInfo = recordService.getXzfyById(xzfyId);
//			System.out.println(xzfyId);
			
			String appType = xzfyInfo.getApp_type();
//			System.out.println(appType);
			String detailType;
			
			if(appType.equals("1")){
				detailType = xzfyInfo.getAppdetail();
			}
			else{
				detailType = xzfyInfo.getAgentDetail();
			}
			
			receiver = acquireAppsOrCompanys(detailType,appType,xzfyInfo.getAgent(),xzfyInfo.getAgent_name());
			
			receiverAddress = appsDetailList.get(0).substring(appsDetailList.get(0).lastIndexOf("址")+1);//初始化收件人地址
					
			if(emsStyle.equals("1")){
				return "emsstyle1";
			}
			else{	
				return "emsstyle2";
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
			return ERROR;
		}
	}

	public String acquireAppsOrCompanys(String detailType,String appType,String agentOrNot,String agentName){
		appsList = new ArrayList<String>();
		appsDetailList = new ArrayList<String>();
			
		if(agentOrNot != null && agentOrNot.equals("1")){
			appsList.add("代理人-" + agentName);
		}
		
		
		String appsString="";
		
		if(appType.equals("1")){
			int j = 0;
			String solidApps="";
			String[] wholeInfo = detailType.split("；");					
			for(String appInfo:wholeInfo){													
				String[] segmentsInfo = appInfo.split("，");
				for(int i=0; i<segmentsInfo.length; i++){
					if(i==0){
						if(segmentsInfo[0] == null || segmentsInfo[0].equals("")){
							break;
						}
						else{
							if(appsString.equals("")){
								appsString = segmentsInfo[0];
								appsList.add(segmentsInfo[0]);
								
								if((j+1) == wholeInfo.length){
									appsList.add("其它");
								}
							}
							else{	
								if(wholeInfo.length > 5){
									if(j < 4){
										appsString += "," + segmentsInfo[0];	
										appsList.add(segmentsInfo[0]);
									}
									else if(j == 4){
										appsString += "," + segmentsInfo[0];
										solidApps = appsString;
										appsList.add(segmentsInfo[0]);
									}
									else{									
										appsString = solidApps + "等" + (j+1) +"人";;
										appsList.add(segmentsInfo[0]);
										
										if((j+1) == wholeInfo.length){
											appsList.add("其它");
											appsList.add(0, appsString);
										}
									}
								}
								else{
									appsString += "," + segmentsInfo[0];	
									appsList.add(segmentsInfo[0]);
									
									if((j+1) == wholeInfo.length){
										appsList.add("其它");
										appsList.add(0, appsString);
									}
								}
							}
							
							j++;
						}
					}
					
					break;		
				}
			}	
			
			
			
			for(int k=0; k<wholeInfo.length; k++){
				String dtInfo = wholeInfo[k];
				dtInfo = dtInfo.replaceAll("；", "");
				appsDetailList.add(dtInfo);
				
				if(k == wholeInfo.length-1){
					appsDetailList.add("其它");
				}
			}
			
		}
		else{
//			if(detailType.contains("：")){
//				if(detailType.contains("住所地")){
//					appsList.add(detailType.substring(detailType.lastIndexOf("：")+1, detailType.lastIndexOf("住")-2));
//					appsList.add("其它");
//					String dtAddr = detailType.replaceAll("；", "");
//					appsDetailList.add(dtAddr.substring(dtAddr.lastIndexOf("住所地")+1));
//					appsDetailList.add("其它");
//				}
//				else{
//					appsList.add(detailType.substring(detailType.lastIndexOf("：")+1, detailType.lastIndexOf("；")-1));
//					appsList.add("其它");
//				}
//			}
//			else{
//				appsDetailList.add("其它");
//				appsList.add("其它");
//			}
			String represent = detailType.substring(detailType.lastIndexOf("：")+1, detailType.lastIndexOf("送")-1);
			appsString = "法人代表-"+represent;
			
			appsList.add(0,appsString);
			appsList.add("其它");
			
			String dtAddr = detailType.replaceAll("；", "");
			appsDetailList.add(dtAddr.substring(dtAddr.lastIndexOf("址")+1));
			appsDetailList.add("其它");
			
			corpName = detailType.substring(0, detailType.lastIndexOf("法")-1);
		}
		
		return appsString;
	}
	
	public String getEmsStyle() {
		return emsStyle;
	}

	public void setEmsStyle(String emsStyle) {
		this.emsStyle = emsStyle;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getSenderPhone() {
		return senderPhone;
	}

	public void setSenderPhone(String senderPhone) {
		this.senderPhone = senderPhone;
	}

	public String getSenderAddress() {
		return senderAddress;
	}

	public void setSenderAddress(String senderAddress) {
		this.senderAddress = senderAddress;
	}

	public String getSenderPostcode() {
		return senderPostcode;
	}

	public void setSenderPostcode(String senderPostcode) {
		this.senderPostcode = senderPostcode;
	}

	public String getSenderFirm() {
		return senderFirm;
	}

	public void setSenderFirm(String senderFirm) {
		this.senderFirm = senderFirm;
	}

	public List<String> getAppsList() {
		return appsList;
	}

	public void setAppsList(List<String> appsList) {
		this.appsList = appsList;
	}

	public List<String> getAppsDetailList() {
		return appsDetailList;
	}

	public void setAppsDetailList(List<String> appsDetailList) {
		this.appsDetailList = appsDetailList;
	}

	public String getReceiverAddress() {
		return receiverAddress;
	}

	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}

	public String getAddedCaseNO() {
		return addedCaseNO;
	}

	public void setAddedCaseNO(String addedCaseNO) {
		this.addedCaseNO = addedCaseNO;
	}

	public String getMailDescription() {
		return mailDescription;
	}

	public void setMailDescription(String mailDescription) {
		this.mailDescription = mailDescription;
	}

	public String getCorpName() {
		return corpName;
	}

	public void setCorpName(String corpName) {
		this.corpName = corpName;
	}

	public String getSystemDate() {
		return systemDate;
	}

	public void setSystemDate(String systemDate) {
		this.systemDate = systemDate;
	}	
	
	
	/********************end***********************/
}