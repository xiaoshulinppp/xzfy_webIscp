package com.taiji.app.webTemplate.news.service.impl;

import com.taiji.app.webTemplate.news.service.NewsTemplateService;
import com.taiji.common.TemplateUtil;
import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;

public class NewsTemplateServiceImpl extends CoreServiceImpl implements NewsTemplateService {

	/*
	 * 获取新闻分页列表
	 * 
	 * @param pageNumber 列表页码
	 * 
	 * @param pageSize 列表每页条目数量
	 * 
	 * @return 分页后的新闻列表
	 */
	@Override
	public PaginationSupport getNewsPageList(int pageNumber, int pageSize, int release, String seqString) {
		String HQL = "";
		HQL += " from " + TemplateUtil.NewsTemplateName + " n";
		HQL += " where 1 = 1";
		HQL += " and n.release = " + release;
		HQL += " order by n." + seqString + " asc";
		return super.find(HQL, pageNumber, pageSize);
	}

}
