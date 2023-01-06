package com.springlec.base;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.springlec.base.dao")
public class TestT2Application {

	public static void main(String[] args) {
		SpringApplication.run(TestT2Application.class, args);
	}

}
