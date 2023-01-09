package com.javalec.base.model;

public class carsearchlist {
	int sseq;
	String sid;
	String sbrand;
	String smodel;
	String stransmission;
	String sfueltype;
	int smileage;
	int smpg;
	int syear;
	double senginesize;
	

	public carsearchlist(int sseq, String sid, String sbrand, String smodel, String stransmission, String sfueltype,
			int smileage, int smpg, int syear, double senginesize) {
		super();
		this.sseq = sseq;
		this.sid = sid;
		this.sbrand = sbrand;
		this.smodel = smodel;
		this.stransmission = stransmission;
		this.sfueltype = sfueltype;
		this.smileage = smileage;
		this.smpg = smpg;
		this.syear = syear;
		this.senginesize = senginesize;
	}

	public int getSyear() {
		return syear;
	}

	public void setSyear(int syear) {
		this.syear = syear;
	}

	public double getSenginesize() {
		return senginesize;
	}

	public void setSenginesize(double senginesize) {
		this.senginesize = senginesize;
	}

	public int getSseq() {
		return sseq;
	}

	public void setSseq(int sseq) {
		this.sseq = sseq;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
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

	public String getStransmission() {
		return stransmission;
	}

	public void setStransmission(String stransmission) {
		this.stransmission = stransmission;
	}

	public String getSfueltype() {
		return sfueltype;
	}

	public void setSfueltype(String sfueltype) {
		this.sfueltype = sfueltype;
	}

	public int getSmileage() {
		return smileage;
	}

	public void setSmileage(int smileage) {
		this.smileage = smileage;
	}

	public int getSmpg() {
		return smpg;
	}

	public void setSmpg(int smpg) {
		this.smpg = smpg;
	}
	
	
	
}
