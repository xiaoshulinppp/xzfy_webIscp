package com.taiji.app.webTemplate.news.webwork.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import slime.util.IOStream.IOStream;
import slime.util.calendar.CalendarUtil;
import slime.util.file.FileDelete;

import com.taiji.app.webTemplate.news.domain.NewsTemplate;
import com.taiji.app.webTemplate.news.service.NewsTemplateService;
import com.taiji.core.util.ApplicationPath;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.webTemplate.domain.WtClassify;

@SuppressWarnings("unchecked")
public class NewsTemplateAction extends ProtectedDetailAction {

	private static final long serialVersionUID = 1L;

	// 类成员

	// 公共功能变量

	private String messageContent = ""; // 信息页面内容

	private String messageAction = ""; // 信息页面跳转路径

	private String onloadCode = ""; // 信息页面默认载入后执行的JS代码

	private PaginationSupport pageList = new PaginationSupport(); // 分页列表

	private Integer pageSize = 15; // 分页列表每页显示个数

	private Integer totalPage = 0; // 分页列表页面总数

	private File upFile = new File("upFile"); // 附件对象

	private String upFileFileName = ""; // 附件对象名称

	private String pageState = ""; // 页面状态

	// 业务变量

	private Integer classifyId = Integer.valueOf(0); // 栏目ID

	private List<NewsTemplate> newsList = new ArrayList<NewsTemplate>(); // 新闻列表

	private NewsTemplateService newsTemplateService = null; // 业务层对象

	private Integer release = Integer.valueOf(0); // 发布标志位
	
