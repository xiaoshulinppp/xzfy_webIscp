package com.taiji.fzb.webwork;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionContext;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.domain.XzfyShenpi;
import com.taiji.fzb.service.XzfyService;
import com.taiji.user.domain.User;

@SuppressWarnings("serial")
public class XzfyOtherAction extends ProtectedDetailAction{
	//补正审批人
	private String shenpiren1;
	//补正批准时间
	private String shijian1;
	//补正批准意见
	private String yijian1;
	//案件状态
	private String status;
	//补正批准人
	private String spr;
	//补正审批意见
	private String spDate;
	//补正审批日期
	private String spYijian;
	//是否审批
	private String isShenpi;

	private String xzfyId;
	private XzfyInfo xzfyInfo;
	// 模板业务层方法
	private XzfyService xzfyService = null; 
	
	public void tijiaoShenpi()  throws IOException{

		XzfyShenpi shenpi = new XzfyShenpi();
		shenpi.setCheck_type(status);
		shenpiren1= new String( shenpiren1.getBytes("iso-8859-1"), "UTF-8");

		shenpi.setCheck_name(shenpiren1);
		User user = (User) ActionContext.getContext().getSession().get(
		"_USER_LOGIN_");
		String admit_name=user.getName();
		
		shenpi.setSqspren_name(admit_name);
		
		xzfyInfo = (XzfyInfo)this.coreService.getEntityObjectById(XzfyInfo.class,xzfyId);
		xzfyInfo.setCheck_status("1");
		shenpi.setXzfyInfo(xzfyInfo);
		this.coreService.save(shenpi);
		
		HttpServletResponse response = ServletActionContext.getResponse();
	    response.setContentType("text/xml;charset=utf-8");
	    PrintWriter writer = response.getWriter();
	    writer.write(SUCCESS);
	}
	
	public void wanchengShenpi() throws IOException{
		String re = "";
		if(isShenpi.equals("1")){
			re = this.getShenpiren(xzfyId,status);
		} else if (isShenpi.equals("0")){
			XzfyShenpi shenpi = new XzfyShenpi();
			shenpi.setCheck_type(status);
			
			User user = (User) ActionContext.getContext().getSession().get(
			"_USER_LOGIN_");
			String admit_name=user.getName();
			
			shenpi.setSqspren_name(admit_name);
			spr= new String( spr.getBytes("iso-8859-1"), "UTF-8");
			spYijian= new String( spYijian.getBytes("iso-8859-1"), "UTF-8");
			shenpi.setCheck_name(spr);
			shenpi.setCheck_date(spDate);
			shenpi.setCheck_advise(spYijian);
			shenpi.setCheck_result("1");
			xzfyInfo = (XzfyInfo)this.coreService.getEntityObjectById(XzfyInfo.class,xzfyId);
			shenpi.setXzfyInfo(xzfyInfo);
			this.coreService.save(shenpi);
			re = this.getShenpiren(xzfyId,status);
		}

		HttpServletResponse response = ServletActionContext.getResponse();
	    response.setContentType("text/xml;charset=utf-8");
	    PrintWriter writer = response.getWriter();
	    writer.write(re);
	}
	
	private String getShenpiren(String xzfyId,String status){
		String re ="";
		List<XzfyShenpi> sps = xzfyService.getShenpiById(xzfyId,status);
		for (int i=0;i<sps.size();i++){
			XzfyShenpi sp = (XzfyShenpi) sps.get(i);
			if(sp.getCheck_result().equals("1")){
				if(re.equals("")){
					re = sp.getCheck_name()+"审批通过";
				} else {
					re = "<br>" + sp.getCheck_name()+"审批通过";
				}
			} else if (sp.getCheck_result().equals("2")){
				if(re.equals("")){
					re = sp.getCheck_name()+"将审批退回";
				} else {
					re = "<br>" + sp.getCheck_name()+"将审批退回";
				}
			}
		}
		return re;
	}
	@Override
	public Class getPersistentClass() {
		// TODO Auto-generated method stub
		return XzfyInfo.class;
//		return null;
	}

	public void setShenpiren1(String shenpiren1) {
		this.shenpiren1 = shenpiren1;
	}

	public String getShenpiren1() {
		return shenpiren1;
	}

	public String getXzfyId() {
		return xzfyId;
	}

	public void setXzfyId(String xzfyId) {
		this.xzfyId = xzfyId;
	}

	public XzfyInfo getXzfyInfo() {
		return xzfyInfo;
	}

	public void setXzfyInfo(XzfyInfo xzfyInfo) {
		this.xzfyInfo = xzfyInfo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setShijian1(String shijian1) {
		this.shijian1 = shijian1;
	}

	public String getShijian1() {
		return shijian1;
	}

	public void setYijian1(String yijian1) {
		this.yijian1 = yijian1;
	}

	public String getYijian1() {
		return yijian1;
	}

	public String getSpr() {
		return spr;
	}

	public void setSpr(String spr) {
		this.spr = spr;
	}

	public String getSpDate() {
		return spDate;
	}

	public void setSpDate(String spDate) {
		this.spDate = spDate;
	}

	public String getSpYijian() {
		return spYijian;
	}

	public void setSpYijian(String spYijian) {
		this.spYijian = spYijian;
	}

	public void setIsShenpi(String isShenpi) {
		this.isShenpi = isShenpi;
	}

	public String getIsShenpi() {
		return isShenpi;
	}

	public XzfyService getXzfyService() {
		return xzfyService;
	}

	public void setXzfyService(XzfyService xzfyService) {
		this.xzfyService = xzfyService;
	}

}
