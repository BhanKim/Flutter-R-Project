package com.springlec.base.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.springlec.base.model.BDto;
import com.springlec.base.service.BDaoService;


@RestController
public class BController {
//	
	@Autowired
	BDaoService service;
	
	@RequestMapping("/info")
	public String About(){
		
		return "Home";
	}
	@RequestMapping(value ="/url", produces = "application/json; charset=utf8", method = RequestMethod.GET )
	public @ResponseBody JSONObject mainDao(Model model) throws Exception{
		List<BDto> BestCakeListDao = service.bestCakeListDao();
		
		
		 	 Map<String, Object> map = new HashMap<>();
	        map.put("students", BestCakeListDao);
	 
	        // Map -> JSON
	        JSONObject jsonObject = new JSONObject(map);
	        
	        return jsonObject;
	 
	}
	
	
	
	//
	
	
	
}
