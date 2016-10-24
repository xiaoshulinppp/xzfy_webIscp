package com.taiji.app.webTemplate.news.service;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;

public interface NewsTemplateService extends ICoreService {

	/**
	 * 获取新闻分页列表
	 * 
	 * @param pageNumber
	 *            列表页码
	 * @param pageSize
	 *            列表每页条目数量
	 * @return 分页后的新闻列表
	 */
	public PaginationSupport getNewsPageList(int pageNumber, int pageSize, int release, String seqString);

}
