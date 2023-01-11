package com.javalec.base.model;

public class carcnt {
	String sbrand;
	String smodel;
	int cnt;
	
	
	public carcnt(String sbrand, String smodel, int cnt) {
		super();
		this.sbrand = sbrand;
		this.smodel = smodel;
		this.cnt = cnt;
	}


	public String getSbrand() {
		return sbrand;
	}


	public void setSbrand(String sbrand) {
		this.sbrand = sbrand;
	}


	public String getSmodel() {
		return smodel;
	}


	public void setSmodel(String smodel) {
		this.smodel = smodel;
	}


	public int getCnt() {
		return cnt;
	}


	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
}
