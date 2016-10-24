package com.taiji.fzb.service;

import com.taiji.core.service.ICoreService;
import com.taiji.fzb.domain.Vacation;

public interface VacationService extends ICoreService {
	public void  saveJiejiari(Vacation vacation);
	public int vacationDays(String xzfyInfoId);
	public void deleteOneMonth(String year,String month);
}
