package com.hyunjin.fsms.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PdMapper {

	List<Map<String, Object>> fspPd001S04(Map<String, Object> request) ;

	List<Map<String, Object>> fspPd001S05(Map<String, Object> request);

	List<Map<String, Object>> fspPd001S06(Map<String, Object> request);

}
