package com.javalec.base.model;

public class carModel {
	int cseq;
	String model;
	int year;
	int price;
	int mileage;
	
	public carModel(int cseq, String model, int year, int price, int mileage) {
		super();
		this.cseq = cseq;
		this.model = model;
		this.year = year;
		this.price = price;
		this.mileage = mileage;
	}

	public int getCseq() {
		return cseq;
	}

	public void setCseq(int cseq) {
		this.cseq = cseq;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	
	
}
