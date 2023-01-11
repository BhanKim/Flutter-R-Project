package com.javalec.base.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		String fileName = request.getParameter("fileName");
		
		RConnection conn1 = new RConnection();

		conn1.voidEval("library(randomForest)");
        //get real path 
		conn1.voidEval("rfs <- readRDS('http://localhost:8080/show_rds?name="+fileName+"','rb')");
		conn1.voidEval("result <- as.character(predict(rfs, (list(year=" + year + ", mileage=" + mileage + ","
		+ "engineSize=" + engineSize + ", mpg=" + mpg + ", Manual=" + Manual + 
		", fuelType_D=" + fuelType_D + ", fuelType_P=" + fuelType_p + "))))");
		
		

	
		String result2 = conn1.eval("result").asString();
		
		 Map<String, Object> map = new HashMap<>();
		 map.put("result", result2);
		 
		 JSONObject jsonObject2 = new JSONObject(map);

		return jsonObject2;
		
		
	}

	
	 // [로직 : 서버 로컬 pc에 저장 된 rds 확인 >> 저장된 이미지 파일이 존재하는 경우 >> 그 파일을 다운로드]
    @RequestMapping("/show_rds")
    public ResponseEntity<Object> showImage(@RequestParam Map<String, String> param){
        // rds가 저장된 폴더 경로 변수 선언
        String rdsRoot = System.getProperty("user.dir") + "/src/main/resources/webapp/rds/";
        	
        // 서버 로컬 경로 + 파일 명 저장 실시
    	rdsRoot = rdsRoot + String.valueOf(param.get("name"));

    	try {
			Path filePath = Paths.get(rdsRoot);
			Resource resource = new InputStreamResource(Files.newInputStream(filePath)); // 파일 resource 얻기
			
			File file = new File(rdsRoot);
			
			HttpHeaders headers = new HttpHeaders();
			headers.setContentDisposition(ContentDisposition.builder("attachment").filename(file.getName()).build());  // 다운로드 되거나 로컬에 저장되는 용도로 쓰이는지를 알려주는 헤더
			
			return new ResponseEntity<Object>(resource, headers, HttpStatus.OK);
		} catch(Exception e) {
			return new ResponseEntity<Object>(null, HttpStatus.CONFLICT);
		}
    }	

}
