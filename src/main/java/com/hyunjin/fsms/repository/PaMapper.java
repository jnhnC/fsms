package com.hyunjin.fsms.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaMapper {

	List<Map<String, Object>> fspPa002S01(Map<String, Object> map);

	Map<String, Object> fspPa002U01(Map<String, Object> map);

	List<Map<String, Object>> fspPa003S01(Map<String, Object> map);

	Map<String, Object> fspPa003I01(Map<String, Object> map);

}
