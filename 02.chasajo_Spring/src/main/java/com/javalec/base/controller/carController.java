package com.javalec.base.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.javalec.base.mapper.modelMapper;
import com.javalec.base.model.carModel;
import com.javalec.base.model.carModel2;
import com.javalec.base.model.carcnt;
import com.javalec.base.model.carsearchlist;

@RestController
public class carController {
	
	private modelMapper mapper;
	
	public carController(modelMapper mapper) {
		this.mapper = mapper;
	}
	// FOR CHART
	@GetMapping("/carmodel/{cseq}")
	public carModel getCarModelInformation(@PathVariable("cseq")String id) {
		return mapper.getCarModelInformation(id);
	}
	// FOR CHART LIST USE THIS
	@GetMapping("/carmodel/list/{model}")
	public List<carModel> getCarAudiModelList(@PathVariable("model")String model){
		return mapper.getCarAudiModelList(model);
	}
	
	// FOR CHART LIST USE THIS
	@GetMapping("/carmodel/VWlist/{model}")
	public List<carModel2> getCarVWModelList(@PathVariable("model")String model){
		return mapper.getCarVWModelList(model);
	}
	
	
	// FOR SEARCH LIST USE THIS
	@GetMapping("/search/list/{sid}")
	public List<carsearchlist> getSearchList(@PathVariable("sid")String sid){
		return mapper.getSearchList(sid);
	}
	

	// FOR INSERT SEARCH LIST
	@GetMapping("/search/insert/{sid}")
	public void insertSearchList(@PathVariable("sid")String sid,@RequestParam("sbrand")String sbrand,@RequestParam("smodel")String smodel,@RequestParam("stransmission")String stransmission,@RequestParam("sfueltype")String sfueltype,@RequestParam("smileage")String smileage,@RequestParam("smpg")String smpg,@RequestParam("syear")String syear,@RequestParam("senginesize")String senginesize) {
		mapper.insertSearchList(sid, sbrand, smodel, stransmission, sfueltype, smileage, smpg, syear, senginesize);
		
	}
	
	// FOR DELETE SEARCH LIST
	@GetMapping("/search/delete/{sid}/{sseq}")
	public void deleteStudnetProfile(@PathVariable("sid") String id,@PathVariable("sseq") String sseq) {
		mapper.deleteSearchRow(id, sseq);
	}	
	
	// TEST
	@GetMapping("/search/list/top/all")
	public List<carcnt> getList(){
		return mapper.getList();
	}


}
