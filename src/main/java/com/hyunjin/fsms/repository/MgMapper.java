package com.hyunjin.fsms.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MgMapper {

	Map<String, Object> fspMg002U01(Map<String, Object> map);

	List<Map<String, Object>> fspMg002S01(Map<String, Object> map);

	List<Map<String, Object>> fspMg002S02();

	List<Map<String, Object>> fspMg002S03();

}
