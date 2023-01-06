package com.springlec.base.dao;

import java.util.List;

import com.springlec.base.model.BDto;


public interface BDao {
	
	public List<BDto> bestCakeListDao() throws Exception;
	
	public void insert( String scode,String sname,String sdept,String sphone) throws Exception;
	

	
	

};
