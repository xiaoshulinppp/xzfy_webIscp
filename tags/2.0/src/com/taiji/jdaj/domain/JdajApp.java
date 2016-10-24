package com.taiji.jdaj.domain;

import com.taiji.core.domain.Entity;

@SuppressWarnings("serial")
public class JdajApp extends Entity{
	private Integer id;
	private String jdaj_id;
	private String name;
	private String sex;
	private String idNumber;
	private String address;
	private String postalAddress;
	private String postCode;
	private String teleNumber;
	private String phoneNumber;
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getTeleNumber() {
		return teleNumber;
	}
	public void setTeleNumber(String teleNumber) {
		this.teleNumber = teleNumber;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	private JdajInfo jdajInfo;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPostalAddress() {
		return postalAddress;
	}
	public void setPostalAddress(String postalAddress) {
		this.postalAddress = postalAddress;
	}
	public JdajInfo getJdajInfo() {
		return jdajInfo;
	}
	public void setJdajInfo(JdajInfo jdajInfo) {
		this.jdajInfo = jdajInfo;
	}
	public void setJdaj_id(String jdaj_id) {
		this.jdaj_id = jdaj_id;
	}
	public String getJdaj_id() {
		return jdaj_id;
	}
	

}
