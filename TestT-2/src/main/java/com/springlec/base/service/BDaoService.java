package com.springlec.base.service;

import java.util.List;



import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.springlec.base.model.BDto;


@Service
public interface BDaoService {
	
	public List<BDto> bestCakeListDao() throws Exception;

}
