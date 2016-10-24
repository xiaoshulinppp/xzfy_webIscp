package test.action;

import java.util.List;


import com.taiji.app.webTemplate.news.service.NewsTemplateService;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.webTemplate.domain.WtClassify;

public class TestAction extends ProtectedDetailAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private NewsTemplateService newsTemplateService = null; // 业务层对象
	private String wtName="成功";
	private int wtId=-1;
	public int getWtId() {
		return wtId;
	}
	public void setWtId(int wtId) {
		this.wtId = wtId;
	}
	public String getWtName() {
		return wtName;
	}
	public void setWtName(String wtName) {
		this.wtName = wtName;
	}
	public void setNewsTemplateService(NewsTemplateService newsTemplateService) {
		this.newsTemplateService = newsTemplateService;
	}
	@Override
	public Class getPersistentClass() {
		// TODO Auto-generated method stub
		return null;
	}
	//	查看数据
	@SuppressWarnings("unchecked")
	public String shipl(){
		String hql="from WtClassify";
		List<WtClassify> dataList=this.newsTemplateService.find(hql);
		wtName=dataList.get(0).getName();
		wtId=dataList.get(0).getId();
		return "success";
	}
//	增加数据
	@Override
	public String save(){
		WtClassify temp = (WtClassify) this.newsTemplateService.getEntityObjectById(WtClassify.class, 0);
		WtClassify wc=new WtClassify();
		wc.setParentClassify(temp);
		wc.setName("土木");
		this.newsTemplateService.save(wc);
		wtName=wc.getName();
		wtId=wc.getId();
		return "success";
	}
//	更新数据
	@Override
	public String update(){
		WtClassify temp = (WtClassify) this.newsTemplateService.getEntityObjectById(WtClassify.class, 0);
		temp.setName("栏目");
		this.newsTemplateService.save(temp);
		wtName=temp.getName();
		wtId=temp.getId();
		return "success";
	}
//	删除数据
	@Override
	public String delete(){
		WtClassify temp = (WtClassify) this.newsTemplateService.getEntityObjectById(WtClassify.class, 3);
		this.newsTemplateService.remove(temp);
		return "success";
	}
}
