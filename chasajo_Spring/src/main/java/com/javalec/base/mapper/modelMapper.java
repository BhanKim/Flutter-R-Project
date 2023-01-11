package com.javalec.base.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.javalec.base.model.carModel;
import com.javalec.base.model.carsearchlist;

@Mapper
public interface modelMapper {
	// 특정 cseq 값 내용 선택
	@Select("SELECT * FROM audi WHERE cseq =#{cseq}")
	carModel getCarModelInformation(@Param("cseq")String id);
	
	@Select("SELECT * FROM audi WHERE model=#{model}")
	List<carModel> getCarModelList(@Param("model")String model);

	// SEARCH LIST 
	@Select("SELECT * FROM carsearchlist WHERE sid = #{sid} ")
	List<carsearchlist> getSearchList(@Param("sid") String sid);
	
	// INSERT SEARCH LIST
	@Insert("INSERT INTO carsearchlist(sid, sbrand, smodel, stransmission, sfueltype, smileage, smpg, syear, senginesize) VALUES(#{sid}, #{sbrand}, #{smodel}, #{stransmission}, #{sfueltype}, #{smileage}, #{smpg}, #{syear}, #{senginesize})")
	int insertSearchList(@Param("sid")String sid,@Param("sbrand") String sbrand, @Param("smodel")String smodel, @Param("stransmission")String stransmission, @Param("sfueltype")String sfueltype, @Param("smileage")String smileage, @Param("smpg")String smpg, @Param("syear")String syear,@Param("senginesize")String senginesize);
	
	// DELETE SEARCH LIST
	@Delete("DELETE FROM carsearchlist WHERE sid=#{sid} AND sseq=#{sseq}")
	int deleteSearchRow(@Param("sid") String id, @Param("sseq") String sseq);
	
	
}
