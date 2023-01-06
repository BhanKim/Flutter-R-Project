package com.springlec.base.model;

public class BDto {
	
String scode;
String sname;
String sdept;
String sphone;
String saddress;




public BDto(String scode, String sname, String sdept, String sphone, String saddress) {
	super();
	this.scode = scode;
	this.sname = sname;
	this.sdept = sdept;
	this.sphone = sphone;
	this.saddress = saddress;
}
public String getScode() {
	return scode;
}
public void setScode(String scode) {
	this.scode = scode;
}
public String getSname() {
	return sname;
}
public void setSname(String sname) {
	this.sname = sname;
}
public String getSdept() {
	return sdept;
}
public void setSdept(String sdept) {
	this.sdept = sdept;
}
public String getSphone() {
	return sphone;
}
public void setSphone(String sphone) {
	this.sphone = sphone;
}
public String getSaddress() {
	return saddress;
}
public void setSaddress(String saddress) {
	this.saddress = saddress;
}



	
	
	
	

}
