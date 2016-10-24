package com.taiji.fzb.service.impl;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.ApplicationPath;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.service.RecordService;
import com.taiji.fzb.service.XzfySearchService;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;
import com.taiji.waiwangTB.domain.XzfyInfo_w;

import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.hwpf.usermodel.Paragraph;
import org.apache.poi.hwpf.usermodel.Range;

public class XzfySearchServiceImpl extends CoreServiceImpl
  implements XzfySearchService
{
	
	
	private RecordService recordService = null;
  public Org getOrg()
  {
    User user = 
      (User)ActionContext.getContext().getSession().get
      ("_USER_LOGIN_");

    String hql = "from Org org where org.id=" + user.getOrg().getId();
    Org org = (Org)super.find(hql).get(0);
    return org;
  }

  public List getAllList(String queryType, String applicant, String receiveCaseDate1, String receiveCaseDate2, String finishCaseDate1, String finishCaseDate2, String undertaker, String undertakerSecond, String caseNo, String representative, String caseNumBFY, String caseNameBFY, String respondent, String applicantType, String fyByMultis, String itemsFyApp, String subOfSqfy, String agent, String adminManageType, String subOfXzgl, String fyPrepose, String adminCompen, String complement, String checkFile, String dealWithFile, String delay, String terminate, String wayOfFinish, String opinionOfXzfy, String adviceOfXzfy, String xzgl, String fysx, String fyjg)
  {
    User user = null;
    user = (User)ActionContext.getContext().getSession().get("_USER_LOGIN_");
    String locbm = getOrg().getLocbm();

    String HQL = "";
    HQL = HQL + " from XzfyInfo xzfy";
    HQL = HQL + " where 1=1";

    if (queryType.equals("2")) {
      HQL = HQL + " and xzfy.caseorg='" + locbm + "'";
    }

    HQL = HQL + " and xzfy.status>'0'";
    if ((applicant != null) && (!(applicant.equals("")))) HQL = HQL + " and (xzfy.agentDetail like '%" + applicant + "%' or xzfy.appdetail like '%" + applicant + "%')";

    if ((receiveCaseDate2 != null) && (!(receiveCaseDate2.equals("")))) HQL = HQL + " and xzfy.receive_date<='" + receiveCaseDate2 + "'";
    if ((receiveCaseDate1 != null) && (!(receiveCaseDate1.equals("")))) HQL = HQL + " and xzfy.receive_date>='" + receiveCaseDate1 + "'";

    if ((finishCaseDate2 != null) && (!(finishCaseDate2.equals("")))) HQL = HQL + " and xzfy.finish_date<='" + finishCaseDate2 + "'";
    if ((finishCaseDate1 != null) && (!(finishCaseDate1.equals("")))) HQL = HQL + " and xzfy.finish_date>='" + finishCaseDate1 + "'";

    if ((undertaker != null) && (!(undertaker.equals("")))) HQL = HQL + " and xzfy.user2_name='" + undertaker + "'";
    if ((undertakerSecond != null) && (!(undertakerSecond.equals("")))) HQL = HQL + " and xzfy.user3_name='" + undertakerSecond + "'";
    if ((caseNo != null) && (!(caseNo.equals("")))) HQL = HQL + " and xzfy.tjzfzh like '%" + caseNo + "%'";
    if ((representative != null) && (!(representative.equals("")))) HQL = HQL + " and xzfy.deputy_show='" + representative + "'";

    if ((fysx != null) && (!(fysx.equals("")))) HQL = HQL + " and xzfy.casetype='" + fysx + "'";
    if ((xzgl != null) && (!(xzgl.equals("")))) { HQL = HQL + " and xzfy.refer='" + xzgl + "'";
    }

    if ((caseNumBFY != null) && (!(caseNumBFY.equals("")))) HQL = HQL + " and xzfy.xwnum like '%" + caseNumBFY + "%'";
    if ((caseNameBFY != null) && (!(caseNameBFY.equals("")))) HQL = HQL + " and xzfy.xwname like '%" + caseNameBFY + "%'";
    if ((respondent != null) && (!(respondent.equals("")))) HQL = HQL + " and xzfy.defendant_name like '%" + respondent + "%'";
    if ((applicantType != null) && (!(applicantType.equals("")))) HQL = HQL + " and xzfy.app_type='" + applicantType + "'";

    if ((fyByMultis != null) && (!(fyByMultis.equals("")))) { HQL = HQL + " and xzfy.isMany='" + fyByMultis + "'";
    }

    if ((agent != null) && (!(agent.equals("")))) HQL = HQL + " and xzfy.agent='" + agent + "'";
    if ((fyjg != null) && (!(fyjg.equals("0")))) HQL = HQL + " and xzfy.caseorg= '" + fyjg + "'";
    if ((adminManageType != null) && (!(adminManageType.equals("")))) HQL = HQL + " and xzfy.guanli1='" + adminManageType + "'";

    if ((fyPrepose != null) && (!(fyPrepose.equals("")))) HQL = HQL + " and xzfy.isfront='" + fyPrepose + "'";
    if ((adminCompen != null) && (!(adminCompen.equals("")))) HQL = HQL + " and xzfy.ismoney='" + adminCompen + "'";

    if ((complement != null) && (!(complement.equals("")))) HQL = HQL + " and xzfy.isBuzheng='" + complement + "'";
    if ((checkFile != null) && (!(checkFile.equals("")))) HQL = HQL + " and xzfy.ischeck='" + checkFile + "'";
    if ((dealWithFile != null) && (!(dealWithFile.equals("")))) HQL = HQL + " and xzfy.stadardResult='" + dealWithFile + "'";
    if ((delay != null) && (!(delay.equals("")))) HQL = HQL + " and xzfy.isdelay='" + delay + "'";

    if ((terminate != null) && (!(terminate.equals("")))) HQL = HQL + " and xzfy.isstop='" + terminate + "'";

    if ((wayOfFinish != null) && (!(wayOfFinish.equals("")))) HQL = HQL + " and xzfy.finish_type in(" + wayOfFinish + ")";
    if ((opinionOfXzfy != null) && (!(opinionOfXzfy.equals("")))) HQL = HQL + " and xzfy.opinionFile='" + opinionOfXzfy + "'";

    if ((adviceOfXzfy != null) && (!(adviceOfXzfy.equals("")))) HQL = HQL + " and xzfy.adviseFile='" + adviceOfXzfy + "'";
    return super.find(HQL);
  }

  @SuppressWarnings("unchecked")
public PaginationSupport getCurrentList(String queryType, int pageNumber, int pageSize, String applicant, String receiveCaseDate1, String receiveCaseDate2, String finishCaseDate1, String finishCaseDate2, String undertaker, String undertakerSecond, String caseNo, String representative, String caseNumBFY, String caseNameBFY, String respondent, String applicantType, String fyByMultis, String itemsFyApp, String subOfSqfy, String agent, String adminManageType, String subOfXzgl, String fyPrepose, String adminCompen, String complement, String checkFile, String dealWithFile, String delay, String terminate, String wayOfFinish, String opinionOfXzfy, String adviceOfXzfy, String xzgl, String fysx, String fyjg, String bumen, String count_type1,String queryStr)
  {
    User user = null;
    user = (User)ActionContext.getContext().getSession().get("_USER_LOGIN_");
    String locbm = getOrg().getLocbm();

    String HQL = "";
    HQL = HQL + "select xzfy.id,xzfy.status,xzfy.check_status,xzfy.stadardResult,xzfy.tjzfzh,xzfy.break_right,xzfy.app_show,xzfy.xwname, xzfy.defendant_name,xzfy.receive_date,xzfy.user1_name,xzfy.user4_name,xzfy.user2_name,xzfy.user3_name  from XzfyInfo xzfy";

    HQL = HQL + " where 1=1";

    if (queryType.equals("2")) {
      HQL = HQL + " and xzfy.caseorg='" + locbm + "'";
    }

    HQL = HQL + " and xzfy.status>'0'";
    if ((applicant != null) && (!(applicant.equals("")))) { HQL = HQL + " and (xzfy.agentDetail like '%" + applicant + "%' or xzfy.appdetail like '%" + applicant + "%')";
    }

    if ((receiveCaseDate2 != null) && (!(receiveCaseDate2.equals("")))) HQL = HQL + " and xzfy.receive_date<='" + receiveCaseDate2 + "'";
    if ((receiveCaseDate1 != null) && (!(receiveCaseDate1.equals("")))) HQL = HQL + " and xzfy.receive_date>='" + receiveCaseDate1 + "'";

    if ((finishCaseDate2 != null) && (!(finishCaseDate2.equals("")))) HQL = HQL + " and xzfy.finish_date<='" + finishCaseDate2 + "'";
    if ((finishCaseDate1 != null) && (!(finishCaseDate1.equals("")))) HQL = HQL + " and xzfy.finish_date>='" + finishCaseDate1 + "'";

    if ((undertaker != null) && (!(undertaker.equals("")))) HQL = HQL + " and xzfy.user2_name='" + undertaker + "'";
    if ((undertakerSecond != null) && (!(undertakerSecond.equals("")))) HQL = HQL + " and xzfy.user3_name='" + undertakerSecond + "'";
    if ((caseNo != null) && (!(caseNo.equals("")))) HQL = HQL + " and xzfy.tjzfzh like '%" + caseNo + "%'";
    if ((representative != null) && (!(representative.equals("")))) HQL = HQL + " and xzfy.deputy_show='" + representative + "'";

    if ((caseNumBFY != null) && (!(caseNumBFY.equals("")))) HQL = HQL + " and xzfy.xwnum like '%" + caseNumBFY + "%'";
    if ((caseNameBFY != null) && (!(caseNameBFY.equals("")))) HQL = HQL + " and xzfy.xwname like '%" + caseNameBFY + "%'";
    if ((respondent != null) && (!(respondent.equals("")))) HQL = HQL + " and xzfy.defendant_name like '%" + respondent + "%'";
    if ((applicantType != null) && (!(applicantType.equals("")))) HQL = HQL + " and xzfy.app_type='" + applicantType + "'";

    if ((fyByMultis != null) && (!(fyByMultis.equals("")))) HQL = HQL + " and xzfy.isMany='" + fyByMultis + "'";
    if ((itemsFyApp != null) && (!(itemsFyApp.equals("")))) HQL = HQL + " and xzfy.app_type1='" + itemsFyApp + "'";
    if ((subOfSqfy != null) && (!(subOfSqfy.equals("")))) HQL = HQL + " and xzfy.app_type2='" + subOfSqfy + "'";
    if ((agent != null) && (!(agent.equals("")))) HQL = HQL + " and xzfy.agent='" + agent + "'";

    
    
    if ((fysx != null) && (!(fysx.equals(""))))
    {
    	
			HQL = HQL + " and xzfy.casetype='" + fysx + "'";
		
    }
    
    	if ((xzgl != null) && (!(xzgl.equals("")))) 
    	{ 
    		if(xzgl.equals("34")){
    			
    			HQL = HQL + " and ( xzfy.refer='16' or xzfy.refer='34' or xzfy.refer='46' )  ";
    		}else if(xzgl.equals("36")){
    			
    			HQL = HQL + " and ( xzfy.refer='36' or xzfy.refer='37' or xzfy.refer='47' )  ";
    		
    		}else{
    			
    			HQL = HQL + " and xzfy.refer='" + xzgl + "'";
    			
    		}
    		
    }

    
    if (queryType.equals("1")) {
      if (count_type1.equals("2"))
        HQL = HQL + " and substr(xzfy.caseorg,-2)='00' and substr(xzfy.caseorg,1,2)>'00' and substr(xzfy.caseorg,1,2)<'19'";
      else if (count_type1.equals("3"))
        HQL = HQL + " and xzfy.caseorg='" + bumen + "'";
      else if (count_type1.equals("4"))
        HQL = HQL + " and substr(xzfy.caseorg,-2)='00' and substr(xzfy.caseorg,1,2)>'18'";
      else if (count_type1.equals("1"))
        bumen = "0";

    }

    if ((adminManageType != null) && (!(adminManageType.equals("")))) HQL = HQL + " and xzfy.guanli1='" + adminManageType + "'";
    if ((subOfXzgl != null) && (!(subOfXzgl.equals("")))) HQL = HQL + " and xzfy.guanli2='" + subOfXzgl + "'";
    if ((fyPrepose != null) && (!(fyPrepose.equals("")))) HQL = HQL + " and xzfy.isfront='" + fyPrepose + "'";
    if ((adminCompen != null) && (!(adminCompen.equals("")))) HQL = HQL + " and xzfy.ismoney='" + adminCompen + "'";

    if ((complement != null) && (!(complement.equals("")))) HQL = HQL + " and xzfy.isBuzheng='" + complement + "'";
    if ((checkFile != null) && (!(checkFile.equals("")))) HQL = HQL + " and xzfy.ischeck='" + checkFile + "'";
    if ((dealWithFile != null) && (!(dealWithFile.equals("")))) HQL = HQL + " and xzfy.stadardResult='" + dealWithFile + "'";
    if ((delay != null) && (!(delay.equals("")))) HQL = HQL + " and xzfy.isdelay='" + delay + "'";

    if ((terminate != null) && (!(terminate.equals("")))) HQL = HQL + " and xzfy.isstop='" + terminate + "'";

    if ((wayOfFinish != null) && (!(wayOfFinish.equals("")))) HQL = HQL + " and xzfy.finish_type in (" + wayOfFinish + ")";
    if ((opinionOfXzfy != null) && (!(opinionOfXzfy.equals(""))))
    {
      if (opinionOfXzfy.equals("0"))
        HQL = HQL + " and xzfy.yijian_file is null";
      else {
        HQL = HQL + " and xzfy.yijian_file is not null";
      }

    }

    if ((adviceOfXzfy != null) && (!(adviceOfXzfy.equals(""))))
    {
      if (adviceOfXzfy.equals("0"))
        HQL = HQL + " and xzfy.jianyi_file is null";
      else
        HQL = HQL + " and xzfy.jianyi_file is not null";
    }
    HQL = HQL + " order by xzfy.receive_date desc, xzfy.id desc";
    
    
    //如有全文检索则进入
    if(!queryStr.equals("")){
		    	
		    	/*建立索引start*/
		    	List firstList = super.find(HQL);
		        //String[] idList = null;
		        ArrayList<String> idList = new ArrayList<String>();
		        for(int i=0;i<firstList.size();i++){
		        	Object[] o = (Object[]) firstList.get(i);
		        	idList.add(o[0].toString());
		        }
		        try {
					buildIndex(idList);    //创建索引
				} catch (Exception e) {
					e.printStackTrace();
				}
				/*建立索引end*/
				
				/*搜索start*/
				ArrayList<String> idFinalList = new ArrayList<String>();
				try {
					idFinalList = search(indexDir, queryStr);
				} catch (Exception e) {
					e.printStackTrace();
				}
				/*搜索end*/
				
				if(!idFinalList.isEmpty()){
					/*根据全文搜索结果再次取列表start*/
					String idFinal="";
					for(int i=0;i<idFinalList.size();i++){
						idFinal+="'"+idFinalList.get(i)+"'";
						if(i<idFinalList.size()-1)
							idFinal+=",";
					}
					String HQLFianl = "";
					HQLFianl += "select xzfy.id,xzfy.status,xzfy.check_status,xzfy.stadardResult,xzfy.tjzfzh,xzfy.break_right,xzfy.app_show,xzfy.xwname, xzfy.defendant_name,xzfy.receive_date,xzfy.user1_name,xzfy.user4_name,xzfy.user2_name,xzfy.user3_name  from XzfyInfo xzfy";
					HQLFianl += " where 1=1 and xzfy.id in ("+idFinal+") order by xzfy.receive_date desc, xzfy.id desc";
					/*根据全文搜索结果再次取列表end*/
			        
			        return super.find(HQLFianl, pageNumber, pageSize);
				}
				else{
					String HQLFianl = "";
					HQLFianl += "select xzfy.id,xzfy.status,xzfy.check_status,xzfy.stadardResult,xzfy.tjzfzh,xzfy.break_right,xzfy.app_show,xzfy.xwname, xzfy.defendant_name,xzfy.receive_date,xzfy.user1_name,xzfy.user4_name,xzfy.user2_name,xzfy.user3_name  from XzfyInfo xzfy";
					HQLFianl += " where 1=1 and xzfy.status='99999' order by xzfy.receive_date desc, xzfy.id desc";
					return super.find(HQLFianl, pageNumber, pageSize);
				}
		 }
    else
    	return super.find(HQL, pageNumber, pageSize);
  }
  /*
  
  外网案件高级查询
  
  */
  @SuppressWarnings("unchecked")
  public PaginationSupport getCurrentList_w(String jiansuom,String g_caseorg,String w_queryType,int pageNumber,int pageSize,String name1,String g_cxm,String g_sljg,String g_sqname,String g_phone,String g_Datefrom,String g_Dateto)
    {
	                                                   //  anjianma,pNum,pageSize,name1,g_cxm,g_sljg,g_sqname,g_phone,g_Datefrom,g_Dateto               
      //User user = null;
     // user = (User)ActionContext.getContext().getSession().get("_USER_LOGIN_");
     // String locbm = getOrg().getLocbm();

      String HQL = "";
      HQL = HQL + "from XzfyInfo2 xzfy";

      HQL = HQL + " where 1=1";

      if (w_queryType.equals("1") &&((name1.equals("1")) || (name1.equals("2")))){
    	  HQL = HQL + " and xzfy.zl_time is null and (xzfy.caseorg ='" + g_caseorg + "')" ;
    	  
      }
      
     
     
      
     // g_cxm,g_sljg,g_sqname,g_phone,g_Datefrom,g_Dateto      
      if ((g_cxm != null) && (!(g_cxm.equals("")))) 
    	  //申请人
      { HQL = HQL + " and (xzfy.jiansuom like '%" + g_cxm + "%')";}
      if ((jiansuom != null) && (!(jiansuom.equals("")))) 
    	  //申请人
      { HQL = HQL + " and (xzfy.jiansuom like '%" + jiansuom + "%')";}
      /*if ((jiansuom != null) && (!(jiansuom.equals("")))) 
    	  //申请也查询码
      { HQL = HQL + " and (xzfy.jiansuom like '%" + jiansuom + "%')";}*/
      if ((g_sljg != null) && (!(g_sljg.equals("")))) 
    	  //录入时间
      {
		  
    	  HQL = HQL + " and xzfy.caseorg='" + g_sljg + "'";
      }
      if ((g_sqname != null) && (!(g_sqname.equals("")))) 
    	  //空
      { HQL = HQL + " and (xzfy.appdetail like '%" + g_sqname + "%')";}
      if ((g_phone != null) && (!(g_phone.equals("")))) 
    	  
      { HQL = HQL + " and (xzfy.yanzhengsj like '%" + g_phone + "%')";}
    
      
if ((g_Datefrom != null) && (!(g_Datefrom.equals("")))) 
	
      { HQL = HQL + " and     to_date(xzfy.receive_real_date,'yyyy/mm/dd')   >=  to_date('"+g_Datefrom+"','yyyy/mm/dd')  ";}
    
if ((g_Dateto != null) && (!(g_Dateto.equals("")))) 
	  
//{ HQL = HQL + " and xzfy.receive_real_date<='"+g_Dateto+"'";}

{ HQL = HQL + " and     to_date(xzfy.receive_real_date,'yyyy/mm/dd')   <=  to_date('"+g_Dateto+"','yyyy/mm/dd')  ";}
  
HQL = HQL + " order by xzfy.receive_real_date  desc";
      return  super.find(HQL, pageNumber, pageSize);
    
    }
  
  
  
  
  
  
  
  
  private IndexWriter writer;
  private static Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_30);//创建分词器（分中文时是按单字分）
  private String rootPath = ApplicationPath.getRootPath().replaceAll("\\\\","\\\\\\\\");
  private String indexDir = rootPath+"uploadfiles"+File.separator+"jieanwenshu"+File.separator+"index";			//索引存放目录
  private String dataDir = rootPath+"uploadfiles"+File.separator+"jieanwenshu";			//文档所在目录
  
  
  private void buildIndex(ArrayList<String> idList) throws Exception{
	  //System.out.println(indexDir);System.out.println(dataDir);
	  TextFilesFilter filter = new TextFilesFilter();
	  Directory dir = FSDirectory.open(new File(indexDir));
	  writer = new IndexWriter(dir, analyzer, true, IndexWriter.MaxFieldLength.UNLIMITED);
	  
	  for(int i=0;i<idList.size();i++){
      	File f = new File(dataDir+File.separator+idList.get(i)+".doc");
      	if (!f.isDirectory()&& !f.isHidden()&& f.exists()&& f.canRead()&& (filter == null || filter.accept(f))){
				indexFile(f);
			}
      }
	  writer.unlock(dir);
	  writer.close();
	  
	  
  }
  
 
  private void indexFile(File f) throws Exception {
		//System.out.println("Indexing " + f.getCanonicalPath());
		Document doc = getDocument(f);
		writer.addDocument(doc);
	}
  private Document getDocument(File f) throws Exception {
		Document doc = new Document();
		//doc.add(new Field("contents", new FileReader(f)));
		doc.add(new Field("contents", getContent(f),Field.Store.YES, Field.Index.ANALYZED));
		doc.add(new Field("id", f.getName().substring(0, f.getName().lastIndexOf(".")), Field.Store.YES, Field.Index.NOT_ANALYZED));
		doc.add(new Field("filename", f.getName(), Field.Store.YES, Field.Index.NOT_ANALYZED));
		doc.add(new Field("fullpath", f.getCanonicalPath(), Field.Store.YES, Field.Index.NOT_ANALYZED));
		return doc;
	}
	
	private static String getContent(File file){
		String content = "";
		try {
			FileInputStream fis = new FileInputStream(file); 
			WordExtractor wordExtractor;
			wordExtractor = new WordExtractor(fis);
			//StringBuffer content = new StringBuffer("");
			content = wordExtractor.getText().trim();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return content;
	}
	
	
	
	public static ArrayList<String> search(String indexDir, String queryStr) throws Exception {
		ArrayList<String> idFinalList = new ArrayList<String>();
		Directory dir = FSDirectory.open(new File(indexDir));
		IndexSearcher is = new IndexSearcher(dir);
		QueryParser parser = new QueryParser(Version.LUCENE_30, "contents", analyzer);
		Query query = parser.parse(queryStr);
		long start = System.currentTimeMillis();
		
		TopDocs hits = is.search(query, 100);//查询前100条
		
		long end = System.currentTimeMillis();
		
		System.err.println("Found " + hits.totalHits 
				+ " document(s) (in " + (end - start) 
				+ " millisecondes) that matched query '" + queryStr + "': ");
		
		for (ScoreDoc scoreDoc : hits.scoreDocs) {
			Document doc = is.doc(scoreDoc.doc);
			System.out.println(doc.get("fullpath"));
			idFinalList.add(doc.get("id"));
		}
		is.close();
		return idFinalList;
	}
  
  
  
  
  
  
  
  
  
  
  
  
  
  

  public void deleteInfoById(String entityId)
  {
    String hql = "delete from  XzfyInfo xzfy where xzfy.id='" + entityId + "'";
    super.deleteAll(hql);
  }
}