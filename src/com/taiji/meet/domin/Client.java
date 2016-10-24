package com.taiji.meet.domin;

public class Client {
	private java.lang.Integer clientid;
	private String Client_name;
	private String Client_sex;
	private String Client_idcard;
	private String Client_address;
	private String Client_zipcode;
	private String Client_phonenum;
	private String Client_laiwenbianhao;
	private String proxytype;
	private Meet Meet;
	public Client()
	{
	}
	public Client(String clientName,String clientSex,String clientIdcard,String clientAddress,String clientZipcpde,String clientPhonenum)
	{
		this.Client_name=clientName;
		this.Client_sex=clientSex;
		this.Client_idcard=clientIdcard;
		this.Client_address=clientAddress;
		this.Client_zipcode=clientZipcpde;
		this.Client_phonenum=clientPhonenum;
	}
	public String getClient_name() {
		return this.Client_name;
	}
	public void setClient_name(String clientName) {
		this.Client_name = clientName;
	}
	public String getClient_sex() {
		return this.Client_sex;
	}
	public void setClient_sex(String clientSex) {
		this.Client_sex = clientSex;
	}
	public String getClient_idcard() {
		return this.Client_idcard;
	}
	public void setClient_idcard(String clientIdcard) {
		this.Client_idcard = clientIdcard;
	}
	public String getClient_address() {
		return this.Client_address;
	}
	public void setClient_address(String clientAddress) {
		this.Client_address = clientAddress;
	}
	public String getClient_zipcode() {
		return this.Client_zipcode;
	}
	public void setClient_zipcode(String clientZipcode) {
		this.Client_zipcode = clientZipcode;
	}
	public String getClient_phonenum() {
		return this.Client_phonenum;
	}
	public void setClient_phonenum(String clientPhonenum) {
		this.Client_phonenum = clientPhonenum;
	}
	public void setMeet(Meet meet) {
		this.Meet = meet;
	}
	public Meet getMeet() {
		return this.Meet;
	}
	public void setClientid(Integer clientid) {
		this.clientid = clientid;
	}
	public Integer getClientid() {
		return clientid;
	}
	public void setProxytype(String proxytype) {
		this.proxytype = proxytype;
	}
	public String getProxytype() {
		return proxytype;
	}
	public void setClient_laiwenbianhao(String client_laiwenbianhao) {
		this.Client_laiwenbianhao = client_laiwenbianhao;
	}
	public String getClient_laiwenbianhao() {
		return Client_laiwenbianhao;
	}
	
}
