package com.unionfly.completesyn.services;

import java.util.ArrayList;
import java.util.List;

import javax.jws.WebMethod;
import javax.jws.WebService;

import com.taiji.fzb.domain.XzfyInfo;
import com.unionfly.completesyn.model.FileUploader;
import com.unionfly.completesyn.model.ListObject;

@WebService
public interface ICaseInfoServices {
	public XzfyInfo getXzfyInfo(String caseNo);

	public ListObject getCaseInfoList();

	// public String getCaseInfoList(List<CaseInfo> caseInfos);

	public boolean uploadFile(FileUploader file);
	@WebMethod
	public void updateName(String name);

}