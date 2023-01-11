package com.javalec.base.controller;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class rdsController {
	
	@RequestMapping(value ="/urlcar", produces = "application/json; charset=utf8", method = RequestMethod.GET)
	public JSONObject Aboutpp(HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		double year = Double.parseDouble(request.getParameter("year"));
		double mileage = Double.parseDouble(request.getParameter("mileage"));
		double engineSize = Double.parseDouble(request.getParameter("engineSize"));
		double mpg = Double.parseDouble(request.getParameter("mpg"));
		String Manual = request.getParameter("Manual");
		String fuelType_D = request.getParameter("fuelType_D");
		String fuelType_p = request.getParameter("fuelType_p");
		
		RConnection conn1 = new RConnection();

		conn1.voidEval("library(randomForest)");

		conn1.voidEval("rfs <- readRDS(\"/Users/ptk/Documents/Develoment/Tomcat/webapps/ROOT/Rserve/Audi_A3.rds\",'rb')");
		conn1.voidEval("result <- as.character(predict(rfs, (list(year=" + year + ", mileage=" + mileage + ","
		+ "engineSize=" + engineSize + ", mpg=" + mpg + ", Manual=" + Manual + 
		", fuelType_D=" + fuelType_D + ", fuelType_P=" + fuelType_p + "))))");
		
		

	
		String result2 = conn1.eval("result").asString();
		
		 Map<String, Object> map = new HashMap<>();
		 map.put("result", result2);
		 
		 JSONObject jsonObject2 = new JSONObject(map);

		return jsonObject2;
		
		
	}


}
