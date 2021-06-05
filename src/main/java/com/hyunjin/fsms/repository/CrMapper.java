package com.hyunjin.fsms.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CrMapper {

	List<Map<String, Object>> fspCr001S01(Map<String, Object> map) ;

	Map<String, Object> fspCr002S01(Map<String, Object> map);

	List<Map<String, Object>> fspCr002S02(Map<String, Object> map);

	Map<String, Object> fspCr002U01(Map<String, Object> map);

	List<Map<String, Object>> fspCr002S03(Map<String, Object> map);

}
