package com.hyunjin.fsms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyunjin.fsms.mapper.HomeMapper;

@Service
public class HomeService {

	@Autowired
	HomeMapper mapper;
	
	
	public String selectTest() {
		System.out.println("test");
		String str = mapper.selectTest();
		return str;
	}

	
	
}
