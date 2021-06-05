package com.hyunjin.fsms.repository;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CpMapper {

	Map<String, Object> fspCp002U01(Map<String, Object> map);

	String fspCp002S01(Map<String, Object> map);

	Map<String, Object> fspCp002U02(Map<String, Object> map);

}
