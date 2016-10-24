package com.taiji.fzb.service;

import java.util.List;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.waiwangTB.domain.XzfyInfo_w;

public interface XzfySearchService extends ICoreService{
     public PaginationSupport getCurrentList(String queryType,int pageNumber,int pageSize,String applicant,String receiveCaseDate1,String receiveCaseDate2,String finishCaseDate1,String finishCaseDate2,String undertaker,String undertakerSecond,String caseNo,String representative,String caseNumBFY,String caseNameBFY,String respondent,String applicantType,String fyByMultis,String itemsFyApp,String subOfSqfy,String agent,String adminManageType,String subOfXzgl,String fyPrepose,String adminCompen,String complement,String checkFile,String dealWithFile,String delay,String terminate,String wayOfFinish,String opinionOfXzfy,String adviceOfXzfy,String xzgl,String fysx,String fyjg,String bumen,String count_type1,String queryStr);
     public List getAllList(String queryType,String applicant,String receiveCaseDate1,String receiveCaseDate2,String finishCaseDate1,String finishCaseDate2,String undertaker,String undertakerSecond,String caseNo,String representative,String caseNumBFY,String caseNameBFY,String respondent,String applicantType,String fyByMultis,String itemsFyApp,String subOfSqfy,String agent,String adminManageType,String subOfXzgl,String fyPrepose,String adminCompen,String complement,String checkFile,String dealWithFile,String delay,String terminate,String wayOfFinish,String opinionOfXzfy,String adviceOfXzfy,String xzgl,String fysx,String fyjg);
     public void deleteInfoById(String entityId);
     public PaginationSupport getCurrentList_w(String anjianma,String caseorg,String w_quertype,int pageNumber,int pageSize,String applicant1,String receiveCaseDate2,String receiveCaseDate3,String finishCaseDate4,String finishCaseDate5,String finishCaseDate6,String finishCaseDate7);

}
