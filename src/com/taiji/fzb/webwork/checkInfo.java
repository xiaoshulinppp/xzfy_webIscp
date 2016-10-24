package com.taiji.fzb.webwork;

import com.taiji.fzb.domain.XzfyInfo;

public class checkInfo {

	public XzfyInfo check_xzfyInfo(XzfyInfo newXzfyInfo, XzfyInfo oldXzfyInfo) {
		if (oldXzfyInfo.getAdmit1() != null
				&& !oldXzfyInfo.getAdmit1().equals(""))
			newXzfyInfo.setAdmit1(oldXzfyInfo.getAdmit1());
		if (oldXzfyInfo.getAdmit1_id() != null
				&& !oldXzfyInfo.getAdmit1_id().equals(""))
			newXzfyInfo.setAdmit1_id(oldXzfyInfo.getAdmit1_id());
		if (oldXzfyInfo.getAdmit2() != null
				&& !oldXzfyInfo.getAdmit2().equals(""))
			newXzfyInfo.setAdmit2(oldXzfyInfo.getAdmit2());
		// 请参照上述，把oldXzfyInfo里所有不为空的属性都set到newXzfyInfo中

		if (oldXzfyInfo.getStadardResult() != null
				&& !oldXzfyInfo.getStadardResult().equals(""))
			newXzfyInfo.setStadardResult(oldXzfyInfo.getStadardResult());

		if (oldXzfyInfo.getYijian_file() != null
				&& !oldXzfyInfo.getYijian_file().equals(""))
			newXzfyInfo.setYijian_file(oldXzfyInfo.getYijian_file());

		if (oldXzfyInfo.getJianyi_file() != null
				&& !oldXzfyInfo.getJianyi_file().equals(""))
			newXzfyInfo.setJianyi_file(oldXzfyInfo.getJianyi_file());

		if (oldXzfyInfo.getHastingzheng() != null
				&& !oldXzfyInfo.getHastingzheng().equals(""))
			newXzfyInfo.setHastingzheng(oldXzfyInfo.getHastingzheng());

		if (oldXzfyInfo.getHasdiaocha() != null
				&& !oldXzfyInfo.getHasdiaocha().equals(""))
			newXzfyInfo.setHasdiaocha(oldXzfyInfo.getHasdiaocha());

		if (oldXzfyInfo.getHasanshen() != null
				&& !oldXzfyInfo.getHasanshen().equals(""))
			newXzfyInfo.setHasanshen(oldXzfyInfo.getHasanshen());

		if (oldXzfyInfo.getHastiaojie() != null
				&& !oldXzfyInfo.getHastiaojie().equals(""))
			newXzfyInfo.setHastiaojie(oldXzfyInfo.getHastiaojie());

		if (oldXzfyInfo.gettAppDeptId() != null
				&& !oldXzfyInfo.gettAppDeptId().equals(""))
			newXzfyInfo.settAppDeptId(oldXzfyInfo.gettAppDeptId());

		if (oldXzfyInfo.getDbrDetail() != null
				&& !oldXzfyInfo.getDbrDetail().equals(""))
			newXzfyInfo.setDbrDetail(oldXzfyInfo.getDbrDetail());

		if (oldXzfyInfo.getHandleReason() != null
				&& !oldXzfyInfo.getHandleReason().equals(""))
			newXzfyInfo.setHandleReason(oldXzfyInfo.getHandleReason());

		if (oldXzfyInfo.getBuzhengDelay() != null
				&& !oldXzfyInfo.getBuzhengDelay().equals(""))
			newXzfyInfo.setBuzhengDelay(oldXzfyInfo.getBuzhengDelay());

		if (oldXzfyInfo.getJieanwenshu() != null
				&& !oldXzfyInfo.getJieanwenshu().equals(""))
			newXzfyInfo.setJieanwenshu(oldXzfyInfo.getJieanwenshu());

		if (oldXzfyInfo.getLaAdvice() != null
				&& !oldXzfyInfo.getLaAdvice().equals(""))
			newXzfyInfo.setLaAdvice(oldXzfyInfo.getLaAdvice());

		if (oldXzfyInfo.getBzAdvice() != null
				&& !oldXzfyInfo.getBzAdvice().equals(""))
			newXzfyInfo.setBzAdvice(oldXzfyInfo.getBzAdvice());

		if (oldXzfyInfo.getJaAdvice() != null
				&& !oldXzfyInfo.getJaAdvice().equals(""))
			newXzfyInfo.setJaAdvice(oldXzfyInfo.getJaAdvice());

		if (oldXzfyInfo.getAdmit2_id() != null
				&& !oldXzfyInfo.getAdmit2_id().equals(""))
			newXzfyInfo.setAdmit2_id(oldXzfyInfo.getAdmit2_id());

		if (oldXzfyInfo.getReceive_date() != null
				&& !oldXzfyInfo.getReceive_date().equals(""))
			newXzfyInfo.setReceive_date(oldXzfyInfo.getReceive_date());

		if (oldXzfyInfo.getReceive_address() != null
				&& !oldXzfyInfo.getReceive_address().equals(""))
			newXzfyInfo.setReceive_address(oldXzfyInfo.getReceive_address());

		// if(oldXzfyInfo.getReceive_real_date()!=null)
		// newXzfyInfo.setReceive_real_date(oldXzfyInfo.getReceive_real_date());

		if (oldXzfyInfo.getAppdetail() != null
				&& !oldXzfyInfo.getAppdetail().equals(""))
			newXzfyInfo.setAppdetail(oldXzfyInfo.getAppdetail());

		if (oldXzfyInfo.getJddetail() != null
				&& !oldXzfyInfo.getJddetail().equals(""))
			newXzfyInfo.setJddetail(oldXzfyInfo.getJddetail());

		if (oldXzfyInfo.getIssafe() != null
				&& !oldXzfyInfo.getIssafe().equals(""))
			newXzfyInfo.setIssafe(oldXzfyInfo.getIssafe());

		if (oldXzfyInfo.getApp_type() != null
				&& !oldXzfyInfo.getApp_type().equals(""))
			newXzfyInfo.setApp_type(oldXzfyInfo.getApp_type());

		if (oldXzfyInfo.getAgent() != null
				&& !oldXzfyInfo.getAgent().equals(""))
			newXzfyInfo.setAgent(oldXzfyInfo.getAgent());

		if (oldXzfyInfo.getAgent_name() != null
				&& !oldXzfyInfo.getAgent_name().equals(""))
			newXzfyInfo.setAgent_name(oldXzfyInfo.getAgent_name());

		if (oldXzfyInfo.getProxy() != null
				&& !oldXzfyInfo.getProxy().equals(""))
			newXzfyInfo.setProxy(oldXzfyInfo.getProxy());

		if (oldXzfyInfo.getAgent_date() != null
				&& !oldXzfyInfo.getAgent_date().equals(""))
			newXzfyInfo.setAgent_date(oldXzfyInfo.getAgent_date());

		if (oldXzfyInfo.getAgent_address() != null
				&& !oldXzfyInfo.getAgent_address().equals(""))
			newXzfyInfo.setAgent_address(oldXzfyInfo.getAgent_address());

		if (oldXzfyInfo.getDefendant_type() != null
				&& !oldXzfyInfo.getDefendant_type().equals(""))
			newXzfyInfo.setDefendant_type(oldXzfyInfo.getDefendant_type());

		if (oldXzfyInfo.getDefendant_name() != null
				&& !oldXzfyInfo.getDefendant_name().equals(""))
			newXzfyInfo.setDefendant_name(oldXzfyInfo.getDefendant_name());

		if (oldXzfyInfo.getDefendant_real_name() != null
				&& !oldXzfyInfo.getDefendant_real_name().equals(""))
			newXzfyInfo.setDefendant_real_name(oldXzfyInfo
					.getDefendant_real_name());

		if (oldXzfyInfo.getIsmanage() != null
				&& !oldXzfyInfo.getIsmanage().equals(""))
			newXzfyInfo.setIsmanage(oldXzfyInfo.getIsmanage());

		if (oldXzfyInfo.getManage_type() != null
				&& !oldXzfyInfo.getManage_type().equals(""))
			newXzfyInfo.setManage_type(oldXzfyInfo.getManage_type());

		if (oldXzfyInfo.getMatter_type() != null
				&& !oldXzfyInfo.getMatter_type().equals(""))
			newXzfyInfo.setMatter_type(oldXzfyInfo.getMatter_type());

		if (oldXzfyInfo.getMatter_detail() != null
				&& !oldXzfyInfo.getMatter_detail().equals(""))
			newXzfyInfo.setMatter_detail(oldXzfyInfo.getMatter_detail());

		if (oldXzfyInfo.getDuty() != null && !oldXzfyInfo.getDuty().equals(""))
			newXzfyInfo.setDuty(oldXzfyInfo.getDuty());

		if (oldXzfyInfo.getExecute_date() != null
				&& !oldXzfyInfo.getExecute_date().equals(""))
			newXzfyInfo.setExecute_date(oldXzfyInfo.getExecute_date());

		if (oldXzfyInfo.getIs_prof() != null
				&& !oldXzfyInfo.getIs_prof().equals(""))
			newXzfyInfo.setIs_prof(oldXzfyInfo.getIs_prof());

		if (oldXzfyInfo.getIs_prof_detail() != null
				&& !oldXzfyInfo.getIs_prof().equals(""))
			newXzfyInfo.setIs_prof_detail(oldXzfyInfo.getIs_prof_detail());

		if (oldXzfyInfo.getRequire_fy() != null
				&& !oldXzfyInfo.getRequire_fy().equals(""))
			newXzfyInfo.setRequire_fy(oldXzfyInfo.getRequire_fy());

		if (oldXzfyInfo.getBreak_right() != null
				&& !oldXzfyInfo.getBreak_right().equals(""))
			newXzfyInfo.setBreak_right(oldXzfyInfo.getBreak_right());

		if (oldXzfyInfo.getXzfy_requset() != null
				&& !oldXzfyInfo.getXzfy_requset().equals(""))
			newXzfyInfo.setXzfy_requset(oldXzfyInfo.getXzfy_requset());

		if (oldXzfyInfo.getXzfy_requset_retail() != null
				&& !oldXzfyInfo.getXzfy_requset_retail().equals(""))
			newXzfyInfo.setXzfy_requset_retail(oldXzfyInfo
					.getXzfy_requset_retail());

		if (oldXzfyInfo.getIstingzheng() != null
				&& !oldXzfyInfo.getIstingzheng().equals(""))
			newXzfyInfo.setIstingzheng(oldXzfyInfo.getIstingzheng());

		if (oldXzfyInfo.getIsmoney() != null
				&& !oldXzfyInfo.getIsmoney().equals(""))
			newXzfyInfo.setIsmoney(oldXzfyInfo.getIsmoney());

		// if(oldXzfyInfo.getMoney_detail()!=null)
		// newXzfyInfo.setMoney_detail(oldXzfyInfo.getMoney_detail());

		if (oldXzfyInfo.getMoney_file() != null
				&& !oldXzfyInfo.getMoney_file().equals(""))
			newXzfyInfo.setMoney_file(oldXzfyInfo.getMoney_file());

		if (oldXzfyInfo.getIsfront() != null
				&& !oldXzfyInfo.getIsfront().equals(""))
			newXzfyInfo.setIsfront(oldXzfyInfo.getIsfront());

		if (oldXzfyInfo.getIscheck() != null
				&& !oldXzfyInfo.getIscheck().equals(""))
			newXzfyInfo.setIscheck(oldXzfyInfo.getIscheck());

		if (oldXzfyInfo.getCheck_file() != null
				&& !oldXzfyInfo.getCheck_file().equals(""))
			newXzfyInfo.setCheck_file(oldXzfyInfo.getCheck_file());

		if (oldXzfyInfo.getIstiaojie() != null
				&& !oldXzfyInfo.getIstiaojie().equals(""))
			newXzfyInfo.setIstiaojie(oldXzfyInfo.getIstiaojie());

		if (oldXzfyInfo.getTiaojie_from() != null
				&& !oldXzfyInfo.getTiaojie_from().equals(""))
			newXzfyInfo.setTiaojie_from(oldXzfyInfo.getTiaojie_from());

		if (oldXzfyInfo.getTiaojie_to() != null
				&& !oldXzfyInfo.getTiaojie_to().equals(""))
			newXzfyInfo.setTiaojie_to(oldXzfyInfo.getTiaojie_to());

		// if(oldXzfyInfo.getTiaojie_count()!=null)
		// newXzfyInfo.setTiaojie_count(oldXzfyInfo.getTiaojie_count());

		if (oldXzfyInfo.getIssame() != null
				&& !oldXzfyInfo.getIssame().equals(""))
			newXzfyInfo.setIssame(oldXzfyInfo.getIssame());

		if (oldXzfyInfo.getIssame_detail() != null
				&& !oldXzfyInfo.getIssame_detail().equals(""))
			newXzfyInfo.setIssame_detail(oldXzfyInfo.getIssame_detail());

		if (oldXzfyInfo.getAgentDetail() != null
				&& !oldXzfyInfo.getAgentDetail().equals(""))
			newXzfyInfo.setAgentDetail(oldXzfyInfo.getAgentDetail());

		if (oldXzfyInfo.getIsAnswer() != null
				&& !oldXzfyInfo.getIsAnswer().equals(""))
			newXzfyInfo.setIsAnswer(oldXzfyInfo.getIsAnswer());

		if (oldXzfyInfo.getSentAnswerDate() != null
				&& !oldXzfyInfo.getSentAnswerDate().equals(""))
			newXzfyInfo.setSentAnswerDate(oldXzfyInfo.getSentAnswerDate());

		if (oldXzfyInfo.getReceiveAnswerDate() != null
				&& !oldXzfyInfo.getReceiveAnswerDate().equals(""))
			newXzfyInfo
					.setReceiveAnswerDate(oldXzfyInfo.getReceiveAnswerDate());

		if (oldXzfyInfo.getTrailMode() != null
				&& !oldXzfyInfo.getTrailMode().equals(""))
			newXzfyInfo.setTrailMode(oldXzfyInfo.getTrailMode());

		if (oldXzfyInfo.getOtherTrailMode() != null
				&& !oldXzfyInfo.getOtherTrailMode().equals(""))
			newXzfyInfo.setOtherTrailMode(oldXzfyInfo.getOtherTrailMode());

		if (oldXzfyInfo.getSecondSubmitResult() != null
				&& !oldXzfyInfo.getSecondSubmitResult().equals(""))
			newXzfyInfo.setSecondSubmitResult(oldXzfyInfo
					.getSecondSubmitResult());

		if (oldXzfyInfo.getSecondSubmitDate() != null
				&& !oldXzfyInfo.getSecondSubmitDate().equals(""))
			newXzfyInfo.setSecondSubmitDate(oldXzfyInfo.getSecondSubmitDate());

		if (oldXzfyInfo.getDelayReport() != null
				&& !oldXzfyInfo.getDelayReport().equals(""))
			newXzfyInfo.setDelayReport(oldXzfyInfo.getDelayReport());

		if (oldXzfyInfo.getDelayTo() != null
				&& !oldXzfyInfo.getDelayTo().equals(""))
			newXzfyInfo.setDelayTo(oldXzfyInfo.getDelayTo());

		if (oldXzfyInfo.getDelayAdvice() != null
				&& !oldXzfyInfo.getDelayAdvice().equals(""))
			newXzfyInfo.setDelayAdvice(oldXzfyInfo.getDelayAdvice());

		if (oldXzfyInfo.getIsBreak() != null
				&& !oldXzfyInfo.getIsBreak().equals(""))
			newXzfyInfo.setIsBreak(oldXzfyInfo.getIsBreak());

		if (oldXzfyInfo.getBreakReport() != null
				&& !oldXzfyInfo.getBreakReport().equals(""))
			newXzfyInfo.setBreakReport(oldXzfyInfo.getBreakReport());

		if (oldXzfyInfo.getBreakTo() != null
				&& !oldXzfyInfo.getBreakTo().equals(""))
			newXzfyInfo.setBreakTo(oldXzfyInfo.getBreakTo());

		if (oldXzfyInfo.getBreakAdvice() != null
				&& !oldXzfyInfo.getBreakAdvice().equals(""))
			newXzfyInfo.setBreakAdvice(oldXzfyInfo.getBreakAdvice());

		if (oldXzfyInfo.getCheck_id() != null
				&& !oldXzfyInfo.getCheck_id().equals(""))
			newXzfyInfo.setCheck_id(oldXzfyInfo.getCheck_id());

		if (oldXzfyInfo.getCheck_name() != null
				&& !oldXzfyInfo.getCheck_name().equals(""))
			newXzfyInfo.setCheck_name(oldXzfyInfo.getCheck_name());

		if (oldXzfyInfo.getLaixin_name() != null
				&& !oldXzfyInfo.getLaixin_name().equals(""))
			newXzfyInfo.setLaixin_name(oldXzfyInfo.getLaixin_name());

		if (oldXzfyInfo.getLaixin_address() != null
				&& !oldXzfyInfo.getLaixin_address().equals(""))
			newXzfyInfo.setLaixin_address(oldXzfyInfo.getLaixin_address());

		if (oldXzfyInfo.getLaixin_post() != null
				&& !oldXzfyInfo.getLaixin_post().equals(""))
			newXzfyInfo.setLaixin_post(oldXzfyInfo.getLaixin_post());

		if (oldXzfyInfo.getLaixin_tel() != null
				&& !oldXzfyInfo.getLaixin_tel().equals(""))
			newXzfyInfo.setLaixin_tel(oldXzfyInfo.getLaixin_tel());

		if (oldXzfyInfo.getZhize() != null
				&& !oldXzfyInfo.getZhize().equals(""))
			newXzfyInfo.setZhize(oldXzfyInfo.getZhize());

		if (oldXzfyInfo.getXwname() != null
				&& !oldXzfyInfo.getXwname().equals(""))
			newXzfyInfo.setXwname(oldXzfyInfo.getXwname());

		if (oldXzfyInfo.getXwnum() != null
				&& !oldXzfyInfo.getXwnum().equals(""))
			newXzfyInfo.setXwnum(oldXzfyInfo.getXwnum());

		if (oldXzfyInfo.getReceive_type() != null
				&& !oldXzfyInfo.getReceive_type().equals(""))
			newXzfyInfo.setReceive_type(oldXzfyInfo.getReceive_type());

		if (oldXzfyInfo.getApp_show() != null
				&& !oldXzfyInfo.getApp_show().equals(""))
			newXzfyInfo.setApp_show(oldXzfyInfo.getApp_show());

		if (oldXzfyInfo.getTime_show() != null
				&& !oldXzfyInfo.getTime_show().equals(""))
			newXzfyInfo.setTime_show(oldXzfyInfo.getTime_show());

		if (oldXzfyInfo.getJdbl_flag() != null
				&& !oldXzfyInfo.getJdbl_flag().equals(""))
			newXzfyInfo.setJdbl_flag(oldXzfyInfo.getJdbl_flag());

		if (oldXzfyInfo.getShouju_flag() != null
				&& !oldXzfyInfo.getShouju_flag().equals(""))
			newXzfyInfo.setShouju_flag(oldXzfyInfo.getShouju_flag());

		if (oldXzfyInfo.getBztz_flag() != null
				&& !oldXzfyInfo.getBztz_flag().equals(""))
			newXzfyInfo.setBztz_flag(oldXzfyInfo.getBztz_flag());

		if (oldXzfyInfo.getTiaojie_result() != null
				&& !oldXzfyInfo.getTiaojie_result().equals(""))
			newXzfyInfo.setTiaojie_result(oldXzfyInfo.getTiaojie_result());

		if (oldXzfyInfo.getFirstSubmitResult() != null
				&& !oldXzfyInfo.getFirstSubmitResult().equals(""))
			newXzfyInfo
					.setFirstSubmitResult(oldXzfyInfo.getFirstSubmitResult());

		if (oldXzfyInfo.getFirstSubmitDate() != null
				&& !oldXzfyInfo.getFirstSubmitDate().equals(""))
			newXzfyInfo.setFirstSubmitDate(oldXzfyInfo.getFirstSubmitDate());

		if (oldXzfyInfo.getTjzfzh() != null
				&& !oldXzfyInfo.getTjzfzh().equals(""))
			newXzfyInfo.setTjzfzh(oldXzfyInfo.getTjzfzh());

		if (oldXzfyInfo.getContent_abstract() != null
				&& !oldXzfyInfo.getContent_abstract().equals(""))
			newXzfyInfo.setContent_abstract(oldXzfyInfo.getContent_abstract());

		if (oldXzfyInfo.getRemark() != null
				&& !oldXzfyInfo.getRemark().equals(""))
			newXzfyInfo.setRemark(oldXzfyInfo.getRemark());

		if (oldXzfyInfo.getFinishBreakType() != null
				&& !oldXzfyInfo.getFinishBreakType().equals(""))
			newXzfyInfo.setFinishBreakType(oldXzfyInfo.getFinishBreakType());

		if (oldXzfyInfo.getNationMoney() != null
				&& !oldXzfyInfo.getNationMoney().equals(""))
			newXzfyInfo.setNationMoney(oldXzfyInfo.getNationMoney());

		if (oldXzfyInfo.getNationMoneyDetail() != null
				&& !oldXzfyInfo.getNationMoneyDetail().equals(""))
			newXzfyInfo
					.setNationMoneyDetail(oldXzfyInfo.getNationMoneyDetail());

		if (oldXzfyInfo.getOpinion() != null
				&& !oldXzfyInfo.getOpinion().equals(""))
			newXzfyInfo.setOpinion(oldXzfyInfo.getOpinion());

		if (oldXzfyInfo.getEndFile() != null
				&& !oldXzfyInfo.getEndFile().equals(""))
			newXzfyInfo.setEndFile(oldXzfyInfo.getEndFile());

		if (oldXzfyInfo.getAdvise() != null
				&& !oldXzfyInfo.getAdvise().equals(""))
			newXzfyInfo.setAdvise(oldXzfyInfo.getAdvise());

		if (oldXzfyInfo.getOpinionFile() != null
				&& !oldXzfyInfo.getOpinionFile().equals(""))
			newXzfyInfo.setOpinionFile(oldXzfyInfo.getOpinionFile());

		if (oldXzfyInfo.getAdviseFile() != null
				&& !oldXzfyInfo.getAdviseFile().equals(""))
			newXzfyInfo.setAdviseFile(oldXzfyInfo.getAdviseFile());

		if (oldXzfyInfo.getPizhunren() != null
				&& !oldXzfyInfo.getPizhunren().equals(""))
			newXzfyInfo.setPizhunren(oldXzfyInfo.getPizhunren());

		if (oldXzfyInfo.getPizhunriqi() != null
				&& !oldXzfyInfo.getPizhunriqi().equals(""))
			newXzfyInfo.setPizhunriqi(oldXzfyInfo.getPizhunriqi());

		if (oldXzfyInfo.getPifuyijian() != null
				&& !oldXzfyInfo.getPifuyijian().equals(""))
			newXzfyInfo.setPifuyijian(oldXzfyInfo.getPifuyijian());

		if (oldXzfyInfo.getDeputy_show() != null
				&& !oldXzfyInfo.getDeputy_show().equals(""))
			newXzfyInfo.setDeputy_show(oldXzfyInfo.getDeputy_show());

		if (oldXzfyInfo.getReferother() != null
				&& !oldXzfyInfo.getReferother().equals(""))
			newXzfyInfo.setReferother(oldXzfyInfo.getReferother());

		if (oldXzfyInfo.getPizhunren1() != null
				&& !oldXzfyInfo.getPizhunren1().equals(""))
			newXzfyInfo.setPizhunren1(oldXzfyInfo.getPizhunren1());

		if (oldXzfyInfo.getPizhunriqi1() != null
				&& !oldXzfyInfo.getPizhunriqi1().equals(""))
			newXzfyInfo.setPizhunriqi1(oldXzfyInfo.getPizhunriqi1());

		if (oldXzfyInfo.getPifuyijian1() != null
				&& !oldXzfyInfo.getPifuyijian1().equals(""))
			newXzfyInfo.setPifuyijian1(oldXzfyInfo.getPifuyijian1());

		if (oldXzfyInfo.getPizhunren2() != null
				&& !oldXzfyInfo.getPizhunren2().equals(""))
			newXzfyInfo.setPizhunren2(oldXzfyInfo.getPizhunren2());

		if (oldXzfyInfo.getPizhunriqi2() != null
				&& !oldXzfyInfo.getPizhunriqi2().equals(""))
			newXzfyInfo.setPizhunriqi2(oldXzfyInfo.getPizhunriqi2());

		if (oldXzfyInfo.getPifuyijian2() != null
				&& !oldXzfyInfo.getPifuyijian2().equals(""))
			newXzfyInfo.setPifuyijian2(oldXzfyInfo.getPifuyijian2());

		if (oldXzfyInfo.getTiaojiejilu() != null
				&& !oldXzfyInfo.getTiaojiejilu().equals(""))
			newXzfyInfo.setTiaojiejilu(oldXzfyInfo.getTiaojiejilu());

		if (oldXzfyInfo.getTiaojiejilu1() != null
				&& !oldXzfyInfo.getTiaojiejilu1().equals(""))
			newXzfyInfo.setTiaojiejilu1(oldXzfyInfo.getTiaojiejilu1());

		if (oldXzfyInfo.getIsBuzheng() != null
				&& !oldXzfyInfo.getIsBuzheng().equals(""))
			newXzfyInfo.setIsBuzheng(oldXzfyInfo.getIsBuzheng());

		if (oldXzfyInfo.getIsBuzhengshenpi() != null
				&& !oldXzfyInfo.getIsBuzhengshenpi().equals(""))
			newXzfyInfo.setIsBuzhengshenpi(oldXzfyInfo.getIsBuzhengshenpi());

		if (oldXzfyInfo.getBzTongzhiriqi() != null
				&& !oldXzfyInfo.getBzTongzhiriqi().equals(""))
			newXzfyInfo.setBzTongzhiriqi(oldXzfyInfo.getBzTongzhiriqi());

		if (oldXzfyInfo.getBzBuqiriqi() != null
				&& !oldXzfyInfo.getBzBuqiriqi().equals(""))
			newXzfyInfo.setBzBuqiriqi(oldXzfyInfo.getBzBuqiriqi());

		if (oldXzfyInfo.getBzTongzhifangshi() != null
				&& !oldXzfyInfo.getBzTongzhifangshi().equals(""))
			newXzfyInfo.setBzTongzhifangshi(oldXzfyInfo.getBzTongzhifangshi());

		if (oldXzfyInfo.getCondition_type() != null
				&& !oldXzfyInfo.getCondition_type().equals(""))
			newXzfyInfo.setCondition_type(oldXzfyInfo.getCondition_type());

		if (oldXzfyInfo.getReceive_detail() != null
				&& !oldXzfyInfo.getReceive_detail().equals(""))
			newXzfyInfo.setReceive_detail(oldXzfyInfo.getReceive_detail());

		if (oldXzfyInfo.getApp_advice_type() != null
				&& !oldXzfyInfo.getApp_advice_type().equals(""))
			newXzfyInfo.setApp_advice_type(oldXzfyInfo.getApp_advice_type());

		if (oldXzfyInfo.getApp_advice_detail() != null
				&& !oldXzfyInfo.getApp_advice_detail().equals(""))
			newXzfyInfo
					.setApp_advice_detail(oldXzfyInfo.getApp_advice_detail());

		if (oldXzfyInfo.getJiedai_file() != null
				&& !oldXzfyInfo.getJiedai_file().equals(""))
			newXzfyInfo.setJiedai_file(oldXzfyInfo.getJiedai_file());

		if (oldXzfyInfo.getThird() != null
				&& !oldXzfyInfo.getThird().equals(""))
			newXzfyInfo.setThird(oldXzfyInfo.getThird());

		if (oldXzfyInfo.getThird_agent() != null
				&& !oldXzfyInfo.getThird_agent().equals(""))
			newXzfyInfo.setThird_agent(oldXzfyInfo.getThird_agent());

		if (oldXzfyInfo.getApp_type1() != null
				&& !oldXzfyInfo.getApp_type1().equals(""))
			newXzfyInfo.setApp_type1(oldXzfyInfo.getApp_type1());

		if (oldXzfyInfo.getApp_type2() != null
				&& !oldXzfyInfo.getApp_type2().equals(""))
			newXzfyInfo.setApp_type2(oldXzfyInfo.getApp_type2());

		if (oldXzfyInfo.getGuanli1() != null
				&& !oldXzfyInfo.getGuanli1().equals(""))
			newXzfyInfo.setGuanli1(oldXzfyInfo.getGuanli1());

		if (oldXzfyInfo.getGuanli2() != null
				&& !oldXzfyInfo.getGuanli2().equals(""))
			newXzfyInfo.setGuanli2(oldXzfyInfo.getGuanli2());

		if (oldXzfyInfo.getGuanli3() != null
				&& !oldXzfyInfo.getGuanli3().equals(""))
			newXzfyInfo.setGuanli3(oldXzfyInfo.getGuanli3());

		if (oldXzfyInfo.getXzfy_org() != null
				&& !oldXzfyInfo.getXzfy_org().equals(""))
			newXzfyInfo.setXzfy_org(oldXzfyInfo.getXzfy_org());

		if (oldXzfyInfo.getUser1_id() != null
				&& !oldXzfyInfo.getUser1_id().equals(""))
			newXzfyInfo.setUser1_id(oldXzfyInfo.getUser1_id());

		if (oldXzfyInfo.getUser1_name() != null
				&& !oldXzfyInfo.getUser1_name().equals(""))
			newXzfyInfo.setUser1_name(oldXzfyInfo.getUser1_name());

		if (oldXzfyInfo.getUser2_id() != null
				&& !oldXzfyInfo.getUser2_id().equals(""))
			newXzfyInfo.setUser2_id(oldXzfyInfo.getUser2_id());

		if (oldXzfyInfo.getUser2_name() != null
				&& !oldXzfyInfo.getUser2_name().equals(""))
			newXzfyInfo.setUser2_name(oldXzfyInfo.getUser2_name());

		if (oldXzfyInfo.getUser3_id() != null
				&& !oldXzfyInfo.getUser3_id().equals(""))
			newXzfyInfo.setUser3_id(oldXzfyInfo.getUser3_id());

		if (oldXzfyInfo.getUser3_name() != null
				&& !oldXzfyInfo.getUser3_name().equals(""))
			newXzfyInfo.setUser3_name(oldXzfyInfo.getUser3_name());

		if (oldXzfyInfo.getStatus() != null
				&& !oldXzfyInfo.getStatus().equals(""))
			newXzfyInfo.setStatus(oldXzfyInfo.getStatus());

		if (oldXzfyInfo.getLian_date() != null
				&& !oldXzfyInfo.getLian_date().equals(""))
			newXzfyInfo.setLian_date(oldXzfyInfo.getLian_date());

		if (oldXzfyInfo.getFinish_date() != null
				&& !oldXzfyInfo.getFinish_date().equals(""))
			newXzfyInfo.setFinish_date(oldXzfyInfo.getFinish_date());

		if (oldXzfyInfo.getBuzheng_from() != null
				&& !oldXzfyInfo.getBuzheng_from().equals(""))
			newXzfyInfo.setBuzheng_from(oldXzfyInfo.getBuzheng_from());

		if (oldXzfyInfo.getBuzheng_to() != null
				&& !oldXzfyInfo.getBuzheng_to().equals(""))
			newXzfyInfo.setBuzheng_to(oldXzfyInfo.getBuzheng_to());

		if (oldXzfyInfo.getLian_real_date() != null)
			newXzfyInfo.setLian_real_date(oldXzfyInfo.getLian_real_date());

		if (oldXzfyInfo.getFinish_real_date() != null)
			newXzfyInfo.setFinish_real_date(oldXzfyInfo.getFinish_real_date());

		if (oldXzfyInfo.getFenpei_id() != null
				&& !oldXzfyInfo.getFenpei_id().equals(""))
			newXzfyInfo.setFenpei_id(oldXzfyInfo.getFenpei_id());

		if (oldXzfyInfo.getFenpei_name() != null
				&& !oldXzfyInfo.getFenpei_name().equals(""))
			newXzfyInfo.setFenpei_name(oldXzfyInfo.getFenpei_name());

		if (oldXzfyInfo.getIsdelay() != null
				&& !oldXzfyInfo.getIsdelay().equals(""))
			newXzfyInfo.setIsdelay(oldXzfyInfo.getIsdelay());

		if (oldXzfyInfo.getIsdelay_from() != null
				&& !oldXzfyInfo.getIsdelay_from().equals(""))
			newXzfyInfo.setIsdelay_from(oldXzfyInfo.getIsdelay_from());

		if (oldXzfyInfo.getIsdelay_to() != null
				&& !oldXzfyInfo.getIsdelay_to().equals(""))
			newXzfyInfo.setIsdelay_to(oldXzfyInfo.getIsdelay_to());

		if (oldXzfyInfo.getIsstop() != null
				&& !oldXzfyInfo.getIsstop().equals(""))
			newXzfyInfo.setIsstop(oldXzfyInfo.getIsstop());

		if (oldXzfyInfo.getIsstop_from() != null
				&& !oldXzfyInfo.getIsstop_from().equals(""))
			newXzfyInfo.setIsstop_from(oldXzfyInfo.getIsstop_from());

		if (oldXzfyInfo.getIsstop_to() != null
				&& !oldXzfyInfo.getIsstop_to().equals(""))
			newXzfyInfo.setIsstop_to(oldXzfyInfo.getIsstop_to());

		if (oldXzfyInfo.getFinish_type() != null
				&& !oldXzfyInfo.getFinish_type().equals(""))
			newXzfyInfo.setFinish_type(oldXzfyInfo.getFinish_type());

		if (oldXzfyInfo.getCheck_status() != null
				&& !oldXzfyInfo.getCheck_status().equals(""))
			newXzfyInfo.setCheck_status(oldXzfyInfo.getCheck_status());

		if (oldXzfyInfo.getHas_tingzheng() != null
				&& !oldXzfyInfo.getHas_tingzheng().equals(""))
			newXzfyInfo.setHas_tingzheng(oldXzfyInfo.getHas_tingzheng());

		if (oldXzfyInfo.getResarch() != null
				&& !oldXzfyInfo.getResarch().equals(""))
			newXzfyInfo.setResarch(oldXzfyInfo.getResarch());

		if (oldXzfyInfo.getJdRenshu() != null
				&& !oldXzfyInfo.getJdRenshu().equals(""))
			newXzfyInfo.setJdRenshu(oldXzfyInfo.getJdRenshu());

		if (oldXzfyInfo.getIsMany() != null
				&& !oldXzfyInfo.getIsMany().equals(""))
			newXzfyInfo.setIsMany(oldXzfyInfo.getIsMany());

		if (oldXzfyInfo.getSafeContent() != null
				&& !oldXzfyInfo.getSafeContent().equals(""))
			newXzfyInfo.setSafeContent(oldXzfyInfo.getSafeContent());

		if (oldXzfyInfo.getJdFileContent() != null
				&& !oldXzfyInfo.getJdFileContent().equals(""))
			newXzfyInfo.setJdFileContent(oldXzfyInfo.getJdFileContent());

		if (oldXzfyInfo.getJdGzContent() != null
				&& !oldXzfyInfo.getJdGzContent().equals(""))
			newXzfyInfo.setJdGzContent(oldXzfyInfo.getJdGzContent());

		if (oldXzfyInfo.getJdBzContent() != null
				&& !oldXzfyInfo.getJdBzContent().equals(""))
			newXzfyInfo.setJdBzContent(oldXzfyInfo.getJdBzContent());

		if (oldXzfyInfo.gettAppDeptId() != null
				&& !oldXzfyInfo.gettAppDeptId().equals(""))
			newXzfyInfo.settAppDeptId(oldXzfyInfo.gettAppDeptId());

		if (oldXzfyInfo.gettPoliceIsParade() != null
				&& !oldXzfyInfo.gettPoliceIsParade().equals(""))
			newXzfyInfo.settPoliceIsParade(oldXzfyInfo.gettPoliceIsParade());

		if (oldXzfyInfo.getKeyword() != null
				&& !oldXzfyInfo.getKeyword().equals(""))
			newXzfyInfo.setKeyword(oldXzfyInfo.getKeyword());

		if (oldXzfyInfo.getMenu() != null && !oldXzfyInfo.getMenu().equals(""))
			newXzfyInfo.setMenu(oldXzfyInfo.getMenu());

		if (oldXzfyInfo.getReception() != null
				&& !oldXzfyInfo.getReception().equals(""))
			newXzfyInfo.setReception(oldXzfyInfo.getReception());

		if (oldXzfyInfo.getReception2() != null
				&& !oldXzfyInfo.getReception2().equals(""))
			newXzfyInfo.setReception2(oldXzfyInfo.getReception2());

		if (oldXzfyInfo.getCasetype() != null
				&& !oldXzfyInfo.getCasetype().equals(""))
			newXzfyInfo.setCasetype(oldXzfyInfo.getCasetype());

		if (oldXzfyInfo.getCasetype2() != null
				&& !oldXzfyInfo.getCasetype2().equals(""))
			newXzfyInfo.setCasetype2(oldXzfyInfo.getCasetype2());

		if (oldXzfyInfo.getRefer() != null
				&& !oldXzfyInfo.getRefer().equals(""))
			newXzfyInfo.setRefer(oldXzfyInfo.getRefer());

		if (oldXzfyInfo.getRefer2() != null
				&& !oldXzfyInfo.getRefer2().equals(""))
			newXzfyInfo.setRefer2(oldXzfyInfo.getRefer2());

		if (oldXzfyInfo.getKeyword2() != null
				&& !oldXzfyInfo.getKeyword2().equals(""))
			newXzfyInfo.setKeyword2(oldXzfyInfo.getKeyword2());

		if (oldXzfyInfo.getKeyword3() != null
				&& !oldXzfyInfo.getKeyword3().equals(""))
			newXzfyInfo.setKeyword3(oldXzfyInfo.getKeyword3());

		if (oldXzfyInfo.getRenCount() != null
				&& !oldXzfyInfo.getRenCount().equals(""))
			newXzfyInfo.setRenCount(oldXzfyInfo.getRenCount());

		if (oldXzfyInfo.getIs_commit() != null
				&& !oldXzfyInfo.getIs_commit().equals(""))
			newXzfyInfo.setIs_commit(oldXzfyInfo.getIs_commit());

		if (oldXzfyInfo.getOther_commit() != null
				&& !oldXzfyInfo.getOther_commit().equals(""))
			newXzfyInfo.setOther_commit(oldXzfyInfo.getOther_commit());

		if (oldXzfyInfo.getMid_tiaojie() != null
				&& !oldXzfyInfo.getMid_tiaojie().equals(""))
			newXzfyInfo.setMid_tiaojie(oldXzfyInfo.getMid_tiaojie());

		if (oldXzfyInfo.getDelay_detail() != null
				&& !oldXzfyInfo.getDelay_detail().equals(""))
			newXzfyInfo.setDelay_detail(oldXzfyInfo.getDelay_detail());

		if (oldXzfyInfo.getStop_detail() != null
				&& !oldXzfyInfo.getStop_detail().equals(""))
			newXzfyInfo.setStop_detail(oldXzfyInfo.getStop_detail());

		if (oldXzfyInfo.getDelay_reason() != null
				&& !oldXzfyInfo.getDelay_reason().equals(""))
			newXzfyInfo.setDelay_reason(oldXzfyInfo.getDelay_reason());

		if (oldXzfyInfo.getStop_reason() != null
				&& !oldXzfyInfo.getStop_reason().equals(""))
			newXzfyInfo.setStop_reason(oldXzfyInfo.getStop_reason());

		if (oldXzfyInfo.getCasenum() != null
				&& !oldXzfyInfo.getCasenum().equals(""))
			newXzfyInfo.setCasenum(oldXzfyInfo.getCasenum());

		if (oldXzfyInfo.getCaseyear() != null
				&& !oldXzfyInfo.getCaseyear().equals(""))
			newXzfyInfo.setCaseyear(oldXzfyInfo.getCaseyear());

		if (oldXzfyInfo.getCaseindex() != null
				&& !oldXzfyInfo.getCaseindex().equals(""))
			newXzfyInfo.setCaseindex(oldXzfyInfo.getCaseindex());

		if (oldXzfyInfo.getCaseorg() != null
				&& !oldXzfyInfo.getCaseorg().equals(""))
			newXzfyInfo.setCaseorg(oldXzfyInfo.getCaseorg());

		if (oldXzfyInfo.getCasestatus() != null
				&& !oldXzfyInfo.getCasestatus().equals(""))
			newXzfyInfo.setCasestatus(oldXzfyInfo.getCasestatus());

		if (oldXzfyInfo.getCurrentuser() != null
				&& !oldXzfyInfo.getCurrentuser().equals(""))
			newXzfyInfo.setCurrentuser(oldXzfyInfo.getCurrentuser());
		if (oldXzfyInfo.getBuzhengContentType() != null
				&& !oldXzfyInfo.getBuzhengContentType().equals(""))
			newXzfyInfo.setBuzhengContentType(oldXzfyInfo
					.getBuzhengContentType());

		return newXzfyInfo;
	}

}