	// 公共方法
	/**
	 * 显示新闻列表
	 */
	public String showSimpleNewsList() {
		try {
			this.pageList = this.newsTemplateService.getNewsPageList(super.getPageNum(), this.pageSize, this.release, "id");
			this.totalPage = this.pageList.getPageSize();
			this.newsList = this.pageList.getItems();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 进入新增简单新闻页面
	 */
	public String gotoCreateSimpleNews() {
		try {
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 创建简单新闻
	 */
	public String createSimpleNews() {
		try {
			if (!"".equals(this.upFileFileName)) {
				String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");//后面替代前面的
				String fileName = Calendar.getInstance().getTimeInMillis() + this.upFileFileName;
				String fileFlod = webRootPath + "uploadfiles/app/webTemplate/news/simpleNews/";
				String relativeFlod = "../uploadfiles/app/webTemplate/news/simpleNews/";
				File outFile = new File(fileFlod + fileName);
				this.getNewsTemplate().setFilePath(fileFlod + fileName);
				this.getNewsTemplate().setFileFlod(relativeFlod);
				this.getNewsTemplate().setFileName(fileName);
				IOStream stream = new IOStream();
				stream.writeFileStream(this.upFile, outFile);
			}
			String content = this.getNewsTemplate().getContent();
			String newContent = content.replaceAll("<br/>", "");
			newContent = newContent.replaceAll("\r\n", "");
			this.getNewsTemplate().setContent(newContent);
			WtClassify wtClassify = (WtClassify) this.newsTemplateService.getEntityObjectById(WtClassify.class, this.classifyId);
			this.getNewsTemplate().setClassify(wtClassify);
			this.getNewsTemplate().setDate(CalendarUtil.nowDate());
			this.getNewsTemplate().setTime(CalendarUtil.nowTime());
			this.getNewsTemplate().setDateTime(CalendarUtil.nowDateTime());
			this.newsTemplateService.save(this.getNewsTemplate());
			this.messageContent = "创建成功！";
			this.messageAction = "../appNewsTemplate/showSimpleNewsList.action?funcCode=" + super.getFuncCode() + "&classifyId="
					+ this.classifyId + "&release=" + this.release;
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 删除简单新闻
	 */
	public String deleteSimpleNews() {
		try {
			if(null != this.getNewsTemplate().getFilePath() && !"".equals(this.getNewsTemplate().getFilePath())){
				FileDelete.deleteFile(this.getNewsTemplate().getFilePath());
			}
			this.newsTemplateService.remove(this.getNewsTemplate());
			this.messageContent = "删除成功！";
			this.messageAction = "../appNewsTemplate/showSimpleNewsList.action?funcCode=" + super.getFuncCode() + "&classifyId="
					+ this.classifyId + "&release=" + this.release;
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 进入修改简单新闻页面
	 */
	public String gotoUpdateSimpleNews() {
		try {
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 修改简单新闻
	 */
	public String updateSimpleNews() {
		try {
			if (!"".equals(this.upFileFileName)) {
				FileDelete.deleteFile(this.getNewsTemplate().getFilePath());
				String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
				String fileName = Calendar.getInstance().getTimeInMillis() + this.upFileFileName;
				String fileFlod = webRootPath + "uploadfiles/app/webTemplate/news/simpleNews/";
				String relativeFlod = "../uploadfiles/app/webTemplate/news/simpleNews/";
				File outFile = new File(fileFlod + fileName);
				this.getNewsTemplate().setFilePath(fileFlod + fileName);
				this.getNewsTemplate().setFileFlod(relativeFlod);
				this.getNewsTemplate().setFileName(fileName);
				IOStream stream = new IOStream();
				stream.writeFileStream(this.upFile, outFile);
			}
			String content = this.getNewsTemplate().getContent();
			String newContent = content.replaceAll("<br/>", "");
			newContent = newContent.replaceAll("\r\n", "");
			this.getNewsTemplate().setContent(newContent);
			this.getNewsTemplate().setUpdateDateTime(CalendarUtil.nowDateTime());
			this.newsTemplateService.update(this.getNewsTemplate());
			this.messageContent = "修改成功！";
			this.messageAction = "../appNewsTemplate/showSimpleNewsList.action?funcCode=" + super.getFuncCode() + "&classifyId="
					+ this.classifyId + "&release=" + this.release;
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 显示简单新闻信息
	 */
	public String showSimpleNewsInfo() {
		try {
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 发布简单新闻
	 */
	public String releaseSimpleNews() {
		try {
			this.getNewsTemplate().setRelease(1);
			this.getNewsTemplate().setReleaseDateTime(CalendarUtil.nowDateTime());
			this.newsTemplateService.update(this.getNewsTemplate());
			this.messageContent = "发布成功！";
			this.messageAction = "../appNewsTemplate/showSimpleNewsList.action?funcCode=" + super.getFuncCode() + "&classifyId="
					+ this.classifyId + "&release=" + this.release;
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 取消发布简单新闻
	 */
	public String cancelReleaseSimpleNews() {
		try {
			this.getNewsTemplate().setRelease(0);
			this.newsTemplateService.update(this.getNewsTemplate());
			this.messageContent = "取消成功！";
			this.messageAction = "../appNewsTemplate/showSimpleNewsList.action?funcCode=" + super.getFuncCode() + "&classifyId="
					+ this.classifyId + "&release=" + this.release;
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	public String test(){
		
		return "success";
	}
	// 继承方法

	@Override
	public Class<NewsTemplate> getPersistentClass() {
		return NewsTemplate.class;
	}

	// 自定义Set和Get方法

	public NewsTemplate getNewsTemplate() {
		return (NewsTemplate) super.getEntity();
	}

	public void setNewsTemplate(NewsTemplate newsTemplate) {
		super.setEntity(newsTemplate);
	}

	// Set和Get方法

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public String getMessageAction() {
		return messageAction;
	}

	public void setMessageAction(String messageAction) {
		this.messageAction = messageAction;
	}

	public String getOnloadCode() {
		return onloadCode;
	}

	public void setOnloadCode(String onloadCode) {
		this.onloadCode = onloadCode;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public File getUpFile() {
		return upFile;
	}

	public void setUpFile(File upFile) {
		this.upFile = upFile;
	}

	public String getUpFileFileName() {
		return upFileFileName;
	}

	public void setUpFileFileName(String upFileFileName) {
		this.upFileFileName = upFileFileName;
	}

	public String getPageState() {
		return pageState;
	}

	public void setPageState(String pageState) {
		this.pageState = pageState;
	}

	public Integer getClassifyId() {
		return classifyId;
	}

	public void setClassifyId(Integer classifyId) {
		this.classifyId = classifyId;
	}

	public List<NewsTemplate> getNewsList() {
		return newsList;
	}

	public void setNewsList(List<NewsTemplate> newsList) {
		this.newsList = newsList;
	}

	public NewsTemplateService getNewsTemplateService() {
		return newsTemplateService;
	}

	public void setNewsTemplateService(NewsTemplateService newsTemplateService) {
		this.newsTemplateService = newsTemplateService;
	}

	public Integer getRelease() {
		return release;
	}

	public void setRelease(Integer release) {
		this.release = release;
	}

}
