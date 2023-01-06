package com.springlec.base.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.springlec.base.model.BDto;

public class BDaoImpl implements BDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public static String nameSpace = "com.springlec.base.dao.BDao";

	@Override
	public List<BDto> bestCakeListDao() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".bestCakeListDao");
	}

	@Override
	public void insert(String scode, String sname, String sdept, String sphone) throws Exception {
		// TODO Auto-generated method stub
		
	}
	

	


	
	
	


}
