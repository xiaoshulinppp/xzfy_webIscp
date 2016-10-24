package com.taiji.fzb.domain;

import java.io.Serializable;

public class Vacation implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6187303963337315973L;
	private String years;
	private String months;
	private String days;
	private String info1;
	private String info2;
	public String getYears() {
		return years;
	}
	public void setYears(String years) {
		this.years = years;
	}
	public String getMonths() {
		return months;
	}
	public void setMonths(String months) {
		this.months = months;
	}
	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days;
	}
	public String getInfo1() {
		return info1;
	}
	public void setInfo1(String info1) {
		this.info1 = info1;
	}
	public String getInfo2() {
		return info2;
	}
	public void setInfo2(String info2) {
		this.info2 = info2;
	}
}
