package com.taiji.fzb.service;

import java.util.List;
import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.MaterialSharing;
import com.taiji.user.domain.User;

public interface MaterialService extends ICoreService{
	public PaginationSupport getMaterialList(int pageNumber, int pageSize,MaterialSharing materialSharing,User user);
	public PaginationSupport getMyMaterialList(int pageNumber, int pageSize,MaterialSharing materialSharing,User user);
	public PaginationSupport getMyOrgMaterialList(int pageNumber, int pageSize,MaterialSharing materialSharing);
	public MaterialSharing getMaterialById(int id);
}