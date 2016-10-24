package com.taiji.archive.webwork;

import java.io.File;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import slime.util.IOStream.IOStream;

import com.dataSync.model.ArchiveDto;
import com.dataSync.service.Services;
import com.dataSync.util.ArchiveDtoToArchive;
import com.dataSync.util.ArchiveToArchiveDto;
import com.opensymphony.xwork.ActionContext;
import com.taiji.archive.domain.Archive;
import com.taiji.archive.service.ArchiveService;
import com.taiji.core.util.ApplicationPath;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.domain.XzfyXcdc;
import com.taiji.fzb.service.RecordService;
import com.taiji.user.domain.User;

public class ArchiveAction extends ProtectedDetailAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Archive archive;
	private ArchiveService archiveService;
	private String xzfyId = "";
	private String id = "";
	private List<Archive> archiveList = new ArrayList<Archive>();
	private List<Archive> archiveList1 = new ArrayList<Archive>();// 申请书
	private List<Archive> archiveList2 = new ArrayList<Archive>();// 收件登记材料
	private List<Archive> archiveList3 = new ArrayList<Archive>();// 申请人提交的其他材料
	private List<Archive> archiveList4 = new ArrayList<Archive>();// 申请人补正材料
	private List<Archive> archiveList5 = new ArrayList<Archive>();// 阅卷笔录、阅卷意见及材料
	private List<Archive> archiveList6 = new ArrayList<Archive>();// 被申请人答复书
	private List<Archive> archiveList7 = new ArrayList<Archive>();// 被申请人证据材料
	private List<Archive> archiveList8 = new ArrayList<Archive>();// 被申请人补充材料
	private List<Archive> archiveList9 = new ArrayList<Archive>();// 第三人有关材料
	private List<Archive> archiveList10 = new ArrayList<Archive>();// 复议机构制作获取的材料
	private List<Archive> archiveList11 = new ArrayList<Archive>();// 正卷其他材料
	private List<Archive> archiveList12 = new ArrayList<Archive>();// 副卷材料
	private List<Archive> archiveList13 = new ArrayList<Archive>();// 结案文书
	private List<Archive> archiveList14 = new ArrayList<Archive>();// 在线申请人材料
	private List<Archive> archiveList15 = new ArrayList<Archive>();// 在线申请人补正材料
	private File[] upFile1; // 附件对象
	private String[] upFile1FileName = {}; // 附件对象名称
	private File[] upFile2; // 附件对象
	private String[] upFile2FileName = {}; // 附件对象名称
	private File[] upFile3; // 附件对象
	private String[] upFile3FileName = {}; // 附件对象名称
	private File[] upFile4; // 附件对象
	private String[] upFile4FileName = {}; // 附件对象名称
	private File[] upFile5; // 附件对象
	private String[] upFile5FileName = {}; // 附件对象名称
	private File[] upFile6; // 附件对象
	private String[] upFile6FileName = {}; // 附件对象名称
	private File[] upFile7; // 附件对象
	private String[] upFile7FileName = {}; // 附件对象名称
	private File[] upFile8; // 附件对象
	private String[] upFile8FileName = {}; // 附件对象名称
	private File[] upFile9; // 附件对象
	private String[] upFile9FileName = {}; // 附件对象名称
	private File[] upFile10; // 附件对象
	private String[] upFile10FileName = {}; // 附件对象名称
	private File[] upFile11; // 附件对象
	private String[] upFile11FileName = {}; // 附件对象名称
	private File[] upFile12; // 附件对象
	private String[] upFile12FileName = {}; // 附件对象名称
	private File[] upFile13; // 附件对象
	private String[] upFile13FileName = {}; // 附件对象名称
	private String currentTime = "";
	private User user;
	private RecordService recordService = null;
	private XzfyInfo xzfyInfo;
	private List fileList;
	private List fileList1;
	private String locbm = "";
	private int jieandocsize = 0;
	private String jieandoctype = "";

	@SuppressWarnings("unchecked")
	public String showArchiveList() {
		archiveList = archiveService.getArchivesByXzfyId(xzfyId);
		for (int i = 0; i < archiveList.size(); i++) {
			switch (Integer.parseInt(archiveList.get(i).getType())) {
			case 1:
				archiveList1.add(archiveList.get(i));
				break;
			case 2:
				archiveList2.add(archiveList.get(i));
				break;
			case 3:
				archiveList3.add(archiveList.get(i));
				break;
			case 4:
				archiveList4.add(archiveList.get(i));
				break;
			case 5:
				archiveList5.add(archiveList.get(i));
				break;
			case 6:
				archiveList6.add(archiveList.get(i));
				break;
			case 7:
				archiveList7.add(archiveList.get(i));
				break;
			case 8:
				archiveList8.add(archiveList.get(i));
				break;
			case 9:
				archiveList9.add(archiveList.get(i));
				break;
			case 10:
				archiveList10.add(archiveList.get(i));
				break;
			case 11:
				archiveList11.add(archiveList.get(i));
				break;
			case 12:
				archiveList12.add(archiveList.get(i));
				break;
			case 13:
				archiveList13.add(archiveList.get(i));
				break;
			}
		}
		// 获取在线复议申请人上传的材料
		String hqlZxfyArc = "from Archive a where a.xzfyId='"
				+ xzfyId
				+ "' and a.fileName not like '(补证)%' and (a.type='3' or a.type='14' or a.type='15' or a.type='16' or a.type='17' or a.type='18' or a.type='19')";
		archiveList14 = archiveService.find(hqlZxfyArc);
		// 获取在线复议申请人上传的补正材料
		String hqlZxfyBzArc = "from Archive a where a.xzfyId='"
				+ xzfyId
				+ "' and a.fileName like '(补证)%' and (a.type='3' or a.type='14' or a.type='15' or a.type='16' or a.type='17' or a.type='18' or a.type='19')";
		archiveList15 = archiveService.find(hqlZxfyBzArc);
		// 取案卷管理功能上线之前的案卷
		xzfyInfo = recordService.getXzfyById(xzfyId);
		String hql = "from XzfyInfoFile file where file.xzfyInfo.id='"
				+ xzfyInfo.getId() + "' and file.type='1'";
		fileList = recordService.find(hql);
		String hql1 = "from XzfyInfoFile file where file.xzfyInfo.id='"
				+ xzfyInfo.getId() + "' and file.type='2'";
		fileList1 = recordService.find(hql1);
		// 只有本单位才可操作案卷
		locbm = this.recordService.getOrg().getLocbm();

		// 结案文书
		String docjieanSql = "select d_type from (select * from eweboffice_t_document where caseid='"
				+ xzfyId
				+ "' and (d_type='buyushouligaozhishushu' or d_type='buyushouligaozhishu' or d_type='xingzhengfuyijuedingshu' or d_type='xingzhengfuyitiaojie' or d_type='xingzhengfuyizhongzhi') order by d_id desc ) where rownum=1";
		List listdocjiean = this.recordService.findListBySQL(docjieanSql);
		jieandocsize = listdocjiean.size();
		if (jieandocsize != 0)
			jieandoctype = (String) listdocjiean.get(0);

		return SUCCESS;
	}

	/**
	 * 更改在线复议案卷可查看状态并将该状态同步到在线复议
	 * 
	 * @author 武金磊
	 * @return
	 */
	public String updateStatus() {
		Archive archive = (Archive) this.coreService.loadEntityObjectById(
				Archive.class, id);
		if (archive.getStatus() != null) {
			if (archive.getStatus().equals("0")) {
				archive.setStatus("1");
			} else {
				archive.setStatus("0");
			}
		} else {
			archive.setStatus("1");
		}
		// 同步案卷材料的状态
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		Services services = (Services) context.getBean("client");
		int flag = services.updateStatus(id, archive.getStatus());
		if (flag == 1) {
			this.coreService.update(archive);
		}
		return SUCCESS;
	}

	/**
	 * 更改行政复议同步到在线复议材料的可查看状态
	 * 
	 * @return
	 */
	public String updateXzfyStatus() {
		Archive archive = (Archive) this.coreService.loadEntityObjectById(
				Archive.class, id);
		if (archive.getStatus() != null) {
			if (archive.getStatus().equals("0")) {
				archive.setStatus("1");
			} else {
				archive.setStatus("0");
			}
		} else {
			archive.setStatus("1");
		}
		// 同步案卷材料的状态
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		Services services = (Services) context.getBean("client");
		int flag = services.updateXzfyStatus(id, archive.getStatus());
		if (flag == 1) {
			this.coreService.update(archive);
		}
		return SUCCESS;
	}

	/**
	 * 同步案卷材料到在线复议
	 * 
	 * @return
	 */
	public String archiveToZxfy() {
		Archive archive = (Archive) this.coreService.loadEntityObjectById(
				Archive.class, id);
		ArchiveDto archiveDto = new ArchiveDto();
		ArchiveToArchiveDto.modelToDto(archiveDto, archive);
		// 同步材料
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		Services services = (Services) context.getBean("client");
		int flag = services.archiveSync(archiveDto);
		if (flag == 1) {
			archive.setFlag("1");
			this.coreService.update(archive);
		}
		return SUCCESS;
	}

	public String saveArchives() {
		// archive = archiveService.getArchiveById(id);
		String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\",
				"\\\\\\\\");
		String fileFlod = webRootPath + "uploadfiles/anjuan/";
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
				Archive archive = new Archive();
				String realName = upFile1FileName[i];
				String extension = upFile1FileName[i]
						.substring(upFile1FileName[i].lastIndexOf("."));
				String fileName = Calendar.getInstance().getTimeInMillis()
						+ numm + extension;
				File outFile = new File(fileFlod + fileName);
				IOStream stream = new IOStream();
				stream.writeFileStream(upFile1[i], outFile);
				archive.setId(new SimpleDateFormat("yyyyMMddHHmmssSSS")
						.format(new Date()) + new Random().nextInt(10000));
				archive.setType("1");
				archive.setFileName(realName);
				archive.setFileAnotherName(fileName);
				archive.setFileRelativePath("../uploadfiles/anjuan/" + fileName);
				archive.setFileAbsolutePath(fileFlod + fileName);
				archive.setUploadTime(this.getCurrentTime());
				archive.setUploadUserId(this.getUser().getId().toString());
				archive.setUploadUserName(this.getUser().getName());
				archive.setXzfyId(xzfyId);
				archiveService.save(archive);
			}
		}
		if (upFile2FileName.length != 0) {
			for (int i = 0; i < upFile2FileName.length; i++) {
				String numm = num + "";
				if (numm.length() == 1)
					numm = "0" + numm;
				++num;
				Archive archive = new Archive();
				String realName = upFile2FileName[i];
				String extension = upFile2FileName[i]
						.substring(upFile2FileName[i].lastIndexOf("."));
				String fileName = Calendar.getInstance().getTimeInMillis()
						+ numm + extension;
				File outFile = new File(fileFlod + fileName);
				IOStream stream = new IOStream();
				stream.writeFileStream(upFile2[i], outFile);
				archive.setId(new SimpleDateFormat("yyyyMMddHHmmssSSS")
						.format(new Date()) + new Random().nextInt(10000));
				archive.setType("2");
				archive.setFileName(realName);
				archive.setFileAnotherName(fileName);
				archive.setFileRelativePath("../uploadfiles/anjuan/" + fileName);
				archive.setFileAbsolutePath(fileFlod + fileName);
				archive.setUploadTime(this.getCurrentTime());
				archive.setUploadUserId(this.getUser().getId().toString());
				archive.setUploadUserName(this.getUser().getName());
				archive.setXzfyId(xzfyId);
				archiveService.save(archive);
			}
		}
		if (upFile3FileName.length != 0) {
			for (int i = 0; i < upFile3FileName.length; i++) {
				String numm = num + "";
				if (numm.length() == 1)
					numm = "0" + numm;
				++num;
				Archive archive = new Archive();
				String realName = upFile3FileName[i];
				String extension = upFile3FileName[i]
						.substring(upFile3FileName[i].lastIndexOf("."));
				String fileName = Calendar.getInstance().getTimeInMillis()
						+ numm + extension;
				File outFile = new File(fileFlod + fileName);
				IOStream stream = new IOStream();
				stream.writeFileStream(upFile3[i], outFile);
				archive.setId(new SimpleDateFormat("yyyyMMddHHmmssSSS")
						.format(new Date()) + new Random().nextInt(10000));
				archive.setType("3");
				archive.setFileName(realName);
				archive.setFileAnotherName(fileName);
				archive.setFileRelativePath("../uploadfiles/anjuan/" + fileName);
				archive.setFileAbsolutePath(fileFlod + fileName);
				archive.setUploadTime(this.getCurrentTime());
				archive.setUploadUserId(this.getUser().getId().toString());
				archive.setUploadUserName(this.getUser().getName());
				archive.setXzfyId(xzfyId);
				archiveService.save(archive);
			}
		}
		if (upFile4FileName.length != 0) {
			for (int i = 0; i < upFile4FileName.length; i++) {
				String numm = num + "";
				if (numm.length() == 1)
					numm = "0" + numm;
				++num;
				Archive archive = new Archive();
				String realName = upFile4FileName[i];
				String extension = upFile4FileName[i]
						.substring(upFile4FileName[i].lastIndexOf("."));
				String fileName = Calendar.getInstance().getTimeInMillis()
						+ numm + extension;
				File outFile = new File(fileFlod + fileName);
				IOStream stream = new IOStream();
				stream.writeFileStream(upFile4[i], outFile);
				archive.setId(new SimpleDateFormat("yyyyMMddHHmmssSSS")
						.format(new Date()) + new Random().nextInt(10000));
				archive.setType("4");
				archive.setFileName(realName);
				archive.setFileAnotherName(fileName);
				archive.setFileRelativePath("../uploadfiles/anjuan/" + fileName);
				archive.setFileAbsolutePath(fileFlod + fileName);
				archive.setUploadTime(this.getCurrentTime());
				archive.setUploadUserId(this.getUser().getId().toString());
				archive.setUploadUserName(this.getUser().getName());
				archive.setXzfyId(xzfyId);
				archiveService.save(archive);
			}
		}
		if (upFile5FileName.length != 0) {
			for (int i = 0; i < upFile5FileName.length; i++) {
				String numm = num + "";
				if (numm.length() == 1)
					numm = "0" + numm;
				++num;
				Archive archive = new Archive();
				String realName = upFile5FileName[i];
				String extension = upFile5FileName[i]
						.substring(upFile5FileName[i].lastIndexOf("."));
				String fileName = Calendar.getInstance().getTimeInMillis()
						+ numm + extension;
				File outFile = new File(fileFlod + fileName);
				IOStream stream = new IOStream();
				stream.writeFileStream(upFile5[i], outFile);
				archive.setId(new SimpleDateFormat("yyyyMMddHHmmssSSS")
						.format(new Date()) + new Random().nextInt(10000));
				archive.setType("5");
				archive.setFileName(realName);
				archive.setFileAnotherName(fileName);
				archive.setFileRelativePath("../uploadfiles/anjuan/" + fileName);
				archive.setFileAbsolutePath(fileFlod + fileName);
				archive.setUploadTime(this.getCurrentTime());
				archive.setUploadUserId(this.getUser().getId().toString());
				archive.setUploadUserName(this.getUser().getName());
				archive.setXzfyId(xzfyId);
				archiveService.save(archive);
			}
		}
		if (upFile6FileName.length != 0) {
			for (int i = 0; i < upFile6FileName.length; i++) {
				String numm = num + "";
				if (numm.length() == 1)
					numm = "0" + numm;
				++num;
				Archive archive = new Archive();
				String realName = upFile6FileName[i];
				String extension = upFile6FileName[i]
						.substring(upFile6FileName[i].lastIndexOf("."));
				String fileName = Calendar.getInstance().getTimeInMillis()
						+ numm + extension;
				File outFile = new File(fileFlod + fileName);
				IOStream stream = new IOStream();
				stream.writeFileStream(upFile6[i], outFile);
				archive.setId(new SimpleDateFormat("yyyyMMddHHmmssSSS")
						.format(new Date()) + new Random().nextInt(10000));
				archive.setType("6");
				archive.setFileName(realName);
				archive.setFileAnotherName(fileName);
				archive.setFileRelativePath("../uploadfiles/anjuan/" + fileName);
				archive.setFileAbsolutePath(fileFlod + fileName);
				archive.setUploadTime(this.getCurrentTime());
				archive.setUploadUserId(this.getUser().getId().toString());
				archive.setUploadUserName(this.getUser().getName());
				archive.setXzfyId(xzfyId);
				archiveService.save(archive);
			}
		}
		if (upFile7FileName.length != 0) {
			for (int i = 0; i < upFile7FileName.length; i++) {
				String numm = num + "";
				if (numm.length() == 1)
					numm = "0" + numm;
				++num;
				Archive archive = new Archive();
				String realName = upFile7FileName[i];
				String extension = upFile7FileName[i]
						.substring(upFile7FileName[i].lastIndexOf("."));
				String fileName = Calendar.getInstance().getTimeInMillis()
						+ numm + extension;
				File outFile = new File(fileFlod + fileName);
				IOStream stream = new IOStream();
				stream.writeFileStream(upFile7[i], outFile);
				archive.setId(new SimpleDateFormat("yyyyMMddHHmmssSSS")
						.format(new Date()) + new Random().nextInt(10000));
				archive.setType("7");
				archive.setFileName(realName);
				archive.setFileAnotherName(fileName);
				archive.setFileRelativePath("../uploadfiles/anjuan/" + fileName);
				archive.setFileAbsolutePath(fileFlod + fileName);
				archive.setUploadTime(this.getCurrentTime());
				archive.setUploadUserId(this.getUser().getId().toString());
				archive.setUploadUserName(this.getUser().getName());
				archive.setXzfyId(xzfyId);
				archiveService.save(archive);
			}
		}
		if (upFile8FileName.length != 0) {
			for (int i = 0; i < upFile8FileName.length; i++) {
				String numm = num + "";
				if (numm.length() == 1)
					numm = "0" + numm;
				++num;
				Archive archive = new Archive();
				String realName = upFile8FileName[i];
				String extension = upFile8FileName[i]
						.substring(upFile8FileName[i].lastIndexOf("."));
				String fileName = Calendar.getInstance().getTimeInMillis()
						+ numm + extension;
				File outFile = new File(fileFlod + fileName);
				IOStream stream = new IOStream();
				stream.writeFileStream(upFile8[i], outFile);
				archive.setId(new SimpleDateFormat("yyyyMMddHHmmssSSS")
						.format(new Date()) + new Random().nextInt(10000));
				archive.setType("8");
				archive.setFileName(realName);
				archive.setFileAnotherName(fileName);
				archive.setFileRelativePath("../uploadfiles/anjuan/" + fileName);
				archive.setFileAbsolutePath(fileFlod + fileName);
				archive.setUploadTime(this.getCurrentTime());
				archive.setUploadUserId(this.getUser().getId().toString());
				archive.setUploadUserName(this.getUser().getName());
				archive.setXzfyId(xzfyId);
				archiveService.save(archive);
			}
		}
		if (upFile9FileName.length != 0) {
			for (int i = 0; i < upFile9FileName.length; i++) {
				String numm = num + "";
				if (numm.length() == 1)
					numm = "0" + numm;
				++num;
				Archive archive = new Archive();
				String realName = upFile9FileName[i];
				String extension = upFile9FileName[i]
						.substring(upFile9FileName[i].lastIndexOf("."));
				String fileName = Calendar.getInstance().getTimeInMillis()
						+ numm + extension;
				File outFile = new File(fileFlod + fileName);
				IOStream stream = new IOStream();
				stream.writeFileStream(upFile9[i], outFile);
				archive.setId(new SimpleDateFormat("yyyyMMddHHmmssSSS")
						.format(new Date()) + new Random().nextInt(10000));
				archive.setType("9");
				archive.setFileName(realName);
				archive.setFileAnotherName(fileName);
				archive.setFileRelativePath("../uploadfiles/anjuan/" + fileName);
				archive.setFileAbsolutePath(fileFlod + fileName);
				archive.setUploadTime(this.getCurrentTime());
				archive.setUploadUserId(this.getUser().getId().toString());
				archive.setUploadUserName(this.getUser().getName());
				archive.setXzfyId(xzfyId);
				archiveService.save(archive);
			}
		}
		if (upFile10FileName.length != 0) {
			for (int i = 0; i < upFile10FileName.length; i++) {
				String numm = num + "";
				if (numm.length() == 1)
					numm = "0" + numm;
				++num;
				Archive archive = new Archive();
				String realName = upFile10FileName[i];
				String extension = upFile10FileName[i]
						.substring(upFile10FileName[i].lastIndexOf("."));
				String fileName = Calendar.getInstance().getTimeInMillis()
						+ numm + extension;
				File outFile = new File(fileFlod + fileName);
				IOStream stream = new IOStream();
				stream.writeFileStream(upFile10[i], outFile);
				archive.setId(new SimpleDateFormat("yyyyMMddHHmmssSSS")
						.format(new Date()) + new Random().nextInt(10000));
				archive.setType("10");
				archive.setFileName(realName);
				archive.setFileAnotherName(fileName);
				archive.setFileRelativePath("../uploadfiles/anjuan/" + fileName);
				archive.setFileAbsolutePath(fileFlod + fileName);
				archive.setUploadTime(this.getCurrentTime());
				archive.setUploadUserId(this.getUser().getId().toString());
				archive.setUploadUserName(this.getUser().getName());
				archive.setXzfyId(xzfyId);
				archiveService.save(archive);
			}
		}
		if (upFile11FileName.length != 0) {
			for (int i = 0; i < upFile11FileName.length; i++) {
				String numm = num + "";
				if (numm.length() == 1)
					numm = "0" + numm;
				++num;
				Archive archive = new Archive();
				String realName = upFile11FileName[i];
				String extension = upFile11FileName[i]
						.substring(upFile11FileName[i].lastIndexOf("."));
				String fileName = Calendar.getInstance().getTimeInMillis()
						+ numm + extension;
				File outFile = new File(fileFlod + fileName);
				IOStream stream = new IOStream();
				stream.writeFileStream(upFile11[i], outFile);
				archive.setId(new SimpleDateFormat("yyyyMMddHHmmssSSS")
						.format(new Date()) + new Random().nextInt(10000));
				archive.setType("11");
				archive.setFileName(realName);
				archive.setFileAnotherName(fileName);
				archive.setFileRelativePath("../uploadfiles/anjuan/" + fileName);
				archive.setFileAbsolutePath(fileFlod + fileName);
				archive.setUploadTime(this.getCurrentTime());
				archive.setUploadUserId(this.getUser().getId().toString());
				archive.setUploadUserName(this.getUser().getName());
				archive.setXzfyId(xzfyId);
				archiveService.save(archive);
			}
		}
		if (upFile12FileName.length != 0) {
			for (int i = 0; i < upFile12FileName.length; i++) {
				String numm = num + "";
				if (numm.length() == 1)
					numm = "0" + numm;
				++num;
				Archive archive = new Archive();
				String realName = upFile12FileName[i];
				String extension = upFile12FileName[i]
						.substring(upFile12FileName[i].lastIndexOf("."));
				String fileName = Calendar.getInstance().getTimeInMillis()
						+ numm + extension;
				File outFile = new File(fileFlod + fileName);
				IOStream stream = new IOStream();
				stream.writeFileStream(upFile12[i], outFile);
				archive.setId(new SimpleDateFormat("yyyyMMddHHmmssSSS")
						.format(new Date()) + new Random().nextInt(10000));
				archive.setType("12");
				archive.setFileName(realName);
				archive.setFileAnotherName(fileName);
				archive.setFileRelativePath("../uploadfiles/anjuan/" + fileName);
				archive.setFileAbsolutePath(fileFlod + fileName);
				archive.setUploadTime(this.getCurrentTime());
				archive.setUploadUserId(this.getUser().getId().toString());
				archive.setUploadUserName(this.getUser().getName());
				archive.setXzfyId(xzfyId);
				archiveService.save(archive);
			}
		}
		if (upFile13FileName.length != 0) {
			for (int i = 0; i < upFile13FileName.length; i++) {
				Archive archive = new Archive();
				String realName = upFile13FileName[i];
				String extension = upFile13FileName[i]
						.substring(upFile13FileName[i].lastIndexOf("."));
				// String fileName = Calendar.getInstance().getTimeInMillis() +
				// extension;
				String fileName = xzfyId + extension;
				String fileFlodJiean = webRootPath + "uploadfiles/jieanwenshu/";
				File outFile = new File(fileFlodJiean + fileName);
				IOStream stream = new IOStream();
				stream.writeFileStream(upFile13[i], outFile);
				archive.setId(new SimpleDateFormat("yyyyMMddHHmmssSSS")
						.format(new Date()) + new Random().nextInt(10000));
				archive.setType("13");
				archive.setFileName(realName);
				archive.setFileAnotherName(fileName);
				archive.setFileRelativePath("../uploadfiles/jieanwenshu/"
						+ fileName);
				archive.setFileAbsolutePath(fileFlodJiean + fileName);
				archive.setUploadTime(this.getCurrentTime());
				archive.setUploadUserId(this.getUser().getId().toString());
				archive.setUploadUserName(this.getUser().getName());
				archive.setXzfyId(xzfyId);
				archiveService.save(archive);
			}
		}
		return SUCCESS;
	}

	public String deleteArchive() {
		// 删除同步到在线复议的材料
		XzfyInfo xzfyInfo = (XzfyInfo) this.coreService.loadEntityObjectById(
				XzfyInfo.class, xzfyId);
		Archive archive = (Archive) this.coreService.loadEntityObjectById(
				Archive.class, id);
		if (xzfyInfo.getReceive_type().equals("4")) {
			if (archive.getFlag() == null) {
				archiveService.deleteArchive(id);
			} else {
				ApplicationContext context = new ClassPathXmlApplicationContext(
						"applicationContext.xml");
				Services services = (Services) context.getBean("client");
				int flag = services.archiveDel(id);
				if (flag == 1) {
					archiveService.deleteArchive(id);
				}
			}
		} else {
			archiveService.deleteArchive(id);
		}

		return SUCCESS;
	}

	public String deleteOldJieanWenshu() {
		xzfyInfo = recordService.getXzfyById(xzfyId);
		xzfyInfo.setJieanwenshu("");
		archiveService.update(xzfyInfo);
		return SUCCESS;
	}

	@Override
	public Class getPersistentClass() {
		// TODO Auto-generated method stub
		return null;
	}

	public Archive getArchive() {
		return archive;
	}

	public void setArchive(Archive archive) {
		this.archive = archive;
	}

	public ArchiveService getArchiveService() {
		return archiveService;
	}

	public void setArchiveService(ArchiveService archiveService) {
		this.archiveService = archiveService;
	}

	public String getXzfyId() {
		return xzfyId;
	}

	public void setXzfyId(String xzfyId) {
		this.xzfyId = xzfyId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public List<Archive> getArchiveList() {
		return archiveList;
	}

	public void setArchiveList(List<Archive> archiveList) {
		this.archiveList = archiveList;
	}

	public List<Archive> getArchiveList1() {
		return archiveList1;
	}

	public void setArchiveList1(List<Archive> archiveList1) {
		this.archiveList1 = archiveList1;
	}

	public List<Archive> getArchiveList2() {
		return archiveList2;
	}

	public void setArchiveList2(List<Archive> archiveList2) {
		this.archiveList2 = archiveList2;
	}

	public List<Archive> getArchiveList3() {
		return archiveList3;
	}

	public void setArchiveList3(List<Archive> archiveList3) {
		this.archiveList3 = archiveList3;
	}

	public List<Archive> getArchiveList4() {
		return archiveList4;
	}

	public void setArchiveList4(List<Archive> archiveList4) {
		this.archiveList4 = archiveList4;
	}

	public List<Archive> getArchiveList5() {
		return archiveList5;
	}

	public void setArchiveList5(List<Archive> archiveList5) {
		this.archiveList5 = archiveList5;
	}

	public List<Archive> getArchiveList6() {
		return archiveList6;
	}

	public void setArchiveList6(List<Archive> archiveList6) {
		this.archiveList6 = archiveList6;
	}

	public List<Archive> getArchiveList7() {
		return archiveList7;
	}

	public void setArchiveList7(List<Archive> archiveList7) {
		this.archiveList7 = archiveList7;
	}

	public List<Archive> getArchiveList8() {
		return archiveList8;
	}

	public void setArchiveList8(List<Archive> archiveList8) {
		this.archiveList8 = archiveList8;
	}

	public List<Archive> getArchiveList9() {
		return archiveList9;
	}

	public void setArchiveList9(List<Archive> archiveList9) {
		this.archiveList9 = archiveList9;
	}

	public List<Archive> getArchiveList10() {
		return archiveList10;
	}

	public void setArchiveList10(List<Archive> archiveList10) {
		this.archiveList10 = archiveList10;
	}

	public List<Archive> getArchiveList11() {
		return archiveList11;
	}

	public void setArchiveList11(List<Archive> archiveList11) {
		this.archiveList11 = archiveList11;
	}

	public List<Archive> getArchiveList12() {
		return archiveList12;
	}

	public void setArchiveList12(List<Archive> archiveList12) {
		this.archiveList12 = archiveList12;
	}

	public File[] getUpFile1() {
		return upFile1;
	}

	public void setUpFile1(File[] upFile1) {
		this.upFile1 = upFile1;
	}

	public File[] getUpFile2() {
		return upFile2;
	}

	public void setUpFile2(File[] upFile2) {
		this.upFile2 = upFile2;
	}

	public File[] getUpFile3() {
		return upFile3;
	}

	public void setUpFile3(File[] upFile3) {
		this.upFile3 = upFile3;
	}

	public File[] getUpFile4() {
		return upFile4;
	}

	public void setUpFile4(File[] upFile4) {
		this.upFile4 = upFile4;
	}

	public File[] getUpFile5() {
		return upFile5;
	}

	public void setUpFile5(File[] upFile5) {
		this.upFile5 = upFile5;
	}

	public File[] getUpFile6() {
		return upFile6;
	}

	public void setUpFile6(File[] upFile6) {
		this.upFile6 = upFile6;
	}

	public File[] getUpFile7() {
		return upFile7;
	}

	public void setUpFile7(File[] upFile7) {
		this.upFile7 = upFile7;
	}

	public File[] getUpFile8() {
		return upFile8;
	}

	public void setUpFile8(File[] upFile8) {
		this.upFile8 = upFile8;
	}

	public File[] getUpFile9() {
		return upFile9;
	}

	public void setUpFile9(File[] upFile9) {
		this.upFile9 = upFile9;
	}

	public File[] getUpFile10() {
		return upFile10;
	}

	public void setUpFile10(File[] upFile10) {
		this.upFile10 = upFile10;
	}

	public File[] getUpFile11() {
		return upFile11;
	}

	public void setUpFile11(File[] upFile11) {
		this.upFile11 = upFile11;
	}

	public File[] getUpFile12() {
		return upFile12;
	}

	public void setUpFile12(File[] upFile12) {
		this.upFile12 = upFile12;
	}

	public String[] getUpFile1FileName() {
		return upFile1FileName;
	}

	public void setUpFile1FileName(String[] upFile1FileName) {
		this.upFile1FileName = upFile1FileName;
	}

	public String[] getUpFile2FileName() {
		return upFile2FileName;
	}

	public void setUpFile2FileName(String[] upFile2FileName) {
		this.upFile2FileName = upFile2FileName;
	}

	public String[] getUpFile3FileName() {
		return upFile3FileName;
	}

	public void setUpFile3FileName(String[] upFile3FileName) {
		this.upFile3FileName = upFile3FileName;
	}

	public String[] getUpFile4FileName() {
		return upFile4FileName;
	}

	public void setUpFile4FileName(String[] upFile4FileName) {
		this.upFile4FileName = upFile4FileName;
	}

	public String[] getUpFile5FileName() {
		return upFile5FileName;
	}

	public void setUpFile5FileName(String[] upFile5FileName) {
		this.upFile5FileName = upFile5FileName;
	}

	public String[] getUpFile6FileName() {
		return upFile6FileName;
	}

	public void setUpFile6FileName(String[] upFile6FileName) {
		this.upFile6FileName = upFile6FileName;
	}

	public String[] getUpFile7FileName() {
		return upFile7FileName;
	}

	public void setUpFile7FileName(String[] upFile7FileName) {
		this.upFile7FileName = upFile7FileName;
	}

	public String[] getUpFile8FileName() {
		return upFile8FileName;
	}

	public void setUpFile8FileName(String[] upFile8FileName) {
		this.upFile8FileName = upFile8FileName;
	}

	public String[] getUpFile9FileName() {
		return upFile9FileName;
	}

	public void setUpFile9FileName(String[] upFile9FileName) {
		this.upFile9FileName = upFile9FileName;
	}

	public String[] getUpFile10FileName() {
		return upFile10FileName;
	}

	public void setUpFile10FileName(String[] upFile10FileName) {
		this.upFile10FileName = upFile10FileName;
	}

	public String[] getUpFile11FileName() {
		return upFile11FileName;
	}

	public void setUpFile11FileName(String[] upFile11FileName) {
		this.upFile11FileName = upFile11FileName;
	}

	public String[] getUpFile12FileName() {
		return upFile12FileName;
	}

	public void setUpFile12FileName(String[] upFile12FileName) {
		this.upFile12FileName = upFile12FileName;
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

	public XzfyInfo getXzfyInfo() {
		return xzfyInfo;
	}

	public void setXzfyInfo(XzfyInfo xzfyInfo) {
		this.xzfyInfo = xzfyInfo;
	}

	public List getFileList() {
		return fileList;
	}

	public void setFileList(List fileList) {
		this.fileList = fileList;
	}

	public List getFileList1() {
		return fileList1;
	}

	public void setFileList1(List fileList1) {
		this.fileList1 = fileList1;
	}

	public String getLocbm() {
		return locbm;
	}

	public void setLocbm(String locbm) {
		this.locbm = locbm;
	}

	public List<Archive> getArchiveList13() {
		return archiveList13;
	}

	public void setArchiveList13(List<Archive> archiveList13) {
		this.archiveList13 = archiveList13;
	}

	public File[] getUpFile13() {
		return upFile13;
	}

	public void setUpFile13(File[] upFile13) {
		this.upFile13 = upFile13;
	}

	public String[] getUpFile13FileName() {
		return upFile13FileName;
	}

	public void setUpFile13FileName(String[] upFile13FileName) {
		this.upFile13FileName = upFile13FileName;
	}

	public String getJieandoctype() {
		return jieandoctype;
	}

	public void setJieandoctype(String jieandoctype) {
		this.jieandoctype = jieandoctype;
	}

	public int getJieandocsize() {
		return jieandocsize;
	}

	public void setJieandocsize(int jieandocsize) {
		this.jieandocsize = jieandocsize;
	}

	public List<Archive> getArchiveList14() {
		return archiveList14;
	}

	public void setArchiveList14(List<Archive> archiveList14) {
		this.archiveList14 = archiveList14;
	}

	public List<Archive> getArchiveList15() {
		return archiveList15;
	}

	public void setArchiveList15(List<Archive> archiveList15) {
		this.archiveList15 = archiveList15;
	}

}
