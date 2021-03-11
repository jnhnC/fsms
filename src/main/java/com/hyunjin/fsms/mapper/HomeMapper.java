package com.hyunjin.fsms.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
public interface HomeMapper {
	String selectTest();
}
