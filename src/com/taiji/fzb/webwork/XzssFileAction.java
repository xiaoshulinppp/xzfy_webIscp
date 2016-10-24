package com.taiji.fzb.webwork;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import slime.util.IOStream.IOStream;

import com.opensymphony.xwork.ActionContext;
import com.taiji.archive.domain.Archive;
import com.taiji.archive.service.ArchiveService;
import com.taiji.core.util.ApplicationPath;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.domain.XzssFile;
import com.taiji.fzb.domain.XzssInfo;
import com.taiji.fzb.service.RecordService;
import com.taiji.fzb.service.XzssService;
import com.taiji.user.domain.User;

public class XzssFileAction extends ProtectedDetailAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private XzssFile XzssFile;
	private XzssService xzssService;
	private String xzssId = "";
	private String id = "";
	private String filepath="";
	private List<XzssFile> xzssFileList = new ArrayList<XzssFile>();
	private List<XzssFile> xzssFileList1 = new ArrayList<XzssFile>();
	private Integer list1Size=0;
	private List<XzssFile> xzssFileList2 = new ArrayList<XzssFile>();
	private Integer list2Size=0;
	private List<XzssFile> xzssFileList3 = new ArrayList<XzssFile>();
	private Integer list3Size=0;
	private List<XzssFile> xzssFileList4 = new ArrayList<XzssFile>();
	private Integer list4Size=0;
	private List<XzssFile> xzssFileList5 = new ArrayList<XzssFile>();
	private Integer list5Size=0;
	private List<XzssFile> xzssFileList6 = new ArrayList<XzssFile>();
	private Integer list6Size=0;
	private List<XzssFile> xzssFileList7 = new ArrayList<XzssFile>();
	private Integer list7Size=0;
	private File[] upFile1; // 附件对象
	private String[] upFile1FileName = {};
	private File[] upFile2;
	private String[] upFile2FileName = {};
	private File[] upFile3; // 附件对象
	private String[] upFile3FileName = {};
	private File[] upFile4; // 附件对象
	private String[] upFile4FileName = {};
	private File[] upFile5; // 附件对象
	private String[] upFile5FileName = {};
	private File[] upFile6; // 附件对象
	private String[] upFile6FileName = {};
	private File[] upFile7; // 附件对象
	private String[] upFile7FileName = {};
	private String currentTime = "";
	private User user;
	private RecordService recordService = null;
	private XzssInfo xzssInfo;
	private List fileList;
	private String locbm = "";
	private String fileId="";
	public String showXzssFile() {
		xzssFileList=xzssService.getXzssFileByXzssId(xzssId);
		for (int i = 0; i < xzssFileList.size(); i++) {
			switch (Integer.parseInt(xzssFileList.get(i).getType())) {
			case 1:
				xzssFileList1.add(xzssFileList.get(i));
				list1Size=xzssFileList1.size();
				break;
			case 2:
				xzssFileList2.add(xzssFileList.get(i));
				list2Size=xzssFileList2.size();
				break;
			case 3:
				xzssFileList3.add(xzssFileList.get(i));
				list3Size=xzssFileList3.size();
				break;
			case 4:
				xzssFileList4.add(xzssFileList.get(i));
				list4Size=xzssFileList4.size();
				break;
			case 5:
				xzssFileList5.add(xzssFileList.get(i));
				list5Size=xzssFileList5.size();
				break;
			case 6:
				xzssFileList6.add(xzssFileList.get(i));
				list6Size=xzssFileList6.size();
				break;
			case 7:
				xzssFileList7.add(xzssFileList.get(i));
				list7Size=xzssFileList7.size();
				break;
			}
		}
		xzssInfo=xzssService.getXzssById(xzssId);
		locbm = this.xzssService.getOrg().getLocbm();
		return SUCCESS;
	}
	public String saveXzssFile() {
		String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\",
				"\\\\\\\\");
		String fileFlod = webRootPath + "uploadfiles/xzssanjuan/";
		File path = new File(fileFlod);
		if (!path.exists())
			path.mkdir();
		int num = 1;
		if (upFile1FileName.length != 0) {
			for (int i = 0; i < upFile1FileName.length; i++) {
				String numm = num + "";
				if (numm.length() == 1)
					numm = "0" + numm;
				++num;
				XzssFile xzssFile = new XzssFile();
				String realName = upFile1FileName[i];
				String extension = upFile1FileName[i]
						.substring(upFile1FileName[i].lastIndexOf("."));
				String fileName = Calendar.getInstance().getTimeInMillis()
						+ numm + extension;
				File outFile = new File(fileFlod + fileName);
				IOStream stream = new IOStream();
				stream.writeFileStream(upFile1[i], outFile);
				xzssFile.setId(new SimpleDateFormat("yyyyMMddHHmmssSSS")
						.format(new Date()) + new Random().nextInt(10000));
				xzssFile.setType("1");
				xzssFile.setFileName(realName);
				xzssFile.setFileAnotherName(fileName);
				xzssFile.setFileRelativePath("../uploadfiles/xzssanjuan/" + fileName);
				xzssFile.setFileAbsolutePath(fileFlod + fileName);
				xzssFile.setUploadTime(this.getCurrentTime());
//				System.out.println("userID="+this.getUser().getId().toString());
				xzssFile.setUploadUserId(this.getUser().getId().toString());
				xzssFile.setUploadUserName(this.getUser().getName());
				xzssFile.setXzssId(xzssId);
				xzssService.save(xzssFile);
			}
		}
		if (upFile2FileName.length != 0) {
			for (int i = 0; i < upFile2FileName.length; i++) {
				String numm = num + "";
				if (numm.length() == 1)
					numm = "0" + numm;
				++num;
				XzssFile xzssFile = new XzssFile();
				String realName = upFile2FileName[i];
				String extension = upFile2FileName[i]
						.substring(upFile2FileName[i].lastIndexOf("."));
				String fileName = Calendar.getInstance().getTimeInMillis()
						+ numm + extension;
				File outFile = new File(fileFlod + fileName);
				IOStream stream = new IOStream();
				stream.writeFileStream(upFile2[i], outFile);
				xzssFile.setId(new SimpleDateFormat("yyyyMMddHHmmssSSS")
						.format(new Date()) + new Random().nextInt(10000));
				xzssFile.setType("2");
				xzssFile.setFileName(realName);
				xzssFile.setFileAnotherName(fileName);
				xzssFile.setFileRelativePath("../uploadfiles/xzssanjuan/" + fileName);
				xzssFile.setFileAbsolutePath(fileFlod + fileName);
				xzssFile.setUploadTime(this.getCurrentTime());
//				System.out.println("userID="+this.getUser().getId().toString());
				xzssFile.setUploadUserId(this.getUser().getId().toString());
				xzssFile.setUploadUserName(this.getUser().getName());
				xzssFile.setXzssId(xzssId);
				xzssService.save(xzssFile);
			}
		}
		if (upFile3FileName.length != 0) {
			for (int i = 0; i < upFile3FileName.length; i++) {
				String numm = num + "";
				if (numm.length() == 1)
					numm = "0" + numm;
				++num;
				XzssFile xzssFile = new XzssFile();
				String realName = upFile3FileName[i];
				String extension = upFile3FileName[i]
						.substring(upFile3FileName[i].lastIndexOf("."));
				String fileName = Calendar.getInstance().getTimeInMillis()
						+ numm + extension;
				File outFile = new File(fileFlod + fileName);
				IOStream stream = new IOStream();
				stream.writeFileStream(upFile3[i], outFile);
				xzssFile.setId(new SimpleDateFormat("yyyyMMddHHmmssSSS")
						.format(new Date()) + new Random().nextInt(10000));
				xzssFile.setType("3");
				xzssFile.setFileName(realName);
				xzssFile.setFileAnotherName(fileName);
				xzssFile.setFileRelativePath("../uploadfiles/xzssanjuan/" + fileName);
				xzssFile.setFileAbsolutePath(fileFlod + fileName);
				xzssFile.setUploadTime(this.getCurrentTime());
//				System.out.println("userID="+this.getUser().getId().toString());
				xzssFile.setUploadUserId(this.getUser().getId().toString());
				xzssFile.setUploadUserName(this.getUser().getName());
				xzssFile.setXzssId(xzssId);
				xzssService.save(xzssFile);
			}
		}
		if (upFile4FileName.length != 0) {
			for (int i = 0; i < upFile4FileName.length; i++) {
				String numm = num + "";
				if (numm.length() == 1)
					numm = "0" + numm;
				++num;
				XzssFile xzssFile = new XzssFile();
				String realName = upFile4FileName[i];
				String extension = upFile4FileName[i]
						.substring(upFile4FileName[i].lastIndexOf("."));
				String fileName = Calendar.getInstance().getTimeInMillis()
						+ numm + extension;
				File outFile = new File(fileFlod + fileName);
				IOStream stream = new IOStream();
				stream.writeFileStream(upFile4[i], outFile);
				xzssFile.setId(new SimpleDateFormat("yyyyMMddHHmmssSSS")
						.format(new Date()) + new Random().nextInt(10000));
				xzssFile.setType("4");
				xzssFile.setFileName(realName);
				xzssFile.setFileAnotherName(fileName);
				xzssFile.setFileRelativePath("../uploadfiles/xzssanjuan/" + fileName);
				xzssFile.setFileAbsolutePath(fileFlod + fileName);
				xzssFile.setUploadTime(this.getCurrentTime());
//				System.out.println("userID="+this.getUser().getId().toString());
				xzssFile.setUploadUserId(this.getUser().getId().toString());
				xzssFile.setUploadUserName(this.getUser().getName());
				xzssFile.setXzssId(xzssId);
				xzssService.save(xzssFile);
			}
		}
		if (upFile5FileName.length != 0) {
			for (int i = 0; i < upFile5FileName.length; i++) {
				String numm = num + "";
				if (numm.length() == 1)
					numm = "0" + numm;
				++num;
				XzssFile xzssFile = new XzssFile();
				String realName = upFile5FileName[i];
				String extension = upFile5FileName[i]
						.substring(upFile5FileName[i].lastIndexOf("."));
				String fileName = Calendar.getInstance().getTimeInMillis()
						+ numm + extension;
				File outFile = new File(fileFlod + fileName);
				IOStream stream = new IOStream();
				stream.writeFileStream(upFile5[i], outFile);
				xzssFile.setId(new SimpleDateFormat("yyyyMMddHHmmssSSS")
						.format(new Date()) + new Random().nextInt(10000));
				xzssFile.setType("5");
				xzssFile.setFileName(realName);
				xzssFile.setFileAnotherName(fileName);
				xzssFile.setFileRelativePath("../uploadfiles/xzssanjuan/" + fileName);
				xzssFile.setFileAbsolutePath(fileFlod + fileName);
				xzssFile.setUploadTime(this.getCurrentTime());
//				System.out.println("userID="+this.getUser().getId().toString());
				xzssFile.setUploadUserId(this.getUser().getId().toString());
				xzssFile.setUploadUserName(this.getUser().getName());
				xzssFile.setXzssId(xzssId);
				xzssService.save(xzssFile);
			}
		}
		if (upFile6FileName.length != 0) {
			for (int i = 0; i < upFile6FileName.length; i++) {
				String numm = num + "";
				if (numm.length() == 1)
					numm = "0" + numm;
				++num;
				XzssFile xzssFile = new XzssFile();
				String realName = upFile6FileName[i];
				String extension = upFile6FileName[i]
						.substring(upFile6FileName[i].lastIndexOf("."));
				String fileName = Calendar.getInstance().getTimeInMillis()
						+ numm + extension;
				File outFile = new File(fileFlod + fileName);
				IOStream stream = new IOStream();
				stream.writeFileStream(upFile6[i], outFile);
				xzssFile.setId(new SimpleDateFormat("yyyyMMddHHmmssSSS")
						.format(new Date()) + new Random().nextInt(10000));
				xzssFile.setType("6");
				xzssFile.setFileName(realName);
				xzssFile.setFileAnotherName(fileName);
				xzssFile.setFileRelativePath("../uploadfiles/xzssanjuan/" + fileName);
				xzssFile.setFileAbsolutePath(fileFlod + fileName);
				xzssFile.setUploadTime(this.getCurrentTime());
//				System.out.println("userID="+this.getUser().getId().toString());
				xzssFile.setUploadUserId(this.getUser().getId().toString());
				xzssFile.setUploadUserName(this.getUser().getName());
				xzssFile.setXzssId(xzssId);
				xzssService.save(xzssFile);
			}
		}
		if (upFile7FileName.length != 0) {
			for (int i = 0; i < upFile7FileName.length; i++) {
				String numm = num + "";
				if (numm.length() == 1)
					numm = "0" + numm;
				++num;
				XzssFile xzssFile = new XzssFile();
				String realName = upFile7FileName[i];
				String extension = upFile7FileName[i]
						.substring(upFile7FileName[i].lastIndexOf("."));
				String fileName = Calendar.getInstance().getTimeInMillis()
						+ numm + extension;
				File outFile = new File(fileFlod + fileName);
				IOStream stream = new IOStream();
				stream.writeFileStream(upFile7[i], outFile);
				xzssFile.setId(new SimpleDateFormat("yyyyMMddHHmmssSSS")
						.format(new Date()) + new Random().nextInt(10000));
				xzssFile.setType("7");
				xzssFile.setFileName(realName);
				xzssFile.setFileAnotherName(fileName);
				xzssFile.setFileRelativePath("../uploadfiles/xzssanjuan/" + fileName);
				xzssFile.setFileAbsolutePath(fileFlod + fileName);
				xzssFile.setUploadTime(this.getCurrentTime());
//				System.out.println("userID="+this.getUser().getId().toString());
				xzssFile.setUploadUserId(this.getUser().getId().toString());
				xzssFile.setUploadUserName(this.getUser().getName());
				xzssFile.setXzssId(xzssId);
				xzssService.save(xzssFile);
			}
		}
		return SUCCESS;
	}
	public String deleteXzssFile() {
		xzssService.deleteXzssFile(fileId);
		return SUCCESS;
	}
	public String downloadFile(){
	    //System.out.println("111111111111");
		return SUCCESS;
	}
	public XzssFile getXzssFile() {
		return XzssFile;
	}


	public void setXzssFile(XzssFile xzssFile) {
		XzssFile = xzssFile;
	}


	public XzssService getXzssService() {
		return xzssService;
	}


	public void setXzssService(XzssService xzssService) {
		this.xzssService = xzssService;
	}


	public String getXzssId() {
		return xzssId;
	}


	public void setXzssId(String xzssId) {
		this.xzssId = xzssId;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public List<XzssFile> getXzssFileList() {
		return xzssFileList;
	}


	public void setXzssFileList(List<XzssFile> xzssFileList) {
		this.xzssFileList = xzssFileList;
	}


	public List<XzssFile> getXzssFileList1() {
		return xzssFileList1;
	}


	public void setXzssFileList1(List<XzssFile> xzssFileList1) {
		this.xzssFileList1 = xzssFileList1;
	}


	public File[] getUpFile1() {
		return upFile1;
	}


	public void setUpFile1(File[] upFile1) {
		this.upFile1 = upFile1;
	}


	public String[] getUpFile1FileName() {
		return upFile1FileName;
	}


	public void setUpFile1FileName(String[] upFile1FileName) {
		this.upFile1FileName = upFile1FileName;
	}


	public String getCurrentTime() {
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	}


	public void setCurrentTime(String currentTime) {
		this.currentTime = currentTime;
	}


	public User getUser() {
		user = (User) ActionContext.getContext().getSession()
				.get("_USER_LOGIN_");
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public RecordService getRecordService() {
		return recordService;
	}


	public void setRecordService(RecordService recordService) {
		this.recordService = recordService;
	}


	public XzssInfo getXzssInfo() {
		return xzssInfo;
	}


	public void setXzssInfo(XzssInfo xzssInfo) {
		this.xzssInfo = xzssInfo;
	}


	public List getFileList() {
		return fileList;
	}


	public void setFileList(List fileList) {
		this.fileList = fileList;
	}


	public String getLocbm() {
		return locbm;
	}


	public void setLocbm(String locbm) {
		this.locbm = locbm;
	}


	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	
	
	public List<XzssFile> getXzssFileList2() {
		return xzssFileList2;
	}
	public void setXzssFileList2(List<XzssFile> xzssFileList2) {
		this.xzssFileList2 = xzssFileList2;
	}
	public List<XzssFile> getXzssFileList3() {
		return xzssFileList3;
	}
	public void setXzssFileList3(List<XzssFile> xzssFileList3) {
		this.xzssFileList3 = xzssFileList3;
	}
	public List<XzssFile> getXzssFileList4() {
		return xzssFileList4;
	}
	public void setXzssFileList4(List<XzssFile> xzssFileList4) {
		this.xzssFileList4 = xzssFileList4;
	}
	public List<XzssFile> getXzssFileList5() {
		return xzssFileList5;
	}
	public void setXzssFileList5(List<XzssFile> xzssFileList5) {
		this.xzssFileList5 = xzssFileList5;
	}
	public List<XzssFile> getXzssFileList6() {
		return xzssFileList6;
	}
	public void setXzssFileList6(List<XzssFile> xzssFileList6) {
		this.xzssFileList6 = xzssFileList6;
	}
	public List<XzssFile> getXzssFileList7() {
		return xzssFileList7;
	}
	public void setXzssFileList7(List<XzssFile> xzssFileList7) {
		this.xzssFileList7 = xzssFileList7;
	}
	public File[] getUpFile2() {
		return upFile2;
	}
	public void setUpFile2(File[] upFile2) {
		this.upFile2 = upFile2;
	}
	public String[] getUpFile2FileName() {
		return upFile2FileName;
	}
	public void setUpFile2FileName(String[] upFile2FileName) {
		this.upFile2FileName = upFile2FileName;
	}
	public File[] getUpFile3() {
		return upFile3;
	}
	public void setUpFile3(File[] upFile3) {
		this.upFile3 = upFile3;
	}
	public String[] getUpFile3FileName() {
		return upFile3FileName;
	}
	public void setUpFile3FileName(String[] upFile3FileName) {
		this.upFile3FileName = upFile3FileName;
	}
	public File[] getUpFile4() {
		return upFile4;
	}
	public void setUpFile4(File[] upFile4) {
		this.upFile4 = upFile4;
	}
	public String[] getUpFile4FileName() {
		return upFile4FileName;
	}
	public void setUpFile4FileName(String[] upFile4FileName) {
		this.upFile4FileName = upFile4FileName;
	}
	public File[] getUpFile5() {
		return upFile5;
	}
	public void setUpFile5(File[] upFile5) {
		this.upFile5 = upFile5;
	}
	public String[] getUpFile5FileName() {
		return upFile5FileName;
	}
	public void setUpFile5FileName(String[] upFile5FileName) {
		this.upFile5FileName = upFile5FileName;
	}
	public File[] getUpFile6() {
		return upFile6;
	}
	public void setUpFile6(File[] upFile6) {
		this.upFile6 = upFile6;
	}
	public String[] getUpFile6FileName() {
		return upFile6FileName;
	}
	public void setUpFile6FileName(String[] upFile6FileName) {
		this.upFile6FileName = upFile6FileName;
	}
	public File[] getUpFile7() {
		return upFile7;
	}
	public void setUpFile7(File[] upFile7) {
		this.upFile7 = upFile7;
	}
	public String[] getUpFile7FileName() {
		return upFile7FileName;
	}
	public void setUpFile7FileName(String[] upFile7FileName) {
		this.upFile7FileName = upFile7FileName;
	}
	
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
	public Integer getList1Size() {
		return list1Size;
	}
	public void setList1Size(Integer list1Size) {
		this.list1Size = list1Size;
	}
	
	public Integer getList2Size() {
		return list2Size;
	}
	public void setList2Size(Integer list2Size) {
		this.list2Size = list2Size;
	}
	public Integer getList3Size() {
		return list3Size;
	}
	public void setList3Size(Integer list3Size) {
		this.list3Size = list3Size;
	}
	public Integer getList4Size() {
		return list4Size;
	}
	public void setList4Size(Integer list4Size) {
		this.list4Size = list4Size;
	}
	public Integer getList5Size() {
		return list5Size;
	}
	public void setList5Size(Integer list5Size) {
		this.list5Size = list5Size;
	}
	public Integer getList6Size() {
		return list6Size;
	}
	public void setList6Size(Integer list6Size) {
		this.list6Size = list6Size;
	}
	public Integer getList7Size() {
		return list7Size;
	}
	public void setList7Size(Integer list7Size) {
		this.list7Size = list7Size;
	}
	@Override
	public Class getPersistentClass() {
		// TODO Auto-generated method stub
		return null;
	}

}
